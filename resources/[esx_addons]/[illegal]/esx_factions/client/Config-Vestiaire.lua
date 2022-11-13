Cloak = {
	clothes = {
        specials = {
            [0] = {
                label = "Tenue Civil",
                minimum_grade = 0,
                variations = {male = {}, female = {}},
                onEquip = function()
                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                        TriggerEvent('skinchanger:loadSkin', skin)
                    end)
                end
            },
        },
        Medellin = {
            [0] = {
                label = "Gris Militaire",
                minimum_grade = 1,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 360,   ['torso_2'] = 11,
                        ['arms'] = 20,
                        ['pants_1'] = 115,   ['pants_2'] = 11,
                        ['shoes_1'] = 44,   ['shoes_2'] = 0,
                        ['chain_1'] = 16,    ['chain_2'] = 0,
                        ['bags_1'] = 35,    ['bags_2'] = 19
                    },
                    female = {
                        ['tshirt_1'] = 10,  ['tshirt_2'] = 0,
                        ['torso_1'] = 367,   ['torso_2'] = 11,
                        ['arms'] = 30,
                        ['pants_1'] = 119,   ['pants_2'] = 11,
                        ['shoes_1'] = 34,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 34,    ['bags_2'] = 19
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Gris OP",
                minimum_grade = 1,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 159,   ['torso_2'] = 2,
                        ['arms'] = 22,
                        ['pants_1'] = 77,   ['pants_2'] = 6,
                        ['shoes_1'] = 44,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 120,    ['bags_2'] = 0
                    },
                    female = {
                        ['tshirt_1'] = 10,  ['tshirt_2'] = 0,
                        ['torso_1'] = 151,   ['torso_2'] = 2,
                        ['arms'] = 26,
                        ['pants_1'] = 80,   ['pants_2'] = 6,
                        ['shoes_1'] = 34,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 116,    ['bags_2'] = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Vert OP",
                minimum_grade = 1,
                variations = {
                    male = {
                        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
                        ['torso_1'] = 54,   ['torso_2'] = 13,
                        ['arms'] = 20,
                        ['pants_1'] = 105,   ['pants_2'] = 13,
                        ['shoes_1'] = 44,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 35,    ['bags_2'] = 11
                    },
                    female = {
                        ['tshirt_1'] = 10,  ['tshirt_2'] = 0,
                        ['torso_1'] = 338,   ['torso_2'] = 13,
                        ['arms'] = 26,
                        ['pants_1'] = 109,   ['pants_2'] =13,
                        ['shoes_1'] = 34,   ['shoes_2'] = 0,
                        ['chain_1'] = 0,    ['chain_2'] = 0,
                        ['bags_1'] = 34,    ['bags_2'] = 11
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "Noir OP",
                minimum_grade = 1,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 3,
                        arms        = 22    , arms_2      = 0,
                        pants_1     = 29    , pants_2     = 0,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 120   , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 29    , tshirt_2    = 0,
                        torso_1     = 211   , torso_2     = 3,
                        arms        = 30    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 35    , shoes_2     = 0,
                        bags_1      = 116   , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 110   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
		},
        IRA = {
            [0] = {
                label = "OP Noir",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 3,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 29    , pants_2     = 0,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "OP Gris",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 0,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 29    , pants_2     = 2,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "OP Beige",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 170   , torso_2     = 0,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 77    , pants_2     = 7,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "OP Marron",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 2,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 29    , pants_2     = 1,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [4] = {
                label = "OP Vert Clair",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 207   , torso_2     = 1,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 20    , pants_2     = 0,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [5] = {
                label = "OP Bleu",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 4,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 20    , pants_2     = 2,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [6] = {
                label = "OP Camo",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 16    , tshirt_2    = 0,
                        torso_1     = 330   , torso_2     = 6,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 105   , pants_2     = 6,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 38    , bags_2      = 11,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 150   , mask_2      = 10,
                        helmet_1    = 156   , helmet_2    = 20,
                        glasses_1   = 5     , glasses_2   = 4,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 16    , tshirt_2    = 0,
                        torso_1     = 339   , torso_2     = 6,
                        arms        = 16    , arms_2      = 0,
                        pants_1     = 109   , pants_2     = 6,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 38    , bags_2      = 11,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 139   , mask_2      = 10,
                        helmet_1    = 147   , helmet_2    = 20,
                        glasses_1   = 11    , glasses_2   = 3,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Mercenaires = {
            [0] = {
                label = "Tenue QG",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 458   , torso_2     = 3,
                        arms        = 17    , arms_2      = 2,
                        pants_1     = 49    , pants_2     = 2,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 109   , tshirt_2    = 0,
                        torso_1     = 475   , torso_2     = 3,
                        arms        = 21    , arms_2      = 2,
                        pants_1     = 49    , pants_2     = 2,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 78    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 10    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Tenue Désert",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 16    , tshirt_2    = 0,
                        torso_1     = 330   , torso_2     = 5,
                        arms        = 139   , arms_2      = 5,
                        pants_1     = 105   , pants_2     = 5,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 119   , bags_2      =14,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 16    , tshirt_2    = 0,
                        torso_1     = 339   , torso_2     = 5,
                        arms        = 176   , arms_2      = 5,
                        pants_1     = 109   , pants_2     = 5,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 115   , bags_2      =14,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 110   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Tenue Rendez-Vous",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 248   , torso_2     = 3,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 4,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 31    , tshirt_2    = 0,
                        torso_1     = 244   , torso_2     = 3,
                        arms        = 21    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 4,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 78    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 10    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "Tenue OP",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 16    , tshirt_2    = 1,
                        torso_1     = 162   , torso_2     = 1,
                        arms        = 17    , arms_2      = 1,
                        pants_1     = 29    , pants_2     = 2,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 34    , bags_2      =19,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 16    , tshirt_2    = 1,
                        torso_1     = 154   , torso_2     = 1,
                        arms        = 216   , arms_2      = 1,
                        pants_1     = 49    , pants_2     = 2,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 37    , bags_2      =19,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 110   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [4] = {
                label = "Tenue OP Noire",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 248   , torso_2     = 3,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 29    , pants_2     = 0,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 10    , tshirt_2    = 0,
                        torso_1     = 244   , torso_2     = 3,
                        arms        = 39    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 78    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 10    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [5] = {
                label = "Tenue OP Pantalon Militaire Noire",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 441   , torso_2     =18,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 9     , pants_2     =13,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 10    , tshirt_2    = 0,
                        torso_1     = 455   , torso_2     =18,
                        arms        = 39    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 78    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 10    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Sinaloa = {
            [0] = {
                label = "Tenue Non-Gradés",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 131   , tshirt_2    = 3,
                        torso_1     = 272   , torso_2     = 0,
                        arms        = 38    , arms_2      = 0,
                        pants_1     = 17    , pants_2     = 4,
                        shoes_1     = 12    , shoes_2     = 6,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 69    , mask_2      = 0,
                        helmet_1    = 108   , helmet_2    = 2,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Tenue Non-Gradés 2",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 66    , torso_2     = 2,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 17    , pants_2     = 4,
                        shoes_1     = 12    , shoes_2     = 6,
                        bags_1      = 39    , bags_2      = 1,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 69    , mask_2      = 0,
                        helmet_1    = 108   , helmet_2    = 2,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 2     , tshirt_2    = 0,
                        torso_1     = 181   , torso_2     = 1,
                        arms        = 34    , arms_2      = 0,
                        pants_1     = 0     , pants_2     = 0,
                        shoes_1     = 35    , shoes_2     = 0,
                        bags_1      = 78    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 58    , mask_2      = 0,
                        helmet_1    = 0     , helmet_2    = 0,
                        glasses_1   = 11    , glasses_2   = 1,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Tenue Gradés",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 131   , tshirt_2    = 3,
                        torso_1     = 272   , torso_2     = 0,
                        arms        = 38    , arms_2      = 0,
                        pants_1     = 17    , pants_2     = 4,
                        shoes_1     = 12    , shoes_2     = 6,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 69    , mask_2      = 0,
                        helmet_1    = 155   , helmet_2    =20,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "Tenue Gradés 2",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 3,
                        torso_1     = 66    , torso_2     = 2,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 17    , pants_2     = 4,
                        shoes_1     = 12    , shoes_2     = 6,
                        bags_1      = 39    , bags_2      = 1,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 69    , mask_2      = 0,
                        helmet_1    = 155   , helmet_2    =20,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Stidda = {
            [0] = {
                label = "OP",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 222   , tshirt_2    = 0,
                        torso_1     = 248   , torso_2     = 3,
                        arms        = 27    , arms_2      = 0,
                        pants_1     = 24    , pants_2     = 2,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 36    , bags_2      = 9,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1     , helmet_2   = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "RDV",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 90    , tshirt_2    = 0,
                        torso_1     = 138   , torso_2     = 5,
                        arms        = 27    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 5,
                        shoes_1     = 10    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = 12    , helmet_2    = 1,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Recolte",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 29    , tshirt_2    = 2,
                        torso_1     = 70    , torso_2     = 0,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 20    , pants_2     = 1,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 39    , bags_2      = 9,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        LosZetas = {
            [0] = {
                label = "Patron",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 6     , tshirt_2    = 0,
                        torso_1     = 11    , torso_2     = 1,
                        arms        = 11    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 5,
                        shoes_1     = 10    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1     , helmet_2   = 0,
                        glasses_1   = 5     , glasses_2   = 3,
                        chain_1     = 42    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = 15    , watches_2   = 2
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Costume Blanc",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 90    , tshirt_2    = 0,
                        torso_1     = 141   , torso_2     = 5,
                        arms        = 1     , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 5,
                        shoes_1     = 60    , shoes_2     = 4,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    =-1     , helmet_2    = 0,
                        glasses_1   = 5     , glasses_2   = 3,
                        chain_1     = 60    , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Costume Noir",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 90    , tshirt_2    = 2,
                        torso_1     = 140   , torso_2     = 0,
                        arms        = 4     , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 2,
                        shoes_1     = 41    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = 5     , glasses_2   = 3,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 114   , tshirt_2    = 2,
                        torso_1     = 6     , torso_2     = 1,
                        arms        = 1     , arms_2      = 0,
                        pants_1     = 73    , pants_2     = 2,
                        shoes_1     = 8     , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 6     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "Tenue OP",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 212   , tshirt_2    = 0,
                        torso_1     = 445   , torso_2     = 3,
                        arms        = 172   , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 120   , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 69    , mask_2      = 0,
                        helmet_1    = 31    , helmet_2    = 1,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 2     , tshirt_2    = 0,
                        torso_1     = 154   , torso_2     = 0,
                        arms        = 16    , arms_2      = 0,
                        pants_1     = 73    , pants_2     = 2,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 127   , mask_2      =25,
                        helmet_1    = 30    , helmet_2    = 1,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [5] = {
                label = "Tenue Illégal",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 114   , tshirt_2    = 0,
                        torso_1     = 162   , torso_2     = 0,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 143   , pants_2     = 1,
                        shoes_1     = 47    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 147   , mask_2      =11,
                        helmet_1    = 99    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 45    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Salvatierra = {
            [0] = {
                label = "Chemise Blanche",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 425   , torso_2     = 5,
                        arms        = 33    , arms_2      = 0,
                        pants_1     = 148   , pants_2     = 4,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 119   , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 138   , mask_2      =25,
                        helmet_1    = 31    , helmet_2    = 1,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 143   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Chemise Verte",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 425   , torso_2     = 4,
                        arms        = 33    , arms_2      = 0,
                        pants_1     = 141   , pants_2     = 0,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 119   , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 138   , mask_2      =25,
                        helmet_1    = 31    , helmet_2    = 1,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 143   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "T-Shirt Blanc",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 66    , torso_2     = 0,
                        arms        = 30    , arms_2      = 0,
                        pants_1     = 148   , pants_2     = 4,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 39    , bags_2      = 3,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 138   , mask_2      =25,
                        helmet_1    = 31    , helmet_2    = 1,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 143   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "T-Shirt Vert",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 66    , torso_2     =13,
                        arms        = 30    , arms_2      = 0,
                        pants_1     = 141   , pants_2     = 0,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 39    , bags_2      = 3,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 138   , mask_2      =25,
                        helmet_1    = 31    , helmet_2    = 1,
                        glasses_1   = 33    , glasses_2   = 2,
                        chain_1     = 143   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [4] = {
                label = "Tenue Production Armes",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 40    , tshirt_2    = 0,
                        torso_1     = 426   , torso_2     = 8,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 148   , pants_2     = 1,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 119   , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 138   , mask_2      =25,
                        helmet_1    = 192   , helmet_2    = 0,
                        glasses_1   = 9     , glasses_2   = 0,
                        chain_1     = 16    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [5] = {
                label = "Tenue Production Matériaux",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 52    , tshirt_2    = 1,
                        torso_1     = 175   , torso_2     = 1,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 57    , pants_2     = 1,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 82    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 41    , mask_2      = 0,
                        helmet_1    = 192   , helmet_2    = 0,
                        glasses_1   = 9     , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Duchesse = {
            [0] = {
                label = "Tenue Opération lourde",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 16    , tshirt_2    = 0,
                        torso_1     = 357   , torso_2     =21,
                        arms        = 16    , arms_2      = 0,
                        pants_1     = 115   , pants_2     =21,
                        shoes_1     = 55    , shoes_2     = 1,
                        bags_1      = 119   , bags_2      =13,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = 200   , helmet_2    =19,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 178   , chain_2     = 9,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Tenue Opération Légère",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 50    , tshirt_2    = 0,
                        torso_1     = 54    , torso_2     =20,
                        arms        = 17    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 80    , shoes_2     = 0,
                        bags_1      = 39    , bags_2      =14,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Tenue Epsilon",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 381   , torso_2     = 0,
                        arms        = 1     , arms_2      = 0,
                        pants_1     = 45    , pants_2     = 5,
                        shoes_1     = 40    , shoes_2     = 3,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Madrazo = {
            [0] = {
                label = "Tenue OP Noire",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 162   , torso_2     = 0,
                        arms        = 33    , arms_2      = 0,
                        pants_1     = 20    , pants_2     = 1,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 6     , tshirt_2    = 0,
                        torso_1     = 451   , torso_2     = 0,
                        arms        = 39    , arms_2      = 0,
                        pants_1     = 31    , pants_2     = 21,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 35    , bags_2      = 17,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 110   , chain_2     = 2,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Tenue OP Beige",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 207   , torso_2     = 0,
                        arms        = 33    , arms_2      = 0,
                        pants_1     = 20    , pants_2     = 3,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 29    , tshirt_2    = 0,
                        torso_1     = 197   , torso_2     = 0,
                        arms        = 21    , arms_2      = 3,
                        pants_1     = 49    , pants_2     = 3,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 79    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 110   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Tenue OP Verte",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 207   , torso_2     = 1,
                        arms        = 16    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 4,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 1,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 29    , tshirt_2    = 0,
                        torso_1     = 197   , torso_2     = 1,
                        arms        = 21    , arms_2      = 4,
                        pants_1     = 49    , pants_2     = 4,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 79    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 110   , chain_2     = 1,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "Tenue Madrazo",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 1,
                        torso_1     = 241   , torso_2     = 0,
                        arms        = 19    , arms_2      = 1,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 29    , tshirt_2    = 0,
                        torso_1     = 237   , torso_2     = 0,
                        arms        = 47    , arms_2      = 0,
                        pants_1     = 31    , pants_2     = 21,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 79    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 30    , chain_2     = 4,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [4] = {
                label = "Tenue Madrazo Verte",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 203   , torso_2     = 0,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [5] = {
                label = "Tenue Madrazo Multicolore",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 203   , torso_2     = 1,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [6] = {
                label = "Tenue Madrazo Verte et Noire",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 203   , torso_2     = 2,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [7] = {
                label = "Tenue Madrazo Sweat Noir",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 243   , torso_2     = 0,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [8] = {
                label = "Tenue Madrazo Sweat Rouge",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 243   , torso_2     = 1,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [9] = {
                label = "Tenue Madrazo Sweat Blanc",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 27    , tshirt_2    = 0,
                        torso_1     = 243   , torso_2     = 2,
                        arms        = 19    , arms_2      = 0,
                        pants_1     = 49    , pants_2     = 0,
                        shoes_1     = 45    , shoes_2     = 0,
                        bags_1      = 83    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 143   , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Mendoza = {
            [0] = {
                label = "Soldat/Pequeno/Recrue",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 2,
                        arms        = 22    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 3,
                        shoes_1     = 41    , shoes_2     = 2,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Soldat/Pequeno/Recrue 2",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 183   , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 2,
                        arms        = 27    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 1,
                        shoes_1     = 41    , shoes_2     = 0,
                        bags_1      = 36    , bags_2      = 1,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Frères d'arme",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 183   , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 3,
                        arms        = 27    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 1,
                        shoes_1     = 41    , shoes_2     = 0,
                        bags_1      = 36    , bags_2      = 1,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [3] = {
                label = "Segundo",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 220   , torso_2     = 3,
                        arms        = 22    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 1,
                        shoes_1     = 41    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [4] = {
                label = "Segundo 2",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 183   , tshirt_2    = 0,
                        torso_1     = 20    , torso_2     = 0,
                        arms        = 27    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 5,
                        shoes_1     = 41    , shoes_2     = 0,
                        bags_1      = 36    , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [5] = {
                label = "Parrain",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 92    , tshirt_2    = 0,
                        torso_1     = 186   , torso_2     = 0,
                        arms        = 22    , arms_2      = 0,
                        pants_1     = 46    , pants_2     = 1,
                        shoes_1     = 41    , shoes_2     = 9,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        mask_1      = 0     , mask_2      = 0,
                        helmet_1    = -1    , helmet_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
        Shadow = {
            [0] = {
                label = "Tenue RDV",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 134   , tshirt_2    = 3,
                        torso_1     = 403   , torso_2     = 0,
                        arms        = 22    , arms_2      = 0,
                        pants_1     = 32    , pants_2     = 1,
                        shoes_1     = 10    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 142   , tshirt_2    = 3,
                        torso_1     = 7     , torso_2     = 0,
                        arms        = 39    , arms_2      = 0,
                        pants_1     = 73    , pants_2     = 2,
                        shoes_1     = 9     , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = -1    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                }, 
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [1] = {
                label = "Tenue OP",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 329   , torso_2     =21,
                        arms        = 172   , arms_2      = 0,
                        pants_1     = 115   , pants_2     = 3,
                        shoes_1     = 44    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                        tshirt_1    = 2     , tshirt_2    = 0,
                        torso_1     = 338   , torso_2     =21,
                        arms        = 39    , arms_2      = 0,
                        pants_1     = 119   , pants_2     = 3,
                        shoes_1     = 34    , shoes_2     = 0,
                        bags_1      = 0     , bags_2      = 0,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = -1    , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
            [2] = {
                label = "Tenue Travail",
                minimum_grade = 0,
                variations = {
                    male = {
                        tshirt_1    = 15    , tshirt_2    = 0,
                        torso_1     = 170   , torso_2     = 3,
                        arms        = 20    , arms_2      = 0,
                        pants_1     = 65    , pants_2     = 1,
                        shoes_1     = 26    , shoes_2     = 0,
                        bags_1      = 46    , bags_2      = 1,
                        decals_1    = 0     , decals_2    = 0,
                        bproof_1    = 0     , bproof_2    = 0,
                        glasses_1   = -1    , glasses_2   = 0,
                        chain_1     = 0     , chain_2     = 0,
                        ears_1      = -1    , ears_2      = 0,
                        bracelets_1 = -1    , bracelets_2 = 0,
                        watches_1   = -1    , watches_2   = 0
                    },
                    female = {
                    }
                },
                onEquip = function()
                    SetPedArmour(PlayerPedId(), 0)
                end
            },
        },
    },
}