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
    afinidade integer NOT NULL
);


CREATE TABLE public.inimigo (
    tipo varchar(150) NOT NULL
);


CREATE TABLE public.aliado (
);


CREATE TABLE public.jogavel (
);


CREATE TABLE public.item (
    id_item integer NOT NULL,
    valor integer NOT NULL,
    quantidade integer NOT NULL,
    raridade integer NOT NULL,
    descricao varchar(300) NOT NULL,
    PRIMARY KEY (id_item)
);


CREATE TABLE public.drop (
    tipo varchar(150) NOT NULL
);


CREATE TABLE public.moeda (
    tipo varchar(150) NOT NULL
);


CREATE TABLE public.consumivel (
);


CREATE TABLE public.ofensivo (
    tipo_dano varchar(150) NOT NULL,
    dano integer NOT NULL
);


CREATE TABLE public.suporte (
    buff varchar(300) NOT NULL,
    debuff varchar(300) NOT NULL
);


CREATE TABLE public.equipamento (
    id_equipamento integer NOT NULL,
    material varchar(150) NOT NULL,
    durabilidade integer NOT NULL,
    PRIMARY KEY (id_equipamento)
);


CREATE TABLE public.armamento (
    tipo varchar(150) NOT NULL,
    bonus_armamento integer NOT NULL
);


CREATE TABLE public.armadura (
    bonus_defesa integer NOT NULL
);


CREATE TABLE public. (
    id_raca integer NOT NULL,
    id_jogador integer NOT NULL
);

CREATE INDEX ON public.
    (id_raca);
CREATE INDEX ON public.
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


ALTER TABLE public. ADD CONSTRAINT FK___id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);
ALTER TABLE public. ADD CONSTRAINT FK___id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.classe_jogador ADD CONSTRAINT FK_classe_jogador__id_classe FOREIGN KEY (id_classe) REFERENCES public.classe(id_classe);
ALTER TABLE public.classe_jogador ADD CONSTRAINT FK_classe_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.habilidade_jogador ADD CONSTRAINT FK_habilidade_jogador__id_habilidade FOREIGN KEY (id_habilidade) REFERENCES public.habilidade(id_habilidade);
ALTER TABLE public.habilidade_jogador ADD CONSTRAINT FK_habilidade_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.atributo_jogador ADD CONSTRAINT FK_atributo_jogador__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);
ALTER TABLE public.atributo_jogador ADD CONSTRAINT FK_atributo_jogador__id_jogador FOREIGN KEY (id_jogador) REFERENCES public.personagem(id_jogador);
ALTER TABLE public.aptidao_atributo ADD CONSTRAINT FK_aptidao_atributo__id_atributo FOREIGN KEY (id_atributo) REFERENCES public.atributo(id_atributo);
ALTER TABLE public.aptidao_atributo ADD CONSTRAINT FK_aptidao_atributo__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_aptidao FOREIGN KEY (id_aptidao) REFERENCES public.aptidoes(id_aptidao);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_equipamento FOREIGN KEY (id_equipamento) REFERENCES public.equipamento(id_equipamento);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__id_raca FOREIGN KEY (id_raca) REFERENCES public.raca(id_raca);
ALTER TABLE public.equipamento_requer_aptidao ADD CONSTRAINT FK_equipamento_requer_aptidao__classe FOREIGN KEY (classe) REFERENCES public.classe(id_classe);