class ContactsController < ApplicationController
  def new
    @contact = ContactNumber.new
  end

  def generate
    generate_number
  end

  def request_number
    
  end

  def check_number
    @status = false
    User.create(user_params) if params[:user][:name]
    if ContactNumber.where(number: params[:user][:number].gsub('-', '').to_i).present?
      generate_number
    else
      @contact = ContactNumber.create(number: params[:user][:number].gsub('-', ''), available: false)
      if @contact  
        @status = true
      else
        flash[:notice] = 'Cannot generate number'
        redirect_to root_path
      end
    end
  end

  def generate_number
    range = ContactNumber::MIN_RANGE..ContactNumber::MAX_RANGE
    @user = User.create(user_params) if params[:user][:name]
    loop do
      @number = rand(range)
      break if !ContactNumber.where(number: @number).present? && (@contact = ContactNumber.create(number: @number, available: false))
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
