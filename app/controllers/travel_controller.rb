class TravelController < ApplicationController
  def index
  end

  # def search
  #   countries = find_country(params[:country])
  #   unless countries
  #     flash[:alert] = 'Country not found'
  #     return render action: :index
  #   end
  #   @country = countries
  #   # ...
  # end

  # def request_api(url)
  #   response = JSON.parse(URI.open(url).read)
  #   # return nil if response.status != 200
  # end

  # def find_country(name)
  #   request_api(
  #     "https://restcountries.com/v3.1/name/#{name}"
  #   )
  # end

  def search
    country = find_country((params[:country]))
    @country = country.read_body
  end

  def find_country(name)
    url = URI("https://rest-countries10.p.rapidapi.com/country/#{name}")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    request = Net::HTTP::Get.new(url)
    request["X-RapidAPI-Key"] = '447c1dbbb5msh9ad06a4c00be069p15e1a4jsnc720b8841080'
    request["X-RapidAPI-Host"] = 'rest-countries10.p.rapidapi.com'

    response = http.request(request)
  end

  private

end
