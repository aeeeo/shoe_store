--
-- PostgreSQL database dump
--

-- Dumped from database version 10.2
-- Dumped by pg_dump version 10.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Home";

--
-- Name: brands; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE brands (
    id bigint NOT NULL,
    name character varying,
    img_url character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE brands OWNER TO "Home";

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: Home
--

CREATE SEQUENCE brands_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_id_seq OWNER TO "Home";

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Home
--

ALTER SEQUENCE brands_id_seq OWNED BY brands.id;


--
-- Name: brands_shoes; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE brands_shoes (
    id bigint NOT NULL,
    brand_id integer,
    shoe_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE brands_shoes OWNER TO "Home";

--
-- Name: brands_shoes_id_seq; Type: SEQUENCE; Schema: public; Owner: Home
--

CREATE SEQUENCE brands_shoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_shoes_id_seq OWNER TO "Home";

--
-- Name: brands_shoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Home
--

ALTER SEQUENCE brands_shoes_id_seq OWNED BY brands_shoes.id;


--
-- Name: brands_stores; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE brands_stores (
    id bigint NOT NULL,
    brand_id integer,
    store_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE brands_stores OWNER TO "Home";

--
-- Name: brands_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: Home
--

CREATE SEQUENCE brands_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE brands_stores_id_seq OWNER TO "Home";

--
-- Name: brands_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Home
--

ALTER SEQUENCE brands_stores_id_seq OWNED BY brands_stores.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Home";

--
-- Name: shoes; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE shoes (
    id bigint NOT NULL,
    name character varying,
    brand_id integer,
    brand_name character varying,
    price integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE shoes OWNER TO "Home";

--
-- Name: shoes_id_seq; Type: SEQUENCE; Schema: public; Owner: Home
--

CREATE SEQUENCE shoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shoes_id_seq OWNER TO "Home";

--
-- Name: shoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Home
--

ALTER SEQUENCE shoes_id_seq OWNED BY shoes.id;


--
-- Name: shoes_stores; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE shoes_stores (
    id bigint NOT NULL,
    shoe_id integer,
    store_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE shoes_stores OWNER TO "Home";

--
-- Name: shoes_stores_id_seq; Type: SEQUENCE; Schema: public; Owner: Home
--

CREATE SEQUENCE shoes_stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE shoes_stores_id_seq OWNER TO "Home";

--
-- Name: shoes_stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Home
--

ALTER SEQUENCE shoes_stores_id_seq OWNED BY shoes_stores.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: Home
--

CREATE TABLE stores (
    id bigint NOT NULL,
    name character varying,
    location integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE stores OWNER TO "Home";

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: Home
--

CREATE SEQUENCE stores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE stores_id_seq OWNER TO "Home";

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Home
--

ALTER SEQUENCE stores_id_seq OWNED BY stores.id;


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: Home
--

ALTER TABLE ONLY brands ALTER COLUMN id SET DEFAULT nextval('brands_id_seq'::regclass);


--
-- Name: brands_shoes id; Type: DEFAULT; Schema: public; Owner: Home
--

ALTER TABLE ONLY brands_shoes ALTER COLUMN id SET DEFAULT nextval('brands_shoes_id_seq'::regclass);


--
-- Name: brands_stores id; Type: DEFAULT; Schema: public; Owner: Home
--

ALTER TABLE ONLY brands_stores ALTER COLUMN id SET DEFAULT nextval('brands_stores_id_seq'::regclass);


--
-- Name: shoes id; Type: DEFAULT; Schema: public; Owner: Home
--

ALTER TABLE ONLY shoes ALTER COLUMN id SET DEFAULT nextval('shoes_id_seq'::regclass);


--
-- Name: shoes_stores id; Type: DEFAULT; Schema: public; Owner: Home
--

ALTER TABLE ONLY shoes_stores ALTER COLUMN id SET DEFAULT nextval('shoes_stores_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: Home
--

ALTER TABLE ONLY stores ALTER COLUMN id SET DEFAULT nextval('stores_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2018-03-04 00:56:08.92761	2018-03-04 00:56:08.92761
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY brands (id, name, img_url, created_at, updated_at) FROM stdin;
1	Nike	data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAANMAAABLCAMAAADd7ELFAAAAYFBMVEX///8AAAD7+/tgYGDFxcXW1tZJSUni4uLs7Oz4+PjQ0NCNjY1tbW3z8/OSkpKmpqaCgoJ0dHTc3Nyurq4iIiK/v79TU1Oenp4RERFERERZWVkuLi4ZGRk5OTm4uLgdHR10sli1AAADzElEQVRogeWbbcOyLAyGI9/xXTMry/7/v7y1tFRUhgzyep7js45NxslgdTj8/zB/7YAoR+4TZabBDTwcWri8Z/JEhyc4HC0/LS3uY+Y91OAMBk4ckKrm593BIrF6b+Rx6pQQkjigZ0m1+2lyzOTUBGTHME/dEykVeySHSxP72QREDNODvRHahOx3mrzMN+5tPOTiw6XZaFJUoVMytILQUeXAKWpp3wKtOs1k+SceQlK+dA/wmzceqvzailOkp29Aj4i7vY6o25d2JeStINy/ARG7EFzs9LX4dpN6nhUZl0E85JJSURvuy8BOUi+LAzKhFNdjr3q/qcBBQbLcmMbTbEZbLHV2hKcXl2wkCB0nWAXEUHbKL6YqqLhmYl+YgIidb/SJdgZuuG6C8ajPJtz2pGtxe8FMMR2FkpXz8RDiS6iw3RvRvjvNCcIn6WQM+x87Wi8isiJgBaFHrAJioF9Lui4ijq6ZXmcEoUO0AmIZfCwtVUQjCLfFcMiGCoglGZhTH5O1KAh90iFskebQoNqYrGVB6KhiwI0Jl/AxtCm3MFc4ZnXw5AREAiSJ8kdWaxyjY16CwIuHVBsrIBZnbNhHMvuFJwgdj60V0AyT8Qw0wy8oTxD6YTFLZ3NiHLGGpTlkfhruEe5NlT0doMCwChKEjnMtcAcEoWCHkDXpOQVAEDqeqYWh3UOOZ3YYqcwOzWTG5BKnUsFpbbqaWq6brdEIuIDenJXsG4fZb7rpuEFjgflpQduMJljzwwlm37GpeKCC0AFtSGwgmR/xCT9weE4NF4SOi0GRlW7I0qhPWNUnJgh9RAINiQ2wQv6Bv3zNSDyetiGBLd0T0pXBzytf0zNL0Xx7I3kch7DuwHwbzm0E7r7+4gLyx3EAc5vT2Isgz9zwHZkXug7N03O1KZ5m3uWP4xB8vifNkr6ejSAIjPNj+UKED8ZxHMIRdgpAQEUFNI+rJyADpdAHkmkI6K6qAlqgVh6RHetukkSKI7qZirfXGZjeIioyDYntKJQ9W83J6IcxaaiA9MakpQLSGhNCQ0IKfI34YdJ1IGv5A6UhIcnKiVAcrIaEJA7fUyB4DQlZwm1nVTaifEe/y1y4NRJjJ0nXI5982A0JBIRugllu2A0JDBauYUE8f78ZzbN2GbbKPd6L0jGEy7+MWUNRQwKJLTLxm5ORAJQfw3iKRH6s/itEgqrSbAc1HQALuKYuBv+/YLvBgxw6jD0VQBCy9c23SnReO6JB04Xm5TWInb+xhmZwzdQe9Swq++abzh/LOBbXMusyiqIyL6jl/tnp+S/xD1xyK+sESFA5AAAAAElFTkSuQmCC	2018-03-04 01:25:27.484912	2018-03-04 01:25:27.484912
2	Adidas	data:image/png;base64,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	2018-03-04 04:57:11.753951	2018-03-04 07:00:03.51635
4	Fila	https://vignette.wikia.nocookie.net/logopedia/images/4/44/Fila_Black.svg/revision/latest?cb=20170722040415	2018-03-04 07:01:17.443411	2018-03-04 07:01:17.443411
3	Vans	https://i.pinimg.com/originals/f4/ae/61/f4ae616da5b1a5bbe5712394d76d4782.jpg	2018-03-04 04:57:16.388282	2018-03-04 07:04:22.973104
\.


--
-- Data for Name: brands_shoes; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY brands_shoes (id, brand_id, shoe_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: brands_stores; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY brands_stores (id, brand_id, store_id, created_at, updated_at) FROM stdin;
1	1	7	2018-03-04 01:58:53.22698	2018-03-04 01:58:53.22698
2	1	8	2018-03-04 02:10:08.243637	2018-03-04 02:10:08.243637
3	1	11	2018-03-04 04:00:12.122285	2018-03-04 04:00:12.122285
4	1	13	2018-03-04 04:08:23.389233	2018-03-04 04:08:23.389233
5	1	12	2018-03-04 04:18:10.259897	2018-03-04 04:18:10.259897
7	2	14	2018-03-04 04:57:49.211965	2018-03-04 04:57:49.211965
8	1	14	2018-03-04 04:57:53.868511	2018-03-04 04:57:53.868511
12	2	17	2018-03-04 05:47:02.285368	2018-03-04 05:47:02.285368
15	1	17	2018-03-04 06:10:39.058503	2018-03-04 06:10:39.058503
17	2	16	2018-03-04 06:35:29.356174	2018-03-04 06:35:29.356174
18	1	16	2018-03-04 06:39:17.384364	2018-03-04 06:39:17.384364
28	2	15	2018-03-04 06:52:35.480828	2018-03-04 06:52:35.480828
29	3	12	2018-03-04 16:42:17.373211	2018-03-04 16:42:17.373211
30	3	17	2018-03-04 17:12:53.890947	2018-03-04 17:12:53.890947
31	3	18	2018-03-04 17:19:42.721253	2018-03-04 17:19:42.721253
32	1	18	2018-03-04 17:19:43.79346	2018-03-04 17:19:43.79346
33	2	18	2018-03-04 17:19:44.686393	2018-03-04 17:19:44.686393
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY schema_migrations (version) FROM stdin;
20180304000738
\.


--
-- Data for Name: shoes; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY shoes (id, name, brand_id, brand_name, price, created_at, updated_at) FROM stdin;
2	Cortez	1	Nike	75	2018-03-04 01:27:56.090588	2018-03-04 03:22:46.199889
1	Roshe	1	Nike	75	2018-03-04 01:25:39.713847	2018-03-04 05:00:02.457278
4	Adidas Kicks 1	2	Adidas	75	2018-03-04 04:57:39.2462	2018-03-04 05:01:16.581375
3	Fly Knit	1	Nike	45	2018-03-04 04:08:12.31896	2018-03-04 05:09:43.537773
5	Old Skool Cool	3	Vans	45	2018-03-04 16:42:05.374264	2018-03-04 16:42:05.394393
\.


--
-- Data for Name: shoes_stores; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY shoes_stores (id, shoe_id, store_id, created_at, updated_at) FROM stdin;
1	1	7	2018-03-04 01:58:53.243938	2018-03-04 01:58:53.243938
2	2	7	2018-03-04 01:58:55.229494	2018-03-04 01:58:55.229494
3	1	8	2018-03-04 02:10:08.252558	2018-03-04 02:10:08.252558
4	2	8	2018-03-04 02:10:10.262935	2018-03-04 02:10:10.262935
5	2	11	2018-03-04 04:00:12.125862	2018-03-04 04:00:12.125862
6	1	11	2018-03-04 04:00:14.221863	2018-03-04 04:00:14.221863
7	1	13	2018-03-04 04:08:23.392974	2018-03-04 04:08:23.392974
8	3	13	2018-03-04 04:08:26.877872	2018-03-04 04:08:26.877872
9	2	13	2018-03-04 04:08:28.737143	2018-03-04 04:08:28.737143
10	3	12	2018-03-04 04:18:10.263102	2018-03-04 04:18:10.263102
14	4	14	2018-03-04 04:57:49.215629	2018-03-04 04:57:49.215629
15	3	14	2018-03-04 04:57:53.871498	2018-03-04 04:57:53.871498
79	4	15	2018-03-04 06:52:35.484328	2018-03-04 06:52:35.484328
80	1	15	2018-03-04 06:52:36.120571	2018-03-04 06:52:36.120571
81	2	15	2018-03-04 06:52:37.041788	2018-03-04 06:52:37.041788
82	3	17	2018-03-04 06:58:55.374648	2018-03-04 06:58:55.374648
83	4	17	2018-03-04 06:58:56.671924	2018-03-04 06:58:56.671924
84	5	12	2018-03-04 16:42:17.38255	2018-03-04 16:42:17.38255
85	1	17	2018-03-04 17:12:49.280436	2018-03-04 17:12:49.280436
86	2	17	2018-03-04 17:12:51.949761	2018-03-04 17:12:51.949761
87	5	17	2018-03-04 17:12:53.895509	2018-03-04 17:12:53.895509
88	5	18	2018-03-04 17:19:42.725057	2018-03-04 17:19:42.725057
89	3	18	2018-03-04 17:19:43.796774	2018-03-04 17:19:43.796774
90	4	18	2018-03-04 17:19:44.690317	2018-03-04 17:19:44.690317
91	1	18	2018-03-04 17:19:45.572402	2018-03-04 17:19:45.572402
92	2	18	2018-03-04 17:19:46.359232	2018-03-04 17:19:46.359232
60	3	16	2018-03-04 06:35:27.842582	2018-03-04 06:35:27.842582
61	4	16	2018-03-04 06:35:29.359447	2018-03-04 06:35:29.359447
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY stores (id, name, location, created_at, updated_at) FROM stdin;
15	Peltz Shoes	34243	2018-03-04 04:25:42.021756	2018-03-04 06:56:48.51006
13	Nike Outlet Store	97006	2018-03-04 03:40:49.868801	2018-03-04 06:57:16.214889
16	Adidas Wholesale Warehouse	34567	2018-03-04 05:11:04.340369	2018-03-04 06:57:55.455124
12	Goodwill	34567	2018-03-04 03:40:37.718861	2018-03-04 06:58:07.1551
11	Fila Outlet	12345	2018-03-04 03:40:30.263934	2018-03-04 06:58:44.551036
18	Sandals	56789	2018-03-04 17:19:29.555628	2018-03-04 17:19:29.555628
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('brands_id_seq', 4, true);


--
-- Name: brands_shoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('brands_shoes_id_seq', 1, false);


--
-- Name: brands_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('brands_stores_id_seq', 33, true);


--
-- Name: shoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('shoes_id_seq', 7, true);


--
-- Name: shoes_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('shoes_stores_id_seq', 92, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('stores_id_seq', 18, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: brands_shoes brands_shoes_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY brands_shoes
    ADD CONSTRAINT brands_shoes_pkey PRIMARY KEY (id);


--
-- Name: brands_stores brands_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY brands_stores
    ADD CONSTRAINT brands_stores_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: shoes shoes_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY shoes
    ADD CONSTRAINT shoes_pkey PRIMARY KEY (id);


--
-- Name: shoes_stores shoes_stores_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY shoes_stores
    ADD CONSTRAINT shoes_stores_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: Home
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

