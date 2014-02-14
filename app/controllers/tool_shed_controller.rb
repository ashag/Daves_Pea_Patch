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
        # above code is same as below
        # @checkout.user = current_user
        # @checkout.save

        @tool.qty -= qty
        @tool.save
      end
      redirect_to tools_path
    else
      render :new
      flash[:notice] = "#{@tool.name} has only #{@tool.qty} in stock"
    end
  end  

  def update #create button in user tools page
    tool = Tool.find(params[:id]) 
    find_tool = UserTool.where(user_id: current_user.id, tool_id: @tool.id)
    find_tool.update(status: 'in')
    find_tool.save

    tool.quantity += find_tool.qty
  end

  private
  def tool_shed_params
    params.require(:user_tool).permit(:tool_id, :qty, :status)
  end

end