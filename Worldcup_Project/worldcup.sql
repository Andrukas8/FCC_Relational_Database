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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    year integer NOT NULL,
    round character varying(50) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
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
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2279, 2018, 'Final', 1085, 1086, 4, 2);
INSERT INTO public.games VALUES (2280, 2018, 'Third Place', 1087, 1088, 2, 0);
INSERT INTO public.games VALUES (2281, 2018, 'Semi-Final', 1086, 1088, 2, 1);
INSERT INTO public.games VALUES (2282, 2018, 'Semi-Final', 1085, 1087, 1, 0);
INSERT INTO public.games VALUES (2283, 2018, 'Quarter-Final', 1086, 1089, 3, 2);
INSERT INTO public.games VALUES (2284, 2018, 'Quarter-Final', 1088, 1090, 2, 0);
INSERT INTO public.games VALUES (2285, 2018, 'Quarter-Final', 1087, 1091, 2, 1);
INSERT INTO public.games VALUES (2286, 2018, 'Quarter-Final', 1085, 1092, 2, 0);
INSERT INTO public.games VALUES (2287, 2018, 'Eighth-Final', 1088, 1093, 2, 1);
INSERT INTO public.games VALUES (2288, 2018, 'Eighth-Final', 1090, 1094, 1, 0);
INSERT INTO public.games VALUES (2289, 2018, 'Eighth-Final', 1087, 1095, 3, 2);
INSERT INTO public.games VALUES (2290, 2018, 'Eighth-Final', 1091, 1096, 2, 0);
INSERT INTO public.games VALUES (2291, 2018, 'Eighth-Final', 1086, 1097, 2, 1);
INSERT INTO public.games VALUES (2292, 2018, 'Eighth-Final', 1089, 1098, 2, 1);
INSERT INTO public.games VALUES (2293, 2018, 'Eighth-Final', 1092, 1099, 2, 1);
INSERT INTO public.games VALUES (2294, 2018, 'Eighth-Final', 1085, 1100, 4, 3);
INSERT INTO public.games VALUES (2295, 2014, 'Final', 1101, 1100, 1, 0);
INSERT INTO public.games VALUES (2296, 2014, 'Third Place', 1102, 1091, 3, 0);
INSERT INTO public.games VALUES (2297, 2014, 'Semi-Final', 1100, 1102, 1, 0);
INSERT INTO public.games VALUES (2298, 2014, 'Semi-Final', 1101, 1091, 7, 1);
INSERT INTO public.games VALUES (2299, 2014, 'Quarter-Final', 1102, 1103, 1, 0);
INSERT INTO public.games VALUES (2300, 2014, 'Quarter-Final', 1100, 1087, 1, 0);
INSERT INTO public.games VALUES (2301, 2014, 'Quarter-Final', 1091, 1093, 2, 1);
INSERT INTO public.games VALUES (2302, 2014, 'Quarter-Final', 1101, 1085, 1, 0);
INSERT INTO public.games VALUES (2303, 2014, 'Eighth-Final', 1091, 1104, 2, 1);
INSERT INTO public.games VALUES (2304, 2014, 'Eighth-Final', 1093, 1092, 2, 0);
INSERT INTO public.games VALUES (2305, 2014, 'Eighth-Final', 1085, 1105, 2, 0);
INSERT INTO public.games VALUES (2306, 2014, 'Eighth-Final', 1101, 1106, 2, 1);
INSERT INTO public.games VALUES (2307, 2014, 'Eighth-Final', 1102, 1096, 2, 1);
INSERT INTO public.games VALUES (2308, 2014, 'Eighth-Final', 1103, 1107, 2, 1);
INSERT INTO public.games VALUES (2309, 2014, 'Eighth-Final', 1100, 1094, 1, 0);
INSERT INTO public.games VALUES (2310, 2014, 'Eighth-Final', 1087, 1108, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (1085, 'France');
INSERT INTO public.teams VALUES (1086, 'Croatia');
INSERT INTO public.teams VALUES (1087, 'Belgium');
INSERT INTO public.teams VALUES (1088, 'England');
INSERT INTO public.teams VALUES (1089, 'Russia');
INSERT INTO public.teams VALUES (1090, 'Sweden');
INSERT INTO public.teams VALUES (1091, 'Brazil');
INSERT INTO public.teams VALUES (1092, 'Uruguay');
INSERT INTO public.teams VALUES (1093, 'Colombia');
INSERT INTO public.teams VALUES (1094, 'Switzerland');
INSERT INTO public.teams VALUES (1095, 'Japan');
INSERT INTO public.teams VALUES (1096, 'Mexico');
INSERT INTO public.teams VALUES (1097, 'Denmark');
INSERT INTO public.teams VALUES (1098, 'Spain');
INSERT INTO public.teams VALUES (1099, 'Portugal');
INSERT INTO public.teams VALUES (1100, 'Argentina');
INSERT INTO public.teams VALUES (1101, 'Germany');
INSERT INTO public.teams VALUES (1102, 'Netherlands');
INSERT INTO public.teams VALUES (1103, 'Costa Rica');
INSERT INTO public.teams VALUES (1104, 'Chile');
INSERT INTO public.teams VALUES (1105, 'Nigeria');
INSERT INTO public.teams VALUES (1106, 'Algeria');
INSERT INTO public.teams VALUES (1107, 'Greece');
INSERT INTO public.teams VALUES (1108, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 2310, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1108, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

