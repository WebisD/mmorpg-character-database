/*
"Encontrar qual o Personagem que mais combateu ( com inimigo) e apresentar um profile do mesmo, considerando:

- Seu nome
- Qual seu equipamento mais utilizado
- Qual o tempo médio de recarga
- Qual é a sua maior aptidão
- Seu nível de defesa e ataque"
*/
SELECT id_personagem, nome, biggest_apt.aptidao, biggest_apt.valor_aptidao, atr.ataque, atr.defesa, AVG(tempo_recarga) as media_recarga, max_quant_item.item_desc, max_quant_item.quant
FROM personagem
JOIN atributo atr ON atr.id_atributo = personagem.id_atributo
JOIN habilidade_jogador hj ON hj.id_jogador = personagem.id_personagem
JOIN habilidade h ON h.id_habilidade = hj.id_habilidade
JOIN (
	SELECT item.descricao as item_desc, MAX(arm.quantidade) as quant, jg.id_jogavel as id_jg
	FROM item
	JOIN armazena arm ON arm.id_item = item.id_item
	JOIN inventario inv ON inv.id_inventario = arm.id_inventario
	JOIN jogavel jg ON jg.id_inventario = inv.id_inventario
	GROUP BY item.descricao, jg.id_jogavel ORDER BY quant DESC LIMIT 1
) max_quant_item ON max_quant_item.id_jg = id_personagem
JOIN (
	SELECT
       CASE GREATEST(determinacao, carisma, forca, constituicao, destreza, agilidade, inteligencia, percepcao) 
         WHEN determinacao THEN 'determinacao'
         WHEN carisma THEN 'carisma'
		 WHEN forca THEN 'forca'
		 WHEN constituicao THEN 'constituicao'
		 WHEN destreza THEN 'destreza'
		 WHEN agilidade THEN 'agilidade'
		 WHEN inteligencia THEN 'inteligencia'
		 WHEN percepcao THEN 'percepcao'
       END AS aptidao,
		GREATEST(determinacao, carisma, forca, constituicao, destreza, agilidade, inteligencia, percepcao) AS valor_aptidao,
		id_aptidao
	FROM aptidoes
) biggest_apt ON biggest_apt.id_aptidao = personagem.id_aptidao
WHERE id_personagem =
(
	SELECT id_perso as maiores_combatentes FROM
	(
		SELECT realiza_interacao.id_persongem_efetuado as id_perso
			FROM combate, realiza_interacao
			WHERE combate.id_interacao = realiza_interacao.id_interacao 
		UNION ALL
		SELECT realiza_interacao.id_persongem_efetua
			FROM combate, realiza_interacao
			WHERE combate.id_interacao = realiza_interacao.id_interacao
	) 
	AS maior_combatente
	GROUP BY maiores_combatentes ORDER BY COUNT(*) DESC LIMIT 1
)
GROUP BY id_personagem, biggest_apt.aptidao, biggest_apt.valor_aptidao, atr.ataque, atr.defesa, max_quant_item.item_desc, max_quant_item.quant
