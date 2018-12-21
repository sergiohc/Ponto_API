class Api::V1::ClockInOutController < Api::V1::ApiController
  before_action :set_employee_clock, only: [:show, :update, :destroy]

  def index
  end

  def show
  end

  def update
  end

  def create
  end

  def destroy
  end

  private
  def set_employee
    @employee_clock = Form.friendly.find(params[:employee_id])    
  end

end
