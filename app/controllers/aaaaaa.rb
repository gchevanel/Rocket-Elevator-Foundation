# class InterventionsController < ApplicationController
#   before_action :set_intervention, only: [:show, :edit, :update, :destroy]

#   # GET /interventions
#   # GET /interventions.json
#   def index
#     @customerids = Customer.all
#     @interventions = Intervention.all
#     current_user.first_name
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     p current_user
#     session[:user] = current_user

#   end

#   def find_buildings
#     @buildings = Building.where("customer_id = ?", params[:customer_id])
#     respond_to do |format|
#       format.js
#     end
#     render json: @buildings
#   end

#   def find_batteries
#     @batteries = Battery.where("building_id = ?", params[:building_id])
#     p(@batteries)
#     respond_to do |format|
#       format.js
#     end
#     render json: @batteries
#   end
#   def find_column
#     @columns = Column.where("battery_id = ?", params[:battery_id])
#     p(@columns)
#     respond_to do |format|
#       format.js
#     end
#     render json: @columns
#   end
#   def find_elevator
#     @elevators = Elevator.where("column_id = ?", params[:column_id])
#     respond_to do |format|
#       format.js
#     end
#     render json: @elevators
#   end
#   # GET /interventions/1
#   # GET /interventions/1.json
#   def show
#   end

#   # GET /interventions/new
#   def new
#     @intervention = Intervention.new
#   end

#   # GET /interventions/1/edit
#   def edit
#   end

#   # POST /interventions
#   # POST /interventions.json
#   def create
#     @intervention = Intervention.new()
#     # customer = Customer.find(params[:customer_id])

#     @intervention.Author = session[:user]
#     @intervention.Customer_id = params[:customer_id]
#     @intervention.Building_id = params[:building_id]
#     @intervention.Battery_id = params[:battery_id]
#     @intervention.Column_id = params[:column_id]
#     @intervention.Elevator_id = params[:elevator_id]
#     @intervention.Employee_id = params[:employee]
#     @intervention.Result = "Incomplet"
#     @intervention.Report = params[:message]
#     @intervention.Status = "Pending"


#     respond_to do |format|
#       if @intervention.save!
#         format.html { redirect_to thanksquote_path, notice: 'Intervention was successfully created.' }
#         format.json { render :show, status: :created, location: @intervention }
#       else
#         format.html { render :new }
#         format.json { render json: @intervention.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PATCH/PUT /interventions/1
#   # PATCH/PUT /interventions/1.json
#   def update
#     respond_to do |format|
#       if @intervention.update(intervention_params)
#         format.html { redirect_to @intervention, notice: 'Intervention was successfully updated.' }
#         format.json { render :show, status: :ok, location: @intervention }
#       else
#         format.html { render :edit }
#         format.json { render json: @intervention.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /interventions/1
#   # DELETE /interventions/1.json
#   def destroy
#     @intervention.destroy
#     respond_to do |format|
#       format.html { redirect_to interventions_url, notice: 'Intervention was successfully destroyed.' }
#       format.json { head :no_content }
#     end
#   end

#   private
#     # Use callbacks to share common setup or constraints between actions.
#     def set_intervention
#       @intervention = Intervention.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def intervention_params
#       params.permit(:employee, :customer_id, :building_id, :battery_id, :column_id, :elevator_id, :message)
#     end
# end
