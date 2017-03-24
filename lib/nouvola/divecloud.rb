module Nouvola
  class Divecloud
    BASE_PATH = 'https://divecloud.nouvola.com/api/v1/'
  
    def initialize(api_key, creds_pass = nil)
      @key = api_key
      @cred = creds_pass
    end

    def params()
      parameters.to_a.map { |k,v| "#{k}=#{v}"}.join('&')  
    end
    
    def run(plan_id)
      url = BASE_PATH+"plans/#{plan_id}/run"
      uri = URI.parse(url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['x-api'] = @key
      if @cred.nil?
        http.request(request)
      end
    end

    def results (test_instance_id, options = nil)
      @url = BASE_PATH+"test_instances/#{test_instance_id}"
      uri = URI.parse(@url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.request_uri)
      request['x-api'] = @key
      if options.nil?
        http.request(request)
      end
    end
    
    def hook (plan_id, url)
      payload = {
        "event":"run_plan", 
        "resource_id":"#{plan_id}",
        "url":"#{url}"
      }
      @url = BASE_PATH+"/hooks"
      uri = URI.parse(@url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.request_uri)
      request['x-api'] = @key
      request['Content-Type'] = 'application/json'
      request.body = payload.to_json
      http.request(request)
    end
  end
end