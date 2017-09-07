LAB #1 - Getting Started With Hubot
==============================

You will need node.js and npm. Once those are installed, we can install the hubot generator:

```bash
%  npm install -g yo generator-hubot
```

This will give us the hubot yeoman generator. Now we can make a new directory, and generate a new instance of hubot in it. For example, if we wanted to make a bot called myhubot:

```bash
% mkdir myhubot
% cd myhubot
% yo hubot
```

At this point, you’ll be asked a few questions about who is creating the bot, and which adapter you’ll be using. Adapters are hubot’s way of integrating with different chat providers. For the demo we will be using slack adapter.
```
                     _____________________________
                    /                             \
   //\              |      Extracting input for    |
  ////\    _____    |   self-replication process   |
 //////\  /_____\   \                             /
 ======= |[^_/\_]|   /----------------------------
  |   | _|___@@__|__
  +===+/  ///     \_\
   | |_\ /// HUBOT/\\
   |___/\//      /  \\
         \      /   +---+
          \____/    |   |
           | //|    +===+
            \//      |xx|

? Owner Mehmet Ali Aydın <maaydin@gmail.com>
? Bot name cem
? Description A simple helpful robot for your Company
? Bot adapter slack
   create bin/hubot
   create bin/hubot.cmd
   create Procfile
   create README.md
   create external-scripts.json
   create hubot-scripts.json
   create .gitignore
   create package.json
   create scripts/example.coffee
   create .editorconfig
                     _____________________________
 _____              /                             \
 \    \             |   Self-replication process   |
 |    |    _____    |          complete...         |
 |__\\|   /_____\   \     Good luck with that.    /
   |//+  |[^_/\_]|   /----------------------------
  |   | _|___@@__|__
  +===+/  ///     \_\
   | |_\ /// HUBOT/\\
   |___/\//      /  \\
         \      /   +---+
          \____/    |   |
           | //|    +===+
            \//      |xx|
```

Export the slack token and start the hubot with --adapter argument.

```
export HUBOT_SLACK_TOKEN=xoxb-232776703381-PgjkGHTfhSsdfhaFhU
bin/hubot --adapter slack
```

Finally ping hubot from slack to be sure it's running.
```
maaydin >> @cem ping
cem >> PONG
```
