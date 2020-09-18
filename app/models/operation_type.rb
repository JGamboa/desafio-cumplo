class OperationType
  TYPES = [
      ['cdd' => 0, 'cdh' => 89, 'ufd' => 0, 'ufh' => 5000, 'type' => 26],
      ['cdd' => 0, 'cdh' => 89, 'ufd' => 5001, 'ufh' => -1, 'type' => 25],
      ['cdd' => 90, 'cdh' => -1, 'ufd' => 0, 'ufh' => 50, 'type' => 45],
      ['cdd' => 90, 'cdh' => -1, 'ufd' => 50, 'ufh' => 200, 'type' => 44],
      ['cdd' => 90, 'cdh' => -1, 'ufd' => 200, 'ufh' => 5000, 'type' => 35],
      ['cdd' => 90, 'cdh' => -1, 'ufd' => 5000, 'ufh' => -1, 'type' => 34],
  ].freeze

  def self.get_operation_type(days, amount)
    operations = OperationType::TYPES.select do  | lp |
      if lp[0]['cdh'] == -1
        days >= lp[0]['cdd']
      else
        days >= lp[0]['cdd'] && days <= lp[0]['cdh']
      end
    end

    operations = operations.select do  | lp |
      if lp[0]['ufh'] == -1
        amount >= lp[0]['ufd']
      else
        amount > lp[0]['ufd'] && amount <= lp[0]['ufh']
      end
    end
    puts operations


    return operations[0][0]
  end
end