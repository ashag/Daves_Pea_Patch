class ToolShedController < ApplicationController

  def new
    @tool = Tool.find(params[:tool_id])
    @checkout = @tool.user_tools.new
  end

  def create
    @tool = Tool.find(tool_shed_params[:tool_id])
    @qty = tool_shed_params[:qty].to_i

    if @tool.in_stock?(qty)
      UserTool.transaction do
        @checkout = current_user.user_tools.create(tool_shed_params)
        # changed default status to out, below code unnecessary 
        # @checkout.update(status: 'out')

        @tool.qty -= qty
        @tool.save
      end
      redirect_to tools_path
    else
      render :new
      flash[:notice] = "#{@tool.name} has only #{@tool.qty} in stock"
    end
  end  

  def update
    UserTool.transaction do 
      return_tool = UserTool.find(params[:id])
      return_tool.update(status: 'in')

      return_tool.tool.qty += return_tool.qty
    end

    redirect_to user_path
  end

  private
  def tool_shed_params
    params.require(:user_tool).permit(:tool_id, :qty, :status)
  end

end