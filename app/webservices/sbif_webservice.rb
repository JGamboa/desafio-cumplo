class SbifWebservice
  API_KEY = '9c84db4d447c80c74961a72245371245cb7ac15f'
  include HTTParty
  base_uri 'https://api.sbif.cl'


  def self.get_tmc_indicator(date)
    month = date.month.to_i
    year = date.year.to_i

    if date >= Date.today
      response = get("/api-sbifv3/recursos_api/tmc/posteriores/#{Date.today.year.to_i}/#{Date.today.month.to_i - 2}?apikey=#{API_KEY}&formato=json", format: :plain)
    else
      response = get("/api-sbifv3/recursos_api/tmc/posteriores/#{year}/#{month -2 }?apikey=#{API_KEY}&formato=json",  format: :plain)
    end
    return JSON.parse response
  end
end