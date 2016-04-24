class SolutionsController < ApplicationController
  before_action :get_goal, only: [:new, :show, :edit, :update, :create]
  before_action :set_solution, only: [:show, :edit, :update]

  # before_action :set_goal, only: [:show, :edit, :update]


  def get_goal
    @project = Project.find(params[:project_id])
    @goal = @project.goals.find(params[:goal_id])
  end

  # GET /solutions
  # GET /solutions.json
  def index
    # @solutions = Solution.all
    @solutions = @goal.solutions
  end

  # GET /solutions/1
  # GET /solutions/1.json
  def show
  end

  # GET /solutions/new
  def new
    # @solution = Solution.new
    @solution = @goal.solutions.build
  end

  # GET /solutions/1/edit
  def edit
    # @solution = @goal.solution.find(params[:id])
  end

  # POST /solutions
  # POST /solutions.json
  def create
    # @solution = Solution.new(solution_params)
    # @goal = Goal.find(params[:goal_id])
    @solution = @goal.solutions.new(solution_params)


    respond_to do |format|
      if @solution.save
        format.html { redirect_to project_goal_path(@project, @goal), notice: 'Solution was successfully created.' }
        format.json { render :show, status: :created, location: @solution }
      else
        format.html { render :new }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to project_goal_path(@project, @goal), notice: 'Solution was successfully updated.' }
        format.json { render :show, status: :ok, location: @solution }
      else
        format.html { render :edit }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    # @goal = Goal.find(params[:goal_id])
    # @solution = @goal.solutions.find(params[:id])
    @project = Project.find(params[:project_id])
    @goal = @project.goals.find(params[:goal_id])
    @solution = @goal.solutions.find(params[:id])
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to project_goal_path(@project, @goal), notice: 'Solution was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      # @solution = Solution.find(params[:id])
      @solution = @goal.solutions.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      params.require(:solution).permit(:description)
    end
end
