--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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

ALTER TABLE IF EXISTS ONLY public.series DROP CONSTRAINT IF EXISTS "FK_94";
ALTER TABLE IF EXISTS ONLY public.series DROP CONSTRAINT IF EXISTS "FK_91";
ALTER TABLE IF EXISTS ONLY public.series DROP CONSTRAINT IF EXISTS "FK_88";
ALTER TABLE IF EXISTS ONLY public.bets DROP CONSTRAINT IF EXISTS "FK_76";
ALTER TABLE IF EXISTS ONLY public.bets DROP CONSTRAINT IF EXISTS "FK_71";
ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS "FK_64";
ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS "FK_61";
ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS "FK_58";
ALTER TABLE IF EXISTS ONLY public.players DROP CONSTRAINT IF EXISTS "FK_55";
ALTER TABLE IF EXISTS ONLY public.bets DROP CONSTRAINT IF EXISTS "FK_105";
ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS "FK_102";
DROP INDEX IF EXISTS public."fkIdx_94";
DROP INDEX IF EXISTS public."fkIdx_91";
DROP INDEX IF EXISTS public."fkIdx_88";
DROP INDEX IF EXISTS public."fkIdx_76";
DROP INDEX IF EXISTS public."fkIdx_71";
DROP INDEX IF EXISTS public."fkIdx_64";
DROP INDEX IF EXISTS public."fkIdx_61";
DROP INDEX IF EXISTS public."fkIdx_58";
DROP INDEX IF EXISTS public."fkIdx_55";
DROP INDEX IF EXISTS public."fkIdx_105";
DROP INDEX IF EXISTS public."fkIdx_102";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS "PK_user";
ALTER TABLE IF EXISTS ONLY public.teams DROP CONSTRAINT IF EXISTS "PK_teams";
ALTER TABLE IF EXISTS ONLY public.bets DROP CONSTRAINT IF EXISTS "PK_table_70";
ALTER TABLE IF EXISTS ONLY public.series DROP CONSTRAINT IF EXISTS "PK_series";
ALTER TABLE IF EXISTS ONLY public.players DROP CONSTRAINT IF EXISTS "PK_players";
ALTER TABLE IF EXISTS ONLY public.games DROP CONSTRAINT IF EXISTS "PK_games";
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.teams;
DROP TABLE IF EXISTS public.series;
DROP TABLE IF EXISTS public.players;
DROP TABLE IF EXISTS public.games;
DROP TABLE IF EXISTS public.bets;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: bets; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.bets (
    bet_id integer NOT NULL,
    user_id integer NOT NULL,
    w_team_id integer NOT NULL,
    n_games integer NOT NULL,
    series_id integer NOT NULL
);


--
-- Name: bets_bet_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.bets ALTER COLUMN bet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.bets_bet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: games; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    h_team_id integer NOT NULL,
    a_team_id integer NOT NULL,
    w_team_id integer NOT NULL,
    h_score integer NOT NULL,
    a_score integer NOT NULL,
    series_id integer NOT NULL
);


--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.games ALTER COLUMN game_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.games_game_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: players; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    p_first text NOT NULL,
    p_last text NOT NULL,
    team_id integer NOT NULL
);


--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.players ALTER COLUMN player_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.players_player_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: series; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.series (
    series_id integer NOT NULL,
    team1_id integer NOT NULL,
    team2_id integer NOT NULL,
    w_team_id integer NOT NULL,
    n_games integer NOT NULL
);


--
-- Name: series_series_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.series ALTER COLUMN series_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.series_series_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: teams; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    team_name text NOT NULL,
    confrence character(1) NOT NULL,
    logo text NOT NULL,
    standing integer NOT NULL
);


--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.teams ALTER COLUMN team_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.teams_team_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    u_first text NOT NULL,
    u_last text NOT NULL
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: bets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.bets (bet_id, user_id, w_team_id, n_games, series_id) FROM stdin;
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.games (game_id, h_team_id, a_team_id, w_team_id, h_score, a_score, series_id) FROM stdin;
\.


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.players (player_id, p_first, p_last, team_id) FROM stdin;
\.


--
-- Data for Name: series; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.series (series_id, team1_id, team2_id, w_team_id, n_games) FROM stdin;
\.


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.teams (team_id, team_name, confrence, logo, standing) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (user_id, u_first, u_last) FROM stdin;
\.


--
-- Name: bets_bet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.bets_bet_id_seq', 1, false);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.games_game_id_seq', 1, false);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.players_player_id_seq', 1, false);


--
-- Name: series_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.series_series_id_seq', 1, false);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_user_id_seq', 1, false);


--
-- Name: games PK_games; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT "PK_games" PRIMARY KEY (game_id);


--
-- Name: players PK_players; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT "PK_players" PRIMARY KEY (player_id);


--
-- Name: series PK_series; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT "PK_series" PRIMARY KEY (series_id);


--
-- Name: bets PK_table_70; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT "PK_table_70" PRIMARY KEY (bet_id);


--
-- Name: teams PK_teams; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT "PK_teams" PRIMARY KEY (team_id);


--
-- Name: users PK_user; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_user" PRIMARY KEY (user_id);


--
-- Name: fkIdx_102; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_102" ON public.games USING btree (series_id);


--
-- Name: fkIdx_105; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_105" ON public.bets USING btree (series_id);


--
-- Name: fkIdx_55; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_55" ON public.players USING btree (team_id);


--
-- Name: fkIdx_58; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_58" ON public.games USING btree (h_team_id);


--
-- Name: fkIdx_61; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_61" ON public.games USING btree (a_team_id);


--
-- Name: fkIdx_64; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_64" ON public.games USING btree (w_team_id);


--
-- Name: fkIdx_71; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_71" ON public.bets USING btree (user_id);


--
-- Name: fkIdx_76; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_76" ON public.bets USING btree (w_team_id);


--
-- Name: fkIdx_88; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_88" ON public.series USING btree (team1_id);


--
-- Name: fkIdx_91; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_91" ON public.series USING btree (team2_id);


--
-- Name: fkIdx_94; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "fkIdx_94" ON public.series USING btree (w_team_id);


--
-- Name: games FK_102; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT "FK_102" FOREIGN KEY (series_id) REFERENCES public.series(series_id);


--
-- Name: bets FK_105; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT "FK_105" FOREIGN KEY (series_id) REFERENCES public.series(series_id);


--
-- Name: players FK_55; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT "FK_55" FOREIGN KEY (team_id) REFERENCES public.teams(team_id);


--
-- Name: games FK_58; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT "FK_58" FOREIGN KEY (h_team_id) REFERENCES public.teams(team_id);


--
-- Name: games FK_61; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT "FK_61" FOREIGN KEY (a_team_id) REFERENCES public.teams(team_id);


--
-- Name: games FK_64; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT "FK_64" FOREIGN KEY (w_team_id) REFERENCES public.teams(team_id);


--
-- Name: bets FK_71; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT "FK_71" FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: bets FK_76; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.bets
    ADD CONSTRAINT "FK_76" FOREIGN KEY (w_team_id) REFERENCES public.teams(team_id);


--
-- Name: series FK_88; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT "FK_88" FOREIGN KEY (team1_id) REFERENCES public.teams(team_id);


--
-- Name: series FK_91; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT "FK_91" FOREIGN KEY (team2_id) REFERENCES public.teams(team_id);


--
-- Name: series FK_94; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.series
    ADD CONSTRAINT "FK_94" FOREIGN KEY (w_team_id) REFERENCES public.teams(team_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

