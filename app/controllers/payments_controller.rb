class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    @payment.user = current_user
    @payment.category_id = params[:category_id]
    if @payment.save
      redirect_to category_path(params[:category_id])
    else
      render :new
    end
  end

  def payment_params
    params.require(:payment).permit(:name, :amount, :category_id)
  end
end