CREATE TABLE public.aptidoes (
    id_aptidao integer NOT NULL,
    determinacao integer NOT NULL,
    carisma integer NOT NULL,
    forca integer NOT NULL,
    constituicao integer NOT NULL,
    destreza integer NOT NULL,
    agilidade integer NOT NULL,
    inteligencia integer NOT NULL,
    percepcao integer NOT NULL,
    PRIMARY KEY (id_aptidao)
);


CREATE TABLE public.raca (
    id_raca integer NOT NULL,
    tipo varchar(150) NOT NULL,
    descricao varchar(300) NOT NULL,
    bonus_de_raca integer NOT NULL,
    alinhamento varchar NOT NULL,
    PRIMARY KEY (id_raca)
);


CREATE TABLE public.classe (
    id_classe integer NOT NULL,
    tipo varchar(150) NOT NULL,
    descricao varchar(300) NOT NULL,
    bonus_de_classe integer NOT NULL,
    PRIMARY KEY (id_classe)
);


CREATE TABLE public.habilidade (
    id_habilidade integer NOT NULL,
    tipo varchar(150) NOT NULL,
    tempo_recarga integer NOT NULL,
    descricao varchar(300) NOT NULL,
    duracao integer NOT NULL,
    tempo_ativacao integer NOT NULL,
    nivel integer NOT NULL,
    ponto integer NOT NULL,
    PRIMARY KEY (id_habilidade)
);


CREATE TABLE public.personagem (
    id_jogador integer NOT NULL,
    nome varchar(150) NOT NULL,
    genero varchar(150) NOT NULL,
    nivel integer NOT NULL,
    PRIMARY KEY (id_jogador)
);


CREATE TABLE public.atributo (
    id_atributo integer NOT NULL,
    pontos integer NOT NULL,
    defesa integer NOT NULL,
    ataque integer NOT NULL,
    vida integer NOT NULL,
    mana integer NOT NULL,
    vigor integer NOT NULL,
    PRIMARY KEY (id_atributo)
);


CREATE TABLE public.nao_jogavel (
    id_jogador integer NOT NULL,
    afinidade integer NOT NULL
);

CREATE INDEX ON public.nao_jogavel
    (id_jogador);


CREATE TABLE public.inimigo (
    id_jogador integer NOT NULL,
    tipo varchar(150) NOT NULL
);

CREATE INDEX ON public.inimigo
    (id_jogador);


CREATE TABLE public.aliado (
    id_jogador integer NOT NULL
);

CREATE INDEX ON public.aliado
    (id_jogador);


CREATE TABLE public.jogavel (
    id_jogador integer NOT NULL
);

CREATE INDEX ON public.jogavel
    (id_jogador);


CREATE TABLE public.item (
    id_item integer NOT NULL,
    valor integer NOT NULL,
    quantidade integer NOT NULL,
    raridade integer NOT NULL,
    descricao varchar(300) NOT NULL,
    PRIMARY KEY (id_item)
);


CREATE TABLE public.drop (
    tipo varchar(150) NOT NULL,
    id_item integer NOT NULL
);

CREATE INDEX ON public.drop
    (id_item);


CREATE TABLE public.moeda (
    id_item integer NOT NULL,
    tipo varchar(150) NOT NULL
);

CREATE INDEX ON public.moeda
    (id_item);


CREATE TABLE public.consumivel (
    id_item integer NOT NULL
);

CREATE INDEX ON public.consumivel
    (id_item);


CREATE TABLE public.ofensivo (
    id_item integer NOT NULL,
    tipo_dano varchar(150) NOT NULL,
    dano integer NOT NULL
);

CREATE INDEX ON public.ofensivo
    (id_item);


CREATE TABLE public.suporte (
    id_item integer NOT NULL,
    buff varchar(300) NOT NULL,
    debuff varchar(300) NOT NULL
);

CREATE INDEX ON public.suporte
    (id_item);


CREATE TABLE public.equipamento (
    id_item integer NOT NULL,
    material varchar(150) NOT NULL,
    durabilidade integer NOT NULL
);

CREATE INDEX ON public.equipamento
    (id_item);


CREATE TABLE public.armamento (
    id_item integer NOT NULL,
    tipo varchar(150) NOT NULL,
    bonus_armamento integer NOT NULL
);

CREATE INDEX ON public.armamento
    (id_item);


CREATE TABLE public.armadura (
    id_item integer NOT NULL,
    bonus_defesa integer NOT NULL
);

CREATE INDEX ON public.armadura
    (id_item);


CREATE TABLE public.raca_jogador (
    id_raca integer NOT NULL,
    id_jogador integer NOT NULL
);

CREATE INDEX ON public.raca_jogador
    (id_raca);
CREATE INDEX ON public.raca_jogador
    (id_jogador);


CREATE TABLE public.classe_jogador (
    id_classe integer NOT NULL,
    id_jogador integer NOT NULL
);

CREATE INDEX ON public.classe_jogador
    (id_classe);
CREATE INDEX ON public.classe_jogador
    (id_jogador);


CREATE TABLE public.habilidade_jogador (
    id_habilidade integer NOT NULL,
    id_jogador integer NOT NULL
);

CREATE INDEX ON public.habilidade_jogador
    (id_habilidade);
CREATE INDEX ON public.habilidade_jogador
    (id_jogador);


CREATE TABLE public.atributo_jogador (
    id_atributo integer NOT NULL,
    id_jogador integer NOT NULL
);

CREATE INDEX ON public.atributo_jogador
    (id_atributo);
CREATE INDEX ON public.atributo_jogador
    (id_jogador);


CREATE TABLE public.aptidao_atributo (
    id_atributo integer NOT NULL,
    id_aptidao integer NOT NULL
);

CREATE INDEX ON public.aptidao_atributo
    (id_atributo);
CREATE INDEX ON public.aptidao_atributo
    (id_aptidao);


CREATE TABLE public.equipamento_requer_aptidao (
    id_aptidao integer NOT NULL,
    id_equipamento integer NOT NULL,
    nivel integer NOT NULL,
    id_raca integer NOT NULL,
    classe integer NOT NULL
);

CREATE INDEX ON public.equipamento_requer_aptidao
    (id_aptidao);
CREATE INDEX ON public.equipamento_requer_aptidao
    (id_equipamento);
CREATE INDEX ON public.equipamento_requer_aptidao
    (id_raca);
CREATE INDEX ON public.equipamento_requer_aptidao
    (classe);


CREATE TABLE public.itens_guardados_jogador (
    id_jogador integer NOT NULL,
    id_item integer NOT NULL
);

CREATE INDEX ON public.itens_guardados_jogador
    (id_jogador);
CREATE INDEX ON public.itens_guardados_jogador
    (id_item);


CREATE TABLE public.itens_dropados_inimigo (
    id_personagem integer NOT NULL,
    id_item integer NOT NULL
);

CREATE INDEX ON public.itens_dropados_inimigo
    (id_personagem);
CREATE INDEX ON public.itens_dropados_inimigo
    (id_item);


CREATE TABLE public.auxilio_entre_jogavel_aliado (
    id_jogador integer NOT NULL,
    id_aliado integer NOT NULL
);

CREATE INDEX ON public.auxilio_entre_jogavel_aliado
    (id_jogador);
CREATE INDEX ON public.auxilio_entre_jogavel_aliado
    (id_aliado);


CREATE TABLE public.combate_entre_jogador_inimigo (
    id_jogador integer NOT NULL,
    id_inimigo integer NOT NULL,
    local varchar(300) NOT NULL
);

CREATE INDEX ON public.combate_entre_jogador_inimigo
    (id_jogador);
CREATE INDEX ON public.combate_entre_jogador_inimigo
    (id_inimigo);


CREATE TABLE public.interacao_entre_jogador (
    id_jogador_efetua integer NOT NULL,
    id_jogador_efetuado integer NOT NULL,
    tipo varchar(300) NOT NULL
);

CREATE INDEX ON public.interacao_entre_jogador
    (id_jogador_efetua);
CREATE INDEX ON public.interacao_entre_jogador
    (id_jogador_efetuado);


ALTER TABLE public.nao_jogavel ADD CONSTRAINT FK_nao_jogavel__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.inimigo ADD CONSTRAINT FK_inimigo__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.nao_jogavel(id_jogador);
ALTER TABLE public.aliado ADD CONSTRAINT FK_aliado__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.nao_jogavel(id_jogador);
ALTER TABLE public.jogavel ADD CONSTRAINT FK_jogavel__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.drop ADD CONSTRAINT FK_drop__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.moeda ADD CONSTRAINT FK_moeda__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.consumivel ADD CONSTRAINT FK_consumivel__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.ofensivo ADD CONSTRAINT FK_ofensivo__id_item FOREIGN KEY (id_item) REFERENCES public.consumivel(id_item);
ALTER TABLE public.suporte ADD CONSTRAINT FK_suporte__id_item FOREIGN KEY (id_item) REFERENCES public.consumivel(id_item);
ALTER TABLE public.equipamento ADD CONSTRAINT FK_equipamento__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.armamento ADD CONSTRAINT FK_armamento__id_item FOREIGN KEY (id_item) REFERENCES public.equipamento(id_item);
ALTER TABLE public.armadura ADD CONSTRAINT FK_armadura__id_item FOREIGN KEY (id_item) REFERENCES public.equipamento(id_item);
ALTER TABLE public.raca_jogador ADD CONSTRAINT FK_raca_jogador__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);
ALTER TABLE public.raca_jogador ADD CONSTRAINT FK_raca_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.classe_jogador ADD CONSTRAINT FK_classe_jogador__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);
ALTER TABLE public.classe_jogador ADD CONSTRAINT FK_classe_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.habilidade_jogador ADD CONSTRAINT FK_habilidade_jogador__id_habilidade FOREIGN KEY (id_habilidade) REFERENCES public.habilidade(id_habilidade);
ALTER TABLE public.habilidade_jogador ADD CONSTRAINT FK_habilidade_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.atributo_jogador ADD CONSTRAINT FK_atributo_jogador__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);
ALTER TABLE public.atributo_jogador ADD CONSTRAINT FK_atributo_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.aptidao_atributo ADD CONSTRAINT FK_aptidao_atributo__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);
ALTER TABLE public.aptidao_atributo ADD CONSTRAINT FK_aptidao_atributo__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_equipamento FOREIGN KEY (id_equipamento) REFERENCES public.equipamento(id_item);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__classe FOREIGN KEY (classe) REFERENCES public.classe(id_classe);
ALTER TABLE public.itens_guardados_jogador ADD CONSTRAINT FK_itens_guardados_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.jogavel(id_jogador);
ALTER TABLE public.itens_guardados_jogador ADD CONSTRAINT FK_itens_guardados_jogador__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.itens_dropados_inimigo ADD CONSTRAINT FK_itens_dropados_inimigo__id_personagem FOREIGN KEY (id_personagem) REFERENCES public.inimigo(id_jogador);
ALTER TABLE public.itens_dropados_inimigo ADD CONSTRAINT FK_itens_dropados_inimigo__id_item FOREIGN KEY (id_item) REFERENCES public.drop(id_item);
ALTER TABLE public.auxilio_entre_jogavel_aliado ADD CONSTRAINT FK_auxilio_entre_jogavel_aliado__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.jogavel(id_jogador);
ALTER TABLE public.auxilio_entre_jogavel_aliado ADD CONSTRAINT FK_auxilio_entre_jogavel_aliado__id_aliado FOREIGN KEY (id_aliado) REFERENCES public.aliado(id_jogador);
ALTER TABLE public.combate_entre_jogador_inimigo ADD CONSTRAINT FK_combate_entre_jogador_inimigo__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.jogavel(id_jogador);
ALTER TABLE public.combate_entre_jogador_inimigo ADD CONSTRAINT FK_combate_entre_jogador_inimigo__id_inimigo FOREIGN KEY (id_inimigo) REFERENCES public.inimigo(id_jogador);
ALTER TABLE public.interacao_entre_jogador ADD CONSTRAINT FK_interacao_entre_jogador__id_jogador_efetua FOREIGN KEY (id_jogador_efetua) REFERENCES public.jogavel(id_jogador);
ALTER TABLE public.interacao_entre_jogador ADD CONSTRAINT FK_interacao_entre_jogador__id_jogador_efetuado FOREIGN KEY (id_jogador_efetuado) REFERENCES public.jogavel(id_jogador);