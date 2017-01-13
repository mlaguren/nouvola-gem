module Nouvola
  class Divecloud
    BASE_PATH = 'https://divecloud.nouvola.com/api/v1/plans/'
  
    def initialize(api_key, creds_pass = nil)
      @key = api_key
      @cred = creds_pass
    end

    def run(plan_id)
      url = BASE_PATH+"#{plan_id}/run"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['x-api'] = @key
      if @cred.nil?
        http.request(request)
      end
    end

  end
end
