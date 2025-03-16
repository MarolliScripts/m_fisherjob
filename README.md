# m_fisherjob
To podstawowa praca, która polega na łowieniu rybek. Posiada bardzo prosty do ustawienia config. Zapraszam do przetestowania i [zostawienia czegoś po sobie!](https://www.youtube.com/watch?v=M_zCxyHUfvU)

# Preview:
## https://www.youtube.com/watch?v=M_zCxyHUfvU

# Wymagania:
- ESX Framework
- ox_lib
- ox_inventory
- ox_target

# Instalacja:
- Wrzucasz plik do resources (oczywiście musisz wystartować go w server.cfg)
- W folderze install znajduje się folder images, z którego zdjęcia należy przeżucić do: ox_inventory/web/images
- Następnie w folderze install znajduje się plik ox_inventory.txt, w nim znajdziecie to co trzeba przekopiować do danych ścieżek

### ox_inventory/data/items.lua
```lua
['fishingrod'] = {
	label = 'Wędka',
	weight = 700,
	stack = false,
},

['okon'] = {
	label = 'Okoń',
	weight = 500,
	stack = true,
},

['dorsz'] = {
	label = 'Dorsz',
	weight = 800,
	stack = true,
},

['szczupak'] = {
	label = 'Szczupak',
	weight = 1000,
	stack = true,
},

['zlotaryba'] = {
	label = 'Złota ryba',
	weight = 800,
	stack = true,
},

['perla'] = {
	label = 'Perła',
	weight = 500,
	stack = true,
},
```

### ox_inventory/data/shops.lua
```lua
wedkarski = {
	name = 'Sklep wędkarski',
	inventory = {
		{ name = 'fishingrod', price = 100 },
	}
},
```

# Poczytaj więcej "o mnie" na moich social mediach:
- Strona WWW: https://marolliscripts.pl
- Discord: https://discord.gg/fQY6azTjM2
- YouTube: https://youtube.com/marolniak
- Donate: https://streamelements.com/marolniak/tip/
