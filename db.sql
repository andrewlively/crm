--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.12
-- Dumped by pg_dump version 9.3.12
-- Started on 2016-04-14 21:46:24 EDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11787)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2068 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 16412)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer (
    id bigint NOT NULL,
    name text,
    "createdAt" timestamp without time zone DEFAULT now(),
    location point
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 16410)
-- Name: Customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Customer_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Customer_id_seq" OWNER TO postgres;

--
-- TOC entry 2069 (class 0 OID 0)
-- Dependencies: 173
-- Name: Customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Customer_id_seq" OWNED BY customer.id;


--
-- TOC entry 176 (class 1259 OID 16424)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE item (
    id bigint NOT NULL,
    name text,
    price numeric NOT NULL
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 16422)
-- Name: Item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Item_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Item_id_seq" OWNER TO postgres;

--
-- TOC entry 2070 (class 0 OID 0)
-- Dependencies: 175
-- Name: Item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Item_id_seq" OWNED BY item.id;


--
-- TOC entry 172 (class 1259 OID 16399)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    id bigint NOT NULL,
    "firstName" text,
    "lastName" text,
    email text NOT NULL,
    password text NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 16397)
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO postgres;

--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 171
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "User_id_seq" OWNED BY "user".id;


--
-- TOC entry 187 (class 1259 OID 16516)
-- Name: communication; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE communication (
    id bigint NOT NULL,
    communication_type bigint NOT NULL,
    customer bigint NOT NULL,
    rep bigint NOT NULL,
    date timestamp without time zone DEFAULT now()
);


ALTER TABLE public.communication OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 16510)
-- Name: communication_communication_type_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE communication_communication_type_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_communication_type_seq OWNER TO postgres;

--
-- TOC entry 2072 (class 0 OID 0)
-- Dependencies: 184
-- Name: communication_communication_type_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE communication_communication_type_seq OWNED BY communication.communication_type;


--
-- TOC entry 185 (class 1259 OID 16512)
-- Name: communication_customer_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE communication_customer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_customer_seq OWNER TO postgres;

--
-- TOC entry 2073 (class 0 OID 0)
-- Dependencies: 185
-- Name: communication_customer_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE communication_customer_seq OWNED BY communication.customer;


--
-- TOC entry 183 (class 1259 OID 16508)
-- Name: communication_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE communication_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_id_seq OWNER TO postgres;

--
-- TOC entry 2074 (class 0 OID 0)
-- Dependencies: 183
-- Name: communication_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE communication_id_seq OWNED BY communication.id;


--
-- TOC entry 186 (class 1259 OID 16514)
-- Name: communication_rep_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE communication_rep_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_rep_seq OWNER TO postgres;

--
-- TOC entry 2075 (class 0 OID 0)
-- Dependencies: 186
-- Name: communication_rep_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE communication_rep_seq OWNED BY communication.rep;


--
-- TOC entry 182 (class 1259 OID 16499)
-- Name: communication_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE communication_type (
    id bigint NOT NULL,
    name text
);


ALTER TABLE public.communication_type OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 16497)
-- Name: communication_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE communication_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.communication_type_id_seq OWNER TO postgres;

--
-- TOC entry 2076 (class 0 OID 0)
-- Dependencies: 181
-- Name: communication_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE communication_type_id_seq OWNED BY communication_type.id;


--
-- TOC entry 180 (class 1259 OID 16475)
-- Name: sale; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sale (
    id bigint NOT NULL,
    item bigint NOT NULL,
    rep bigint NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


ALTER TABLE public.sale OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 16469)
-- Name: sale_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sale_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_id_seq OWNER TO postgres;

--
-- TOC entry 2077 (class 0 OID 0)
-- Dependencies: 177
-- Name: sale_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sale_id_seq OWNED BY sale.id;


--
-- TOC entry 178 (class 1259 OID 16471)
-- Name: sale_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sale_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_item_seq OWNER TO postgres;

--
-- TOC entry 2078 (class 0 OID 0)
-- Dependencies: 178
-- Name: sale_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sale_item_seq OWNED BY sale.item;


--
-- TOC entry 179 (class 1259 OID 16473)
-- Name: sale_rep_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sale_rep_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sale_rep_seq OWNER TO postgres;

--
-- TOC entry 2079 (class 0 OID 0)
-- Dependencies: 179
-- Name: sale_rep_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sale_rep_seq OWNED BY sale.rep;


--
-- TOC entry 1913 (class 2604 OID 16519)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication ALTER COLUMN id SET DEFAULT nextval('communication_id_seq'::regclass);


--
-- TOC entry 1914 (class 2604 OID 16520)
-- Name: communication_type; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication ALTER COLUMN communication_type SET DEFAULT nextval('communication_communication_type_seq'::regclass);


--
-- TOC entry 1915 (class 2604 OID 16521)
-- Name: customer; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication ALTER COLUMN customer SET DEFAULT nextval('communication_customer_seq'::regclass);


--
-- TOC entry 1916 (class 2604 OID 16522)
-- Name: rep; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication ALTER COLUMN rep SET DEFAULT nextval('communication_rep_seq'::regclass);


--
-- TOC entry 1912 (class 2604 OID 16502)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication_type ALTER COLUMN id SET DEFAULT nextval('communication_type_id_seq'::regclass);


--
-- TOC entry 1905 (class 2604 OID 16415)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY customer ALTER COLUMN id SET DEFAULT nextval('"Customer_id_seq"'::regclass);


--
-- TOC entry 1907 (class 2604 OID 16427)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item ALTER COLUMN id SET DEFAULT nextval('"Item_id_seq"'::regclass);


--
-- TOC entry 1908 (class 2604 OID 16478)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale ALTER COLUMN id SET DEFAULT nextval('sale_id_seq'::regclass);


--
-- TOC entry 1909 (class 2604 OID 16479)
-- Name: item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale ALTER COLUMN item SET DEFAULT nextval('sale_item_seq'::regclass);


--
-- TOC entry 1910 (class 2604 OID 16480)
-- Name: rep; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale ALTER COLUMN rep SET DEFAULT nextval('sale_rep_seq'::regclass);


--
-- TOC entry 1904 (class 2604 OID 16402)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- TOC entry 2080 (class 0 OID 0)
-- Dependencies: 173
-- Name: Customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Customer_id_seq"', 1, false);


--
-- TOC entry 2081 (class 0 OID 0)
-- Dependencies: 175
-- Name: Item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Item_id_seq"', 1, false);


--
-- TOC entry 2082 (class 0 OID 0)
-- Dependencies: 171
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"User_id_seq"', 1, true);


--
-- TOC entry 2060 (class 0 OID 16516)
-- Dependencies: 187
-- Data for Name: communication; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY communication (id, communication_type, customer, rep, date) FROM stdin;
\.


--
-- TOC entry 2083 (class 0 OID 0)
-- Dependencies: 184
-- Name: communication_communication_type_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('communication_communication_type_seq', 1, false);


--
-- TOC entry 2084 (class 0 OID 0)
-- Dependencies: 185
-- Name: communication_customer_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('communication_customer_seq', 1, false);


--
-- TOC entry 2085 (class 0 OID 0)
-- Dependencies: 183
-- Name: communication_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('communication_id_seq', 1, false);


--
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 186
-- Name: communication_rep_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('communication_rep_seq', 1, false);


--
-- TOC entry 2055 (class 0 OID 16499)
-- Dependencies: 182
-- Data for Name: communication_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY communication_type (id, name) FROM stdin;
1	phone
2	email
3	mail
\.


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 181
-- Name: communication_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('communication_type_id_seq', 1, false);


--
-- TOC entry 2047 (class 0 OID 16412)
-- Dependencies: 174
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (id, name, "createdAt", location) FROM stdin;
\.


--
-- TOC entry 2049 (class 0 OID 16424)
-- Dependencies: 176
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY item (id, name, price) FROM stdin;
\.


--
-- TOC entry 2053 (class 0 OID 16475)
-- Dependencies: 180
-- Data for Name: sale; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sale (id, item, rep, "createdAt") FROM stdin;
\.


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 177
-- Name: sale_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sale_id_seq', 1, false);


--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 178
-- Name: sale_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sale_item_seq', 1, false);


--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 179
-- Name: sale_rep_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sale_rep_seq', 1, false);


--
-- TOC entry 2045 (class 0 OID 16399)
-- Dependencies: 172
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, "firstName", "lastName", email, password) FROM stdin;
\.


--
-- TOC entry 1923 (class 2606 OID 16421)
-- Name: Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);


--
-- TOC entry 1925 (class 2606 OID 16432)
-- Name: Item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY item
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY (id);


--
-- TOC entry 1919 (class 2606 OID 16409)
-- Name: User_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);


--
-- TOC entry 1921 (class 2606 OID 16407)
-- Name: User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 1931 (class 2606 OID 16525)
-- Name: communication_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY communication
    ADD CONSTRAINT communication_pkey PRIMARY KEY (id);


--
-- TOC entry 1929 (class 2606 OID 16507)
-- Name: communication_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY communication_type
    ADD CONSTRAINT communication_type_pkey PRIMARY KEY (id);


--
-- TOC entry 1927 (class 2606 OID 16486)
-- Name: sale_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sale
    ADD CONSTRAINT sale_pkey PRIMARY KEY (id);


--
-- TOC entry 1934 (class 2606 OID 16526)
-- Name: communication_communication_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication
    ADD CONSTRAINT communication_communication_type_fkey FOREIGN KEY (communication_type) REFERENCES communication_type(id);


--
-- TOC entry 1935 (class 2606 OID 16531)
-- Name: communication_customer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication
    ADD CONSTRAINT communication_customer_fkey FOREIGN KEY (customer) REFERENCES customer(id);


--
-- TOC entry 1936 (class 2606 OID 16536)
-- Name: communication_rep_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY communication
    ADD CONSTRAINT communication_rep_fkey FOREIGN KEY (rep) REFERENCES "user"(id);


--
-- TOC entry 1932 (class 2606 OID 16487)
-- Name: sale_item_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale
    ADD CONSTRAINT sale_item_fkey FOREIGN KEY (item) REFERENCES item(id);


--
-- TOC entry 1933 (class 2606 OID 16492)
-- Name: sale_rep_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sale
    ADD CONSTRAINT sale_rep_fkey FOREIGN KEY (rep) REFERENCES "user"(id);


--
-- TOC entry 2067 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-04-14 21:46:25 EDT

--
-- PostgreSQL database dump complete
--

