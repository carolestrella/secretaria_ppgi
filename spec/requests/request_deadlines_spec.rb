 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/request_deadlines", type: :request do
  # RequestDeadline. As you add validations to RequestDeadline, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      RequestDeadline.create! valid_attributes
      get request_deadlines_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      request_deadline = RequestDeadline.create! valid_attributes
      get request_deadline_url(request_deadline)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_request_deadline_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      request_deadline = RequestDeadline.create! valid_attributes
      get edit_request_deadline_url(request_deadline)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new RequestDeadline" do
        expect {
          post request_deadlines_url, params: { request_deadline: valid_attributes }
        }.to change(RequestDeadline, :count).by(1)
      end

      it "redirects to the created request_deadline" do
        post request_deadlines_url, params: { request_deadline: valid_attributes }
        expect(response).to redirect_to(request_deadline_url(RequestDeadline.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new RequestDeadline" do
        expect {
          post request_deadlines_url, params: { request_deadline: invalid_attributes }
        }.to change(RequestDeadline, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post request_deadlines_url, params: { request_deadline: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested request_deadline" do
        request_deadline = RequestDeadline.create! valid_attributes
        patch request_deadline_url(request_deadline), params: { request_deadline: new_attributes }
        request_deadline.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the request_deadline" do
        request_deadline = RequestDeadline.create! valid_attributes
        patch request_deadline_url(request_deadline), params: { request_deadline: new_attributes }
        request_deadline.reload
        expect(response).to redirect_to(request_deadline_url(request_deadline))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        request_deadline = RequestDeadline.create! valid_attributes
        patch request_deadline_url(request_deadline), params: { request_deadline: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested request_deadline" do
      request_deadline = RequestDeadline.create! valid_attributes
      expect {
        delete request_deadline_url(request_deadline)
      }.to change(RequestDeadline, :count).by(-1)
    end

    it "redirects to the request_deadlines list" do
      request_deadline = RequestDeadline.create! valid_attributes
      delete request_deadline_url(request_deadline)
      expect(response).to redirect_to(request_deadlines_url)
    end
  end
end