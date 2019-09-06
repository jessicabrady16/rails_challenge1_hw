require 'balance_calc'

class CalculationsController < ApplicationController

  def index
    @calculation = Calculation.new
  end

  def show
    @result = Calculation.find(params[:id])
  end

  def create
    input = (params.require(:calculation)[:input])
  challenge_result = BalanceCalc.balanced?(input)
  result = Calculation.create(input: input, output: challenge_result)
  redirect_to calculation_path(result)
  end

  private

  def challenge_params
    params.require(:calculation).permit(:input)
  end





end
