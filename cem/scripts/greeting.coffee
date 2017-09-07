# Description:
#   A hubot script that greets people
#
# Configuration:
#
# Commands:
#   hubot merhaba - Reply with a hello sentence!
#   hubot nasılsın - Reply with it's mood
#
# Notes:
#
# Author:
#   Mehmet Ali Aydın <maaydin@gmail.com>

helloList = [
    "Selam @%",
    "Merhaba @%",
    "İyi günler @%"
]

moodList = [
    "Bugün harika hissediyorum @%, sen nasılsın?",
    "İçimde bir sıkıntı var ama hayırlısı @%, sen nasılsın?",
    "Teşekkür ederim @%, sen nasılsın?"
]

module.exports = (robot) ->

  robot.hear /.*(selam|slm|merhaba|mrb).*/i, (msg) ->
      hello = msg.random helloList
      msg.send hello.replace "%", msg.message.user.name

  robot.respond /.*(naber|nas.ls.n|ne yapt.n|ne haber|nass.n).*/i, (msg) ->
      mood = msg.random moodList
      msg.send mood.replace "%", msg.message.user.name