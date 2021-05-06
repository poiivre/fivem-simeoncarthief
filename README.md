[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/D1D44EGNM)

# seln_simeoncarthief ( ESX )

# Add car thief missions at Simeon's dealership
Simeon is looking for cars to sell to his clients, but no need for them to be new.
Talk to him to know which car he need ( needed car is synced to every players ), and the first one to get him one will be paid.
After selling him a stolen car wait 5 min ( change the time in conf.lua ) for him to need a new one.
In case nobody is able to sell him the needed car in less than 30 min ( change the time in conf.lua ), he will pass the mission and ask a new one.

## Conf.lua :

### Selling Point
 ```
Config.Revente = { 
    x = -34.815,
    y = -1089.216,
    z = 26.422,
}
```

### Ped Spawn Point
 ```
Config.Simeon = { 
    x = -26.411,
    y = -1089.618,
    z = 25.422,
    h = 111.674,
}
```

### Maximum damages
 `Config.MaxCasse = 950 `

### Time between sell and new mission
 `Config.TempsEntre = 1000*300`

### Timer for new mission so if nobody find the car it's not blocked
 `Config.TempsRecherche = 1000*1800`

### The number of car you have in Config.Liste
 `Config.ListeMax = 27 `

### List of vehicle, their labels, and the price you sell them
 ```
Config.Liste = {
    { model = 'TURISMOR',       label= 'Turismo R',         prix = '1000' },
    { model = 'ZENTORNO',       label= 'Zentorno',          prix = '1000' },
    { model = 'JESTER',         label= 'Jester',            prix = '750' },
    { model = 'VOLTIC',         label= 'Voltic',            prix = '700' },
    { model = 'MASSACRO',       label= 'Massacro',          prix = '650' },
    { model = 'SUPERD',         label= 'Super Diamond',     prix = '600' },
    { model = 'INFERNUS',       label= 'Infernus',          prix = '550' },
    { model = 'NINEF',          label= '9F',                prix = '500' },
    { model = 'COMET',          label= 'Comet',             prix = '500' },
    { model = 'DUBSTA',         label= 'Dubsta',            prix = '400' },
    { model = 'GRESLEY',        label= 'Gresley',           prix = '350' },
    { model = 'FUSILLADE',      label= 'Fusillade',         prix = '350' },
    { model = 'BALLER',         label= 'Baller',            prix = '350' },
    { model = 'ISSI2',          label= 'Issi Décapotable',  prix = '325' },
    { model = 'RANCHERXL',      label= 'Ranger XL',         prix = '325' },
    { model = 'SULTAN',         label= 'Sultan',            prix = '300' },
    { model = 'FUTO',           label= 'Futo',              prix = '300' },
    { model = 'SPEEDO',         label= 'Speedo Van',        prix = '300' },
    { model = 'MANANA',         label= 'Manana',            prix = '275' },
    { model = 'BATI',           label= 'Bati',              prix = '250' },
    { model = 'BAGGER',         label= 'Bagger',            prix = '250' },
    { model = 'RUINER',         label= 'Ruiner',            prix = '250' },
    { model = 'TORNADO',        label= 'Tornado',           prix = '200' },
    { model = 'PRAIRIE',        label= 'Prairie',           prix = '200' },
    { model = 'SABRE',          label= 'Sabre',             prix = '200' },
    { model = 'ASTEROPE',       label= 'Asterope',          prix = '200' },
    { model = 'ORACLE',         label= 'Oracle',            prix = '200' },
    { model = 'YOUGA',          label= 'Youga',             prix = '200' },

}
 ```
