class GoalsController < ApplicationController
  before_action :get_project, only: [:new, :show, :edit, :update]
  before_action :set_goal, only: [:show, :edit, :update]



  def get_project
    @project = Project.find(params[:project_id])
  end
  # GET /goals
  # GET /goals.json
  def index
    # @goals = Goal.all
    @goals = @project.goals
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    # @goal.solutions.build
  end

  # GET /goals/new
  def new
    # @goal = Goal.new
    @goal = @project.goals.build
    # @goal = @project.goals.new

  end

  # GET /goals/1/edit
  def edit
    @goal = @project.goals.find(params[:id])
  end

  # POST /goals
  # POST /goals.json
  def create
    # @goal = Goal.new(goal_params)
    @project = Project.find(params[:project_id])
    @goal = @project.goals.new(goal_params)

    respond_to do |format|
      if @goal.save
        format.html { redirect_to @project, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @project, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @goal = @project.goals.find(params[:id])
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to @project, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_goal

    @goal = @project.goals.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def goal_params
    params.require(:goal).permit(:problem, :reference, :solutions_attributes => [:description])
  end
end
