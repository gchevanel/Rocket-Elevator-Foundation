require 'spec_helper'
require 'rails_helper'
    RSpec.describe QuotesController do
    it 'should put all the leads' do
        get :index

        Quote.create(Full_Name: 'QuotesName')
        expect(assigns[:quotes]).not_to be_nil
    end

    it 'should look if size eq 1' do
        get :index
    Quote.create(Full_Name: 'QuotesName')
    expect(assigns[:quotes].size).to eq(1)
    end
end