class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :authenticate_user, except: [:create]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user,
           include: %w[courses courses.quizzes courses.quizzes.questions]
  end

  # POST /users
  def create
    @user = User.new(user_params)
    @user.gold_ledger_entries.build(amount: 99,
                                    notes: 'Initial 99 pasco_gold given to user for purchasing courses')
    # Automatically purchase ENGL157 (Communication Skills) for user
    @user.purchases.build(course: Course.find_by(code: 'ENGL157'))

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def refresh_token
    token = Knock::AuthToken.new(payload: { sub: current_user.id }).token
    render json: { jwt: token }
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email, :password, :programme)
  end
end
