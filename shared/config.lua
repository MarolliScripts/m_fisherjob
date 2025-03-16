-- https://marolliscripts.pl/
Config = {}

Config.MarolliScripts = {
    Debug = false, -- debug (zostaw false)

    Blip = { -- ustawienia blip
        Coords = vec3(-1819.3110, -1208.6017, 13.0173),
        Name = 'Stacja rybacka',
        Sprite = 68,
        Colour = 3,
        Scale = 1.0
    },

    FishingTime = { -- czas łowienia (w sekundach)
        min = 5,
        max = 30
    },

    Requirejob = false, -- true/false (wymaganie pracy, tak/nie)
    JobName = 'rybak', -- (jeżeli requirejob zrobiłeś na true, ustaw tu joba, którego skrypt wymaga, aby łowić.)

    Zone = vec3(-1856.44, -1245.68, 8.62), -- kordy lokalizacji lowienia
    Label = 'Rozpocznij łowienie',

    Items = { -- itemki
        Wedka = 'fishingrod',
        Ryby = {
            [1] = 'okon',
            [2] = 'dorsz',
            [3] = 'szczupak',
            [4] = 'zlotaryba',
            [5] = 'perla'
        }
    },

    ShopPed = { -- ustawienia peda
        Ped = 'a_m_m_hillbilly_01',
        PedCoords = vec3(-1814.3905, -1212.9767, 12.0175),
        PedHeading = 46.0643,
        PedOptions = {
            [1] = 'Zakup wędkę',
            [2] = 'Sprzedaj ryby',
        }
    },

    PayOut = 100, -- podstawowa wypłata

    PayOutPercent = { -- ustawienia wypłat za ryby (działa to: payout * payoutpercent * ilosc ryb)
        okondorsz = 0.3,
        szczupak = 0.8,
        zlotaryba = 1.5,
        perla = 2.0
    }
}