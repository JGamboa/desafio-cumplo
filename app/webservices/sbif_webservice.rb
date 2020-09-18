class SbifWebservice
  API_KEY = '9c84db4d447c80c74961a72245371245cb7ac15f'
  include HTTParty
  base_uri 'https://api.sbif.cl'


  def self.get_tmc_indicator(day, month, year)
    if year > Date.today.year.to_i
      response = get("/api-sbifv3/recursos_api/tmc/posteriores/2017/12?apikey=#{API_KEY}&formato=json", format: :plain)
    else
      response = get("/api-sbifv3/recursos_api/tmc/posteriores/#{year}/#{month -2 }?apikey=#{API_KEY}&formato=json",  format: :plain)
    end

    return JSON.parse response
  end
end