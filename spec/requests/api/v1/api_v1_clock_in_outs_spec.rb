require 'rails_helper'

RSpec.describe "Api::V1::ClockInOut", type: :request do
  #index
  describe "GET /api_v1_clock_in_outs" do
    before do
      @user = create(:user)
      @team = create(:team)
      @office = create(:office)
      @employee = create(:employee, 
        user: @user, office: @office, team: @team) 
      
      @clock_in_outs = create(:clock_in_outs, employee: @employee)
  
      get "/api/v1/clock_in_out", params: {}, headers: header_with_authentication(@user)
    end

    it "returns 200" do
      expect_status(200)
    end
  end
end
