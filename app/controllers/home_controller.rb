class HomeController < ApplicationController
  def index

  end

  def get_tmc
    credit = Credit.new(form_params)
    if credit.valid?
      tmc_value = credit.get_tmc
      render locals: { credit: credit, tmc: tmc_value }
    else
      render 'home/index', locals: { errors: credit.errors }
    end
  end

  private
  def form_params
    params.require(:body).permit(:amount, :days, :tmc_date)
  end
end