require 'spec_helper'

describe ToolController do 

  describe 'GET "new" ' do 
    it 'is successful' do 
      get :new
      expect(user).to be_successful
    end
  end

  describe 'POST "create" ' do 

    context 'with valid attributes' do 
      let(:valid_tool) {name: 'pruners', qty: 1}

      it 'changes tool count by 1' do 
        expect { post :create, tool: valid_tool }.to change(Tool, :count).by(1)
      end

      it 'redirects to tool index page' do 
        subject { post :create, tool: valid_tool }
        expect(subject).to redirect_to :action => :index
      end

      it 'sets a flash message' do 
        post :create, tool: valid_tool
        expect(flash[:notice]).to include "#{valid_tool.name} added to tool inventory"
      end
    end

<<<<<<< HEAD
    context 'with invalid attributes' do 
      let(:invalid_tool) {name: '', qty: 1}

      it 'renders new template' do 
        post :create, tool: invalid_tool
        expect(response).to render_template :new
      end

      it 'sets a flash message' do 
        post :create, tool: invalid_tool
        expect(flash[:notice]).to include 'Tool must have a name'
      end
    end
  end

  describe 'DELETE "destroy" ' do 
    let(:deleted_tool) {create(:user)}

    it 'is successful' do 
      delete :destroy, id: deleted_tool.id
      expect(response).to be_successful
    end

    it 'changes tool count' do 
      expect { delete :destroy, tool: deleted_tool }.to change(Tool, :count).by(tool.qty)
    end
  end
=======
  end






>>>>>>> twitter
end