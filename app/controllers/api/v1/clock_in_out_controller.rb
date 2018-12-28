class Api::V1::ClockInOutController < Api::V1::ApiController
  #before_action :authenticate_api_v1_user!, except: [:show]
  #before_action :set_employee
  before_action :set_clock_employee, only: [:update, :destroy, :show]
  #before_action :allow_only_owner, only: [:create, :update, :destroy]
  
  def index
    @clock = @employee.clock_in_out
    render json: @clock
  end

  def show
    render json: @employee_clock
  end

  def update
    @employee_clock.update(clock_params)
    render json: @question
  end

  def create
    @add_clock = ClockInOut.create(clock_params.merge(employee: @employee))
    render json: @add_clock
  end

  def destroy
    @employee_clock.destroy
    render json: {message: 'ok'}
  end

  private
  def set_employee
    @employee =  Employee.find(params[:employee_id])  
  end

  def set_clock_employee
    if (params[:day].present?)
      @employee_clock = ClockInOut.where(employee_id: params[:id], date: Date.today)
    else
      @employee_clock = ClockInOut.where(employee_id: params[:id])
    end
  end

  def clock_params
    params.require(:clock_in_out).permit(:date, :h1, :h2, :h3, :h4, :day)
  end 

  def allow_only_owner
    unless current_api_v1_user == @employee.user
      render(json: {}, status: :forbidden) and return
    end
  end

end
