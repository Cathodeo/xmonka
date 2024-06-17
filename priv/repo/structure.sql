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
-- Name: cards; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cards (
    card_id integer NOT NULL,
    cardtype integer,
    foreign_id integer
);


--
-- Name: cards_card_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cards_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cards_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cards_card_id_seq OWNED BY public.cards.card_id;


--
-- Name: consumableitems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.consumableitems (
    item_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text
);


--
-- Name: consumableitems_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.consumableitems_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: consumableitems_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.consumableitems_item_id_seq OWNED BY public.consumableitems.item_id;


--
-- Name: elements; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.elements (
    element_id integer NOT NULL,
    name character varying(50) NOT NULL
);


--
-- Name: elements_element_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.elements_element_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: elements_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.elements_element_id_seq OWNED BY public.elements.element_id;


--
-- Name: equipableweapons; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.equipableweapons (
    weapon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    element_id integer,
    move_id integer,
    description text
);


--
-- Name: equipableweapons_weapon_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.equipableweapons_weapon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: equipableweapons_weapon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.equipableweapons_weapon_id_seq OWNED BY public.equipableweapons.weapon_id;


--
-- Name: monsters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.monsters (
    monster_id integer NOT NULL,
    name character varying(50) NOT NULL,
    healthpoints integer NOT NULL,
    element_id integer,
    move_id integer,
    CONSTRAINT monsters_healthpoints_check CHECK (((healthpoints >= 1) AND (healthpoints <= 12)))
);


--
-- Name: monsters_monster_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.monsters_monster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: monsters_monster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.monsters_monster_id_seq OWNED BY public.monsters.monster_id;


--
-- Name: moves; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.moves (
    move_id integer NOT NULL,
    name character varying(50) NOT NULL,
    power integer NOT NULL,
    element_id integer,
    description text,
    CONSTRAINT moves_power_check CHECK (((power >= 1) AND (power <= 12)))
);


--
-- Name: moves_move_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.moves_move_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: moves_move_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.moves_move_id_seq OWNED BY public.moves.move_id;


--
-- Name: cards card_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cards ALTER COLUMN card_id SET DEFAULT nextval('public.cards_card_id_seq'::regclass);


--
-- Name: consumableitems item_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consumableitems ALTER COLUMN item_id SET DEFAULT nextval('public.consumableitems_item_id_seq'::regclass);


--
-- Name: elements element_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.elements ALTER COLUMN element_id SET DEFAULT nextval('public.elements_element_id_seq'::regclass);


--
-- Name: equipableweapons weapon_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipableweapons ALTER COLUMN weapon_id SET DEFAULT nextval('public.equipableweapons_weapon_id_seq'::regclass);


--
-- Name: monsters monster_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.monsters ALTER COLUMN monster_id SET DEFAULT nextval('public.monsters_monster_id_seq'::regclass);


--
-- Name: moves move_id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moves ALTER COLUMN move_id SET DEFAULT nextval('public.moves_move_id_seq'::regclass);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (card_id);


--
-- Name: consumableitems consumableitems_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consumableitems
    ADD CONSTRAINT consumableitems_name_key UNIQUE (name);


--
-- Name: consumableitems consumableitems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.consumableitems
    ADD CONSTRAINT consumableitems_pkey PRIMARY KEY (item_id);


--
-- Name: elements elements_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_name_key UNIQUE (name);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (element_id);


--
-- Name: equipableweapons equipableweapons_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipableweapons
    ADD CONSTRAINT equipableweapons_name_key UNIQUE (name);


--
-- Name: equipableweapons equipableweapons_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.equipableweapons
    ADD CONSTRAINT equipableweapons_pkey PRIMARY KEY (weapon_id);


--
-- Name: monsters monsters_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_name_key UNIQUE (name);


--
-- Name: monsters monsters_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_pkey PRIMARY KEY (monster_id);


--
-- Name: moves moves_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_name_key UNIQUE (name);


--
-- Name: moves moves_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.moves
    ADD CONSTRAINT moves_pkey PRIMARY KEY (move_id);


--
-- Name: monsters monsters_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_element_id_fkey FOREIGN KEY (element_id) REFERENCES public.elements(element_id);


--
-- Name: monsters monsters_move_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.monsters
    ADD CONSTRAINT monsters_move_id_fkey FOREIGN KEY (move_id) REFERENCES public.moves(move_id);


--
-- PostgreSQL database dump complete
--

