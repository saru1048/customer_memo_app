class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      flash[:notice] = "登録しました"
      redirect_to customer_path(@customer)
    else
      flash[:alert] = "登録に失敗しました"
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :memo)
  end
end
