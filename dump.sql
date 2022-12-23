--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- Name: sessions_userId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."sessions_userId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_userId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."sessions_userId_seq" OWNED BY public.sessions."userId";


--
-- Name: urls; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.urls (
    id integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: urls_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.urls_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: urls_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.urls_id_seq OWNED BY public.urls.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    email character varying(30) NOT NULL,
    password text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" date DEFAULT now() NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- Name: sessions userId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN "userId" SET DEFAULT nextval('public."sessions_userId_seq"'::regclass);


--
-- Name: urls id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls ALTER COLUMN id SET DEFAULT nextval('public.urls_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.sessions VALUES (1, 8, '5615cefc-7d20-4897-8abd-cc42179602e3', '2022-12-23 11:57:12.185827');
INSERT INTO public.sessions VALUES (2, 3, '46a608c3-b0b7-4488-8631-c9a063d33e42', '2022-12-23 12:00:24.28386');
INSERT INTO public.sessions VALUES (3, 1, '34829d68-0c17-425e-ad2e-c71032253432', '2022-12-23 12:00:44.049069');
INSERT INTO public.sessions VALUES (4, 6, 'f09d323d-af3e-42b0-bd29-e8077125fc0b', '2022-12-23 12:00:49.004302');
INSERT INTO public.sessions VALUES (5, 5, '805bec2d-4865-4e5c-9199-778c0ad8fbde', '2022-12-23 12:00:54.272126');
INSERT INTO public.sessions VALUES (6, 7, '80fc6e62-576d-46c9-aac4-82b7318febce', '2022-12-23 12:01:04.039977');


--
-- Data for Name: urls; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.urls VALUES (5, 'https://uol.com.br', 'ZOnIcK4GNJsbO', 0, 8, '2022-12-23 11:58:59.904111');
INSERT INTO public.urls VALUES (9, 'https://brandbucket.com', 'CbVWnM_SfxRrF', 0, 1, '2022-12-23 12:03:25.441025');
INSERT INTO public.urls VALUES (12, 'https://nytimes.com', '9j7OSSaQd4yFk', 0, 1, '2022-12-23 12:03:53.031623');
INSERT INTO public.urls VALUES (16, 'https://live.com', 'Ay8pXIaNnY4QS', 0, 3, '2022-12-23 12:05:14.727499');
INSERT INTO public.urls VALUES (18, 'https://pinterest.com', 'JGttcuOZ3y3ZC', 0, 3, '2022-12-23 12:05:44.201681');
INSERT INTO public.urls VALUES (19, 'https://amazon.co', 'pceNbLkkVVmAD', 0, 3, '2022-12-23 12:05:59.128622');
INSERT INTO public.urls VALUES (22, 'https://wp.com', 'vryvOpntY3HmD', 0, 3, '2022-12-23 12:06:29.511323');
INSERT INTO public.urls VALUES (23, 'https://estadao.com.br', 't7N_gVKQv3s5A', 0, 3, '2022-12-23 12:06:43.649526');
INSERT INTO public.urls VALUES (30, 'https://canada.ca', 'P6vAGNFan9jfw', 0, 5, '2022-12-23 12:09:30.167293');
INSERT INTO public.urls VALUES (31, 'https://aol.com', 'srwfNG1FiaR15', 0, 5, '2022-12-23 12:09:38.692024');
INSERT INTO public.urls VALUES (33, 'https://prezi.com', '4MfEn0EgsRnis', 0, 5, '2022-12-23 12:10:05.951708');
INSERT INTO public.urls VALUES (34, 'https://gov.br', 'ekwqLMbCvE7tl', 0, 5, '2022-12-23 12:10:18.082082');
INSERT INTO public.urls VALUES (42, 'https://berkeley.edu', '4G-pISEOJCA3Q', 0, 7, '2022-12-23 12:12:34.699292');
INSERT INTO public.urls VALUES (43, 'https://ted.com', 'UXiQojDkMd97w', 0, 7, '2022-12-23 12:12:47.828424');
INSERT INTO public.urls VALUES (17, 'https://pt.wikipedia.org', 'zj6VpK0WCmL6i', 4, 3, '2022-12-23 12:05:32.175769');
INSERT INTO public.urls VALUES (15, 'https://shoppify.com', 'PaYh9Zmox-v0z', 3, 1, '2022-12-23 12:04:30.317698');
INSERT INTO public.urls VALUES (41, 'https://naver.com', 'YC9XC5HBkWtHJ', 4, 7, '2022-12-23 12:12:23.782063');
INSERT INTO public.urls VALUES (36, 'https://capcom.co.jp', 'dcn2kd7g2XLhT', 1, 5, '2022-12-23 12:10:36.858488');
INSERT INTO public.urls VALUES (6, 'https://dailymotion.com', 'fcFh5MaLw_OFA', 6, 8, '2022-12-23 11:59:22.564683');
INSERT INTO public.urls VALUES (37, 'https://quora.com', 'RLMbAzRbBlcbY', 3, 5, '2022-12-23 12:10:47.165471');
INSERT INTO public.urls VALUES (45, 'https://sciencemag.org', '10T_aUOJ3LxiU', 2, 7, '2022-12-23 12:13:20.697528');
INSERT INTO public.urls VALUES (1, 'https://linkedin.com', 'F7Uus1FvHv9HI', 11, 8, '2022-12-23 11:58:17.960565');
INSERT INTO public.urls VALUES (38, 'https://youtube.com', 'TEg5dNsEfBnhX', 13, 5, '2022-12-23 12:10:52.824909');
INSERT INTO public.urls VALUES (32, 'https://lemonde.fr', '_SqPSE1Ck0CZh', 4, 5, '2022-12-23 12:09:53.68188');
INSERT INTO public.urls VALUES (2, 'https://apple.com', 'PR6OW96T5vi4G', 4, 8, '2022-12-23 11:58:30.107569');
INSERT INTO public.urls VALUES (13, 'https://www.yahoo.com', 'UJHz9J_sMJYsR', 6, 1, '2022-12-23 12:04:03.098059');
INSERT INTO public.urls VALUES (26, 'https://forbes.com', 'j7pejxBhnnGrF', 6, 6, '2022-12-23 12:07:50.202908');
INSERT INTO public.urls VALUES (40, 'https://images.google.com', 'vHgVrgMRD2RQv', 6, 7, '2022-12-23 12:12:03.487519');
INSERT INTO public.urls VALUES (44, 'https://mit.edu', 'i7HONfBuc9zLR', 5, 7, '2022-12-23 12:13:03.9011');
INSERT INTO public.urls VALUES (3, 'https://wordpress.com', 'befgWa3TMyNNi', 12, 8, '2022-12-23 11:58:36.871236');
INSERT INTO public.urls VALUES (7, 'https://jimdofree.com', 'sWC2AWaHlrOBb', 6, 1, '2022-12-23 12:03:03.64704');
INSERT INTO public.urls VALUES (27, 'https://webmotors.com.br', 'z-uvWPES58SkR', 3, 6, '2022-12-23 12:07:59.130615');
INSERT INTO public.urls VALUES (14, 'https://w3.org', 'qfmiSy9o8rNRH', 4, 1, '2022-12-23 12:04:16.584046');
INSERT INTO public.urls VALUES (29, 'https://nasa.gov', 'bkJVb2gtIlo03', 5, 5, '2022-12-23 12:09:13.978562');
INSERT INTO public.urls VALUES (25, 'https://usatoday.com', 'FkW9eKJ2dLfeC', 4, 6, '2022-12-23 12:07:37.395443');
INSERT INTO public.urls VALUES (21, 'https://shutterstock.com', 'PMCHX_39YeN7l', 4, 3, '2022-12-23 12:06:20.358187');
INSERT INTO public.urls VALUES (8, 'https://issuu.com', 'dFhiEHO1x0_iY', 4, 1, '2022-12-23 12:03:12.722958');
INSERT INTO public.urls VALUES (24, 'https://ig.com.br', 'Xt0MREMYEGD6u', 4, 6, '2022-12-23 12:07:10.981086');
INSERT INTO public.urls VALUES (20, 'https://tiktok.com', 'MALsXW5nHRMIO', 6, 3, '2022-12-23 12:06:09.627759');
INSERT INTO public.urls VALUES (39, 'https://mega.nz', '61CD2DVcjEAmO', 7, 7, '2022-12-23 12:11:50.495877');
INSERT INTO public.urls VALUES (10, 'https://gravatar.com', 'Z3Zwl7vv5_kRg', 4, 1, '2022-12-23 12:03:34.385045');
INSERT INTO public.urls VALUES (11, 'https://bbc.com', 'aG47DiO2c17Tm', 9, 1, '2022-12-23 12:03:39.68821');
INSERT INTO public.urls VALUES (35, 'https://ibm.com', 'lLggNiNoTiI9p', 5, 5, '2022-12-23 12:10:27.965417');
INSERT INTO public.urls VALUES (28, 'https://soundcloud.com', '8OkX38wsQih_B', 8, 6, '2022-12-23 12:08:15.151538');
INSERT INTO public.urls VALUES (4, 'https://microsoft.com', 'x9spxa9Ptp79S', 3, 8, '2022-12-23 11:58:46.0621');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (2, 'Luis', 'luis@teste.com', '$2b$10$PlKVy440ULklAobr7vg9Uev8VZ7jY6fgVesOlcj8D2yBkl6kJ0N4O', 0, '2022-12-23');
INSERT INTO public.users VALUES (4, 'Felipe Avô', 'felipe@teste.com', '$2b$10$mg6Dhdy4hROfaAuVLNSNXOGVxM/PpJISD73vDO6exQ5WuRpYyw9V.', 0, '2022-12-23');
INSERT INTO public.users VALUES (6, 'Alfredo Gallardo', 'alfredo@teste.com', '$2b$10$xIVxvqo.HO0Eq5a.neyLCuv4AOkkrxSpmmT907KIB5kQlZAhkI2Gy', 25, '2022-12-23');
INSERT INTO public.users VALUES (8, 'Geovanna Lucia', 'geovanna@teste.com', '$2b$10$EG9ywH.barq6LJs7Q5jfQu8.nZV2r/dhDTMpDbeaQRofRbNuPq2ZW', 36, '2022-12-23');
INSERT INTO public.users VALUES (1, 'Pedro', 'pedro@teste.com', '$2b$10$rHPszzlfqQTzxx4M/XD.hucSibr4p6avfNJsOvtKKgJL8UsaQ9t76', 36, '2022-12-23');
INSERT INTO public.users VALUES (9, 'Jorge Adalberto Ferreira', 'emaildojorge@email.com', '$2b$10$jBNyHoXYtk77sxHoE42xsudseBQhVeR4Of3axQc6Pro1/LEpQX6v6', 0, '2022-12-23');
INSERT INTO public.users VALUES (10, 'Amanda da Silva Silva', 'amandonha@email.com', '$2b$10$OkvVnf2DJ5/wxIBr6Usrw.9nXFbmMwqZbje/kiwwviaJlkfKpKkYC', 0, '2022-12-23');
INSERT INTO public.users VALUES (11, 'Fernanda Paes', 'fe@teste.com', '$2b$10$5owYtZqiIu5RjKV.dfxmI.CNLEeGPGwrSsxYKMxuWa6hsULNGlDn6', 0, '2022-12-23');
INSERT INTO public.users VALUES (3, 'Joao das Couves', 'joao@teste.com', '$2b$10$xh/tcR6cpb4OEUm3UbII3OpJHqczEGSje6BIf0Wu66AWRIw13SEz2', 14, '2022-12-23');
INSERT INTO public.users VALUES (12, 'Luzia Luisa', 'luzi@email.com', '$2b$10$1WSVweBUEDYzNyInZu7BTev3r0lx79Ul/ebOsFzZpXyMXZTUXO6FS', 0, '2022-12-23');
INSERT INTO public.users VALUES (13, 'Antonella da Costa', 'anton@email.com', '$2b$10$ZvwRJmtgLup6h2dXg4kV4.VLrlGOkhZ10vgi5D2kzTOu6ax9Zg5k6', 0, '2022-12-23');
INSERT INTO public.users VALUES (5, 'Polinario da Silva', 'poli@teste.com', '$2b$10$jBuaPx4Couorr.g0AnLFhevxIhSFFxTAOOAW.a.ybqRPvJOHMw1h6', 31, '2022-12-23');
INSERT INTO public.users VALUES (7, 'Sarah Farias da Silva', 'sarah@teste.com', '$2b$10$EUTux1J8RvulAU/YDmnAE..VhNny171W.J54dOLGsWUssU4Uj773O', 24, '2022-12-23');


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.sessions_id_seq', 6, true);


--
-- Name: sessions_userId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."sessions_userId_seq"', 1, false);


--
-- Name: urls_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.urls_id_seq', 45, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 13, true);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- Name: urls urls_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: urls urls_fk0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.urls
    ADD CONSTRAINT urls_fk0 FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

