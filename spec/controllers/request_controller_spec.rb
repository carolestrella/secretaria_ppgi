require "rails_helper"

describe RequestsController do
  before(:all) do
    @request_instance = create(:request)

    @params = {}
    @params['request'] = {user_id: 1, request_type_id: 1, documents: fixture_file_upload(Rails.root.join('public', 'dummy_pdf.pdf'), 'application/pdf')}
  end
  
  describe "GET index" do
    it "should return 200 status" do
      get :index, {}
      expect(response).to have_http_status(200)
    end
    
    it "assigns all requests as @requests" do
      get :index, {}
      assigns(:requests).should eq([@request_instance])
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new request" do
        expect {
          post :create, params: @params
        }.to change(Request, :count).by(1)
      end

      it "assigns a newly created request as @request" do
        post :create, params: @params
        assigns(:request).should be_persisted
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates a request" do
        request = Request.create!(user_id: 1, request_type_id: 1, documents: fixture_file_upload(Rails.root.join('public', 'dummy_pdf.pdf'), 'application/pdf'))
        updated_request_type = RequestType.create!(title: "Passagem")
  
        Request.any_instance.should_receive(:update_attributes).with({ :request_type_id => updated_request_type.id })
        put :update, {:id => request.to_param, :request => { :request_type_id => updated_request_type.id }}
      end

      it "assigns the requested request as @request" do
        request = Request.create!(user_id: 1, request_type_id: 1, documents: fixture_file_upload(Rails.root.join('public', 'dummy_pdf.pdf'), 'application/pdf'))

        put :update, {:id => request.to_param, :request => @params['request']}
        assigns(:request).should eq(request)
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the request" do
      request = create(:request)

      expect {
        delete :destroy, {:id => request.to_param}
      }.to change(Request, :count).by(-1)
    end
  end

end