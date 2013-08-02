require 'net/telnet'
require 'rest-client'
require 'json'

DOMAIN="localhost:8080"
JOBNAME="test"
KOBO_HOST="192.168.1.100"
SLEEP=10
ANGRY_LIMIT=3

err_cnt=0
jenkins=""

while true do
  response=RestClient::get "http://#{DOMAIN}/job/#{JOBNAME}/lastBuild/api/json?pretty=true"

  json_res = JSON.parse response
  build_result = json_res["result"]


  telnet = Net::Telnet.new("Host" => KOBO_HOST, "Timeout" => 10)
  
  previous_jenkins=jenkins

  if build_result == "SUCCESS"
    jenkins="jenkins"
    err_cnt=0
  else
    jenkins="sad-jenkins"
    err_cnt=err_cnt+1
  end

  if err_cnt >= ANGRY_LIMIT
    jenkins="angry-jenkins"
  end
  
  if jenkins != previous_jenkins
    telnet.cmd("cat /mnt/onboard/#{jenkins}.raw  | /usr/local/Kobo/pickel showpic") 
  end
  sleep SLEEP

end
