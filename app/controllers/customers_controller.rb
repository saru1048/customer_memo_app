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
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])

    if @customer.update(customer_params)
      flash[:notice] = "更新しました"
      redirect_to customer_path(@customer)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :name_kana, :phone_number, :memo)
  end
end
