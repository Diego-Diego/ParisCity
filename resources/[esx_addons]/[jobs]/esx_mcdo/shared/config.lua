_McDo = {}
_McDo.DrawDistance = 2.0

_McDo.posU = {
    {
        Command = vector3(89.35, 288.23, 110.19-0.98)
        
    }
}

_McDo.posEmployer = {
    {
        Command2 = vector3(89.90, 291.09, 110.19-0.98),
        Garage = vector3 (115.054947, 277.200012, 109.973633-0.98),
        Cuisine = vector3(94.10, 294.76, 110.19-0.98)
    }
}

_McDo.menu = {
    {lbl = "Menu maxi best of™", desc = "- 1x boisson 50cl\n- 1x Sandwich\n- 1x Dessert"},
    {lbl = "Menu best of™", desc = "- 1x boisson 40cl\n- 1x Sandwich\n- 1x Dessert"}
}

_McDo.submenu = {
    boisson = {
        {lbl = "Coca cola", name = "cocacola"},
        {lbl = "Ice tea", name = "icetea"},
        {lbl = "Fanta", name = "fanta"},
        {lbl = "Eau", name = "water"},
    },
    burger = {
        {lbl = "Big mac", name = "bigmac", ingredient = "- 2 Steak de boeuf\n- Cornichon\n- Oignon\n- Salade\n- Sauce big mac\n- Cheddar\n- Pain au sésame"},
        {lbl = "Mc wrap", name = "mcwrap", ingredient = "- Galette\n- Poulet croustiant\n- Bacon\n- Cheddar\n- Salade\n- 2x Tomates\n- Sauce blanche"},
        {lbl = "Royal cheese", name = "royalcheese", ingredient = "- x2 Cheddars\n- Steak de boeuf\n- Cornichons\n- Oignon\n- Moutarde\n- Ketchup"},
        {lbl = "Mc Fish", name = "mcfish", ingredient = "- Pain\n- Poisson pané croustillant\n- Ketchup"},
    },
    frite = {
        {lbl = "Potatoes", name = "potatoes"},
        {lbl = "Frite", name = "frite"}
    }
}

_McDo.garage = {
    {lbl = "Camionette McDo", name = "vwcaddy"}
}

_McDo.spawnPoint = {
    {coords = vector3(106.74, 282.61, 109.97), heading = 249.44, radius = 0.5, type = 11},
    {coords = vector3(107.20, 286.66, 109.97), heading = 252.28, radius = 0.5, type = 12},
    {coords = vector3(108.50, 290.10, 109.97), heading = 246.61, radius = 0.5, type = 13},
    {coords = vector3(115.27, 300.71, 109.97), heading = 155.90, radius = 0.5, type = 14},
    {coords = vector3(118.72, 299.38, 109.97), heading = 155.90, radius = 0.5, type = 15},
    {coords = vector3(121.41, 287.69, 109.97), heading = 65.19, radius = 0.5, type = 16},
}

_McDo.cat = {
    --[""]
}