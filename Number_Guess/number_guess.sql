--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    player_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 20);
INSERT INTO public.games VALUES (2, 1, 12);
INSERT INTO public.games VALUES (3, 1, 15);
INSERT INTO public.games VALUES (4, 2, 5);
INSERT INTO public.games VALUES (5, 2, 30);
INSERT INTO public.games VALUES (6, 2, 24);
INSERT INTO public.games VALUES (7, 2, 29);
INSERT INTO public.games VALUES (8, 3, 15);
INSERT INTO public.games VALUES (9, 3, 70);
INSERT INTO public.games VALUES (10, 3, 5);
INSERT INTO public.games VALUES (11, 3, 1);
INSERT INTO public.games VALUES (12, 3, 23);
INSERT INTO public.games VALUES (13, 3, 17);
INSERT INTO public.games VALUES (14, 10, 538);
INSERT INTO public.games VALUES (15, 10, 167);
INSERT INTO public.games VALUES (16, 11, 703);
INSERT INTO public.games VALUES (17, 11, 998);
INSERT INTO public.games VALUES (18, 10, 239);
INSERT INTO public.games VALUES (19, 10, 731);
INSERT INTO public.games VALUES (20, 10, 760);
INSERT INTO public.games VALUES (21, 12, 623);
INSERT INTO public.games VALUES (22, 12, 662);
INSERT INTO public.games VALUES (23, 13, 14);
INSERT INTO public.games VALUES (24, 13, 666);
INSERT INTO public.games VALUES (25, 12, 762);
INSERT INTO public.games VALUES (26, 12, 346);
INSERT INTO public.games VALUES (27, 12, 587);
INSERT INTO public.games VALUES (28, 14, 152);
INSERT INTO public.games VALUES (29, 14, 874);
INSERT INTO public.games VALUES (30, 15, 33);
INSERT INTO public.games VALUES (31, 15, 839);
INSERT INTO public.games VALUES (32, 14, 901);
INSERT INTO public.games VALUES (33, 14, 353);
INSERT INTO public.games VALUES (34, 14, 767);
INSERT INTO public.games VALUES (35, 16, 276);
INSERT INTO public.games VALUES (36, 16, 900);
INSERT INTO public.games VALUES (37, 17, 362);
INSERT INTO public.games VALUES (38, 17, 947);
INSERT INTO public.games VALUES (39, 16, 471);
INSERT INTO public.games VALUES (40, 16, 617);
INSERT INTO public.games VALUES (41, 16, 675);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (1, 'Jhon');
INSERT INTO public.players VALUES (2, 'Anna');
INSERT INTO public.players VALUES (3, 'Petya');
INSERT INTO public.players VALUES (4, 'user_1712853557269');
INSERT INTO public.players VALUES (5, 'user_1712853557268');
INSERT INTO public.players VALUES (6, 'Walter');
INSERT INTO public.players VALUES (7, 'kraig');
INSERT INTO public.players VALUES (8, 'user_1712854036912');
INSERT INTO public.players VALUES (9, 'user_1712854036911');
INSERT INTO public.players VALUES (10, 'user_1712854250846');
INSERT INTO public.players VALUES (11, 'user_1712854250845');
INSERT INTO public.players VALUES (12, 'user_1712854394489');
INSERT INTO public.players VALUES (13, 'user_1712854394488');
INSERT INTO public.players VALUES (14, 'user_1712854725961');
INSERT INTO public.players VALUES (15, 'user_1712854725960');
INSERT INTO public.players VALUES (16, 'user_1712854789822');
INSERT INTO public.players VALUES (17, 'user_1712854789821');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 41, true);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 17, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- Name: games games_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(player_id);


--
-- PostgreSQL database dump complete
--

