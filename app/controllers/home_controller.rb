class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=25&API_KEY=D2DE3099-5FDA-42BC-A509-2D923C7E4FD3'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color = "grey"
      @api_description = ""
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Air quality is satisfactory."
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "ir quality is satisfactory"
    elsif @final_output >=101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Air quality is poor"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Air quality is bad"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Air quality is extremely bad, find a safe zone"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = "Hope you are using a breather!!"
    end

  end

  def zipcode
    @zip_query = params[:zipcode]

    if params[:zipcode] == ""
      @zip_query = "Hey you forgot to enter a zipcode"
    elsif params[:zipcode]
      #do something


      require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=' + params[:zipcode] +'&distance=25&API_KEY=D2DE3099-5FDA-42BC-A509-2D923C7E4FD3'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end

    if @final_output == "Error"
      @api_color = "grey"
      @api_description = ""
    elsif @final_output <= 50
      @api_color = "green"
      @api_description = "Air quality is satisfactory."
    elsif @final_output >= 51 && @final_output <= 100
      @api_color = "yellow"
      @api_description = "ir quality is satisfactory"
    elsif @final_output >=101 && @final_output <= 150
      @api_color = "orange"
      @api_description = "Air quality is poor"
    elsif @final_output >= 151 && @final_output <= 200
      @api_color = "red"
      @api_description = "Air quality is bad"
    elsif @final_output >= 201 && @final_output <= 300
      @api_color = "purple"
      @api_description = "Air quality is extremely bad, find a safe zone"
    elsif @final_output >= 301 && @final_output <= 500
      @api_color = "maroon"
      @api_description = "Hope you are using a breather!!"
    end


    end

  end
end
