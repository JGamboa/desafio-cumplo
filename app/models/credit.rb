class Credit
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  attr_accessor :amount, :days, :tmc_date
  validates :amount, presence: true,  numericality: { only_integer: false, greater_than: 0 }
  validates :days, presence: true,  numericality: { only_integer: true, greater_than: 0 }
  validates :tmc_date, presence: true
  validate :validate_tmc_date

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def validate_tmc_date
    begin
      Date.parse(self.tmc_date)
      return true
    rescue ArgumentError
      return false
    end
  end

  def get_tmc
    operation = OperationType.get_operation_type(self.days.to_i, self.amount.to_f)
    date = Date.parse(self.tmc_date)
    tmcs = SbifWebservice.get_tmc_indicator(date)
    filtered_tmcs = tmcs["TMCs"].select do | tmc |
      parsed_from = Date.parse(tmc["Fecha"])
      tmc["Tipo"].to_i == operation["type"] &&
          parsed_from <= date &&
          tmc.key?("Hasta") &&
          Date.parse(tmc["Hasta"]) >= date
    end

    if filtered_tmcs.size == 0
      filtered_tmcs = tmcs["TMCs"].select do | tmc |
        parsed_from = Date.parse(tmc["Fecha"])
        tmc["Tipo"].to_i == operation["type"] &&
            parsed_from <= date &&
            !tmc.key?("Hasta")
      end
    end

  return filtered_tmcs[0]
  end

end