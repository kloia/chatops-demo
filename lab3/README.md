LAB #3 - Running Routine Tasks
==============================

##Environment Initialization

Run below docker-compose command to prepare the environment that contains a [Jenkins](http://localhost:8090) and [Bitbucket](http://localhost:7990) (User/Pass: admin/admin) applications:

```bash
cd lab3
docker-compose up
```

##Jenkins Trigger Script

First create a script file in the scripts directory of your hubot. 

```bash
% cd myhubot
% vim scripts/service.coffee
```

Copy the below script to the service.coffee file.

```
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

```
Now restart the hubot.

```
bin/hubot --adapter slack
```

Finally say create new service to hubot from slack to test the script. It will respond with Jenkins url of the service after Bitbucket repository and Jenkins build jobs created for the new service.
```
maaydin >> yeni servis login
cem >> @maaydin login servisi oluşturuluyor...
cem >> @maaydin <login> servisi oluşturuldu!
```