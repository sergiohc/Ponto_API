class Api::V1::EmployeesController < Api::V1::ApiController
  before_action :authenticate_api_v1_user!, except: [:show]
  def index
#    @employees = employee.find(:all, :order => 'name')
    @employees = current_api_v1_user.employee
    render json: @employees.to_json
  end

  def show
    render json: @employees
  end

  def update
    @employee.update(employee_params)
    render json: @employee
  end

  def create
    @employee.create(employee_params)
    render json: @employee
  end

  def destroy
    @employee.destroy
    render json: {message: 'ok'}
  end

  private
  def employee_params
    params.require(:employee).permit(:name, :cpf, :pis, :office_id, :team_id).merge(user: current_api_v1_user)        
  end 
end
