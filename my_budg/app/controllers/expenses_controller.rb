class ExpensesController < ApplicationController


  def index
    @expenses = Expense.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @expenses}
    end
  end

  def show
     @expense = Expense.find(params[:id])
     respond_to do |format|
       format.html { render :show }
       format.json { render json: @expense}
     end
   end

   def new
     @expense = Expense.new
   end

   def create
     @expense = Expense.create(expense_params)
     render json: @expense, status: 201
   end

  def edit
    @expense = Expense.find(params[:id])
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(expense_params)
      flash[:success] = "expenses updated"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :expense_type, :cost, :start_time, :user_id)
  end
end
