class Public::CustmersController < ApplicationController

  def show
    @customer = Customer.find
  end
  
  def edit
    
  end

end
