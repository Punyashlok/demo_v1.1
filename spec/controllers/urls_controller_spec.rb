require "rails_helper"

RSpec.describe UrlsController, type: :controller do
  let(:url_params) { { url: { long_url: "http://www.itsalongurl.com/how-to-cook-pasta" } } }
 
  describe "get#index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "post#create" do
  it "returns a successful response" do
    post :create, params: url_params
    expect(response).to redirect_to urls_path
  end
end

  describe "get#show" do
    it "returns a successful response" do
      valid_url = Url.create!(name: "test", 
      long_url: "https://nasa.gov/press-release/nasa-to-brief-media-on-first-earth-water-monitoring-satellite-mission", short_url: "abc123")

      get :show, params: { short_url: "abc123" }
      expect(response).to redirect_to long_url
    end
  end
end