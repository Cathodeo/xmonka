--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1
-- Dumped by pg_dump version 16.1

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
-- Name: cards; Type: TABLE; Schema: public; Owner: xmonka
--

CREATE TABLE public.cards (
    card_id integer NOT NULL,
    cardtype integer,
    foreign_id integer
);


ALTER TABLE public.cards OWNER TO xmonka;

--
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: xmonka
--

CREATE SEQUENCE public.cards_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_card_id_seq OWNER TO xmonka;

--
-- Name: cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmonka
--

ALTER SEQUENCE public.cards_card_id_seq OWNED BY public.cards.card_id;


--
-- Name: consumableitems; Type: TABLE; Schema: public; Owner: xmonka
--

CREATE TABLE public.consumableitems (
    item_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


ALTER TABLE public.consumableitems OWNER TO xmonka;

--
-- Name: consumableitems_item_id_seq; Type: SEQUENCE; Schema: public; Owner: xmonka
--

CREATE SEQUENCE public.consumableitems_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.consumableitems_item_id_seq OWNER TO xmonka;

--
-- Name: consumableitems_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmonka
--

ALTER SEQUENCE public.consumableitems_item_id_seq OWNED BY public.consumableitems.item_id;


--
-- Name: elements; Type: TABLE; Schema: public; Owner: xmonka
--

CREATE TABLE public.elements (
    element_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.elements OWNER TO xmonka;

--
-- Name: elements_element_id_seq; Type: SEQUENCE; Schema: public; Owner: xmonka
--

CREATE SEQUENCE public.elements_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.elements_element_id_seq OWNER TO xmonka;

--
-- Name: elements_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmonka
--

ALTER SEQUENCE public.elements_element_id_seq OWNED BY public.elements.element_id;


--
-- Name: equipableweapons; Type: TABLE; Schema: public; Owner: xmonka
--

CREATE TABLE public.equipableweapons (
    weapon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    element_id integer,
    move_id integer,
    description text
);


ALTER TABLE public.equipableweapons OWNER TO xmonka;

--
-- Name: equipableweapons_weapon_id_seq; Type: SEQUENCE; Schema: public; Owner: xmonka
--

CREATE SEQUENCE public.equipableweapons_weapon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.equipableweapons_weapon_id_seq OWNER TO xmonka;

--
-- Name: equipableweapons_weapon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmonka
--

ALTER SEQUENCE public.equipableweapons_weapon_id_seq OWNED BY public.equipableweapons.weapon_id;


--
-- Name: monsters; Type: TABLE; Schema: public; Owner: xmonka
--

CREATE TABLE public.monsters (
    monster_id integer NOT NULL,
    name character varying(50) NOT NULL,
    healthpoints integer NOT NULL,
    element_id integer,
    move_id integer,
    CONSTRAINT monsters_healthpoints_check CHECK (((healthpoints >= 1) AND (healthpoints <= 12)))
);


ALTER TABLE public.monsters OWNER TO xmonka;

--
-- Name: monsters_monster_id_seq; Type: SEQUENCE; Schema: public; Owner: xmonka
--

CREATE SEQUENCE public.monsters_monster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.monsters_monster_id_seq OWNER TO xmonka;

--
-- Name: monsters_monster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmonka
--

ALTER SEQUENCE public.monsters_monster_id_seq OWNED BY public.monsters.monster_id;


--
-- Name: moves; Type: TABLE; Schema: public; Owner: xmonka
--

CREATE TABLE public.moves (
    move_id integer NOT NULL,
    name character varying(50) NOT NULL,
    power integer NOT NULL,
    element_id integer,
    description text,
    CONSTRAINT moves_power_check CHECK (((power >= 1) AND (power <= 12)))
);


ALTER TABLE public.moves OWNER TO xmonka;

--
-- Name: moves_move_id_seq; Type: SEQUENCE; Schema: public; Owner: xmonka
--

CREATE SEQUENCE public.moves_move_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moves_move_id_seq OWNER TO xmonka;

--
-- Name: moves_move_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: xmonka
--

ALTER SEQUENCE public.moves_move_id_seq OWNED BY public.moves.move_id;


--
-- Name: cards card_id; Type: DEFAULT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.cards ALTER COLUMN card_id SET DEFAULT nextval('public.cards_card_id_seq'::regclass);


--
-- Name: consumableitems item_id; Type: DEFAULT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.consumableitems ALTER COLUMN item_id SET DEFAULT nextval('public.consumableitems_item_id_seq'::regclass);


--
-- Name: elements element_id; Type: DEFAULT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.elements ALTER COLUMN element_id SET DEFAULT nextval('public.elements_element_id_seq'::regclass);


--
-- Name: equipableweapons weapon_id; Type: DEFAULT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.equipableweapons ALTER COLUMN weapon_id SET DEFAULT nextval('public.equipableweapons_weapon_id_seq'::regclass);


--
-- Name: monsters monster_id; Type: DEFAULT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.monsters ALTER COLUMN monster_id SET DEFAULT nextval('public.monsters_monster_id_seq'::regclass);


--
-- Name: moves move_id; Type: DEFAULT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.moves ALTER COLUMN move_id SET DEFAULT nextval('public.moves_move_id_seq'::regclass);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: xmonka
--

COPY public.cards (card_id, cardtype, foreign_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	2	1
9	2	2
10	3	1
11	3	2
12	3	3
13	3	4
14	3	5
\.


--
-- Data for Name: consumableitems; Type: TABLE DATA; Schema: public; Owner: xmonka
--

COPY public.consumableitems (item_id, name, description) FROM stdin;
1	Spiky tape	Prevents one healthppint of damage and deals it to the foe
2	Eject protocol	Allows the monster to attack and switch the same turn
\.


--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: xmonka
--

COPY public.elements (element_id, name) FROM stdin;
1	Robot
2	Animal
3	Biohazard
4	Radio
\.


--
-- Data for Name: equipableweapons; Type: TABLE DATA; Schema: public; Owner: xmonka
--

COPY public.equipableweapons (weapon_id, name, element_id, move_id, description) FROM stdin;
1	Rainbow launcher	4	7	Rocket Launcher that attachs to a Radio droid
2	Droid Hammer	2	9	A huge hammer that appends to a Robot
3	Horned Helmet	4	5	A helmet that can be used by an Animal
4	Corrosion Element	3	10	Allows a Biohazard type monster to puke corrosive chemistry
5	Gaseose reaction	3	11	Allows a Biohazard type monster to expel gas
\.


--
-- Data for Name: monsters; Type: TABLE DATA; Schema: public; Owner: xmonka
--

COPY public.monsters (monster_id, name, healthpoints, element_id, move_id) FROM stdin;
1	Crimson Bovid	10	2	4
2	Vermin FM	4	2	1
3	B.O.B	6	1	3
4	Funk Station	6	4	8
5	Maladin	5	3	2
6	Patcher	7	1	6
7	Goostav	8	3	12
\.


--
-- Data for Name: moves; Type: TABLE DATA; Schema: public; Owner: xmonka
--

COPY public.moves (move_id, name, power, element_id, description) FROM stdin;
1	Sabotage Signal	2	4	Throw a coin. If heads and the oponent is Robot, paralyzes one turn
2	Pestilence	1	3	Animal foes become poisoned, losing health every turn
3	Zapper	3	1	Toss a coin. If tails, the attack misses
4	Stompede	2	2	The opposing foe has to switch Monster cards
5	Horned Tackle	3	2	Powerful tackle. No additional effects
6	Energy Transfer	2	1	The user may heal one healthpoint from himself or a benched robot
7	Rainbow Bomb	3	4	A powerful electromagnetic bomb. No additional effects
8	Null Frequency	3	4	Does not work against non-Robot foes
9	Droid hammer	3	1	Toss a coin. If heads, the oponent is stunned a turn
10	Corroder	3	3	Deals double damage to Robots
11	Foul Gas	3	3	Double damage against poisoned foes
12	Gooey String	1	3	The foe monster cant be switched the next turn
\.


--
-- Name: cards_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmonka
--

SELECT pg_catalog.setval('public.cards_card_id_seq', 14, true);


--
-- Name: consumableitems_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmonka
--

SELECT pg_catalog.setval('public.consumableitems_item_id_seq', 2, true);


--
-- Name: elements_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmonka
--

SELECT pg_catalog.setval('public.elements_element_id_seq', 4, true);


--
-- Name: equipableweapons_weapon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmonka
--

SELECT pg_catalog.setval('public.equipableweapons_weapon_id_seq', 5, true);


--
-- Name: monsters_monster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmonka
--

SELECT pg_catalog.setval('public.monsters_monster_id_seq', 7, true);


--
-- Name: moves_move_id_seq; Type: SEQUENCE SET; Schema: public; Owner: xmonka
--

SELECT pg_catalog.setval('public.moves_move_id_seq', 12, true);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_id);


--
-- Name: consumableitems consumableitems_name_key; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.consumableitems
    ADD CONSTRAINT consumableitems_name_key UNIQUE (name);


--
-- Name: consumableitems consumableitems_pkey; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.consumableitems
    ADD CONSTRAINT consumableitems_pkey PRIMARY KEY (item_id);


--
-- Name: elements elements_name_key; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_name_key UNIQUE (name);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (element_id);


--
-- Name: equipableweapons equipableweapons_name_key; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.equipableweapons
    ADD CONSTRAINT equipableweapons_name_key UNIQUE (name);


--
-- Name: equipableweapons equipableweapons_pkey; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.equipableweapons
    ADD CONSTRAINT equipableweapons_pkey PRIMARY KEY (weapon_id);


--
-- Name: monsters monsters_name_key; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_name_key UNIQUE (name);


--
-- Name: monsters monsters_pkey; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_pkey PRIMARY KEY (monster_id);


--
-- Name: moves moves_name_key; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_name_key UNIQUE (name);


--
-- Name: moves moves_pkey; Type: CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_pkey PRIMARY KEY (move_id);


--
-- Name: monsters monsters_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.elements(element_id);


--
-- Name: monsters monsters_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: xmonka
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(move_id);


--
-- PostgreSQL database dump complete
--

