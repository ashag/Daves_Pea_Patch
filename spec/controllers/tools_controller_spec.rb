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

  end






end