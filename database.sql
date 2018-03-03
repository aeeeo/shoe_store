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
    price character varying,
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
    location character varying,
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
environment	default_env	2018-03-03 06:33:14.103124	2018-03-03 06:33:14.103124
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY brands (id, name, img_url, created_at, updated_at) FROM stdin;
1	Nike	http://content.nike.com/content/dam/one-nike/globalAssets/social_media_images/nike_swoosh_logo_black.png	2018-03-03 06:37:44.887076	2018-03-03 06:37:44.887076
2	Adidas	https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Adidas_Logo.svg/1200px-Adidas_Logo.svg.png	2018-03-03 06:38:08.83298	2018-03-03 06:38:08.83298
3	Fila	https://upload.wikimedia.org/wikipedia/commons/thumb/7/7f/Fila_logo.svg/1200px-Fila_logo.svg.png	2018-03-03 06:38:55.664815	2018-03-03 06:38:55.664815
4	Birkenstock	https://typographyfall2016.files.wordpress.com/2016/09/birkenstock-logo.png?w=840	2018-03-03 06:39:50.631469	2018-03-03 06:39:50.631469
5	Puma	https://rankabrand.org/uploads/brand/3488/PUMA%20logo.jpg	2018-03-03 06:40:31.763043	2018-03-03 06:40:31.763043
6	Vans	https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Vans-logo.svg/2000px-Vans-logo.svg.png	2018-03-03 06:41:18.278269	2018-03-03 06:41:18.278269
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
1	1	1	2018-03-03 06:51:57.853249	2018-03-03 06:51:57.853249
2	6	1	2018-03-03 06:52:19.358014	2018-03-03 06:52:19.358014
3	2	6	2018-03-03 06:55:11.070602	2018-03-03 06:55:11.070602
4	4	6	2018-03-03 06:55:14.969442	2018-03-03 06:55:14.969442
5	1	6	2018-03-03 06:55:19.420355	2018-03-03 06:55:19.420355
6	5	6	2018-03-03 06:55:22.260064	2018-03-03 06:55:22.260064
7	6	6	2018-03-03 06:55:25.312232	2018-03-03 06:55:25.312232
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY schema_migrations (version) FROM stdin;
20180303033608
\.


--
-- Data for Name: shoes; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY shoes (id, name, brand_id, price, created_at, updated_at) FROM stdin;
1	Adidas Consortium Eqt Adv Support 910	2	$0.00	2018-03-03 06:42:05.174754	2018-03-03 06:42:05.180787
2	Adidas Ultra Boost Uncaged	2	$0.00	2018-03-03 06:42:09.495175	2018-03-03 06:42:09.498736
3	Adidas Palace Pro Primeknit	2	$0.00	2018-03-03 06:42:22.386238	2018-03-03 06:42:22.389412
4	Bait X Adidas Stan Smith “420”	2	$0.00	2018-03-03 06:42:31.220893	2018-03-03 06:42:31.223397
5	Slam Jam X Adidas Tubular Nova	2	$0.00	2018-03-03 06:42:39.564266	2018-03-03 06:42:39.566783
6	Stan Smith Primeknit	2	$0.00	2018-03-03 06:42:47.052322	2018-03-03 06:42:47.054738
7	Arizona	4	$0.00	2018-03-03 06:43:46.106624	2018-03-03 06:43:46.109683
8	Gizeh	4	$0.00	2018-03-03 06:43:51.458656	2018-03-03 06:43:51.46247
9	Riva	4	$0.00	2018-03-03 06:43:59.124458	2018-03-03 06:43:59.127507
10	Mayari	4	$0.00	2018-03-03 06:44:01.263042	2018-03-03 06:44:01.265434
11	Adria	4	$0.00	2018-03-03 06:44:11.182728	2018-03-03 06:44:11.187396
12	Boston	4	$0.00	2018-03-03 06:44:13.119485	2018-03-03 06:44:13.121819
13	Florida	4	$0.00	2018-03-03 06:44:18.459791	2018-03-03 06:44:18.462335
14	Fila Original Fitness Athletic Shoe	3	$100.00	2018-03-03 06:46:18.813415	2018-03-03 06:46:43.479126
15	Fila Mb Athletic Shoe	3	$100.00	2018-03-03 06:46:31.040926	2018-03-03 06:47:02.297348
16	Fila Fx 100 Athletic Shoe	3	$100.00	2018-03-03 06:47:23.073865	2018-03-03 06:47:23.076392
17	Roshe	1	$75.00	2018-03-03 06:47:37.062502	2018-03-03 06:47:37.065731
18	Cortez	1	$75.00	2018-03-03 06:47:45.258054	2018-03-03 06:47:45.260812
19	Custom Nike Roshe	1	$125.00	2018-03-03 06:47:56.005483	2018-03-03 06:47:56.009279
20	Fly Net	1	$75.00	2018-03-03 06:48:03.61842	2018-03-03 06:48:03.621762
21	Air Force 1	1	$125.00	2018-03-03 06:48:15.437844	2018-03-03 06:48:15.441272
22	Puma Suede Classic Shoes	5	$65.00	2018-03-03 06:48:43.257006	2018-03-03 06:48:43.260803
23	Enzo Sneaker	5	$65.00	2018-03-03 06:48:56.530768	2018-03-03 06:48:56.533199
24	Tazon 6 Fm	5	$59.00	2018-03-03 06:49:13.368368	2018-03-03 06:49:20.425466
25	Old Skool	6	$60.00	2018-03-03 06:49:44.589099	2018-03-03 06:49:44.591752
\.


--
-- Data for Name: shoes_stores; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY shoes_stores (id, shoe_id, store_id, created_at, updated_at) FROM stdin;
1	17	1	2018-03-03 06:51:57.861736	2018-03-03 06:51:57.861736
2	18	1	2018-03-03 06:52:01.697043	2018-03-03 06:52:01.697043
3	21	1	2018-03-03 06:52:06.644473	2018-03-03 06:52:06.644473
4	20	1	2018-03-03 06:52:09.58439	2018-03-03 06:52:09.58439
5	25	1	2018-03-03 06:52:19.362809	2018-03-03 06:52:19.362809
6	1	6	2018-03-03 06:55:11.074569	2018-03-03 06:55:11.074569
7	6	6	2018-03-03 06:55:13.253633	2018-03-03 06:55:13.253633
8	9	6	2018-03-03 06:55:14.973164	2018-03-03 06:55:14.973164
9	13	6	2018-03-03 06:55:17.212907	2018-03-03 06:55:17.212907
10	18	6	2018-03-03 06:55:19.424244	2018-03-03 06:55:19.424244
11	22	6	2018-03-03 06:55:22.264406	2018-03-03 06:55:22.264406
12	25	6	2018-03-03 06:55:25.317669	2018-03-03 06:55:25.317669
13	7	6	2018-03-03 06:55:27.511767	2018-03-03 06:55:27.511767
14	23	6	2018-03-03 06:55:34.742336	2018-03-03 06:55:34.742336
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: Home
--

COPY stores (id, name, location, created_at, updated_at) FROM stdin;
1	Nike Outlet	97006	2018-03-03 06:34:29.334414	2018-03-03 06:35:35.721415
6	Foot Traffic	97548	2018-03-03 06:35:07.12955	2018-03-03 06:35:48.403615
5	Adidas Factory Store	97548	2018-03-03 06:34:59.689402	2018-03-03 06:36:04.775921
4	Nike Factory Outlet	97006	2018-03-03 06:34:51.725202	2018-03-03 06:36:21.312826
3	Columbia Sportswear Outlet Store At Historic Old Sellwood	97548	2018-03-03 06:34:43.391185	2018-03-03 06:36:31.872626
2	Buffalo Exchange	97213	2018-03-03 06:34:36.004767	2018-03-03 06:36:46.814429
\.


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('brands_id_seq', 6, true);


--
-- Name: brands_shoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('brands_shoes_id_seq', 1, false);


--
-- Name: brands_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('brands_stores_id_seq', 7, true);


--
-- Name: shoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('shoes_id_seq', 25, true);


--
-- Name: shoes_stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('shoes_stores_id_seq', 14, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Home
--

SELECT pg_catalog.setval('stores_id_seq', 6, true);


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

