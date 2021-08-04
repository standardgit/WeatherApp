class HomeController < ApplicationController
  def index
    require 'net/http'
    require 'json'

    @url = 'https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=89129&distance=0&API_KEY=D2DE3099-5FDA-42BC-A509-2D923C7E4FD3'
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)

    if @output.empty?
      @final_output = "Error"
    else
      @final_output = @output[0]['AQI']
    end

  end
end
