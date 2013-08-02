require 'net/telnet'
require 'rest-client'
require 'json'

DOMAIN="localhost:8080"
JOBNAME="test"
KOBO_HOST="192.168.1.100"
SLEEP=10

while true do
  response=RestClient::get "http://#{DOMAIN}/job/#{JOBNAME}/lastBuild/api/json?pretty=true"

  json_res = JSON.parse response
  build_result = json_res["result"]


  telnet = Net::Telnet.new("Host" => KOBO_HOST, "Timeout" => 10)
  
  if build_result == "SUCCESS"
    telnet.cmd("cat /mnt/onboard/jenkins.raw  | /usr/local/Kobo/pickel showpic") 
  else
    telnet.cmd("cat /mnt/onboard/sad-jenkins.raw  | /usr/local/Kobo/pickel showpic") 
  end

  sleep SLEEP

end