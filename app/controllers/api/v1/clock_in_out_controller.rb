class Api::V1::ClockInOutController < Api::V1::ApiController
  #before_action :set_employee_clock, only: [:show, :update, :destroy]
  #before_action :set_employ
  def index
    #@clock = ClockInOut.find(:all,:order=> 'date desc')
    @clock = ClockInOut.all
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
  def set_employ
    @employee = (@employee_clock)? @employee_clock.employee :  Employee.find(params[:employee_id])  
  end

  def set_employee_clock
    @employee_clock = ClockInOut.find(params[:employee_id])    
  end

  def clock_params
    params.require(:clock_in_out).permit(:date, :h1, :h2, :h3, :h4)
  end 

end
