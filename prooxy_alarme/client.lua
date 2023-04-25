local Tunnel = module('vrp','lib/Tunnel')
local Proxy = module('vrp','lib/Proxy')
vSERVER = Tunnel.getInterface('prooxy_alarme')

CreateThread(function(source) --Tread que verifica ser o player esta proximo a mansao e caso esteja sera explodido
	while true do
		local time = 1000
		local ped = PlayerPedId()
		local playercoords = GetEntityCoords(ped)
		local vida = GetEntityHealth(ped)
		if vida > 101 then -- ser o player estiver morto não explodira
			for k,v in pairs(mansoes) do
				distancia = Vdist(playercoords, vector3(v.coords[1],v.coords[2],v.coords[3]))
				if distancia < 20 then --ser a distancia for menos que 20 metros da mansao ira explodir o player (deixar a cds no meio da mansao)
					if not vSERVER.Prooxycheck(v.perm) then
						--AddExplosion(GetEntityCoords(ped), 2, 50.0, true, false, true)
						TriggerEvent('Notify','negado','Não era pra você esta aqui, safadinho!')
					end
				end
			end	
		end
		Wait(time)
	end
end)






