-- https://marolliscripts.pl/
local marolliscripts = Config.MarolliScripts
local princior = '       ^4https://marolliscripts.pl/'
local princiordc = '            ^1discord: marolli_'
local princiorzw = '^2Pomyślnie załadowano skrypt napisany przez:'

CreateThread(function()
    print(princiorzw)
    print(princior)
    print(princiordc)
end)

RegisterNetEvent('m_fisherjob:collectfish', function(zlapanaryba)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local czymawedke = xPlayer.getInventoryItem(marolliscripts.Items.Wedka).count > 0

    if not marolliscripts.Requirejob or xPlayer.job.name == marolliscripts.JobName then
        if czymawedke then
            local losowaniejakubuddy = math.random(1, 10)
            if losowaniejakubuddy >= 1 then
                if zlapanaryba == marolliscripts.Items.Ryby[5] then
                    xPlayer.showNotification('Gratulacje! Złowiłeś perłę, ale masz szczęście!')
                elseif zlapanaryba == marolliscripts.Items.Ryby[4] then
                    xPlayer.showNotification('Gratulacje! Złowiłeś złotą rybę, to chyba jest twój dzień!')
                else
                    xPlayer.showNotification('Gratulacje! Złowiłeś niezłą sztukę bratku!')
                end

                xPlayer.addInventoryItem(zlapanaryba, 1)
            else
                xPlayer.showNotification('Ryba zerwała się z haczyka!')
            end
        else
            print('^1https://marolliscripts.pl/')
            xPlayer.showNotification('Nie posiadasz wędki!')
        end
    else
        xPlayer.showNotification('Nie jesteś zatrudniony!')
        print('^1https://marolliscripts.pl/')
        return false
    end
end)

RegisterNetEvent('m_fisherjob:sellfish', function(items, percent, itemCount)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    
    if itemCount > 0 then
        local sigmaboii = marolliscripts.PayOut * marolliscripts.PayOutPercent[percent]
        local totalPay = sigmaboii * itemCount
        
        for _, item in ipairs(items) do
            xPlayer.removeInventoryItem(item, itemCount)
        end
        
        xPlayer.addInventoryItem('money', totalPay)
        xPlayer.showNotification('Ze sprzedaży otrzymałeś $' .. totalPay)
    else
        xPlayer.showNotification('Nie masz wystarczająco przedmiotów!')
    end
end)
