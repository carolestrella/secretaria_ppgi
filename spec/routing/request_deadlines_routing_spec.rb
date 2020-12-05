require "rails_helper"

RSpec.describe RequestDeadlinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/request_deadlines").to route_to("request_deadlines#index")
    end

    it "routes to #new" do
      expect(get: "/request_deadlines/new").to route_to("request_deadlines#new")
    end

    it "routes to #show" do
      expect(get: "/request_deadlines/1").to route_to("request_deadlines#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/request_deadlines/1/edit").to route_to("request_deadlines#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/request_deadlines").to route_to("request_deadlines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/request_deadlines/1").to route_to("request_deadlines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/request_deadlines/1").to route_to("request_deadlines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/request_deadlines/1").to route_to("request_deadlines#destroy", id: "1")
    end
  end
end
