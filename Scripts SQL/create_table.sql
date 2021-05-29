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
    ponto integer NOT NULL,
    PRIMARY KEY (id_habilidade)
);


CREATE TABLE public.personagem (
    id_personagem integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    id_atributo integer NOT NULL,
    id_aptidao integer NOT NULL,
    nome varchar(150) NOT NULL,
    genero varchar(150) NOT NULL,
    nivel integer NOT NULL,
    PRIMARY KEY (id_personagem)
);

CREATE INDEX ON public.personagem
    (id_raca);
CREATE INDEX ON public.personagem
    (id_classe);
CREATE INDEX ON public.personagem
    (id_atributo);
CREATE INDEX ON public.personagem
    (id_aptidao);


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
    id_nao_jogavel integer NOT NULL,
    afinidade integer NOT NULL,
    tipo varchar(150) NOT NULL,
    acrescimo_experiencia integer NOT NULL
);

CREATE INDEX ON public.nao_jogavel
    (id_nao_jogavel);


CREATE TABLE public.jogavel (
    id_jogavel integer NOT NULL,
    id_inventario integer NOT NULL,
    nickname varchar(20) NOT NULL
);

ALTER TABLE public.jogavel
    ADD UNIQUE (nickname);

CREATE INDEX ON public.jogavel
    (id_jogavel);
CREATE INDEX ON public.jogavel
    (id_inventario);


CREATE TABLE public.item (
    id_item integer NOT NULL,
    valor integer NOT NULL,
    raridade integer NOT NULL,
    descricao varchar(300) NOT NULL,
    PRIMARY KEY (id_item)
);


CREATE TABLE public.variedades (
    id_item integer NOT NULL,
    nome varchar(150) NOT NULL
);

CREATE INDEX ON public.variedades
    (id_item);


CREATE TABLE public.moeda (
    id_item integer NOT NULL,
    id_moeda integer NOT NULL
);

CREATE INDEX ON public.moeda
    (id_item);
CREATE INDEX ON public.moeda
    (id_moeda);


CREATE TABLE public.consumivel_ofensivo (
    id_item integer NOT NULL,
    dano integer NOT NULL,
    tipo_dano varchar(50) NOT NULL,
    duracao integer NOT NULL
);

CREATE INDEX ON public.consumivel_ofensivo
    (id_item);


CREATE TABLE public.consumivel_suporte (
    id_item integer NOT NULL,
    buff integer,
    debuff integer,
    descricao_buf varchar(200),
    descricao_debuff varchar(200),
    duracao integer NOT NULL
);

CREATE INDEX ON public.consumivel_suporte
    (id_item);


CREATE TABLE public.armamento (
    id_item integer NOT NULL,
    tipo varchar(150) NOT NULL,
    bonus_armamento integer NOT NULL,
    material varchar(150) NOT NULL,
    durabilidade integer NOT NULL
);

CREATE INDEX ON public.armamento
    (id_item);


CREATE TABLE public.armadura (
    id_item integer NOT NULL,
    bonus_defesa integer NOT NULL,
    material varchar(150) NOT NULL,
    durabilidade integer NOT NULL
);

CREATE INDEX ON public.armadura
    (id_item);


CREATE TABLE public.habilidade_jogador (
    id_habilidade integer NOT NULL,
    id_jogador integer NOT NULL,
    nivel integer NOT NULL
);

CREATE INDEX ON public.habilidade_jogador
    (id_habilidade);
CREATE INDEX ON public.habilidade_jogador
    (id_jogador);


CREATE TABLE public.equipamento_requer_aptidao (
    id_aptidao integer NOT NULL,
    id_equipamento integer NOT NULL,
    id_raca integer NOT NULL,
    id_classe integer NOT NULL,
    nivel integer NOT NULL
);

CREATE INDEX ON public.equipamento_requer_aptidao
    (id_aptidao);
CREATE INDEX ON public.equipamento_requer_aptidao
    (id_equipamento);
CREATE INDEX ON public.equipamento_requer_aptidao
    (id_raca);
CREATE INDEX ON public.equipamento_requer_aptidao
    (id_classe);


CREATE TABLE public.armazena (
    id_item integer NOT NULL,
    id_inventario integer NOT NULL,
    quantidade integer NOT NULL
);

CREATE INDEX ON public.armazena
    (id_item);
CREATE INDEX ON public.armazena
    (id_inventario);


CREATE TABLE public.inventario (
    id_inventario integer NOT NULL,
    capacidade_atual integer NOT NULL,
    capacidade_max integer NOT NULL,
    PRIMARY KEY (id_inventario)
);


CREATE TABLE public.tipo_moeda (
    id_moeda integer NOT NULL,
    minerio varchar(200) NOT NULL,
    PRIMARY KEY (id_moeda)
);


CREATE TABLE public.realiza_interacao (
    id_persongem_efetua integer NOT NULL,
    id_persongem_efetuado integer NOT NULL,
    id_interacao integer NOT NULL
);

CREATE INDEX ON public.realiza_interacao
    (id_persongem_efetua);
CREATE INDEX ON public.realiza_interacao
    (id_persongem_efetuado);
CREATE INDEX ON public.realiza_interacao
    (id_interacao);


CREATE TABLE public.interacao (
    id_interacao integer NOT NULL,
    local varchar(200) NOT NULL,
    data timestamp with time zone NOT NULL,
    PRIMARY KEY (id_interacao)
);


CREATE TABLE public.combate (
    id_interacao integer NOT NULL
);

CREATE INDEX ON public.combate
    (id_interacao);


CREATE TABLE public.troca (
    id_interacao integer NOT NULL
);

CREATE INDEX ON public.troca
    (id_interacao);


CREATE TABLE public.comunicacao (
    id_interacao integer NOT NULL,
    mensagem varchar(500) NOT NULL
);

CREATE INDEX ON public.comunicacao
    (id_interacao);


CREATE TABLE public.ganha_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);

CREATE INDEX ON public.ganha_item
    (id_interacao);
CREATE INDEX ON public.ganha_item
    (id_item);


CREATE TABLE public.recebe_item (
    id_interacao integer NOT NULL,
    id_item integer NOT NULL
);

CREATE INDEX ON public.recebe_item
    (id_interacao);
CREATE INDEX ON public.recebe_item
    (id_item);


ALTER TABLE public.personagem ADD CONSTRAINT FK_personagem__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);
ALTER TABLE public.personagem ADD CONSTRAINT FK_personagem__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);
ALTER TABLE public.personagem ADD CONSTRAINT FK_personagem__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);
ALTER TABLE public.personagem ADD CONSTRAINT FK_personagem__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);
ALTER TABLE public.nao_jogavel ADD CONSTRAINT FK_nao_jogavel__id_nao_jogavel FOREIGN KEY (id_nao_jogavel) REFERENCES public.personagem(id_personagem);
ALTER TABLE public.jogavel ADD CONSTRAINT FK_jogavel__id_jogavel FOREIGN KEY (id_jogavel) REFERENCES public.personagem(id_personagem);
ALTER TABLE public.variedades ADD CONSTRAINT FK_variedades__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.moeda ADD CONSTRAINT FK_moeda__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.moeda ADD CONSTRAINT FK_moeda__id_moeda FOREIGN KEY (id_moeda) REFERENCES public.tipo_moeda(id_moeda);
ALTER TABLE public.consumivel_ofensivo ADD CONSTRAINT FK_consumivel_ofensivo__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.consumivel_suporte ADD CONSTRAINT FK_consumivel_suporte__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.armamento ADD CONSTRAINT FK_armamento__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.armadura ADD CONSTRAINT FK_armadura__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.habilidade_jogador ADD CONSTRAINT FK_habilidade_jogador__id_habilidade FOREIGN KEY (id_habilidade) REFERENCES public.habilidade(id_habilidade);
ALTER TABLE public.habilidade_jogador ADD CONSTRAINT FK_habilidade_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_personagem);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);
ALTER TABLE public.armazena ADD CONSTRAINT FK_armazena__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.armazena ADD CONSTRAINT FK_armazena__id_inventario FOREIGN KEY (id_inventario) REFERENCES public.inventario(id_inventario);
ALTER TABLE public.realiza_interacao ADD CONSTRAINT FK_realiza_interacao__id_persongem_efetua FOREIGN KEY (id_persongem_efetua) REFERENCES public.personagem(id_personagem);
ALTER TABLE public.realiza_interacao ADD CONSTRAINT FK_realiza_interacao__id_persongem_efetuado FOREIGN KEY (id_persongem_efetuado) REFERENCES public.personagem(id_personagem);
ALTER TABLE public.realiza_interacao ADD CONSTRAINT FK_realiza_interacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);
ALTER TABLE public.combate ADD CONSTRAINT FK_combate__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);
ALTER TABLE public.troca ADD CONSTRAINT FK_troca__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);
ALTER TABLE public.comunicacao ADD CONSTRAINT FK_comunicacao__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);
ALTER TABLE public.ganha_item ADD CONSTRAINT FK_ganha_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);
ALTER TABLE public.ganha_item ADD CONSTRAINT FK_ganha_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);
ALTER TABLE public.recebe_item ADD CONSTRAINT FK_recebe_item__id_interacao FOREIGN KEY (id_interacao) REFERENCES public.interacao(id_interacao);
ALTER TABLE public.recebe_item ADD CONSTRAINT FK_recebe_item__id_item FOREIGN KEY (id_item) REFERENCES public.item(id_item);