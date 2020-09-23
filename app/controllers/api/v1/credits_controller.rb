class Api::V1::CreditsController < ApplicationApiController

  def get_tmc
    credit = Credit.new(credit_params)

    if credit.valid?
      tmc_value = credit.get_tmc
      render json: { credit:  { amount: credit.amount, days: credit.days, tmc_date: credit.tmc_date }, tmc: {
          title: tmc_value["Titulo"],
          subTitle: tmc_value["SubTitulo"],
          value: tmc_value["Valor"]
        }
      }, status: :ok
    else
      render json: { errors: credit.errors, message: 'Existieron errores en los parametros de entrada' }, :status => :unprocessable_entity
    end
  end

  private
  def credit_params
    params.require(:credit).permit(:amount, :days, :tmc_date) rescue nil
  end
end