class CareersController < ApplicationController
  before_action :set_career, only: [:show, :edit, :update, :destroy]

  # GET /careers
  # GET /careers.json
  def index
    @careers = Career.all
  end

  # GET /careers/1
  # GET /careers/1.json
  def show
  end

  # GET /careers/new
  def new
    @career = Career.new
  end

  # GET /careers/1/edit
  def edit
  end

  # POST /careers
  # POST /careers.json
  def create
    @career = Career.new()

    @career.first_name = career_params[:first_name]
    @career.last_name = career_params[:last_name]
    @career.email = career_params[:email]
    @career.phone = career_params[:phone]
    @career.position = career_params[:position]
    @career.expected_salary = career_params[:expected_salary]
    @career.start_date = career_params[:start_date]
    @career.experience = career_params[:experience]
    @career.attachment = career_params[:attachment]


    respond_to do |format|
      if @career.save
        format.html { redirect_to thanks_path, notice: 'Career was successfully created.' }
        format.json { render :show, status: :created, location: @career }
      else
        format.html { render :new }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH/PUT /careers/1
  # PATCH/PUT /careers/1.json
  def update
    respond_to do |format|
      if @career.update(career_params)
        format.html { redirect_to @career, notice: 'Career was successfully updated.' }
        format.json { render :show, status: :ok, location: @career }
      else
        format.html { render :edit }
        format.json { render json: @career.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /careers/1
  # DELETE /careers/1.json
  def destroy
    @career.destroy
    respond_to do |format|
      format.html { redirect_to careers_url, notice: 'Career was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_career
      @career = Career.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def career_params
      params.permit(:first_name, :last_name, :email, :phone, :position, :expected_salary, :start_date, :experience, :attachment)
    end

end