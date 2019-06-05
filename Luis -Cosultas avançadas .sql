-- quantas multas um veiculo tem?
select v.placa, m.local_multa, m.data_multa
from veiculo v
join multa m on (v.id=m.id_veiculo)
where v.placa = "EVA4960"

-- qual e o valor das multas somado?
select v.placa,
       sum(i.valor) as multa_somadas
from veiculo v
join multa m on (v.id = m.id_veiculo)
join infracao i on (i.id = m.id_infracao)
where v.placa = "EVA4960"

--qual e o valor de multas especificas
select v.placa, m.local_multa, m.data_multa, m.id as "codigo da multa"
from veiculo v
join multa m on (v.id = m.id_veiculo)
where (m.id = 3 or m.id = 100)

-- quantos pontos um proprietário tem?
select p.nome,
       v.placa,
       sum(i.pontos) as total_pontos
from proprietario p 
join veiculo v on (p.id = v.id_proprietario)
join multa m on (m.id_veiculo = v.id)
join infracao i on (i.id = m.id_infracao)
group by p.id;  

-- qual e a multa mais cara?
