require 'rails_helper'

RSpec.describe Request, type: :model do
  describe 'accept only valid requests' do
    before :each do
      @request = build(:request)
    end

    context "valid attributes" do
      it "is valid" do
        expect(@request.save).to be true
      end
    end

    context "invalid attributes" do
      it "no documents" do
        @request.documents = nil
        expect(@request.save).to be false 
      end

      it "no user" do
        @request.user = nil
        expect(@request.save).to be false 
      end

      it "no request type" do
        @request.request_type_id = nil
        expect(@request.save).to be false 
      end
    end
  end
end
