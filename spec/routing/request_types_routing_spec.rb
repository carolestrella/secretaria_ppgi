require "rails_helper"

RSpec.describe RequestTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/request_types").to route_to("request_types#index")
    end

    it "routes to #new" do
      expect(get: "/request_types/new").to route_to("request_types#new")
    end

    it "routes to #show" do
      expect(get: "/request_types/1").to route_to("request_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/request_types/1/edit").to route_to("request_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/request_types").to route_to("request_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/request_types/1").to route_to("request_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/request_types/1").to route_to("request_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/request_types/1").to route_to("request_types#destroy", id: "1")
    end
  end
end
