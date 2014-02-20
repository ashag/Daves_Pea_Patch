class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end  

  def new
    # before_filter
    # if current_user.nil?
    #   redirect_to :somewhere
    # end

    if current_user && current_user.email != nil
      @tool = Tool.new
      render :new
    else
      redirect_to root_path
      #TODO: fix this flash notice because it doesn't work.
      flash[:notice] = "Please add your email to gain access to tools"
    end
  end

  def create
    @tool = Tool.create(tool_params)

    if @tool.save
      redirect_to tools_path
      flash[:notice] = "#{@tool.name} added to tool shed"
    else
      render :new
      flash[:notice] = 'Tool must have a name'
    end 
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    redirect_to tools_path
  end



  private
  def tool_params
    params.require(:tool).permit(:name, :qty)
  end
end