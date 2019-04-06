require 'sendgrid-ruby'
require 'dropbox_api'
include DropboxApi
include SendGrid
class LeadsController < ApplicationController
  before_action :set_lead, only: [:show, :edit, :update, :destroy]

  # GET /leads
  # GET /leads.json
  def index
    @leads = Lead.all
  end

  # GET /leads/1
  # GET /leads/1.json
  def show
  end

  # GET /leads/new
  def new
    @lead = Lead.new
  end

  # GET /leads/1/edit
  def edit
  end

  # POST /leads
  # POST /leads.json
  def create

    @lead = Lead.new(lead_params)

@lead.full_name = params[:full_name]
@lead.email = params[:email]
@lead.phone = params[:phone]
@lead.business_name = params[:business_name]
@lead.project_name = params[:project_name]
@lead.department = params[:department]
@lead.project_description = params[:project_description]
@lead.message = params[:message]
@lead.file_attachment = params[:lead]

    if @lead.file_attachment !=nil

        extra_text = "The Contact uploaded an attachment"
        @lead.file_attachment = params[:lead][:file_attachment]
    else

        extra_text = ""
        @lead.file_attachment = params[:file_attachment]
    end

    ZendeskAPI::Ticket.create!($client, 
        :subject => "#{@lead.full_name} from #{@lead.business_name}", 
        :comment => "The contact #{@lead.full_name} from company #{@lead.business_name} can be reached at email #{@lead.email} and at phone number #{@lead.phone}. 
        #{@lead.department} has a project named #{@lead.project_name} which would require contribution from Rocket Elevators.
        \n Project Description : #{@lead.project_description} 
        \n Attached message : #{@lead.message}  
        #{extra_text} ",
        )

    #Call to Lead Model
    if @lead.file_attachment != nil
        @lead.dropbox
    end

    respond_to do |format|
      if @lead.save
        format.html { redirect_to thanksleads_path, notice: 'leads was successfully created.' }
        format.json { render :show, status: :created, location: @lead }
        # SendGrid Call
        sendgrid(@lead)
      else
        format.html { render :new }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /leads/1
  # PATCH/PUT /leads/1.json
  def update
    respond_to do |format|
      if @lead.update(lead_params)
        format.html { redirect_to @lead, notice: 'Lead was successfully updated.' }
        format.json { render :show, status: :ok, location: @lead }
      else
        format.html { render :edit }
        format.json { render json: @lead.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leads/1
  # DELETE /leads/1.json
  def destroy
    @lead.destroy
    respond_to do |format|
      format.html { redirect_to leads_url, notice: 'Lead was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lead
      @lead = Lead.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lead_params
      params.permit(:full_name, :email, :phone, :business_name, :project_name, :department, :project_description, :message, file_attachment:[])
    end

    # SendGrid Leads Notification Email Template
    def sendgrid(lead)
      data = JSON.parse("{
        \"personalizations\": [
          {
            \"to\": [
              {
                \"email\": \"#{lead.email}\"
              }
            ],
            \"dynamic_template_data\": {
              \"subject\": \"Sending with SendGrid is Fun\",
              \"name\": \"#{lead.full_name}\",
              \"project_name\": \"#{lead.project_name}\"
            }
          }
        ],
        \"from\": {
          \"email\": \"support@rocketelevators.com\"
        },
      \"template_id\": \"#{ENV['template_id']}\"
      }")
 
      sg = SendGrid::API.new(api_key: ENV['sendgrid_api_key'])
      response = sg.client.mail._('send').post(request_body: data)
      puts response.status_code
      puts response.body
      puts response.headers
 end
end