class ToolShedController < ApplicationController

  def new
    @tool = UserTool.new
  end

  def create
    @tool = Tool.find(params[:id])

    if in_stock?(params[:qty])
      UserTool.create(tool_shed_params)
      @tool.qty -= params[:qty]
      redirect_to tools_path
    else
      render :new
      flash[:notice] = "#{@tool.name} has only #{@tool.qty} in stock"
    end
  end  

  def in_stock?(quantity)
    @tool = Tool.find(params[:id])
    quantity <= @tool.qty
  end

  def check_in #create button in user tools page
    tool = Tool.find(params[:id]) 
    find_tool = UserTool.where(user_id: current_user.id, tool_id: @tool.id)
    find_tool.update(status: 'in')

    tool.quantity += find_tool.qty
  end

  private
  def tool_shed_params
    params.require(:user_tool).permit(:user_id, :tool_id, :qty, :status)
  end

end