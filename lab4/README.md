LAB #4 - Adding External Scripts
================================

# hubot-meteoroloji

A hubot script that presents daily weather forecast from Turkish Meteoroloji Genel Müdürlüğü when someone typed `hava`

See [`src/meteoroloji.coffee`](src/meteoroloji.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-meteoroloji --save`

Then add **hubot-meteoroloji** to your `external-scripts.json`:

```json
[
  "hubot-meteoroloji"
]
```

## Sample Interaction

```
user1>> hubot hava
hubot>> @user1 bugün gökgürültülü sağanak yağışlı 20° - 23°, yarın parçalı bulutlu 18° - 25°.
```

# hubot-yemeksepeti

A hubot script that suggests random food from online food ordering company yemeksepeti.com

See [`src/yemeksepeti.coffee`](src/yemeksepeti.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-yemeksepeti --save`

Then add **hubot-yemeksepeti** to your `external-scripts.json`:

```json
[
  "hubot-yemeksepeti"
]
```

## Sample Interaction

```
user1>> hubot bugün ne yesek
hubot>> @user1 ne vereyim abime
hubot>> @user1 bak Et Döner diyorum, başka da bir şey demiyorum.
```


# hubot-eksisozluk

A hubot script that retrieves random entries from Turkish collaborative hypertext dictionary eksisozluk.com

See [`src/eksisozluk.coffee`](src/eksisozluk.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-eksisozluk --save`

Then add **hubot-eksisozluk** to your `external-scripts.json`:

```json
[
  "hubot-eksisozluk"
]
```

## Sample Interaction

```
user1>> hubot script nedir?
hubot>> @user1 latincede yazi, kitap, yasa