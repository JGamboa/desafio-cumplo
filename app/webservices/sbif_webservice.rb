class SbifWebservice
  include HTTParty
  base_uri 'https://api.sbif.cl/api-sbifv3/recursos_api/tmc/'


  def get_tmc
    api_key = '9c84db4d447c80c74961a72245371245cb7ac15f'
    url = base_uri +
    response = HTTParty.get()
  end
end