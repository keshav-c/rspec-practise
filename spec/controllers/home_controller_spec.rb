require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "#index" do
    it "responds successfully" do
      get :index
      # success has been deprecated for rails 6
      # expect(response).to be_successful               # <- works
      # expect(response).to have_http_status :ok        # <- also works
      expect(response).to have_http_status :success     # <- also works
    end
  end
end