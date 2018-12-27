class Api::V1::EmployeesController < Api::V1::ApiController
  before_action :authenticate_api_v1_user!, except: [:show]
  before_action :set_employee, only: [:show, :update, :destroy] 
  before_action :allow_only_owner, only: [:show, :destroy] 
  
  def index
    @employees = current_api_v1_user.employees
    render json: @employees
  end

  def show
    render json: @employee
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

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def allow_only_owner
    byebug
    unless current_api_v1_user == @employee.user
      render(json: {}, status: :forbidden) and return
    end
    byebug
  end

end
