# Description:
#   A hubot script that creates git repo and jenkins job for given service
#
# Configuration:
#
# Commands:
#   hubot yeni servis <name> - Reply service created!
#
# Notes:
#
# Author:
#   Mehmet Ali Aydın <maaydin@gmail.com>

jenkins_url = process.env.HUBOT_JENKINS_URL ? "http://jenkins:8090"
createServiceUri = process.env.HUBOT_JENKINS_CREATE_SERVICE_URI ? "/job/Operations/job/Create%20Service/"

createService = (msg) ->
   serviceRepoName = msg.match[3]
   url = jenkins_url + createServiceUri + "buildWithParameters?repository=#{serviceRepoName}&username=#{msg.message.user.name}"
   req = msg.http(url)
   if process.env.HUBOT_JENKINS_AUTH
      auth = process.env.HUBOT_JENKINS_AUTH
      req.headers Authorization: "Basic #{auth}"
   req.header('Content-Length', 0)
   req.post() (err, res, body) ->
      if err
         msg.send "@#{msg.message.user.name} maalesef :cry: servisi oluşturamadım: #{err}"
      if res.statusCode >= 400
         msg.send "@#{msg.message.user.name} maalesef :cry: servisi oluşturamadım: Status #{res.statusCode} #{body}"
   msg.send "@#{msg.message.user.name} servisi oluşturuyorum..."

module.exports = (robot) ->
    robot.respond /.*(yeni|new).*(servis|service)\s*([a-zA-Z0-9\-_]+).*/i, (msg) ->
        createService msg
