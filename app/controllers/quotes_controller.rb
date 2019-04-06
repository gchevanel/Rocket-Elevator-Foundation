class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @quotes = Quote.all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new()

    if params[:department] == 'Residential'
        @quote.Full_Name = quote_params[:Full_Name]
        @quote.Phone_Number = quote_params[:Phone_Number]
        @quote.Company_Name = quote_params[:Company_Name]
        @quote.Email = quote_params[:Email]
        @quote.Building_Type = quote_params[:department]
        @quote.Product_Grade = quote_params[:Check]
        @quote.Nb_Appartement = quote_params[:NbApartRes]
        @quote.Nb_Floor = quote_params[:NbStageRes]
        @quote.Nb_Basement = quote_params[:NbSsRes]
        @quote.Nb_Cage = quote_params[:nb_of_cage]
        @quote.Final_Price = quote_params[:totalprice]

    end
    if  params[:department] == 'Commercial'
        @quote.Full_Name = quote_params[:Full_Name]
        @quote.Phone_Number = quote_params[:Phone_Number]
        @quote.Company_Name = quote_params[:Company_Name]
        @quote.Email = quote_params[:Email]
        @quote.Building_Type = quote_params[:department]
        @quote.Product_Grade = quote_params[:Check]
        @quote.Nb_Floor = quote_params[:NbStageCom]
        @quote.Nb_Basement = quote_params[:NbSsCom]
        @quote.Nb_Parking = quote_params[:NbParkCom]
        @quote.Nb_Business = quote_params[:NbBusiCom]
        @quote.Nb_Cage = quote_params[:NbCageCom]
        @quote.Nb_Cage = quote_params[:nb_of_cage]
        @quote.Final_Price = quote_params[:totalprice]
    end
    if params[:department] == 'Corporate'
        @quote.Full_Name = quote_params[:Full_Name]
        @quote.Phone_Number = quote_params[:Phone_Number]
        @quote.Company_Name = quote_params[:Company_Name]
        @quote.Email = quote_params[:Email]
        @quote.Building_Type = quote_params[:department]
        @quote.Product_Grade = quote_params[:Check]
        @quote.Nb_Business = quote_params[:NbBusiCorp]
        @quote.Nb_Floor = quote_params[:NbStageCorp]
        @quote.Nb_Basement = quote_params[:NbSsCorp]
        @quote.Nb_Parking = quote_params[:NbParkCorp]
        @quote.Nb_OccupantPerFloor = quote_params[:MaxOccCorp]
        @quote.Nb_Cage = quote_params[:nb_of_cage]
        @quote.Final_Price = quote_params[:totalprice]

    end

    if params[:department] == 'Hybrid'
        @quote.Full_Name = quote_params[:Full_Name]
        @quote.Phone_Number = quote_params[:Phone_Number]
        @quote.Company_Name = quote_params[:Company_Name]
        @quote.Email = quote_params[:Email]
        @quote.Building_Type = quote_params[:department]
        @quote.Product_Grade = quote_params[:Check]
        @quote.Nb_Business = quote_params[:NbBusiHyb]
        @quote.Nb_Floor = quote_params[:NbStageHyb]
        @quote.Nb_Basement = quote_params[:NbSsHyb]
        @quote.Nb_Parking = quote_params[:NbParkHyb]
        @quote.Nb_OccupantPerFloor = quote_params[:MaxOccHyb]
        @quote.Nb_OpperatingHour = quote_params[:OppHourHyb]
        @quote.Nb_Cage = quote_params[:nb_of_cage]  
        @quote.Final_Price = quote_params[:totalprice]
        
    end
    
    ZendeskAPI::Ticket.create!($client, 
        :subject => "#{@quote.Full_Name} from #{@quote.Company_Name}", 
        :comment => "The contact #{@quote.Full_Name} from company #{@quote.Company_Name} can be reached at email #{@quote.Email} and at phone number #{@quote.Phone_Number}.
        The building type was #{@quote.Building_Type} with product grade #{@quote.Product_Grade} with a cost of #{@quote.Final_Price}."
        )

    respond_to do |format|
      if @quote.save
        format.html { redirect_to thanksquote_path, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.permit(:department, :Company_Name, :Email, :Check, :NbApartRes, :NbStageRes, :NbSsRes, :nb_of_cage, :totalprice, :NbStageCom, 
        :NbSsCom, :NbParkCom, :NbBusiCom, :NbCageCom, :NbBusiCorp,:NbStageCorp, :NbSsCorp, :NbParkCorp,
        :MaxOccCorp, :NbBusiHyb, :NbStageHyb, :NbSsHyb, :NbParkHyb, :MaxOccHyb, :OppHourHyb, :Full_Name, :Phone_Number)
    end
end
