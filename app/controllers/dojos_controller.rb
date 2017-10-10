class DojosController < ApplicationController
  def index
  	@dojos = Dojo.all
  	render "dojos/index.html.erb"
  end
  
  def show_create_page
  	render "dojos/create_page.html.erb"
  end
  
  def destroy
  	@dojo = Dojo.find(params[:id]).destroy
  	redirect_to "/dojos"
  end
  
  def create
  	dojo = Dojo.new(dojo_params)
  	dojo.save
  	redirect_to "/dojos"
  end

  def update
  	@dojo = Dojo.find(params[:id])
  	@dojo.update(dojo_params)
  	redirect_to "/dojos"
  end

  def show_edit_page
  	@dojo = Dojo.find(params[:id])
  	render "dojos/edit_dojo.html.erb"
  end
  

  private 
  def dojo_params
  	params.require(:dojo).permit(:branch, :street, :city, :state)
  end

end
