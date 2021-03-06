class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :update, :destroy]
  before_action :authenticate_user

  # GET /quizzes
  def index
    if params[:by_name]
      @quizzes = paginate Quiz.visible_to_public.search_by_name(params[:by_name])
    else
      @quizzes = paginate Quiz.visible_to_public.order(course_code: :asc)
    end

    render json: @quizzes,
             include: params[:include],
             meta: meta_attributes(@quizzes)
  end

  # GET /quizzes/1
  def show
    render json: @quiz, include: params[:include]
  end

  # POST /quizzes
  def create
    @quiz = Quiz.new(quiz_params)

    if @quiz.save
      render json: @quiz, status: :created, location: @quiz
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quizzes/1
  def update
    if @quiz.update(quiz_params)
      render json: @quiz
    else
      render json: @quiz.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quizzes/1
  def destroy
    @quiz.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quiz
      @quiz = Quiz.visible_to_public.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quiz_params
      params.require(:quiz).permit(:instructions, :duration, :quiz_type, :year)
    end
end
