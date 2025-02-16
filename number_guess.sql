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
    user_id integer NOT NULL,
    guesses integer DEFAULT 0 NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (74, 50, 3);
INSERT INTO public.games VALUES (75, 51, 7);
INSERT INTO public.games VALUES (76, 52, 4);
INSERT INTO public.games VALUES (77, 53, 50);
INSERT INTO public.games VALUES (78, 53, 207);
INSERT INTO public.games VALUES (79, 54, 786);
INSERT INTO public.games VALUES (80, 54, 477);
INSERT INTO public.games VALUES (81, 53, 541);
INSERT INTO public.games VALUES (82, 53, 702);
INSERT INTO public.games VALUES (83, 53, 177);
INSERT INTO public.games VALUES (84, 55, 179);
INSERT INTO public.games VALUES (85, 55, 47);
INSERT INTO public.games VALUES (86, 56, 61);
INSERT INTO public.games VALUES (87, 56, 27);
INSERT INTO public.games VALUES (88, 55, 624);
INSERT INTO public.games VALUES (89, 55, 246);
INSERT INTO public.games VALUES (90, 55, 223);
INSERT INTO public.games VALUES (91, 57, 130);
INSERT INTO public.games VALUES (92, 57, 761);
INSERT INTO public.games VALUES (93, 58, 252);
INSERT INTO public.games VALUES (94, 58, 785);
INSERT INTO public.games VALUES (95, 57, 541);
INSERT INTO public.games VALUES (96, 57, 722);
INSERT INTO public.games VALUES (97, 57, 620);
INSERT INTO public.games VALUES (98, 59, 789);
INSERT INTO public.games VALUES (99, 59, 939);
INSERT INTO public.games VALUES (100, 60, 279);
INSERT INTO public.games VALUES (101, 60, 33);
INSERT INTO public.games VALUES (102, 59, 60);
INSERT INTO public.games VALUES (103, 59, 365);
INSERT INTO public.games VALUES (104, 59, 249);
INSERT INTO public.games VALUES (105, 61, 590);
INSERT INTO public.games VALUES (106, 61, 524);
INSERT INTO public.games VALUES (107, 62, 976);
INSERT INTO public.games VALUES (108, 62, 919);
INSERT INTO public.games VALUES (109, 61, 227);
INSERT INTO public.games VALUES (110, 61, 293);
INSERT INTO public.games VALUES (111, 61, 970);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (50, '4');
INSERT INTO public.users VALUES (51, '5');
INSERT INTO public.users VALUES (52, '6');
INSERT INTO public.users VALUES (53, 'user_1729745390557');
INSERT INTO public.users VALUES (54, 'user_1729745390556');
INSERT INTO public.users VALUES (55, 'user_1729745420204');
INSERT INTO public.users VALUES (56, 'user_1729745420203');
INSERT INTO public.users VALUES (57, 'user_1729745485234');
INSERT INTO public.users VALUES (58, 'user_1729745485233');
INSERT INTO public.users VALUES (59, 'user_1729745497292');
INSERT INTO public.users VALUES (60, 'user_1729745497291');
INSERT INTO public.users VALUES (61, 'user_1729745512815');
INSERT INTO public.users VALUES (62, 'user_1729745512814');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 111, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 62, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users username_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT username_unique UNIQUE (username);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: games fk_user_games; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT fk_user_games FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

