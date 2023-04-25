local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
vRP = Proxy.getInterface('vRP')
yRP = {}
Tunnel.bindInterface('prooxy_alarme',yRP)


RegisterCommand('addnacasa', function(source, args,rawCommand) --Comando para o dono da casa adicionar um amigo para não ser explodido '/addnacasa ID NomeDogroupdamansao' (possivel só adicionar groups que tem na tabela mansoes, não colocar groups de adm na tabela ) 
    local source = source
    local user_id = vRP.getUserId(source)
    if args[1] and args[2] then
        for k,v in pairs(mansoes) do
            if ProoxyGroup(user_id,v.group) == args[2] then
                vRP.addUserGroup(parseInt(args[1]),args[2])
                TriggerClientEvent('Notify',source,'sucesso','Você adicionou o <b>(ID: '..parseInt(args[1])..')</b> na mansão: <b>'..args[2]..'</b>', 5)
            end
        end
    end
end)

function yRP.Prooxycheck(perm) --Função que não deixa explodir o player caso ela tenha a permissão que esta na tabela mansoes
    local source = source
    local user_id = vRP.getUserId(source)
    for k,v in pairs(mansoes) do
        if user_id then
            if vRP.hasPermission(user_id, v.perm) then
                return true
            end
        end
    end
end

function ProoxyGroup(user_id,group) --Função que retorna o group que foi enviado a ela, com ela só tem como adicionar o group que esta na tabela mansoes
    local source = source
    local user_id = vRP.getUserId(source)
    return group
end

print('Mansoes com alarmes ligados - Qualquer duvida -> https://discord.gg/AETxBBNK6e')


