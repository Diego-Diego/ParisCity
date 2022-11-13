
Config = {
    --Marker Config--
    MarkerType = 27, -- Pour voir les différents type de marker: https://docs.fivem.net/docs/game-references/markers/
    MarkerSizeLargeur = 1.0, -- Largeur du marker
    MarkerSizeEpaisseur = 1.0, -- Épaisseur du marker
    MarkerSizeHauteur = 0.3, -- Hauteur du marker
    MarkerDistance = 10.0, -- Distane de visibiliter du marker (1.0 = 1 mètre)
    MarkerColorR = 0, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorG = 102, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerColorB = 255, -- Voir pour les couleurs RGB: https://www.google.com/search?q=html+color+picker&rlz=1C1GCEA_enFR965FR965&oq=html+color+&aqs=chrome.2.69i59j0i131i433i512j0i512l5j69i60.3367j0j7&sourceid=chrome&ie=UTF-8
    MarkerOpacite = 255, -- Opacité du marker (min: 0, max: 255)
    MarkerSaute = false, -- Si le marker saute (true = oui, false = non)
    MarkerTourne = true, -- Si le marker tourne (true = oui, false = non)


    blipname = "Norauto",
    blipscale = 0.8, 
    blipcolour = 26, 
    blipsprite = 446, 
    blipdisplay = 4, 
    position = {vector3(823.73, -891.31, 42.48)},


    --Config Point--
    Position = {
        Coffre = {vector3(840.12, -880.52, 24.29)}, -- Menu coffre 
        GarageVehicule = {vector3(844.91, -902.96, 24.29)}, -- Menu Garage Vehicule
        RangerVehicule = {vector3(853.08, -898.88, 24.33)}, -- Menu ranger votre véhicule
        FabricationKit = {vector3(842.1, -908.63, 24.29)}, -- Menu Fabrication Kit
        Vestiaire = {vector3(829.7, -908.81, 24.29)}, -- Menu Vestiaire
        Boss = {vector3(808.4, -885.72, 24.29)}, -- Menu Boss
    },


    --Config Texte
    TextCoffre = "Appuyez sur ~y~[E] ~s~pour accèder au ~y~Stockage ~s~",
    TextGarage = "Appuyez sur ~y~[E] ~s~pour accèder au ~y~Garage",
    TextRangerGarage = "Appuyez sur ~y~[E] ~s~pour ranger votre ~y~Véhicule de service",
    TextFabricationKit = "Appuyez sur ~y~[E] ~s~pour accèder à ~y~l'établie",
    TextVestiaire = "Appuyez sur ~y~[E] ~s~pour accèder au ~y~vestiaire",
    TextBoss = "Appuyez sur ~y~[E] ~s~pour accèder au ~y~compte",


    --Config Vehicule 
    VehiculeBenny = { 
        {buttoname = "Utilitaire", rightlabel = "→→", spawnname = "no2", spawnzone = vector3(866.62, -959.38, 26.28), headingspawn = 2.92}, -- Garage Voiture
        {buttoname = "Clio", rightlabel = "→→", spawnname = "no3", spawnzone = vector3(858.23, -951.55, 26.28), headingspawn = 268.61}, -- Garage Voiture
        {buttoname = "Dépanneuse à plateau", rightlabel = "→→", spawnname = "no4", spawnzone = vector3(882.45, -900.77, 26.21), headingspawn = 268.61}, -- Garage Voiture
        {buttoname = "Depanneuse tractage", rightlabel = "→→", spawnname = "no5", spawnzone = vector3(854.65, -865.98, 25.36), headingspawn = 268.61}, -- Garage Voiture
        {buttoname = "Depanneuse xxl", rightlabel = "→→", spawnname = "flatbed", spawnzone = vector3(858.36, -890.66, 25.47), headingspawn = 268.68}, -- Garage Voiture
        {buttoname = "Accident", rightlabel = "→→", spawnname = "rifternorauto", spawnzone = vector3(852.43, -905.72, 25.41), headingspawn = 268.61}, -- Garage Voiture
        {buttoname = "Depanneuse tractage 2 ", rightlabel = "→→", spawnname = "f450towtruk", spawnzone = vector3(889.13, -918.73, 26.28), headingspawn = 268.61}, -- Garage Voiture
    }
}