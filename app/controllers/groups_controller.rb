class GroupsController < ApplicationController
  before_action :authenticate_user!, :except => :show
  
  def new
    @group = Group.new
  end
  
  def create
    @founder = Character.find(params[:founder])
    head :forbidden unless @founder and @founder.user == current_user
    
    @group = Group.new(group_params)
    @group.characters = [@founder]
    @group.save
    
    redirect_to @group
  end
  
  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    
    if @group.update(group_params)
      redirect_to @group
    else
      render 'edit'
    end
  end
  
  def show
    @group = Group.find(params[:id])
  end
  
  private
  def group_params
    params.require(:group).permit(:name, :message)
  end
end