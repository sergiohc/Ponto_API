require 'rails_helper'

RSpec.describe "Api::V1::Employees", type: :request do
  describe "GET /api_v1_employees" do
    context "With Invalid authentication headers" do
      it_behaves_like :deny_without_authorization, :get, "/api/v1/clock_in_out"
    end

    context "With Valid authentication headers" do
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
  
      it "returned employee have right datas" do
        expect(json[0]).to eql(JSON.parse(@employee))
      end
    end
  end
end
