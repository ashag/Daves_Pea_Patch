require 'spec_helper'

describe ToolsController do 

  describe 'GET "new" ' do 

    context 'user email not on user profile, clicks link to create new tool' do
      let(:user) { create(:user_no_email)}

      before(:each) do 
        session[:user_id] = user.id
      end  

      it 'redirects user to profile' do
        get :new
        expect(response).to redirect_to(user_path(user.id))
      end

      it 'sets flash notice' do 
        get :new
        expect(flash[:notice]).to include 'Please add your email to gain access to tools'
      end
    end
  end

  describe 'POST "create" ' do 

    context 'with valid attributes' do 
      let(:valid_tool) { {name: 'pruners', qty: 1} }

      it 'changes tool count by 1' do 
        expect { post :create, tool: valid_tool }.to change(Tool, :count).by(1)
      end

      it 'redirects to tool index page' do 
        post :create, tool: valid_tool 
        expect(response).to redirect_to tools_path
      end

      it 'sets a flash message' do 
        post :create, tool: valid_tool
        expect(flash[:notice]).to include "added to tool shed"
      end
    end

    context 'with invalid attributes' do 

      it 'renders new template' do 
        post :create, tool: { name: nil}
        expect(response).to render_template :new
      end

      it 'sets a flash message' do 
        post :create, tool: { name: nil}
        expect(flash[:notice]).to include 'Tool must have a name'
      end
    end
  end

  describe 'DELETE "destroy" ' do 
    let!(:delete_tool) { create(:tool) }

    it 'redirects to tools index' do 
      delete :destroy, id: delete_tool.id
      expect(response).to redirect_to tools_path
    end

    it 'changes tool count' do 
      expect { delete :destroy, id: delete_tool.id }.to change(Tool, :count).by(-1)
    end
  end
end