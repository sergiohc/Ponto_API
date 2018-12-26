require 'rails_helper'

RSpec.describe "Api::V1::Employees", type: :request do
  describe "GET /api_v1_employees" do
    before do
      @user = create(:user)
      @team = create(:team)
      @office = create(:office)
      @employee = create(:employee, 
        user: @user, office: @office, team: @team) 
      
      get "/api/v1/employees", params: {}, headers: header_with_authentication(@user)
    end
    
    it "returns 200" do
      expect_status(200)
    end
  end
end
