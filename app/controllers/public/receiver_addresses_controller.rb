class Public::ReceiverAddressesController < ApplicationController
  def index
    @receiver_addresses = current_customer.receiver_addresses
    @receiver_address = ReceiverAddress.new
  end

  def edit
    @receiver_address = ReceiverAddress.find(params[:id])
  end

  def create
    @receiver_address = current_customer.receiver_addresses.new(receiver_address_params)
    if @receiver_address.save!
      redirect_to public_receiver_addresses_path
    else
      render :index
    end
  end

  def update
    @receiver_address = ReceiverAddress.find(params[:id])
    @receiver_address.update(receiver_address_params)
    redirect_to public_receiver_addresses_path
  end

  def destroy
    receiver_address = ReceiverAddress.find(params[:id])
    receiver_address.destroy
    @receiver_addresses = ReceiverAddress.all
    redirect_to request.referer
  end

  private
  def receiver_address_params
      params.require(:receiver_address).permit(:zip_code, :address, :name)
  end
end
