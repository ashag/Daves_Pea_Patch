require 'spec_helper'

describe EventsController do 

  describe 'GET "index" ' do 
    it "assigns @events as instance"  do 
      let(:event) { create(:event) }
      get :index
      expect(@events).to be_an_instance_of(:event)
    end
  end

  describe 'POST "create" ' do 
    context 'with valid attributes' do
      let(:event) { create(:event) } 
      
      it 'redirects to event show page' do 
        post :create, event: event
        expect(response).to redirect_to event_show_path
      end

      it 'increases event count by 1' do 
        expect { post :create, event: event }.to change(Event, :count).by(1)
      end
    end

    context 'with invalid attributes' do 
      let(:event) { build(:event2)}

      it 'sets a flash message' do 
        post :create, event: event
        expect(flash[:notice]).to include "can't be blank"
      end
    end
  end

  describe 'DELETE "destroy" ' do
    let(:event) { create(:event) } 
    it 'decreases event count by 1' do 
      expect { delete :destroy, event: event}.to change(Event, :count).by(-1)
    end
  end
end