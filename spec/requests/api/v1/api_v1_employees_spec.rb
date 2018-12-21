require 'rails_helper'

RSpec.describe "Api::V1::Employees", type: :request do
  describe "GET /api_v1_employees" do
    it "works! (now write some real specs)" do
      get api_v1_employees_index_path
      expect(response).to have_http_status(200)
    end
  end
end
