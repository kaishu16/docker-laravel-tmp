import json

file = open('src/composer.json')
value = json.load(file)
value['minimum-stability'] = 'dev'
value['repositories'] = []
with open('src/composer.json', 'w') as f:
    json.dump(value, f, indent=2)