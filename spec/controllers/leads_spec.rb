require 'spec_helper'
require 'rails_helper'
    RSpec.describe LeadsController do
    it 'should get all the leads' do
        Lead.create(full_name: 'LeadsName')
        get :index

        expect(assigns[:leads]).not_to be_empty

    end

        it 'should get all the leads' do
            get :index

            Lead.create(full_name: 'LeadsName')
    
            expect(assigns[:leads].size).to eq(1)
    
        
    end
end
