class ToolShedController < ApplicationController

  def new
    @tool = UserTool.new(tool_shed_params)
  end

  def add_tool
    @tool = Tool.find(params[:tool_id])
  end

  def in_stock?(quantity)
    quantity <= @user_tool.tool.qty
  end

  def create

  end

  def destroy

  end

  private
  def tool_shed_params
    params.require(:user_tool).permit(:user_id, :tool_id, :qty)
  end

end