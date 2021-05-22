--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aptidoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aptidoes (
    id_aptidao integer NOT NULL,
    determinacao integer NOT NULL,
    carisma integer NOT NULL,
    forca integer NOT NULL,
    constituicao integer NOT NULL,
    destreza integer NOT NULL,
    agilidade integer NOT NULL,
    inteligencia integer NOT NULL,
    percepcao integer NOT NULL
);


ALTER TABLE public.aptidoes OWNER TO postgres;

--
-- Name: armadura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armadura (
    id_item integer NOT NULL,
    bonus_defesa integer NOT NULL,
    material character varying(150) NOT NULL,
    durabilidade integer NOT NULL
);


ALTER TABLE public.armadura OWNER TO postgres;

--
-- Name: armamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armamento (
    id_item integer NOT NULL,
    tipo character varying(150) NOT NULL,
    bonus_armamento integer NOT NULL,
    material character varying(150) NOT NULL,
    durabilidade integer NOT NULL
);


ALTER TABLE public.armamento OWNER TO postgres;

--
-- Name: armazena; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armazena (
    id_item integer NOT NULL,
    id_inventario integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE public.armazena OWNER TO postgres;

--
-- Name: atributo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atributo (
    id_atributo integer NOT NULL,
    pontos integer NOT NULL,
    defesa integer NOT NULL,
    ataque integer NOT NULL,
    vida integer NOT NULL,
    mana integer NOT NULL,
    vigor integer NOT NULL
);


ALTER TABLE public.atributo OWNER TO postgres;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe (
    id_classe integer NOT NULL,
    tipo character varying(150) NOT NULL,
    descricao character varying(300) NOT NULL,
    bonus_de_classe integer NOT NULL
);


ALTER TABLE public.classe OWNER TO postgres;

--
-- Name: combate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combate (
    id_interacao integer NOT NULL
);


ALTER TABLE public.combate OWNER TO postgres;

--
-- Name: comunicacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comunicacao (
    id_interacao integer NOT NULL,
    mensagem character varying(500) NOT NULL
);


ALTER TABLE public.comunicacao OWNER TO postgres;

--
-- Name: consumivel_ofensivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumivel_ofensivo (
    id_item integer NOT NULL,
    dano integer NOT NULL,
    tipo_dano character varying(50) NOT NULL,
    duracao timestamp without time zone NOT NULL
);


ALTER TABLE public.consumivel_ofensivo OWNER TO postgres;

--
-- Name: consumivel_suporte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumivel_suporte (
    id_item integer NOT NULL,
    buff integer,
    debuff integer,
    descricao_buf character varying(200),
    descricao_debuff character varying(200),
    duracao timestamp without time zone NOT NULL
);


ALTER TABLE public.consumivel_suporte OWNER TO postgres;

--
-- Name: equipamento_requer_aptidao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamento_requer_aptidao (
    id_aptidao integer NOT NULL,
    id_equipamento integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.equipamento_requer_aptidao OWNER TO postgres;

--
-- Name: ganha_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ganha_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.ganha_item OWNER TO postgres;

--
-- Name: habilidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidade (
    id_habilidade integer NOT NULL,
    tipo character varying(150) NOT NULL,
    tempo_recarga integer NOT NULL,
    descricao character varying(300) NOT NULL,
    duracao integer NOT NULL,
    tempo_ativacao integer NOT NULL,
    ponto integer NOT NULL
);


ALTER TABLE public.habilidade OWNER TO postgres;

--
-- Name: habilidade_jogador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidade_jogador (
    id_habilidade integer NOT NULL,
    id_jogador integer NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.habilidade_jogador OWNER TO postgres;

--
-- Name: interacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interacao (
    id_interacao integer NOT NULL,
    local character varying(200) NOT NULL,
    data timestamp with time zone NOT NULL
);


ALTER TABLE public.interacao OWNER TO postgres;

--
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    capacidade_atual integer NOT NULL,
    capacidade_max integer NOT NULL
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id_item integer NOT NULL,
    valor integer NOT NULL,
    raridade integer NOT NULL,
    descricao character varying(300) NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: jogavel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogavel (
    id_jogavel integer NOT NULL,
    id_inventario integer NOT NULL,
    nickname character varying(20) NOT NULL
);


ALTER TABLE public.jogavel OWNER TO postgres;

--
-- Name: moeda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moeda (
    id_item integer NOT NULL,
    id_moeda integer NOT NULL
);


ALTER TABLE public.moeda OWNER TO postgres;

--
-- Name: nao_jogavel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nao_jogavel (
    id_nao_jogavel integer NOT NULL,
    afinidade integer NOT NULL,
    tipo character varying(150) NOT NULL,
    acrescimo_experiencia integer NOT NULL
);


ALTER TABLE public.nao_jogavel OWNER TO postgres;

--
-- Name: personagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personagem (
    id_personagem integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    id_atributo integer NOT NULL,
    id_aptidao integer NOT NULL,
    nome character varying(150) NOT NULL,
    genero character varying(150) NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.personagem OWNER TO postgres;

--
-- Name: raca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raca (
    id_raca integer NOT NULL,
    tipo character varying(150) NOT NULL,
    descricao character varying(300) NOT NULL,
    bonus_de_raca integer NOT NULL,
    alinhamento character varying NOT NULL
);


ALTER TABLE public.raca OWNER TO postgres;

--
-- Name: realiza_interacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realiza_interacao (
    id_persongem_efetua integer NOT NULL,
    id_persongem_efetuado integer NOT NULL,
    id_interacao integer NOT NULL
);


ALTER TABLE public.realiza_interacao OWNER TO postgres;

--
-- Name: recebe_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recebe_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.recebe_item OWNER TO postgres;

--
-- Name: tipo_moeda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_moeda (
    id_moeda integer NOT NULL,
    minerio character varying(200) NOT NULL
);


ALTER TABLE public.tipo_moeda OWNER TO postgres;

--
-- Name: troca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.troca (
    id_interacao integer NOT NULL
);


ALTER TABLE public.troca OWNER TO postgres;

--
-- Name: variedades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variedades (
    id_item integer NOT NULL,
    nome character varying(150) NOT NULL
);


ALTER TABLE public.variedades OWNER TO postgres;

--
-- Data for Name: aptidoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aptidoes (id_aptidao, determinacao, carisma, forca, constituicao, destreza, agilidade, inteligencia, percepcao) FROM stdin;
1	100	100	400	200	300	500	100	410
2	300	70	100	220	360	700	130	440
3	400	130	220	270	380	100	210	100
4	700	170	530	190	410	130	320	110
5	250	110	760	150	517	220	330	215
\.


--
-- Data for Name: armadura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armadura (id_item, bonus_defesa, material, durabilidade) FROM stdin;
\.


--
-- Data for Name: armamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armamento (id_item, tipo, bonus_armamento, material, durabilidade) FROM stdin;
\.


--
-- Data for Name: armazena; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armazena (id_item, id_inventario, quantidade) FROM stdin;
\.


--
-- Data for Name: atributo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atributo (id_atributo, pontos, defesa, ataque, vida, mana, vigor) FROM stdin;
1	15	200	7000	5000	14000	100
2	27	300	9000	56000	3000	150
3	12	400	4000	29000	76000	120
4	66	500	2700	7400	54000	370
5	78	600	10000	2100	100	410
\.


--
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classe (id_classe, tipo, descricao, bonus_de_classe) FROM stdin;
1	Lutador	Um mestre do combate marcial, hábil com uma variedade de armas e armaduras	10
2	Barbaro	Um guerreiro feroz de origem primitiva que pode entrar em uma batalha furiosa	27
3	Druida	Um sacerdote da Velha Fé, exercendo os poderes da natureza e adotando formas animais	55
4	Paladino	A holy warrior bound to a sacred oath	32
5	Mago	Um usuário de magia erudito capaz de manipular as estruturas da realidade.	98
\.


--
-- Data for Name: combate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combate (id_interacao) FROM stdin;
\.


--
-- Data for Name: comunicacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comunicacao (id_interacao, mensagem) FROM stdin;
\.


--
-- Data for Name: consumivel_ofensivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumivel_ofensivo (id_item, dano, tipo_dano, duracao) FROM stdin;
\.


--
-- Data for Name: consumivel_suporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumivel_suporte (id_item, buff, debuff, descricao_buf, descricao_debuff, duracao) FROM stdin;
\.


--
-- Data for Name: equipamento_requer_aptidao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamento_requer_aptidao (id_aptidao, id_equipamento, id_raca, id_classe, nivel) FROM stdin;
\.


--
-- Data for Name: ganha_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ganha_item (id_interacao, id_item) FROM stdin;
\.


--
-- Data for Name: habilidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidade (id_habilidade, tipo, tempo_recarga, descricao, duracao, tempo_ativacao, ponto) FROM stdin;
1	Kage bunshin no jutsu	10	Cria um clone do personagem, que o ajuda durante a luta.	15	3	100
2	Bola de fogo no jutsu	5	Solta uma bola de fogo em direção ao inimigo.	5	3	200
3	suiton no jutsu	8	Solta um jato dágua em direção ao inimigo.	10	3	150
4	kamehameha	12	Solta um poderoso raio de energia em direção ao inimigo.	10	3	200
5	expelliarmus	25	Solta uma bola de energia em direção ao inimigo que o desarma.	10	3	70
\.


--
-- Data for Name: habilidade_jogador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidade_jogador (id_habilidade, id_jogador, nivel) FROM stdin;
\.


--
-- Data for Name: interacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interacao (id_interacao, local, data) FROM stdin;
1	Armia	2010-08-29 00:00:00-03
2	Arzan	2010-04-10 00:00:00-03
3	Nipplehein	2004-07-04 00:00:00-03
4	Noatum	2002-04-02 00:00:00-03
5	Erion	2001-01-10 00:00:00-02
\.


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (id_inventario, capacidade_atual, capacidade_max) FROM stdin;
1	10	100
2	70	320
3	230	750
4	2	30
5	670	800
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (id_item, valor, raridade, descricao) FROM stdin;
1	10	1	Botas de couro, aumentam a velocidade em 10%
2	50	2	Colar de  safira, protege contra danos causados por fogo.
3	200	3	Mjolnir o martelo de Thor destruirá seus inimigos causando danos de raio.
4	310	4	Armadura lendária do dragão celestial, aumenta defesa em 300%, vitalidade em 200%, resistencia a venenos 100%.
5	720	5	Lamina infernal de Ifrit, esta poderosa lamina \n forjada com o corpo de Ifrid queimara seus inimigo até a morte.
\.


--
-- Data for Name: jogavel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogavel (id_jogavel, id_inventario, nickname) FROM stdin;
\.


--
-- Data for Name: moeda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moeda (id_item, id_moeda) FROM stdin;
\.


--
-- Data for Name: nao_jogavel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nao_jogavel (id_nao_jogavel, afinidade, tipo, acrescimo_experiencia) FROM stdin;
\.


--
-- Data for Name: personagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personagem (id_personagem, id_raca, id_classe, id_atributo, id_aptidao, nome, genero, nivel) FROM stdin;
1	1	1	1	1	buenoGameplay321	Masculino	100
2	2	2	2	2	ziliombrom	Feminino	4000
3	3	3	3	3	bobafelps	Masculino	50
4	4	4	4	4	dragonSlayer69	Masculino	300
5	5	5	5	5	gustavo_matador_de_porco	Masculino	150
\.


--
-- Data for Name: raca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raca (id_raca, tipo, descricao, bonus_de_raca, alinhamento) FROM stdin;
1	Humano	Os humanos são as pessoas mais adaptáveis ​​e ambiciosas entre as raças comuns	20	Neutro e Bom
2	Elfo	Elfos são um povo mágico de graça sobrenatural, vivendo no mundo, mas não totalmente parte dele.	10	Caótico e Bom
3	Orc	Orcs vivem uma vida onde não há lugar para fraquezas, e todo guerreiro deve ser forte o suficiente para pegar o que é necessário à força.	90	Ordeiro e Mau
4	Gnome	A energia e o entusiasmo de um gnomo pela vida brilham em cada centímetro de seu minúsculo corpo.	30	Ordeiro e Mau
5	Goliath	Strong and reclusive, every day brings a new challenge to a goliath.	200	Neutro e Mau
\.


--
-- Data for Name: realiza_interacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realiza_interacao (id_persongem_efetua, id_persongem_efetuado, id_interacao) FROM stdin;
\.


--
-- Data for Name: recebe_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recebe_item (id_interacao, id_item) FROM stdin;
\.


--
-- Data for Name: tipo_moeda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_moeda (id_moeda, minerio) FROM stdin;
1	Cobre
2	Bronze
3	Ouro
4	Prata
5	quarto
\.


--
-- Data for Name: troca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.troca (id_interacao) FROM stdin;
\.


--
-- Data for Name: variedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variedades (id_item, nome) FROM stdin;
\.


--
-- Name: aptidoes aptidoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aptidoes
    ADD CONSTRAINT aptidoes_pkey PRIMARY KEY (id_aptidao);


--
-- Name: atributo atributo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atributo
    ADD CONSTRAINT atributo_pkey PRIMARY KEY (id_atributo);


--
-- Name: classe classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_pkey PRIMARY KEY (id_classe);


--
-- Name: habilidade habilidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade
    ADD CONSTRAINT habilidade_pkey PRIMARY KEY (id_habilidade);


--
-- Name: interacao interacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacao
    ADD CONSTRAINT interacao_pkey PRIMARY KEY (id_interacao);


--
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_inventario);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id_item);


--
-- Name: jogavel jogavel_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogavel
    ADD CONSTRAINT jogavel_nickname_key UNIQUE (nickname);


--
-- Name: personagem personagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT personagem_pkey PRIMARY KEY (id_personagem);


--
-- Name: raca raca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raca
    ADD CONSTRAINT raca_pkey PRIMARY KEY (id_raca);


--
-- Name: tipo_moeda tipo_moeda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_moeda
    ADD CONSTRAINT tipo_moeda_pkey PRIMARY KEY (id_moeda);


--
-- Name: armadura_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armadura_id_item_idx ON public.armadura USING btree (id_item);


--
-- Name: armamento_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armamento_id_item_idx ON public.armamento USING btree (id_item);


--
-- Name: armazena_id_inventario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armazena_id_inventario_idx ON public.armazena USING btree (id_inventario);


--
-- Name: armazena_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armazena_id_item_idx ON public.armazena USING btree (id_item);


--
-- Name: combate_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX combate_id_interacao_idx ON public.combate USING btree (id_interacao);


--
-- Name: comunicacao_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comunicacao_id_interacao_idx ON public.comunicacao USING btree (id_interacao);


--
-- Name: consumivel_ofensivo_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumivel_ofensivo_id_item_idx ON public.consumivel_ofensivo USING btree (id_item);


--
-- Name: consumivel_suporte_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumivel_suporte_id_item_idx ON public.consumivel_suporte USING btree (id_item);


--
-- Name: equipamento_requer_aptidao_id_aptidao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_aptidao_idx ON public.equipamento_requer_aptidao USING btree (id_aptidao);


--
-- Name: equipamento_requer_aptidao_id_classe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_classe_idx ON public.equipamento_requer_aptidao USING btree (id_classe);


--
-- Name: equipamento_requer_aptidao_id_equipamento_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_equipamento_idx ON public.equipamento_requer_aptidao USING btree (id_equipamento);


--
-- Name: equipamento_requer_aptidao_id_raca_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_raca_idx ON public.equipamento_requer_aptidao USING btree (id_raca);


--
-- Name: ganha_item_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ganha_item_id_interacao_idx ON public.ganha_item USING btree (id_interacao);


--
-- Name: ganha_item_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ganha_item_id_item_idx ON public.ganha_item USING btree (id_item);


--
-- Name: habilidade_jogador_id_habilidade_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX habilidade_jogador_id_habilidade_idx ON public.habilidade_jogador USING btree (id_habilidade);


--
-- Name: habilidade_jogador_id_jogador_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX habilidade_jogador_id_jogador_idx ON public.habilidade_jogador USING btree (id_jogador);


--
-- Name: jogavel_id_inventario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jogavel_id_inventario_idx ON public.jogavel USING btree (id_inventario);


--
-- Name: jogavel_id_jogavel_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jogavel_id_jogavel_idx ON public.jogavel USING btree (id_jogavel);


--
-- Name: moeda_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moeda_id_item_idx ON public.moeda USING btree (id_item);


--
-- Name: moeda_id_moeda_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moeda_id_moeda_idx ON public.moeda USING btree (id_moeda);


--
-- Name: nao_jogavel_id_nao_jogavel_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nao_jogavel_id_nao_jogavel_idx ON public.nao_jogavel USING btree (id_nao_jogavel);


--
-- Name: personagem_id_aptidao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_aptidao_idx ON public.personagem USING btree (id_aptidao);


--
-- Name: personagem_id_atributo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_atributo_idx ON public.personagem USING btree (id_atributo);


--
-- Name: personagem_id_classe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_classe_idx ON public.personagem USING btree (id_classe);


--
-- Name: personagem_id_raca_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_raca_idx ON public.personagem USING btree (id_raca);


--
-- Name: realiza_interacao_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_interacao_idx ON public.realiza_interacao USING btree (id_interacao);


--
-- Name: realiza_interacao_id_persongem_efetua_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_persongem_efetua_idx ON public.realiza_interacao USING btree (id_persongem_efetua);


--
-- Name: realiza_interacao_id_persongem_efetuado_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_persongem_efetuado_idx ON public.realiza_interacao USING btree (id_persongem_efetuado);


--
-- Name: recebe_item_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recebe_item_id_interacao_idx ON public.recebe_item USING btree (id_interacao);


--
-- Name: recebe_item_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recebe_item_id_item_idx ON public.recebe_item USING btree (id_item);


--
-- Name: troca_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX troca_id_interacao_idx ON public.troca USING btree (id_interacao);


--
-- Name: variedades_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX variedades_id_item_idx ON public.variedades USING btree (id_item);


--
-- Name: armadura fk_armadura__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armadura
    ADD CONSTRAINT fk_armadura__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: armamento fk_armamento__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armamento
    ADD CONSTRAINT fk_armamento__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: armazena fk_armazena__id_inventario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazena
    ADD CONSTRAINT fk_armazena__id_inventario FOREIGN KEY (id_inventario) REFERENCES public.inventario(id_inventario);


--
-- Name: armazena fk_armazena__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazena
    ADD CONSTRAINT fk_armazena__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: combate fk_combate__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: comunicacao fk_comunicacao__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunicacao
    ADD CONSTRAINT fk_comunicacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: consumivel_ofensivo fk_consumivel_ofensivo__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumivel_ofensivo
    ADD CONSTRAINT fk_consumivel_ofensivo__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: consumivel_suporte fk_consumivel_suporte__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumivel_suporte
    ADD CONSTRAINT fk_consumivel_suporte__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_aptidao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_raca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);


--
-- Name: ganha_item fk_ganha_item__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ganha_item
    ADD CONSTRAINT fk_ganha_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: ganha_item fk_ganha_item__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ganha_item
    ADD CONSTRAINT fk_ganha_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: habilidade_jogador fk_habilidade_jogador__id_habilidade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade_jogador
    ADD CONSTRAINT fk_habilidade_jogador__id_habilidade FOREIGN KEY (id_habilidade) REFERENCES public.habilidade(id_habilidade);


--
-- Name: habilidade_jogador fk_habilidade_jogador__id_jogador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade_jogador
    ADD CONSTRAINT fk_habilidade_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_personagem);


--
-- Name: jogavel fk_jogavel__id_jogavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogavel
    ADD CONSTRAINT fk_jogavel__id_jogavel FOREIGN KEY (id_jogavel) REFERENCES public.personagem(id_personagem);


--
-- Name: moeda fk_moeda__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moeda
    ADD CONSTRAINT fk_moeda__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: moeda fk_moeda__id_moeda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moeda
    ADD CONSTRAINT fk_moeda__id_moeda FOREIGN KEY (id_moeda) REFERENCES public.tipo_moeda(id_moeda);


--
-- Name: nao_jogavel fk_nao_jogavel__id_nao_jogavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nao_jogavel
    ADD CONSTRAINT fk_nao_jogavel__id_nao_jogavel FOREIGN KEY (id_nao_jogavel) REFERENCES public.personagem(id_personagem);


--
-- Name: personagem fk_personagem__id_aptidao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);


--
-- Name: personagem fk_personagem__id_atributo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);


--
-- Name: personagem fk_personagem__id_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);


--
-- Name: personagem fk_personagem__id_raca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);


--
-- Name: realiza_interacao fk_realiza_interacao__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: realiza_interacao fk_realiza_interacao__id_persongem_efetua; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_persongem_efetua FOREIGN KEY (id_persongem_efetua) REFERENCES public.personagem(id_personagem);


--
-- Name: realiza_interacao fk_realiza_interacao__id_persongem_efetuado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_persongem_efetuado FOREIGN KEY (id_persongem_efetuado) REFERENCES public.personagem(id_personagem);


--
-- Name: recebe_item fk_recebe_item__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recebe_item
    ADD CONSTRAINT fk_recebe_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: recebe_item fk_recebe_item__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recebe_item
    ADD CONSTRAINT fk_recebe_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: troca fk_troca__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.troca
    ADD CONSTRAINT fk_troca__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: variedades fk_variedades__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variedades
    ADD CONSTRAINT fk_variedades__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aptidoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aptidoes (
    id_aptidao integer NOT NULL,
    determinacao integer NOT NULL,
    carisma integer NOT NULL,
    forca integer NOT NULL,
    constituicao integer NOT NULL,
    destreza integer NOT NULL,
    agilidade integer NOT NULL,
    inteligencia integer NOT NULL,
    percepcao integer NOT NULL
);


ALTER TABLE public.aptidoes OWNER TO postgres;

--
-- Name: armadura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armadura (
    id_item integer NOT NULL,
    bonus_defesa integer NOT NULL,
    material character varying(150) NOT NULL,
    durabilidade integer NOT NULL
);


ALTER TABLE public.armadura OWNER TO postgres;

--
-- Name: armamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armamento (
    id_item integer NOT NULL,
    tipo character varying(150) NOT NULL,
    bonus_armamento integer NOT NULL,
    material character varying(150) NOT NULL,
    durabilidade integer NOT NULL
);


ALTER TABLE public.armamento OWNER TO postgres;

--
-- Name: armazena; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armazena (
    id_item integer NOT NULL,
    id_inventario integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE public.armazena OWNER TO postgres;

--
-- Name: atributo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atributo (
    id_atributo integer NOT NULL,
    pontos integer NOT NULL,
    defesa integer NOT NULL,
    ataque integer NOT NULL,
    vida integer NOT NULL,
    mana integer NOT NULL,
    vigor integer NOT NULL
);


ALTER TABLE public.atributo OWNER TO postgres;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe (
    id_classe integer NOT NULL,
    tipo character varying(150) NOT NULL,
    descricao character varying(300) NOT NULL,
    bonus_de_classe integer NOT NULL
);


ALTER TABLE public.classe OWNER TO postgres;

--
-- Name: combate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combate (
    id_interacao integer NOT NULL
);


ALTER TABLE public.combate OWNER TO postgres;

--
-- Name: comunicacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comunicacao (
    id_interacao integer NOT NULL,
    mensagem character varying(500) NOT NULL
);


ALTER TABLE public.comunicacao OWNER TO postgres;

--
-- Name: consumivel_ofensivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumivel_ofensivo (
    id_item integer NOT NULL,
    dano integer NOT NULL,
    tipo_dano character varying(50) NOT NULL,
    duracao timestamp without time zone NOT NULL
);


ALTER TABLE public.consumivel_ofensivo OWNER TO postgres;

--
-- Name: consumivel_suporte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumivel_suporte (
    id_item integer NOT NULL,
    buff integer,
    debuff integer,
    descricao_buf character varying(200),
    descricao_debuff character varying(200),
    duracao timestamp without time zone NOT NULL
);


ALTER TABLE public.consumivel_suporte OWNER TO postgres;

--
-- Name: equipamento_requer_aptidao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamento_requer_aptidao (
    id_aptidao integer NOT NULL,
    id_equipamento integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.equipamento_requer_aptidao OWNER TO postgres;

--
-- Name: ganha_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ganha_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.ganha_item OWNER TO postgres;

--
-- Name: habilidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidade (
    id_habilidade integer NOT NULL,
    tipo character varying(150) NOT NULL,
    tempo_recarga integer NOT NULL,
    descricao character varying(300) NOT NULL,
    duracao integer NOT NULL,
    tempo_ativacao integer NOT NULL,
    ponto integer NOT NULL
);


ALTER TABLE public.habilidade OWNER TO postgres;

--
-- Name: habilidade_jogador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidade_jogador (
    id_habilidade integer NOT NULL,
    id_jogador integer NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.habilidade_jogador OWNER TO postgres;

--
-- Name: interacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interacao (
    id_interacao integer NOT NULL,
    local character varying(200) NOT NULL,
    data timestamp with time zone NOT NULL
);


ALTER TABLE public.interacao OWNER TO postgres;

--
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    capacidade_atual integer NOT NULL,
    capacidade_max integer NOT NULL
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id_item integer NOT NULL,
    valor integer NOT NULL,
    raridade integer NOT NULL,
    descricao character varying(300) NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: jogavel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogavel (
    id_jogavel integer NOT NULL,
    id_inventario integer NOT NULL,
    nickname character varying(20) NOT NULL
);


ALTER TABLE public.jogavel OWNER TO postgres;

--
-- Name: moeda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moeda (
    id_item integer NOT NULL,
    id_moeda integer NOT NULL
);


ALTER TABLE public.moeda OWNER TO postgres;

--
-- Name: nao_jogavel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nao_jogavel (
    id_nao_jogavel integer NOT NULL,
    afinidade integer NOT NULL,
    tipo character varying(150) NOT NULL,
    acrescimo_experiencia integer NOT NULL
);


ALTER TABLE public.nao_jogavel OWNER TO postgres;

--
-- Name: personagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personagem (
    id_personagem integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    id_atributo integer NOT NULL,
    id_aptidao integer NOT NULL,
    nome character varying(150) NOT NULL,
    genero character varying(150) NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.personagem OWNER TO postgres;

--
-- Name: raca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raca (
    id_raca integer NOT NULL,
    tipo character varying(150) NOT NULL,
    descricao character varying(300) NOT NULL,
    bonus_de_raca integer NOT NULL,
    alinhamento character varying NOT NULL
);


ALTER TABLE public.raca OWNER TO postgres;

--
-- Name: realiza_interacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realiza_interacao (
    id_persongem_efetua integer NOT NULL,
    id_persongem_efetuado integer NOT NULL,
    id_interacao integer NOT NULL
);


ALTER TABLE public.realiza_interacao OWNER TO postgres;

--
-- Name: recebe_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recebe_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.recebe_item OWNER TO postgres;

--
-- Name: tipo_moeda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_moeda (
    id_moeda integer NOT NULL,
    minerio character varying(200) NOT NULL
);


ALTER TABLE public.tipo_moeda OWNER TO postgres;

--
-- Name: troca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.troca (
    id_interacao integer NOT NULL
);


ALTER TABLE public.troca OWNER TO postgres;

--
-- Name: variedades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variedades (
    id_item integer NOT NULL,
    nome character varying(150) NOT NULL
);


ALTER TABLE public.variedades OWNER TO postgres;

--
-- Data for Name: aptidoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aptidoes (id_aptidao, determinacao, carisma, forca, constituicao, destreza, agilidade, inteligencia, percepcao) FROM stdin;
1	100	100	400	200	300	500	100	410
2	300	70	100	220	360	700	130	440
3	400	130	220	270	380	100	210	100
4	700	170	530	190	410	130	320	110
5	250	110	760	150	517	220	330	215
\.


--
-- Data for Name: armadura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armadura (id_item, bonus_defesa, material, durabilidade) FROM stdin;
1	100	Vibranio	200
2	50	Ferro	50
3	90	Couro	15
4	80	Ferro elfico	700
5	200	Aço	500
\.


--
-- Data for Name: armamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armamento (id_item, tipo, bonus_armamento, material, durabilidade) FROM stdin;
1	Espada	100	Ferro	80
2	Arco e flecha	50	Madeira	120
3	Cajado	910	Vibranio	900
4	Machado	200	Cobre	700
5	Besta	15	Madeira	700
\.


--
-- Data for Name: armazena; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armazena (id_item, id_inventario, quantidade) FROM stdin;
1	1	5
2	2	6
3	3	1
4	4	2
5	5	1
\.


--
-- Data for Name: atributo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atributo (id_atributo, pontos, defesa, ataque, vida, mana, vigor) FROM stdin;
1	15	200	7000	5000	14000	100
2	27	300	9000	56000	3000	150
3	12	400	4000	29000	76000	120
4	66	500	2700	7400	54000	370
5	78	600	10000	2100	100	410
\.


--
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classe (id_classe, tipo, descricao, bonus_de_classe) FROM stdin;
1	Lutador	Um mestre do combate marcial, hábil com uma variedade de armas e armaduras	10
2	Barbaro	Um guerreiro feroz de origem primitiva que pode entrar em uma batalha furiosa	27
3	Druida	Um sacerdote da Velha Fé, exercendo os poderes da natureza e adotando formas animais	55
4	Paladino	A holy warrior bound to a sacred oath	32
5	Mago	Um usuário de magia erudito capaz de manipular as estruturas da realidade.	98
\.


--
-- Data for Name: combate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combate (id_interacao) FROM stdin;
1
2
3
4
5
\.


--
-- Data for Name: comunicacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comunicacao (id_interacao, mensagem) FROM stdin;
1	Bom dia
2	Vamos atacar
3	Me buffa rápido
4	Vamos farma
5	Bora x1?
\.


--
-- Data for Name: consumivel_ofensivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumivel_ofensivo (id_item, dano, tipo_dano, duracao) FROM stdin;
\.


--
-- Data for Name: consumivel_suporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumivel_suporte (id_item, buff, debuff, descricao_buf, descricao_debuff, duracao) FROM stdin;
\.


--
-- Data for Name: equipamento_requer_aptidao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamento_requer_aptidao (id_aptidao, id_equipamento, id_raca, id_classe, nivel) FROM stdin;
1	1	1	1	100
2	2	2	2	50
3	3	3	3	80
4	4	4	4	90
5	5	5	5	120
\.


--
-- Data for Name: ganha_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ganha_item (id_interacao, id_item) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: habilidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidade (id_habilidade, tipo, tempo_recarga, descricao, duracao, tempo_ativacao, ponto) FROM stdin;
1	Kage bunshin no jutsu	10	Cria um clone do personagem, que o ajuda durante a luta.	15	3	100
2	Bola de fogo no jutsu	5	Solta uma bola de fogo em direção ao inimigo.	5	3	200
3	suiton no jutsu	8	Solta um jato dágua em direção ao inimigo.	10	3	150
4	kamehameha	12	Solta um poderoso raio de energia em direção ao inimigo.	10	3	200
5	expelliarmus	25	Solta uma bola de energia em direção ao inimigo que o desarma.	10	3	70
\.


--
-- Data for Name: habilidade_jogador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidade_jogador (id_habilidade, id_jogador, nivel) FROM stdin;
1	1	100
2	2	50
3	3	120
4	4	200
5	5	110
\.


--
-- Data for Name: interacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interacao (id_interacao, local, data) FROM stdin;
1	Armia	2010-08-29 00:00:00-03
2	Arzan	2010-04-10 00:00:00-03
3	Nipplehein	2004-07-04 00:00:00-03
4	Noatum	2002-04-02 00:00:00-03
5	Erion	2001-01-10 00:00:00-02
\.


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (id_inventario, capacidade_atual, capacidade_max) FROM stdin;
1	10	100
2	70	320
3	230	750
4	2	30
5	670	800
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (id_item, valor, raridade, descricao) FROM stdin;
1	10	1	Botas de couro, aumentam a velocidade em 10%
2	50	2	Colar de  safira, protege contra danos causados por fogo.
3	200	3	Mjolnir o martelo de Thor destruirá seus inimigos causando danos de raio.
4	310	4	Armadura lendária do dragão celestial, aumenta defesa em 300%, vitalidade em 200%, resistencia a venenos 100%.
5	720	5	Lamina infernal de Ifrit, esta poderosa lamina \n forjada com o corpo de Ifrid queimara seus inimigo até a morte.
\.


--
-- Data for Name: jogavel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogavel (id_jogavel, id_inventario, nickname) FROM stdin;
1	1	venom extreme
2	2	ziliombrom
3	3	abigail
4	4	bobafelps
5	5	buenoGameplay2469
\.


--
-- Data for Name: moeda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moeda (id_item, id_moeda) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: nao_jogavel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nao_jogavel (id_nao_jogavel, afinidade, tipo, acrescimo_experiencia) FROM stdin;
1	70	Artesão	100
2	90	Dragão guerreiro	900
3	3	Npc	20
4	4	Zumbi	100
5	5	Ifrid	10000
\.


--
-- Data for Name: personagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personagem (id_personagem, id_raca, id_classe, id_atributo, id_aptidao, nome, genero, nivel) FROM stdin;
1	1	1	1	1	buenoGameplay321	Masculino	100
2	2	2	2	2	ziliombrom	Feminino	4000
3	3	3	3	3	bobafelps	Masculino	50
4	4	4	4	4	dragonSlayer69	Masculino	300
5	5	5	5	5	gustavo_matador_de_porco	Masculino	150
\.


--
-- Data for Name: raca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raca (id_raca, tipo, descricao, bonus_de_raca, alinhamento) FROM stdin;
1	Humano	Os humanos são as pessoas mais adaptáveis ​​e ambiciosas entre as raças comuns	20	Neutro e Bom
2	Elfo	Elfos são um povo mágico de graça sobrenatural, vivendo no mundo, mas não totalmente parte dele.	10	Caótico e Bom
3	Orc	Orcs vivem uma vida onde não há lugar para fraquezas, e todo guerreiro deve ser forte o suficiente para pegar o que é necessário à força.	90	Ordeiro e Mau
4	Gnome	A energia e o entusiasmo de um gnomo pela vida brilham em cada centímetro de seu minúsculo corpo.	30	Ordeiro e Mau
5	Goliath	Strong and reclusive, every day brings a new challenge to a goliath.	200	Neutro e Mau
\.


--
-- Data for Name: realiza_interacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realiza_interacao (id_persongem_efetua, id_persongem_efetuado, id_interacao) FROM stdin;
1	2	1
2	3	5
3	4	2
4	1	3
5	2	4
\.


--
-- Data for Name: recebe_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recebe_item (id_interacao, id_item) FROM stdin;
1	2
2	3
3	4
4	5
5	1
\.


--
-- Data for Name: tipo_moeda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_moeda (id_moeda, minerio) FROM stdin;
1	Cobre
2	Bronze
3	Ouro
4	Prata
5	quarto
\.


--
-- Data for Name: troca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.troca (id_interacao) FROM stdin;
1
2
3
4
5
\.


--
-- Data for Name: variedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variedades (id_item, nome) FROM stdin;
1	Botas de couro
2	Colasr de safira
3	Mjolnir
4	Armadura lendária do dragão celestial
5	Lamina infernal de Ifrit
\.


--
-- Name: aptidoes aptidoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aptidoes
    ADD CONSTRAINT aptidoes_pkey PRIMARY KEY (id_aptidao);


--
-- Name: atributo atributo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atributo
    ADD CONSTRAINT atributo_pkey PRIMARY KEY (id_atributo);


--
-- Name: classe classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_pkey PRIMARY KEY (id_classe);


--
-- Name: habilidade habilidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade
    ADD CONSTRAINT habilidade_pkey PRIMARY KEY (id_habilidade);


--
-- Name: interacao interacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacao
    ADD CONSTRAINT interacao_pkey PRIMARY KEY (id_interacao);


--
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_inventario);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id_item);


--
-- Name: jogavel jogavel_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogavel
    ADD CONSTRAINT jogavel_nickname_key UNIQUE (nickname);


--
-- Name: personagem personagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT personagem_pkey PRIMARY KEY (id_personagem);


--
-- Name: raca raca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raca
    ADD CONSTRAINT raca_pkey PRIMARY KEY (id_raca);


--
-- Name: tipo_moeda tipo_moeda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_moeda
    ADD CONSTRAINT tipo_moeda_pkey PRIMARY KEY (id_moeda);


--
-- Name: armadura_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armadura_id_item_idx ON public.armadura USING btree (id_item);


--
-- Name: armamento_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armamento_id_item_idx ON public.armamento USING btree (id_item);


--
-- Name: armazena_id_inventario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armazena_id_inventario_idx ON public.armazena USING btree (id_inventario);


--
-- Name: armazena_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armazena_id_item_idx ON public.armazena USING btree (id_item);


--
-- Name: combate_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX combate_id_interacao_idx ON public.combate USING btree (id_interacao);


--
-- Name: comunicacao_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comunicacao_id_interacao_idx ON public.comunicacao USING btree (id_interacao);


--
-- Name: consumivel_ofensivo_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumivel_ofensivo_id_item_idx ON public.consumivel_ofensivo USING btree (id_item);


--
-- Name: consumivel_suporte_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumivel_suporte_id_item_idx ON public.consumivel_suporte USING btree (id_item);


--
-- Name: equipamento_requer_aptidao_id_aptidao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_aptidao_idx ON public.equipamento_requer_aptidao USING btree (id_aptidao);


--
-- Name: equipamento_requer_aptidao_id_classe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_classe_idx ON public.equipamento_requer_aptidao USING btree (id_classe);


--
-- Name: equipamento_requer_aptidao_id_equipamento_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_equipamento_idx ON public.equipamento_requer_aptidao USING btree (id_equipamento);


--
-- Name: equipamento_requer_aptidao_id_raca_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_raca_idx ON public.equipamento_requer_aptidao USING btree (id_raca);


--
-- Name: ganha_item_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ganha_item_id_interacao_idx ON public.ganha_item USING btree (id_interacao);


--
-- Name: ganha_item_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ganha_item_id_item_idx ON public.ganha_item USING btree (id_item);


--
-- Name: habilidade_jogador_id_habilidade_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX habilidade_jogador_id_habilidade_idx ON public.habilidade_jogador USING btree (id_habilidade);


--
-- Name: habilidade_jogador_id_jogador_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX habilidade_jogador_id_jogador_idx ON public.habilidade_jogador USING btree (id_jogador);


--
-- Name: jogavel_id_inventario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jogavel_id_inventario_idx ON public.jogavel USING btree (id_inventario);


--
-- Name: jogavel_id_jogavel_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jogavel_id_jogavel_idx ON public.jogavel USING btree (id_jogavel);


--
-- Name: moeda_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moeda_id_item_idx ON public.moeda USING btree (id_item);


--
-- Name: moeda_id_moeda_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moeda_id_moeda_idx ON public.moeda USING btree (id_moeda);


--
-- Name: nao_jogavel_id_nao_jogavel_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nao_jogavel_id_nao_jogavel_idx ON public.nao_jogavel USING btree (id_nao_jogavel);


--
-- Name: personagem_id_aptidao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_aptidao_idx ON public.personagem USING btree (id_aptidao);


--
-- Name: personagem_id_atributo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_atributo_idx ON public.personagem USING btree (id_atributo);


--
-- Name: personagem_id_classe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_classe_idx ON public.personagem USING btree (id_classe);


--
-- Name: personagem_id_raca_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_raca_idx ON public.personagem USING btree (id_raca);


--
-- Name: realiza_interacao_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_interacao_idx ON public.realiza_interacao USING btree (id_interacao);


--
-- Name: realiza_interacao_id_persongem_efetua_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_persongem_efetua_idx ON public.realiza_interacao USING btree (id_persongem_efetua);


--
-- Name: realiza_interacao_id_persongem_efetuado_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_persongem_efetuado_idx ON public.realiza_interacao USING btree (id_persongem_efetuado);


--
-- Name: recebe_item_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recebe_item_id_interacao_idx ON public.recebe_item USING btree (id_interacao);


--
-- Name: recebe_item_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recebe_item_id_item_idx ON public.recebe_item USING btree (id_item);


--
-- Name: troca_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX troca_id_interacao_idx ON public.troca USING btree (id_interacao);


--
-- Name: variedades_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX variedades_id_item_idx ON public.variedades USING btree (id_item);


--
-- Name: armadura fk_armadura__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armadura
    ADD CONSTRAINT fk_armadura__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: armamento fk_armamento__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armamento
    ADD CONSTRAINT fk_armamento__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: armazena fk_armazena__id_inventario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazena
    ADD CONSTRAINT fk_armazena__id_inventario FOREIGN KEY (id_inventario) REFERENCES public.inventario(id_inventario);


--
-- Name: armazena fk_armazena__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazena
    ADD CONSTRAINT fk_armazena__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: combate fk_combate__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: comunicacao fk_comunicacao__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunicacao
    ADD CONSTRAINT fk_comunicacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: consumivel_ofensivo fk_consumivel_ofensivo__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumivel_ofensivo
    ADD CONSTRAINT fk_consumivel_ofensivo__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: consumivel_suporte fk_consumivel_suporte__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumivel_suporte
    ADD CONSTRAINT fk_consumivel_suporte__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_aptidao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_raca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);


--
-- Name: ganha_item fk_ganha_item__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ganha_item
    ADD CONSTRAINT fk_ganha_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: ganha_item fk_ganha_item__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ganha_item
    ADD CONSTRAINT fk_ganha_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: habilidade_jogador fk_habilidade_jogador__id_habilidade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade_jogador
    ADD CONSTRAINT fk_habilidade_jogador__id_habilidade FOREIGN KEY (id_habilidade) REFERENCES public.habilidade(id_habilidade);


--
-- Name: habilidade_jogador fk_habilidade_jogador__id_jogador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade_jogador
    ADD CONSTRAINT fk_habilidade_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_personagem);


--
-- Name: jogavel fk_jogavel__id_jogavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogavel
    ADD CONSTRAINT fk_jogavel__id_jogavel FOREIGN KEY (id_jogavel) REFERENCES public.personagem(id_personagem);


--
-- Name: moeda fk_moeda__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moeda
    ADD CONSTRAINT fk_moeda__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: moeda fk_moeda__id_moeda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moeda
    ADD CONSTRAINT fk_moeda__id_moeda FOREIGN KEY (id_moeda) REFERENCES public.tipo_moeda(id_moeda);


--
-- Name: nao_jogavel fk_nao_jogavel__id_nao_jogavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nao_jogavel
    ADD CONSTRAINT fk_nao_jogavel__id_nao_jogavel FOREIGN KEY (id_nao_jogavel) REFERENCES public.personagem(id_personagem);


--
-- Name: personagem fk_personagem__id_aptidao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);


--
-- Name: personagem fk_personagem__id_atributo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);


--
-- Name: personagem fk_personagem__id_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);


--
-- Name: personagem fk_personagem__id_raca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);


--
-- Name: realiza_interacao fk_realiza_interacao__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: realiza_interacao fk_realiza_interacao__id_persongem_efetua; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_persongem_efetua FOREIGN KEY (id_persongem_efetua) REFERENCES public.personagem(id_personagem);


--
-- Name: realiza_interacao fk_realiza_interacao__id_persongem_efetuado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_persongem_efetuado FOREIGN KEY (id_persongem_efetuado) REFERENCES public.personagem(id_personagem);


--
-- Name: recebe_item fk_recebe_item__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recebe_item
    ADD CONSTRAINT fk_recebe_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: recebe_item fk_recebe_item__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recebe_item
    ADD CONSTRAINT fk_recebe_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: troca fk_troca__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.troca
    ADD CONSTRAINT fk_troca__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: variedades fk_variedades__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variedades
    ADD CONSTRAINT fk_variedades__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)
-- Dumped by pg_dump version 13.3 (Ubuntu 13.3-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: aptidoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aptidoes (
    id_aptidao integer NOT NULL,
    determinacao integer NOT NULL,
    carisma integer NOT NULL,
    forca integer NOT NULL,
    constituicao integer NOT NULL,
    destreza integer NOT NULL,
    agilidade integer NOT NULL,
    inteligencia integer NOT NULL,
    percepcao integer NOT NULL
);


ALTER TABLE public.aptidoes OWNER TO postgres;

--
-- Name: armadura; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armadura (
    id_item integer NOT NULL,
    bonus_defesa integer NOT NULL,
    material character varying(150) NOT NULL,
    durabilidade integer NOT NULL
);


ALTER TABLE public.armadura OWNER TO postgres;

--
-- Name: armamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armamento (
    id_item integer NOT NULL,
    tipo character varying(150) NOT NULL,
    bonus_armamento integer NOT NULL,
    material character varying(150) NOT NULL,
    durabilidade integer NOT NULL
);


ALTER TABLE public.armamento OWNER TO postgres;

--
-- Name: armazena; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.armazena (
    id_item integer NOT NULL,
    id_inventario integer NOT NULL,
    quantidade integer NOT NULL
);


ALTER TABLE public.armazena OWNER TO postgres;

--
-- Name: atributo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.atributo (
    id_atributo integer NOT NULL,
    pontos integer NOT NULL,
    defesa integer NOT NULL,
    ataque integer NOT NULL,
    vida integer NOT NULL,
    mana integer NOT NULL,
    vigor integer NOT NULL
);


ALTER TABLE public.atributo OWNER TO postgres;

--
-- Name: classe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classe (
    id_classe integer NOT NULL,
    tipo character varying(150) NOT NULL,
    descricao character varying(300) NOT NULL,
    bonus_de_classe integer NOT NULL
);


ALTER TABLE public.classe OWNER TO postgres;

--
-- Name: combate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combate (
    id_interacao integer NOT NULL
);


ALTER TABLE public.combate OWNER TO postgres;

--
-- Name: comunicacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comunicacao (
    id_interacao integer NOT NULL,
    mensagem character varying(500) NOT NULL
);


ALTER TABLE public.comunicacao OWNER TO postgres;

--
-- Name: consumivel_ofensivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumivel_ofensivo (
    id_item integer NOT NULL,
    dano integer NOT NULL,
    tipo_dano character varying(50) NOT NULL,
    duracao timestamp without time zone NOT NULL
);


ALTER TABLE public.consumivel_ofensivo OWNER TO postgres;

--
-- Name: consumivel_suporte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consumivel_suporte (
    id_item integer NOT NULL,
    buff integer,
    debuff integer,
    descricao_buf character varying(200),
    descricao_debuff character varying(200),
    duracao timestamp without time zone NOT NULL
);


ALTER TABLE public.consumivel_suporte OWNER TO postgres;

--
-- Name: equipamento_requer_aptidao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.equipamento_requer_aptidao (
    id_aptidao integer NOT NULL,
    id_equipamento integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.equipamento_requer_aptidao OWNER TO postgres;

--
-- Name: ganha_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ganha_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.ganha_item OWNER TO postgres;

--
-- Name: habilidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidade (
    id_habilidade integer NOT NULL,
    tipo character varying(150) NOT NULL,
    tempo_recarga integer NOT NULL,
    descricao character varying(300) NOT NULL,
    duracao integer NOT NULL,
    tempo_ativacao integer NOT NULL,
    ponto integer NOT NULL
);


ALTER TABLE public.habilidade OWNER TO postgres;

--
-- Name: habilidade_jogador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.habilidade_jogador (
    id_habilidade integer NOT NULL,
    id_jogador integer NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.habilidade_jogador OWNER TO postgres;

--
-- Name: interacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.interacao (
    id_interacao integer NOT NULL,
    local character varying(200) NOT NULL,
    data timestamp with time zone NOT NULL
);


ALTER TABLE public.interacao OWNER TO postgres;

--
-- Name: inventario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    capacidade_atual integer NOT NULL,
    capacidade_max integer NOT NULL
);


ALTER TABLE public.inventario OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id_item integer NOT NULL,
    valor integer NOT NULL,
    raridade integer NOT NULL,
    descricao character varying(300) NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: jogavel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jogavel (
    id_jogavel integer NOT NULL,
    id_inventario integer NOT NULL,
    nickname character varying(20) NOT NULL
);


ALTER TABLE public.jogavel OWNER TO postgres;

--
-- Name: moeda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moeda (
    id_item integer NOT NULL,
    id_moeda integer NOT NULL
);


ALTER TABLE public.moeda OWNER TO postgres;

--
-- Name: nao_jogavel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nao_jogavel (
    id_nao_jogavel integer NOT NULL,
    afinidade integer NOT NULL,
    tipo character varying(150) NOT NULL,
    acrescimo_experiencia integer NOT NULL
);


ALTER TABLE public.nao_jogavel OWNER TO postgres;

--
-- Name: personagem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personagem (
    id_personagem integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    id_atributo integer NOT NULL,
    id_aptidao integer NOT NULL,
    nome character varying(150) NOT NULL,
    genero character varying(150) NOT NULL,
    nivel integer NOT NULL
);


ALTER TABLE public.personagem OWNER TO postgres;

--
-- Name: raca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.raca (
    id_raca integer NOT NULL,
    tipo character varying(150) NOT NULL,
    descricao character varying(300) NOT NULL,
    bonus_de_raca integer NOT NULL,
    alinhamento character varying NOT NULL
);


ALTER TABLE public.raca OWNER TO postgres;

--
-- Name: realiza_interacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realiza_interacao (
    id_persongem_efetua integer NOT NULL,
    id_persongem_efetuado integer NOT NULL,
    id_interacao integer NOT NULL
);


ALTER TABLE public.realiza_interacao OWNER TO postgres;

--
-- Name: recebe_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recebe_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);


ALTER TABLE public.recebe_item OWNER TO postgres;

--
-- Name: tipo_moeda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_moeda (
    id_moeda integer NOT NULL,
    minerio character varying(200) NOT NULL
);


ALTER TABLE public.tipo_moeda OWNER TO postgres;

--
-- Name: troca; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.troca (
    id_interacao integer NOT NULL
);


ALTER TABLE public.troca OWNER TO postgres;

--
-- Name: variedades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.variedades (
    id_item integer NOT NULL,
    nome character varying(150) NOT NULL
);


ALTER TABLE public.variedades OWNER TO postgres;

--
-- Data for Name: aptidoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aptidoes (id_aptidao, determinacao, carisma, forca, constituicao, destreza, agilidade, inteligencia, percepcao) FROM stdin;
1	100	100	400	200	300	500	100	410
2	300	70	100	220	360	700	130	440
3	400	130	220	270	380	100	210	100
4	700	170	530	190	410	130	320	110
5	250	110	760	150	517	220	330	215
\.


--
-- Data for Name: armadura; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armadura (id_item, bonus_defesa, material, durabilidade) FROM stdin;
1	100	Vibranio	200
2	50	Ferro	50
3	90	Couro	15
4	80	Ferro elfico	700
5	200	Aço	500
\.


--
-- Data for Name: armamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armamento (id_item, tipo, bonus_armamento, material, durabilidade) FROM stdin;
1	Espada	100	Ferro	80
2	Arco e flecha	50	Madeira	120
3	Cajado	910	Vibranio	900
4	Machado	200	Cobre	700
5	Besta	15	Madeira	700
\.


--
-- Data for Name: armazena; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.armazena (id_item, id_inventario, quantidade) FROM stdin;
1	1	5
2	2	6
3	3	1
4	4	2
5	5	1
\.


--
-- Data for Name: atributo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.atributo (id_atributo, pontos, defesa, ataque, vida, mana, vigor) FROM stdin;
1	15	200	7000	5000	14000	100
2	27	300	9000	56000	3000	150
3	12	400	4000	29000	76000	120
4	66	500	2700	7400	54000	370
5	78	600	10000	2100	100	410
\.


--
-- Data for Name: classe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classe (id_classe, tipo, descricao, bonus_de_classe) FROM stdin;
1	Lutador	Um mestre do combate marcial, hábil com uma variedade de armas e armaduras	10
2	Barbaro	Um guerreiro feroz de origem primitiva que pode entrar em uma batalha furiosa	27
3	Druida	Um sacerdote da Velha Fé, exercendo os poderes da natureza e adotando formas animais	55
4	Paladino	A holy warrior bound to a sacred oath	32
5	Mago	Um usuário de magia erudito capaz de manipular as estruturas da realidade.	98
\.


--
-- Data for Name: combate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combate (id_interacao) FROM stdin;
1
2
3
4
5
\.


--
-- Data for Name: comunicacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comunicacao (id_interacao, mensagem) FROM stdin;
1	Bom dia
2	Vamos atacar
3	Me buffa rápido
4	Vamos farma
5	Bora x1?
\.


--
-- Data for Name: consumivel_ofensivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumivel_ofensivo (id_item, dano, tipo_dano, duracao) FROM stdin;
\.


--
-- Data for Name: consumivel_suporte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consumivel_suporte (id_item, buff, debuff, descricao_buf, descricao_debuff, duracao) FROM stdin;
\.


--
-- Data for Name: equipamento_requer_aptidao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.equipamento_requer_aptidao (id_aptidao, id_equipamento, id_raca, id_classe, nivel) FROM stdin;
1	1	1	1	100
2	2	2	2	50
3	3	3	3	80
4	4	4	4	90
5	5	5	5	120
\.


--
-- Data for Name: ganha_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ganha_item (id_interacao, id_item) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: habilidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidade (id_habilidade, tipo, tempo_recarga, descricao, duracao, tempo_ativacao, ponto) FROM stdin;
1	Kage bunshin no jutsu	10	Cria um clone do personagem, que o ajuda durante a luta.	15	3	100
2	Bola de fogo no jutsu	5	Solta uma bola de fogo em direção ao inimigo.	5	3	200
3	suiton no jutsu	8	Solta um jato dágua em direção ao inimigo.	10	3	150
4	kamehameha	12	Solta um poderoso raio de energia em direção ao inimigo.	10	3	200
5	expelliarmus	25	Solta uma bola de energia em direção ao inimigo que o desarma.	10	3	70
\.


--
-- Data for Name: habilidade_jogador; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.habilidade_jogador (id_habilidade, id_jogador, nivel) FROM stdin;
1	1	100
2	2	50
3	3	120
4	4	200
5	5	110
\.


--
-- Data for Name: interacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.interacao (id_interacao, local, data) FROM stdin;
1	Armia	2010-08-29 00:00:00-03
2	Arzan	2010-04-10 00:00:00-03
3	Nipplehein	2004-07-04 00:00:00-03
4	Noatum	2002-04-02 00:00:00-03
5	Erion	2001-01-10 00:00:00-02
\.


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.inventario (id_inventario, capacidade_atual, capacidade_max) FROM stdin;
1	10	100
2	70	320
3	230	750
4	2	30
5	670	800
\.


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (id_item, valor, raridade, descricao) FROM stdin;
1	10	1	Botas de couro, aumentam a velocidade em 10%
2	50	2	Colar de  safira, protege contra danos causados por fogo.
3	200	3	Mjolnir o martelo de Thor destruirá seus inimigos causando danos de raio.
4	310	4	Armadura lendária do dragão celestial, aumenta defesa em 300%, vitalidade em 200%, resistencia a venenos 100%.
5	720	5	Lamina infernal de Ifrit, esta poderosa lamina \n forjada com o corpo de Ifrid queimara seus inimigo até a morte.
\.


--
-- Data for Name: jogavel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jogavel (id_jogavel, id_inventario, nickname) FROM stdin;
1	1	venom extreme
2	2	ziliombrom
3	3	abigail
4	4	bobafelps
5	5	buenoGameplay2469
\.


--
-- Data for Name: moeda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moeda (id_item, id_moeda) FROM stdin;
1	1
2	2
3	3
4	4
5	5
\.


--
-- Data for Name: nao_jogavel; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nao_jogavel (id_nao_jogavel, afinidade, tipo, acrescimo_experiencia) FROM stdin;
1	70	Artesão	100
2	90	Dragão guerreiro	900
3	3	Npc	20
4	4	Zumbi	100
5	5	Ifrid	10000
\.


--
-- Data for Name: personagem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personagem (id_personagem, id_raca, id_classe, id_atributo, id_aptidao, nome, genero, nivel) FROM stdin;
1	1	1	1	1	buenoGameplay321	Masculino	100
2	2	2	2	2	ziliombrom	Feminino	4000
3	3	3	3	3	bobafelps	Masculino	50
4	4	4	4	4	dragonSlayer69	Masculino	300
5	5	5	5	5	gustavo_matador_de_porco	Masculino	150
\.


--
-- Data for Name: raca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.raca (id_raca, tipo, descricao, bonus_de_raca, alinhamento) FROM stdin;
1	Humano	Os humanos são as pessoas mais adaptáveis ​​e ambiciosas entre as raças comuns	20	Neutro e Bom
2	Elfo	Elfos são um povo mágico de graça sobrenatural, vivendo no mundo, mas não totalmente parte dele.	10	Caótico e Bom
3	Orc	Orcs vivem uma vida onde não há lugar para fraquezas, e todo guerreiro deve ser forte o suficiente para pegar o que é necessário à força.	90	Ordeiro e Mau
4	Gnome	A energia e o entusiasmo de um gnomo pela vida brilham em cada centímetro de seu minúsculo corpo.	30	Ordeiro e Mau
5	Goliath	Strong and reclusive, every day brings a new challenge to a goliath.	200	Neutro e Mau
\.


--
-- Data for Name: realiza_interacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realiza_interacao (id_persongem_efetua, id_persongem_efetuado, id_interacao) FROM stdin;
1	2	1
2	3	5
3	4	2
4	1	3
5	2	4
\.


--
-- Data for Name: recebe_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recebe_item (id_interacao, id_item) FROM stdin;
1	2
2	3
3	4
4	5
5	1
\.


--
-- Data for Name: tipo_moeda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipo_moeda (id_moeda, minerio) FROM stdin;
1	Cobre
2	Bronze
3	Ouro
4	Prata
5	quarto
\.


--
-- Data for Name: troca; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.troca (id_interacao) FROM stdin;
1
2
3
4
5
\.


--
-- Data for Name: variedades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.variedades (id_item, nome) FROM stdin;
1	Botas de couro
2	Colasr de safira
3	Mjolnir
4	Armadura lendária do dragão celestial
5	Lamina infernal de Ifrit
\.


--
-- Name: aptidoes aptidoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aptidoes
    ADD CONSTRAINT aptidoes_pkey PRIMARY KEY (id_aptidao);


--
-- Name: atributo atributo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.atributo
    ADD CONSTRAINT atributo_pkey PRIMARY KEY (id_atributo);


--
-- Name: classe classe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classe
    ADD CONSTRAINT classe_pkey PRIMARY KEY (id_classe);


--
-- Name: habilidade habilidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade
    ADD CONSTRAINT habilidade_pkey PRIMARY KEY (id_habilidade);


--
-- Name: interacao interacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.interacao
    ADD CONSTRAINT interacao_pkey PRIMARY KEY (id_interacao);


--
-- Name: inventario inventario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id_inventario);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (id_item);


--
-- Name: jogavel jogavel_nickname_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogavel
    ADD CONSTRAINT jogavel_nickname_key UNIQUE (nickname);


--
-- Name: personagem personagem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT personagem_pkey PRIMARY KEY (id_personagem);


--
-- Name: raca raca_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.raca
    ADD CONSTRAINT raca_pkey PRIMARY KEY (id_raca);


--
-- Name: tipo_moeda tipo_moeda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_moeda
    ADD CONSTRAINT tipo_moeda_pkey PRIMARY KEY (id_moeda);


--
-- Name: armadura_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armadura_id_item_idx ON public.armadura USING btree (id_item);


--
-- Name: armamento_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armamento_id_item_idx ON public.armamento USING btree (id_item);


--
-- Name: armazena_id_inventario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armazena_id_inventario_idx ON public.armazena USING btree (id_inventario);


--
-- Name: armazena_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX armazena_id_item_idx ON public.armazena USING btree (id_item);


--
-- Name: combate_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX combate_id_interacao_idx ON public.combate USING btree (id_interacao);


--
-- Name: comunicacao_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX comunicacao_id_interacao_idx ON public.comunicacao USING btree (id_interacao);


--
-- Name: consumivel_ofensivo_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumivel_ofensivo_id_item_idx ON public.consumivel_ofensivo USING btree (id_item);


--
-- Name: consumivel_suporte_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX consumivel_suporte_id_item_idx ON public.consumivel_suporte USING btree (id_item);


--
-- Name: equipamento_requer_aptidao_id_aptidao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_aptidao_idx ON public.equipamento_requer_aptidao USING btree (id_aptidao);


--
-- Name: equipamento_requer_aptidao_id_classe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_classe_idx ON public.equipamento_requer_aptidao USING btree (id_classe);


--
-- Name: equipamento_requer_aptidao_id_equipamento_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_equipamento_idx ON public.equipamento_requer_aptidao USING btree (id_equipamento);


--
-- Name: equipamento_requer_aptidao_id_raca_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX equipamento_requer_aptidao_id_raca_idx ON public.equipamento_requer_aptidao USING btree (id_raca);


--
-- Name: ganha_item_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ganha_item_id_interacao_idx ON public.ganha_item USING btree (id_interacao);


--
-- Name: ganha_item_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ganha_item_id_item_idx ON public.ganha_item USING btree (id_item);


--
-- Name: habilidade_jogador_id_habilidade_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX habilidade_jogador_id_habilidade_idx ON public.habilidade_jogador USING btree (id_habilidade);


--
-- Name: habilidade_jogador_id_jogador_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX habilidade_jogador_id_jogador_idx ON public.habilidade_jogador USING btree (id_jogador);


--
-- Name: jogavel_id_inventario_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jogavel_id_inventario_idx ON public.jogavel USING btree (id_inventario);


--
-- Name: jogavel_id_jogavel_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jogavel_id_jogavel_idx ON public.jogavel USING btree (id_jogavel);


--
-- Name: moeda_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moeda_id_item_idx ON public.moeda USING btree (id_item);


--
-- Name: moeda_id_moeda_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX moeda_id_moeda_idx ON public.moeda USING btree (id_moeda);


--
-- Name: nao_jogavel_id_nao_jogavel_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX nao_jogavel_id_nao_jogavel_idx ON public.nao_jogavel USING btree (id_nao_jogavel);


--
-- Name: personagem_id_aptidao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_aptidao_idx ON public.personagem USING btree (id_aptidao);


--
-- Name: personagem_id_atributo_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_atributo_idx ON public.personagem USING btree (id_atributo);


--
-- Name: personagem_id_classe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_classe_idx ON public.personagem USING btree (id_classe);


--
-- Name: personagem_id_raca_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX personagem_id_raca_idx ON public.personagem USING btree (id_raca);


--
-- Name: realiza_interacao_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_interacao_idx ON public.realiza_interacao USING btree (id_interacao);


--
-- Name: realiza_interacao_id_persongem_efetua_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_persongem_efetua_idx ON public.realiza_interacao USING btree (id_persongem_efetua);


--
-- Name: realiza_interacao_id_persongem_efetuado_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX realiza_interacao_id_persongem_efetuado_idx ON public.realiza_interacao USING btree (id_persongem_efetuado);


--
-- Name: recebe_item_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recebe_item_id_interacao_idx ON public.recebe_item USING btree (id_interacao);


--
-- Name: recebe_item_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX recebe_item_id_item_idx ON public.recebe_item USING btree (id_item);


--
-- Name: troca_id_interacao_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX troca_id_interacao_idx ON public.troca USING btree (id_interacao);


--
-- Name: variedades_id_item_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX variedades_id_item_idx ON public.variedades USING btree (id_item);


--
-- Name: armadura fk_armadura__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armadura
    ADD CONSTRAINT fk_armadura__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: armamento fk_armamento__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armamento
    ADD CONSTRAINT fk_armamento__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: armazena fk_armazena__id_inventario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazena
    ADD CONSTRAINT fk_armazena__id_inventario FOREIGN KEY (id_inventario) REFERENCES public.inventario(id_inventario);


--
-- Name: armazena fk_armazena__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.armazena
    ADD CONSTRAINT fk_armazena__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: combate fk_combate__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combate
    ADD CONSTRAINT fk_combate__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: comunicacao fk_comunicacao__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comunicacao
    ADD CONSTRAINT fk_comunicacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: consumivel_ofensivo fk_consumivel_ofensivo__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumivel_ofensivo
    ADD CONSTRAINT fk_consumivel_ofensivo__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: consumivel_suporte fk_consumivel_suporte__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consumivel_suporte
    ADD CONSTRAINT fk_consumivel_suporte__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_aptidao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);


--
-- Name: equipamento_requer_aptidao fk_equipamento_requer_aptidao__id_raca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.equipamento_requer_aptidao
    ADD CONSTRAINT fk_equipamento_requer_aptidao__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);


--
-- Name: ganha_item fk_ganha_item__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ganha_item
    ADD CONSTRAINT fk_ganha_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: ganha_item fk_ganha_item__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ganha_item
    ADD CONSTRAINT fk_ganha_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: habilidade_jogador fk_habilidade_jogador__id_habilidade; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade_jogador
    ADD CONSTRAINT fk_habilidade_jogador__id_habilidade FOREIGN KEY (id_habilidade) REFERENCES public.habilidade(id_habilidade);


--
-- Name: habilidade_jogador fk_habilidade_jogador__id_jogador; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.habilidade_jogador
    ADD CONSTRAINT fk_habilidade_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_personagem);


--
-- Name: jogavel fk_jogavel__id_jogavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jogavel
    ADD CONSTRAINT fk_jogavel__id_jogavel FOREIGN KEY (id_jogavel) REFERENCES public.personagem(id_personagem);


--
-- Name: moeda fk_moeda__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moeda
    ADD CONSTRAINT fk_moeda__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: moeda fk_moeda__id_moeda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moeda
    ADD CONSTRAINT fk_moeda__id_moeda FOREIGN KEY (id_moeda) REFERENCES public.tipo_moeda(id_moeda);


--
-- Name: nao_jogavel fk_nao_jogavel__id_nao_jogavel; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nao_jogavel
    ADD CONSTRAINT fk_nao_jogavel__id_nao_jogavel FOREIGN KEY (id_nao_jogavel) REFERENCES public.personagem(id_personagem);


--
-- Name: personagem fk_personagem__id_aptidao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);


--
-- Name: personagem fk_personagem__id_atributo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);


--
-- Name: personagem fk_personagem__id_classe; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);


--
-- Name: personagem fk_personagem__id_raca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personagem
    ADD CONSTRAINT fk_personagem__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);


--
-- Name: realiza_interacao fk_realiza_interacao__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: realiza_interacao fk_realiza_interacao__id_persongem_efetua; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_persongem_efetua FOREIGN KEY (id_persongem_efetua) REFERENCES public.personagem(id_personagem);


--
-- Name: realiza_interacao fk_realiza_interacao__id_persongem_efetuado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realiza_interacao
    ADD CONSTRAINT fk_realiza_interacao__id_persongem_efetuado FOREIGN KEY (id_persongem_efetuado) REFERENCES public.personagem(id_personagem);


--
-- Name: recebe_item fk_recebe_item__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recebe_item
    ADD CONSTRAINT fk_recebe_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: recebe_item fk_recebe_item__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recebe_item
    ADD CONSTRAINT fk_recebe_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- Name: troca fk_troca__id_interacao; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.troca
    ADD CONSTRAINT fk_troca__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);


--
-- Name: variedades fk_variedades__id_item; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.variedades
    ADD CONSTRAINT fk_variedades__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);


--
-- PostgreSQL database dump complete
--

