require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /new" do
    it "responds successfully" do
      get login_path
      expect(response.status).to eq 200
    end
  end
end
