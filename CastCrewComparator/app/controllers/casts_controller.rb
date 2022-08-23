require 'net/http'
require 'json'

class CastsController < ApplicationController
  before_action :set_cast, only: %i[ show edit update destroy ]

  # GET /casts or /casts.json
  def index
    @casts = Cast.all
  end

  # GET /casts/1 or /casts/1.json
  def show
  end

  # GET /casts/new
  def new
    @cast = Cast.new
  end

  # GET /casts/1/edit
  def edit
  end

  # POST /casts or /casts.json
  def create
    @cast = Cast.new(cast_params)

    respond_to do |format|
      if @cast.save
        format.html { redirect_to cast_url(@cast), notice: "Cast was successfully created." }
        format.json { render :show, status: :created, location: @cast }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /casts/1 or /casts/1.json
  def update
    respond_to do |format|
      if @cast.update(cast_params)
        format.html { redirect_to cast_url(@cast), notice: "Cast was successfully updated." }
        format.json { render :show, status: :ok, location: @cast }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /casts/1 or /casts/1.json
  def destroy
    @cast.destroy

    respond_to do |format|
      format.html { redirect_to casts_url, notice: "Cast was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cast
      @cast = Cast.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cast_params
      api_call()
      params.require(:cast).permit(:first_person, :second_person)
    end

    def api_call
      puts ""
      puts "@@@@@Test1@@@@@"
      puts ""

      imdb_api_key = "";
      # 1.1 Search
      uri = URI("https://imdb-api.com/en/API/Search/#{imdb_api_key}/#{:first_person}")
      search_result1 = Net::HTTP.get_response(uri)

      # 1.2 Search
      uri2 = URI("https://imdb-api.com/en/API/Search/#{imdb_api_key}/#{:second_person}")
      search_result2 = Net::HTTP.get_response(uri)


      # 2.1 First film
      film_id1 = JSON.parse(search_result1.body)['results'][0]['id']

      # 2.2 First film
      film_id2 = JSON.parse(search_result2.body)['results'][0]['id']


      # 3.1 CC of first film
      cast_uri1 = URI("https://imdb-api.com/en/API/FullCast/#{imdb_api_key}/#{film_id1}")
      castList1= Net::HTTP.get_response(cast_uri1)
      all_cc1 = castList1.body.scan(/id\":\"([a-zA-Z0-9]*)/)

      # 3.2 CC of second film
      cast_uri2 = URI("https://imdb-api.com/en/API/FullCast/#{imdb_api_key}/#{film_id2}")
      castList2= Net::HTTP.get_response(cast_uri2)
      all_cc2 = castList2.body.scan(/id\":\"([a-zA-Z0-9]*)/)

      # 4
      intersection = all_cc2 & all_cc1

      listOfMembers = Array.new{CCInfo}

      for x in 1..5 do
        listOfMembers.push(getCCInfo(intersection[x].first))
      end
        
       puts listOfMembers

    end
end


def getCCInfo(nm)
  imdb_api_key = "";
  uri = URI("https://imdb-api.com/API/Name/#{imdb_api_key}/#{nm}");
  ccInforesult= Net::HTTP.get_response(uri)

  ccData = CcInfo.new(name: JSON.parse(ccInforesult.body)["name"].to_s,picture:JSON.parse(ccInforesult.body)["image"].to_s,knownFor: JSON.parse(ccInforesult.body)["knownFor"].to_s)
  ccData.save

  ccData
end


=begin
1. Create 2 search links
2. Get id from first responses
3. Get all id of CC
4. Find people in common
5. New Function that takes name and returns photo and known works
=end
