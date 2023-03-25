const fs = require('fs');

const jsonObject = JSON.parse(fs.readFileSync('./src/composer.json', 'utf8'));

jsonObject.repositories = [];
jsonObject["minimum-stability"] = "dev"
fs.writeFileSync('./src/composer.json', JSON.stringify(jsonObject, null, 2));