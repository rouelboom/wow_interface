local addon, ATTdbs = ...

ATTdbs.cooldownResetters = {
   [235219] = {    -- Cold Snap
      [120] = 1,   -- Cone of Cold
      [45438] = 1, -- Ice Block
      [122] = 1,   -- Frost Nova
      [11426] = 1,
   },
   [200183] = { -- 2
      [88625] = 1,
      [34861] = 1,
      [2050] = 1,
   },
   [327193] = { -- 3
      [31935] = 1,
   },
   [310454] = { -- 4
      [121253] = 1,
   },
   [360952] = { -- 4
      [259495] = 1,
   },
   [50334] = { -- 4
      [22842] = 1,
   },
   [115399] = { -- 4
      [322507] = 1,
   },
}


ATTdbs.dbModif = {
   [62618] = { ["mod"] = 197590,["cooldown"] = { [1] = 90 }, },                          -- 90
   [275699] = { ["mod"] = 288848,["cooldown"] = { [1] = 15 }, },                         -- 45
   [47568] = { ["mod"] = 233394,["x"] = true,["cooldown"] = { [1] = .50 }, },            --50%
   [48707] = { ["mod"] = 205727,["cooldown"] = { [1] = 20 }, },                          -- 20 --DK
   [200166] = { ["mod"] = 235893,["cooldown"] = { [1] = 60 }, },                         -- 120 dh havoc
   [191427] = { ["mod"] = 235893,["cooldown"] = { [1] = 60 }, },                         --dh meta 120
   [179057] = { ["mod"] = 206477,["x"] = true,["cooldown"] = { [1] = .80 }, },           -- 20
   [22812] = { ["mod"] = 203965,["x"] = true,["cooldown"] = { [1] = .85,[2] = .70 }, },  -- 33%
   [61336] = { ["mod"] = 203965,["x"] = true,["cooldown"] = { [1] = .85,[2] = .70 }, },  -- 33%
   [186257] = { ["mod"] = 266921,["x"] = true,["cooldown"] = { [1] = .90,[2] = .80 }, }, -- 10% 20%
   [186265] = { ["mod"] = 266921,["x"] = true,["cooldown"] = { [1] = .90,[2] = .80 }, }, -- 20%
   [264735] = { ["mod"] = 266921,["x"] = true,["cooldown"] = { [1] = .90,[2] = .80 }, }, -- 20%
   [186289] = { ["mod"] = 266921,["x"] = true,["cooldown"] = { [1] = .90,[2] = .80 }, }, -- 20%
   [288613] = { ["mod"] = 203129,["cooldown"] = { [1] = 20 }, },                         -- 20
   [110959] = { ["mod"] = 210476,["cooldown"] = { [1] = 45 }, },                         -- 45
   [109132] = { ["mod"] = 115173,["cooldown"] = { [1] = 5 }, },                          -- 5
   [119381] = { ["mod"] = 264348,["cooldown"] = { [1] = 5,[2] = 10 }, },                 -- 10
   [184662] = { ["mod"] = 114154,["x"] = true,["cooldown"] = { [1] = .70 }, },           -- 30%
   [31850] = { ["mod"] = 114154,["x"] = true,["cooldown"] = { [1] = .70 }, },            -- 30%
   [8122] = { ["mod"] = 196704,["cooldown"] = { [1] = 15 }, },                           -- 30
   [15487] = { ["mod"] = 263716,["cooldown"] = { [1] = 15 }, },                          -- 15
   [15286] = { ["mod"] = 199855,["cooldown"] = { [1] = 45 }, },                          -- 45
   [47585] = { ["mod"] = 288733,["cooldown"] = { [1] = 30 }, },                          -- 30
   [195457] = { ["mod"] = 256188,["cooldown"] = { [1] = 15 }, },                         -- 15
   [2094] = { ["mod"] = 256165,["cooldown"] = { [1] = 30 }, },                           -- 30
   [51514] = { ["mod"] = 204268,["cooldown"] = { [1] = 15 }, },                          -- 20
   [79206] = { ["mod"] = 192088,["cooldown"] = { [1] = 30 }, },                          -- 60
   [30283] = { ["mod"] = 264874,["cooldown"] = { [1] = 15 }, },                          -- 15
   [227847] = { ["mod"] = 236308,["x"] = true,["cooldown"] = { [1] = .66 }, },           -- 33%
   [97462] = { ["mod"] = 235941,["cooldown"] = { [1] = 60 }, },                          -- 120
   [1160] = { ["mod"] = 199023,["cooldown"] = { [1] = 15 }, },                           -- 15
   [6544] = { ["mod"] = 202163,["cooldown"] = { [1] = 15 }, },                           -- 15
   [740] = { ["mod"] = 197073,["cooldown"] = { [1] = 60 }, },                            -- 60
   [108853] = { ["mod"] = 205029,["cooldown"] = { [1] = 2,[2] = 2 }, },                  -- 2
   [196770] = { ["mod"] = 287250,["cooldown"] = { [1] = -25 }, },                        -- +25
   [342245] = { ["mod"] = 342249,["cooldown"] = { [1] = 10 }, },                         --mage talent 30 -- arcane alter --blink reset
   -- 9.1
   [32375] = { ["mod"] = 341167,["cooldown"] = { [1] = 25 }, },                          --Improved Mass Dispel
   [115310] = { ["mod"] = 353313,["x"] = true,["cooldown"] = { [1] = .50 }, },           -- Peaceweaver
   [20473] = { ["mod"] = 196926,["cooldown"] = { [1] = 1,[2] = 2 }, },                   -- Holy Shock
   [1856] = { ["mod"] = 354825,["xx"] = true,["cooldown"] = { [1] = .67 }, },            --
   [1966] = { ["mod"] = 354825,["xx"] = true,["cooldown"] = { [1] = .67 }, },            --
   [121471] = { ["mod"] = 354825,["xx"] = true,["cooldown"] = { [1] = .67 }, },          --
   [191034] = { ["mod"] = 202354,["cooldown"] = -12 },                                   -- Stellar Drift
   [8143] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                    --
   [207399] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [157153] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [198838] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [51485] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                   --
   [108280] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [5394] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                    --
   [192058] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [192222] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [98008] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                   --
   [196932] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [192077] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [204332] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                  --
   [16191] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                   --
   [2484] = { ["mod"] = 381867,["cooldown"] = { [1] = 3,[2] = 6 }, },                    --
   [32379] = { ["mod"] = 322107,["cooldown"] = { [1] = 12 }, },                          --
   [187650] = { ["mod"] = 343247,["cooldown"] = { [1] = 2.5,[2] = 5 }, },                --
   [236776] = { ["mod"] = 343247,["cooldown"] = { [1] = 2.5,[2] = 5 }, },                --
   [162488] = { ["mod"] = 343247,["cooldown"] = { [1] = 2.5,[2] = 5 }, },                --
   [187698] = { ["mod"] = 343247,["cooldown"] = { [1] = 2.5,[2] = 5 }, },                --
   [108271] = { ["mod"] = 381647,["cooldown"] = { [1] = 30, }, },                        -- [Planes Traveler] -- astral
   --NEW
   --DK
   [63560] = { ["mod"] = 316941,["cooldown"] = { [1] = 8,[2] = 15 }, },                 -- 20 --DK
   [279302] = { ["mod"] = 377047,["cooldown"] = { [1] = 90 }, },                        --
   [48792] = { ["mod"] = 373926,["cooldown"] = { [1] = 60 }, },                         --
   [108199] = { ["mod"] = 206970,["cooldown"] = { [1] = 30 }, },                        --
   [49028] = { ["mod"] = 233412,["x"] = true,["cooldown"] = { [1] = .50 }, },           --
   --DH
   [198793] = { ["mod"] = 389688,["cooldown"] = { [1] = 5 }, },                         --
   [196718] = { ["mod"] = 389783,["cooldown"] = { [1] = 120 }, },                       --
   [207684] = { ["mod"] = 320418,["cooldown"] = { [1] = 30 }, },                        -- mod3  dh sigil
   --Druid
   [48438] = { ["mod"] = 203624,["cooldown"] = { [1] = 10 }, },                         --
   [339] = { ["mod"] = 202226,["cooldown"] = { [1] = -6 },["spec"] = 104 },             -- guadrian , not in spelllist
   --343240
   [194223] = { ["mod"] = 390378,["cooldown"] = { [1] = 60 }, },                        --
   [102560] = { ["mod"] = 390378,["cooldown"] = { [1] = 60 }, },                        --
   [391528] = { ["mod"] = 393414,["cooldown"] = { [1] = 60 }, },                        --
   [106898] = { ["mod"] = 288826,["cooldown"] = { [1] = 60 }, },                        --
   [22842] = { ["mod"] = 372945,["x"] = true,["cooldown"] = { [1] = .80,[2] = .60 }, }, --
   [102342] = { ["mod"] = 382552,["cooldown"] = { [1] = 20 }, },                        --
   [202770] = { ["mod"] = 394121,["cooldown"] = { [1] = 15 }, },                        --
   [132158] = { ["mod"] = 382550,["cooldown"] = { [1] = 12 }, },                        --
   -- Mage
   [157981] = { ["mod"] = 389627,["cooldown"] = { [1] = 5 }, },                         --
   [45438] = { ["mod"] = 382424,["cooldown"] = { [1] = 20,[2] = 40, }, },               --
   [30449] = { ["mod"] = 198100,["cooldown"] = { [1] = -30 }, },                        --
   [212653] = { ["mod"] = 382268,["cooldown"] = { [1] = 1,[2] = 2, }, },                --
   -- Monk
   -- [107428] = {["mod"]= 116680, ["cooldown"] =  {[1]= 9}, }, --   Thunder Focus Tea
   [123904] = { ["mod"] = 388212,["cooldown"] = { [1] = 120 }, },              --
   [132578] = { ["mod"] = 388212,["cooldown"] = { [1] = 120 }, },              --
   [322118] = { ["mod"] = 388212,["cooldown"] = { [1] = 120 }, },              --
   [325197] = { ["mod"] = 388212,["cooldown"] = { [1] = 120 }, },              --
   [115203] = { ["mod"] = 388813,["cooldown"] = { [1] = 120 }, },              --
   [115176] = { ["mod"] = 387035,["x"] = true,["cooldown"] = { [1] = .75 }, }, --
   [115078] = { ["mod"] = 344359,["cooldown"] = { [1] = 15 }, },               --
   [322507] = { ["mod"] = 325093,["x"] = true,["cooldown"] = { [1] = .80 }, }, --
   [119582] = { ["mod"] = 325093,["x"] = true,["cooldown"] = { [1] = .80 }, }, --
   [100784] = { ["mod"] = 387230,["cooldown"] = { [1] = 1 }, },                --
   [322109] = { ["mod"] = 394123,["cooldown"] = { [1] = 45,[2] = 90, }, },     --
   --
   -- Priest
   [341374] = { ["mod"] = 373221,["cooldown"] = { [1] = 15,[2] = 30, }, },            --
   [263165] = { ["mod"] = 373221,["cooldown"] = { [1] = 15,[2] = 30, }, },            --
   [73325] = { ["mod"] = 390620,["cooldown"] = { [1] = 30 }, },                       --
   [204883] = { ["mod"] = 390947,["cooldown"] = { [1] = 3 }, },                       --
   [586] = { ["mod"] = 390670,["cooldown"] = { [1] = 5,[2] = 10 }, },                 --
   --Rogue
   [2983] = { ["mod"] = 231691,["cooldown"] = { [1] = 60 }, },                        --
   [36554] = { ["mod"] = 382503,["x"] = true,["cooldown"] = { [1] = .80 }, },         --
   --warlock
   [104773] = { ["mod"] = 386659,["cooldown"] = { [1] = 45 }, },                      --
   [333889] = { ["mod"] = 386113,["cooldown"] = { [1] = 30,[2] = 60 }, },             --
   -- Warrior
   [6552] = { ["mod"] = 383115,["cooldown"] = { [1] = 1 }, },                         --
   [118038] = { ["mod"] = 383338,["cooldown"] = { [1] = 30 }, },                      --
   [12975] = { ["mod"] = 280001,["cooldown"] = { [1] = 60 }, },                       --
   [384318] = { ["mod"] = 391572,["cooldown"] = { [1] = 30 }, },                      --
   [64382] = { ["mod"] = 329033,["x"] = true,["cooldown"] = { [1] = .50 }, },         --
   [384110] = { ["mod"] = 329033,["x"] = true,["cooldown"] = { [1] = .50 }, },        --
   ---Shaman
   [114050] = { ["mod"] = 381785,["cooldown"] = { [1] = 30,[2] = 60 }, },             --
   [58875] = { ["mod"] = 381678,["cooldown"] = { [1] = 10,[2] = 20 }, },              --
   [192063] = { ["mod"] = 381678,["cooldown"] = { [1] = 5,[2] = 10 }, },              --
   [60103] = { ["mod"] = 334033,["cooldown"] = { [1] = 3,[2] = 6 }, },                --
   [51490] = { ["mod"] = 378779,["cooldown"] = { [1] = 5, }, },                       --
   [108285] = { ["mod"] = 383011,["cooldown"] = { [1] = 60, }, },                     --
   ---Evoker
   [358385] = { ["mod"] = 375528,["cooldown"] = { [1] = 30, }, },                     --
   [367226] = { ["mod"] = 376150,["cooldown"] = { [1] = 10, }, },                     --
   [357210] = { ["mod"] = 386348,["cooldown"] = { [1] = 60, }, },                     --
   [374348] = { ["mod"] = 375577,["cooldown"] = { [1] = 30, }, },                     --
   [351338] = { ["mod"] = 371016,["cooldown"] = { [1] = 20, }, },                     --
   [355913] = { ["mod"] = 365262,["x"] = true,["cooldown"] = { [1] = 0 }, },          --
   --patch 10.0.5
   [132469] = { ["mod"] = 400140,["cooldown"] = { [1] = 5, }, },                      -- drood phon
   [257044] = { ["mod"] = 400472,["x"] = true,["cooldown"] = { [1] = .90 }, },        --  Tactical Reload
   [116849] = { ["mod"] = 399226,["cooldown"] = { [1] = 20, }, },                     -- Burst of Life
   --
   [387174] = { ["mod"] = 405757,["x"] = true,["cooldown"] = { [1] = .75 }, },        -- Inmost Light
   --paladin
   [642] = { ["mod"] = 378425,["x"] = true,["cooldown"] = { [1] = .85,[2] = .70 }, }, --tank
   [633] = { ["mod"] = 378425,["x"] = true,["cooldown"] = { [1] = .85,[2] = .70 }, },
   [1022] = { ["mod"] = 378425,["x"] = true,["cooldown"] = { [1] = .85,[2] = .70 }, },
   [204018] = { ["mod"] = 378425,["x"] = true,["cooldown"] = { [1] = .85,[2] = .70 }, },
   [20271] = { ["mod"] = 385425,["cooldown"] = { [1] = 0.5,[2] = 1 }, },
   -- Pala
   [31821] = { ["mod"] = 392911,["cooldown"] = { [1] = 30 }, }, --
}

ATTdbs.dbModif2 = {
   [186257] = { ["mod"] = 203235,["x"] = true,["cooldown"] = .50, }, -- 50% 4
   [207684] = { ["mod"] = 209281,["x"] = true,["cooldown"] = .80, }, -- 20% 1
   [202137] = { ["mod"] = 209281,["x"] = true,["cooldown"] = .80, }, -- 20% 2
   [204596] = { ["mod"] = 209281,["x"] = true,["cooldown"] = .80, }, -- 20% 3
   [202138] = { ["mod"] = 209281,["x"] = true,["cooldown"] = .80, }, -- 25%
   [200166] = { ["mod"] = 320421,["cooldown"] = 60, },               --2 120 dh old
   [191427] = { ["mod"] = 320421,["cooldown"] = 60, },               --2 dh meta 120
   [108280] = { ["mod"] = 404015,["cooldown"] = 30, },               -- healing tide current control
   --DK
   [275699] = { ["mod"] = 276837,["cooldown"] = 45, },               --
   --DH
   --Druid
   [391528] = { ["mod"] = 393371,["cooldown"] = 60, },               --
   -- Monk
   [115203] = { ["mod"] = 202107,["x"] = true,["cooldown"] = .50, }, -- 50%
   [115176] = { ["mod"] = 202200,["x"] = true,["cooldown"] = .25, }, -- 75%
   --Palandin
   --[633] = { ["mod"] = 393027, ["x"] = true, ["cooldown"] = .90, }, -- 10% --prot TODO duplicate
   --[152262] = { ["mod"] = 379391, ["cooldown"] = 5, }, --
   [375576] = { ["mod"] = 379391,["cooldown"] = 15, },            --
   [31821] = { ["mod"] = 199324,["cooldown"] = 60, },             --
   --Shaman
   [210918] = { ["mod"] = 381647,["cooldown"] = 15, },            -- [Planes Traveler] -- eth
   --Monk
   [116849] = { ["mod"] = 202424,["cooldown"] = 45, },            -- 25
   --hunter
   [264735] = { ["mod"] = 388039,["cooldown"] = 30, },            -- surf of fit
   --pala
   [642] = { ["mod"] = 114154,["x"] = true,["cooldown"] = .70, }, -- 30%
   [498] = { ["mod"] = 114154,["x"] = true,["cooldown"] = .70, }, -- 30%
   [633] = { ["mod"] = 114154,["x"] = true,["cooldown"] = .70, }, -- 30%
   [1022] = { ["mod"] = 384909,["cooldown"] = 60, },              --
   [6940] = { ["mod"] = 384820,["cooldown"] = 60, },
   [204018] = { ["mod"] = 384909,["cooldown"] = 60, },            -- pana imp
   [20271] = { ["mod"] = 383228,["cooldown"] = 2, },              --low cd
   [35395] = { ["mod"] = 383228,["cooldown"] = 2, },              --low cd
   [184575] = { ["mod"] = 404436,["cooldown"] = 2, },             --low cd
}

ATTdbs.dbModif3 = {
   [207684] = { ["mod"] = 211489,["x"] = true,["cooldown"] = .75 },  -- 25% 1
   [202137] = { ["mod"] = 211489,["x"] = true,["cooldown"] = .75 },  -- 25% 2
   [204596] = { ["mod"] = 211489,["x"] = true,["cooldown"] = .75 },  -- 25% 3
   [202138] = { ["mod"] = 211489,["x"] = true,["cooldown"] = .75 },  -- 25%
   [204018] = { ["mod"] = 216853,["x"] = true,["cooldown"] = .67, }, -- 33%
   [1022] = { ["mod"] = 216853,["x"] = true,["cooldown"] = .67, },   --  33%
   [6940] = { ["mod"] = 216853,["x"] = true,["cooldown"] = .67, },   --  33%
   [391528] = { ["mod"] = 393991,["x"] = true,["cooldown"] = .50, }, --
   [108280] = { ["mod"] = 353115,["cooldown"] = 60, },               -- healing tide pvp
   --  [323764] = {["mod"]= 393991,  ["x"] = true , ["cooldown"] = .50, }, -- conv
}


ATTdbs.dbReducePowerSpell = {
   --holy power
   [53600]  = 3,
   [53385]  = 3,
   [85222]  = 3,
   [85256]  = 3,
   [85673]  = 3,
   [383328] = 3,
   --[343527] = 3,
   --[152262] = 3,
   [215661] = 3,
   [216331] = 5,
   --focus
   [982]    = 35,
   [1513]   = 25,
   [2643]   = 40,
   [19434]  = 35,
   [34026]  = 30,
   [53351]  = 10,
   [120360] = 60,
   [131894] = 30,
   [185358] = 40,
   [186270] = 30,
   [186387] = 10,
   [187708] = 35,
   [193455] = 35,
   [195645] = 20,
   [203155] = 40,
   [205691] = 60,
   [208652] = 30,
   [212431] = 20,
   [212436] = 30,
   [257620] = 20,
   [259387] = 30,
   [259391] = 15,
   [259491] = 20,
   [271788] = 10,
   [342049] = 40,
   --chi
   [100784] = 1,
   [107428] = 2,
   [101546] = 2,
   [113656] = 3,
   [116847] = 1,
   [392983] = 2,
   --rage
   [772]    = 30,
   [1464]   = 20,
   [1680]   = 30,
   [1715]   = 10,
   [2565]   = 30,
   [6572]   = 20,
   [12294]  = 30,
   [163201] = 40, --
   [184367] = 80,
   [190456] = 40,
   [202168] = 10,
   [330334] = 30,
   --runes
   [47541]  = 40,
   [49998]  = 45,
   [61999]  = 30,
   [327574] = 20,
   --combopoints rogue
   [408]    = 5,
   [1943]   = 5,
   [196819] = 5,
   [280719] = 5,
   [315341] = 5,
   [315496] = 5,
   [319175] = 5,
   [5171]   = 5,
   --combopoints feral
   [1079]   = 5,
   [22568]  = 5,
   [202031] = 5,
   [22570]  = 5,
   -- fury
   [198013] = 30,
   [162794] = 40,
   [188499] = 35,
   [179057] = 30,
}

ATTdbs.dbModifCrit = {
   --mage (Kindling)
   [108853] = { ["mod"] = { [1] = 190319 },["tid"] = 155148,["cooldown"] = { [1] = 1, }, },                     --
   [11366]  = { ["mod"] = { [1] = 190319 },["tid"] = 155148,["cooldown"] = { [1] = 1, }, },                     --
   [133]    = { ["mod"] = { [1] = 190319 },["tid"] = 155148,["cooldown"] = { [1] = 1, }, },                     --
   [203413] = { ["mod"] = { [1] = 269751 },["tid"] = 385718,["cooldown"] = { [1] = 1,[2] = 1.5,[3] = 1.5, }, }, --fury of the
}

ATTdbs.dbModifCharge = {
   [122] = 205036,    --
   [109132] = 115173,
   [190784] = 230332, --
   [185313] = 238104, --
   [100] = 103827,    --
   [7384] = 262150,   --
   [275779] = 204023, --
   [259489] = 269737, --
   [259495] = 264332, --
   [51505] = 108283,  --
   [61295] = 108283,  --
   [108853] = 205029, --
   -- new
   [53351] = 321460,  --
   [185123] = 203556, -- new dh
   -- pvp ?
   [2050] = 235587,
   [527] = 196162,
   [1044] = 199454,
   [1022] = 199454,
   [48265] = 356367,
   [43265] = 356367,
   [49576] = 356367,
   [61336] = 328767,
   -- [5394] = 51564,
   [157153] = 5394,
   -- [185313] = 185313,   --shadow dance
   [1856] = 382513,
   --[185313] = 185313261, --sd fix
   --TO DO SHADOW DANCE - Healing stream
   [358267] = 365933,
   [33206] = 373035,  --ps
   [228920] = 382953, --ravager
}

ATTdbs.dbChargeSpellFix = {
   [36554] = true,
   [191634] = true,
   [47568] = true,
   [5394] = true,
   [185313] = true,
}


ATTdbs.dbReplace = {
   --  [1022] = { 204018 },
   [31884] = { 394088, 231895, 385438, 216331 },
   [48792] = { 287081 },
   [42650] = { 288853 },
   [194223] = { 102560 },
   [102558] = { 50334 },
   [106951] = { 102543 },
   [1850] = { 252216 },
   [34477] = { 248518 },
   [12472] = { 198144 },
   [1953] = { 212653 },
   [33395] = { 205024 },
   [137639] = { 152173 },
   [109132] = { 115008 },
   [8122] = { 205369 },
   [62618] = { 271466 }, --["mod2"]= 197590
   [5384] = { 202748 },
   [108271] = { 210918 },
   [80240] = { 200546 },
   [227847] = { 152277 },
   [167105] = { 262161 },
   [23920] = { 213915 },
   -- [192249] ={ ["mod"]= 198067 },
   [198067] = { 192249 },
   [586] = { 213602 },
   [86659] = { 228049 },
   [32182] = { 193876 },
   [2825] = { 193876 },
   [5394] = { 157153 },
   --  [394088] = { 216331 },

  ---- [102560] = { 194223 }, --bugged?
   [360823] = { 365585 },
   --10.0.0.7
   [2484] = { 51485 }, -- earthgrab
}

ATTdbs.dbTalentSpellFix = {
   [103216] = 343240,
   [103224] = 377623,
   [103211] = 377779,
}

ATTdbs.ShareCD = {
   [204018] = 1022,
   [1022]   = 204018,
   [390414] = 194223,
   [102560] = 194223,
   [383410] = 194223,

   [274283] = 274281,
   [274282] = 274281,

   [200166] = 191427,
   [162264] = 191427,
   [394088] = 216331,
   [202140] = 207684, --sigil
   [204513] = 204596, --sigil
   [207682] = 202137, --sigil
   [207665] = 202138, --sigil
   [77761]  = 106898, --stamped
   [6358]   = 119898,
   [19647]  = 119898,
   [119907] = 119898, --sb
   [119910] = 119898,
   [261589] = 119898,
   [89808]  = 119898,
   [119905] = 119898,
   [132411] = 119898,
   [89766]  = 119898,
   [119914] = 119898,
   [132409] = 119898,
   [17767]  = 119898, --
   [204362] = 193876,
   [204361] = 193876,
   [360823] = 365585,
   [342247] = 342245,
   [61391]  = 132469, --typhoon
}

ATTdbs.lockPets = {
   [697] = { ["id"] = 17767,["tex"] = 136121,["cd"] = 90, }, --
   [688] = { ["id"] = 89808,["tex"] = 135791,["cd"] = 15, },
   [691] = { ["id"] = 19647,["tex"] = 136174,["cd"] = 24, },
   [712] = { ["id"] = 6358,["tex"] = 1717715,["cd"] = 30, },
   [30146] = { ["id"] = 89766,["tex"] = 236316,["cd"] = 30, },
   [366222] = { ["id"] = 6358,["tex"] = 1717715,["cd"] = 30, },
   -- [119707] = {["id"] = 6358, ["tex"] = 1717715,["cd"] = 24, },
}

ATTdbs.dbAuraRemoved = {
   [5384]   = true,
   [5215]   = true,
   [34477]  = true,
   [328774] = true,
   [256948] = true,
   [248518] = true,
   [215652] = true,
   [210918] = true,
   [210294] = true, --
   [209785] = true,
   [209584] = true,
   [205025] = true,
   [202425] = true,
   [199483] = true,
   [198817] = true,
   [188501] = true,
   [132158] = true,
   [116680] = true,
   [369536] = true,
   [378081] = true,

}

ATTdbs.dbAuraApplied = {
   [65116] = true,
   [273104] = true,
   [336139] = true, -- ad
   [195901] = true, -- ad
   [31616] = true,  -- nat
   [87024] = true,  --cau
   [20594] = true,  --stone ?
   [7744] = true,
   -- [342245] = true, --alter
   [323436] = true, -- conv
   -- [110909] = true, -- alter2?
   --[342247] = true,

   --110909 , 342246 alter?
}

ATTdbs.RecoverySpells = {
   [740]    = true,
   [1122]   = true,
   [1719]   = true,
   [12042]  = true,
   [12472]  = true,
   [13750]  = true,
   [31884]  = true,
   [42650]  = true,
   [47536]  = true,
   [47568]  = true,
   [50334]  = true,
   [51533]  = true,
   [55233]  = true,
   [64843]  = true,
   [79140]  = true,
   [102543] = true,
   [102558] = true,
   [102560] = true,
   [106951] = true,
   [107574] = true,
   [108280] = true,
   [115310] = true,
   [121471] = true,
   [132578] = true,
   [137639] = true,
   [152173] = true,
   [152277] = true,
   [187827] = true,
   [190319] = true,
   [192249] = true,
   [193530] = true,
   [194223] = true,
   [198067] = true,
   [200166] = true,
   [205180] = true,
   [216331] = true,
   [227847] = true,
   [228260] = true,
   [231895] = true,
   [265187] = true,
   [266779] = true,
   [288613] = true,
}

ATTdbs.isStun = {
   [408]    = true,
   [853]    = true,
   [1833]   = true,
   [5211]   = true,
   [20549]  = true,
   [22703]  = true,
   [24394]  = true,
   [30283]  = true,
   [46968]  = true,
   [64044]  = true,
   [89766]  = true,
   [91797]  = true,
   [91800]  = true,
   [108194] = true,
   [118345] = true,
   [118905] = true,
   [119381] = true,
   [132168] = true,
   [132169] = true,
   [145047] = true,
   [163505] = true,
   [171017] = true,
   [171018] = true,
   [179057] = true,
   [199085] = true,
   [200166] = true,
   [200200] = true,
   [202244] = true,
   [202346] = true,
   [203123] = true,
   [205630] = true,
   [208618] = true,
   [210141] = true,
   [211881] = true,
   [213491] = true,
   [213688] = true,
   [221562] = true,
   [245638] = true,
   [255723] = true,
   [255941] = true,
   [280061] = true,
   [287254] = true,
   [287712] = true,
   [305485] = true,
   [325321] = true,
   [332423] = true,
   [334693] = true,
}

ATTdbs.dbTimeSpiral = {
   --free procs
   [358267] = true,
   [48265] = true,
   [195072] = true,
   [189110] = true,
   [1850] = true,
   [252216] = true,
   [186257] = true,
   [1953] = true,
   [212653] = true,
   [109132] = true,
   [115008] = true,
   [190784] = true,
   [73325] = true,
   [2983] = true,
   [79206] = true,
   [48020] = true,
   [6544] = true,
}