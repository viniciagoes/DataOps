--
-- PostgreSQL database dump
--

\restrict a3QmJOkGQjoaZvcls0xWDSFCfhmdOFVbfkmiW9cVKG33sVEaawNBipqbQqJeGEY

-- Dumped from database version 18.1 (Debian 18.1-1.pgdg13+2)
-- Dumped by pg_dump version 18.1

-- Started on 2025-12-19 11:03:02 -03

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE IF EXISTS coffee_shop_db;
--
-- TOC entry 3512 (class 1262 OID 16823)
-- Name: coffee_shop_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE coffee_shop_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE coffee_shop_db OWNER TO postgres;

\unrestrict a3QmJOkGQjoaZvcls0xWDSFCfhmdOFVbfkmiW9cVKG33sVEaawNBipqbQqJeGEY
\connect coffee_shop_db
\restrict a3QmJOkGQjoaZvcls0xWDSFCfhmdOFVbfkmiW9cVKG33sVEaawNBipqbQqJeGEY

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 226 (class 1259 OID 16849)
-- Name: branches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.branches (
    branch_id integer NOT NULL,
    branch_name character varying(100),
    region_id integer
);


ALTER TABLE public.branches OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16848)
-- Name: branches_branch_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.branches_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.branches_branch_id_seq OWNER TO postgres;

--
-- TOC entry 3513 (class 0 OID 0)
-- Dependencies: 225
-- Name: branches_branch_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.branches_branch_id_seq OWNED BY public.branches.branch_id;


--
-- TOC entry 222 (class 1259 OID 16833)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16832)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 3514 (class 0 OID 0)
-- Dependencies: 221
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 224 (class 1259 OID 16841)
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(100),
    loyalty_tier character varying(20)
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16840)
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- TOC entry 3515 (class 0 OID 0)
-- Dependencies: 223
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- TOC entry 230 (class 1259 OID 16875)
-- Name: order_headers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_headers (
    order_id integer NOT NULL,
    customer_id integer,
    branch_id integer,
    order_timestamp timestamp without time zone
);


ALTER TABLE public.order_headers OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16874)
-- Name: order_headers_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_headers_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_headers_order_id_seq OWNER TO postgres;

--
-- TOC entry 3516 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_headers_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_headers_order_id_seq OWNED BY public.order_headers.order_id;


--
-- TOC entry 232 (class 1259 OID 16893)
-- Name: order_line_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_line_items (
    line_item_id integer NOT NULL,
    order_id integer,
    product_id integer,
    quantity integer
);


ALTER TABLE public.order_line_items OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16892)
-- Name: order_line_items_line_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_line_items_line_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_line_items_line_item_id_seq OWNER TO postgres;

--
-- TOC entry 3517 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_line_items_line_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_line_items_line_item_id_seq OWNED BY public.order_line_items.line_item_id;


--
-- TOC entry 228 (class 1259 OID 16862)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    product_name character varying(100),
    unit_price numeric(10,2),
    category integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16861)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 3518 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 220 (class 1259 OID 16825)
-- Name: regions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.regions (
    region_id integer NOT NULL,
    region_name character varying(50)
);


ALTER TABLE public.regions OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16824)
-- Name: regions_region_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.regions_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.regions_region_id_seq OWNER TO postgres;

--
-- TOC entry 3519 (class 0 OID 0)
-- Dependencies: 219
-- Name: regions_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.regions_region_id_seq OWNED BY public.regions.region_id;


--
-- TOC entry 3322 (class 2604 OID 16852)
-- Name: branches branch_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches ALTER COLUMN branch_id SET DEFAULT nextval('public.branches_branch_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 16836)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 16844)
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 16878)
-- Name: order_headers order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_headers ALTER COLUMN order_id SET DEFAULT nextval('public.order_headers_order_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 16896)
-- Name: order_line_items line_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_items ALTER COLUMN line_item_id SET DEFAULT nextval('public.order_line_items_line_item_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 16865)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 16828)
-- Name: regions region_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions ALTER COLUMN region_id SET DEFAULT nextval('public.regions_region_id_seq'::regclass);


--
-- TOC entry 3500 (class 0 OID 16849)
-- Dependencies: 226
-- Data for Name: branches; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.branches (branch_id, branch_name, region_id) VALUES (1, 'Alabama', 1);
INSERT INTO public.branches (branch_id, branch_name, region_id) VALUES (2, 'Massachusetts', 1);
INSERT INTO public.branches (branch_id, branch_name, region_id) VALUES (3, 'Montana', 1);
INSERT INTO public.branches (branch_id, branch_name, region_id) VALUES (4, 'New York', 1);
INSERT INTO public.branches (branch_id, branch_name, region_id) VALUES (5, 'Delaware', 1);


--
-- TOC entry 3496 (class 0 OID 16833)
-- Dependencies: 222
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (category_id, name) VALUES (1, 'Beverages');
INSERT INTO public.categories (category_id, name) VALUES (2, 'Foods');
INSERT INTO public.categories (category_id, name) VALUES (3, 'Sweets');


--
-- TOC entry 3498 (class 0 OID 16841)
-- Dependencies: 224
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (1, 'Alan', 'Young', 'Alan.Young@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (2, 'Lauren', 'Moore', 'Lauren.Moore@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (3, 'Tina', 'Carlson', 'Tina.Carlson@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (4, 'Zachary', 'Bridges', 'Zachary.Bridges@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (5, 'Robert', 'Molina', 'Robert.Molina@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (6, 'Adrian', 'Faulkner', 'Adrian.Faulkner@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (7, 'Russell', 'Sanders', 'Russell.Sanders@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (8, 'Michelle', 'Guzman', 'Michelle.Guzman@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (9, 'Shannon', 'Rosario', 'Shannon.Rosario@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (10, 'Christy', 'Walsh', 'Christy.Walsh@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (11, 'Thomas', 'Ryan', 'Thomas.Ryan@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (12, 'Jessica', 'Martinez', 'Jessica.Martinez@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (13, 'Benjamin', 'Reid', 'Benjamin.Reid@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (14, 'Carla', 'Lewis', 'Carla.Lewis@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (15, 'Andrea', 'Coffey', 'Andrea.Coffey@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (16, 'Andrew', 'Henderson', 'Andrew.Henderson@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (17, 'Bianca', 'Gilbert', 'Bianca.Gilbert@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (18, 'Elizabeth', 'Gilmore', 'Elizabeth.Gilmore@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (19, 'Kim', 'Foster', 'Kim.Foster@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (20, 'Rebecca', 'Sandoval', 'Rebecca.Sandoval@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (21, 'Chase', 'Rowland', 'Chase.Rowland@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (22, 'Matthew', 'Dougherty', 'Matthew.Dougherty@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (23, 'Jeff', 'Cox', 'Jeff.Cox@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (24, 'Jennifer', 'Davis', 'Jennifer.Davis@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (25, 'Connor', 'Moore', 'Connor.Moore@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (26, 'Courtney', 'Munoz', 'Courtney.Munoz@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (27, 'Brittany', 'Evans', 'Brittany.Evans@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (28, 'Jacqueline', 'Shaw', 'Jacqueline.Shaw@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (29, 'Jamie', 'Tran', 'Jamie.Tran@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (30, 'Mark', 'Combs', 'Mark.Combs@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (31, 'Miranda', 'Clark', 'Miranda.Clark@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (32, 'Lisa', 'Lam', 'Lisa.Lam@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (33, 'Lori', 'Williams', 'Lori.Williams@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (34, 'Ruth', 'Patrick', 'Ruth.Patrick@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (35, 'Cheryl', 'Smith', 'Cheryl.Smith@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (36, 'David', 'Li', 'David.Li@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (37, 'Alexander', 'Zuniga', 'Alexander.Zuniga@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (38, 'Steven', 'Peters', 'Steven.Peters@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (39, 'Tracy', 'Perez', 'Tracy.Perez@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (40, 'Darren', 'Banks', 'Darren.Banks@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (41, 'Carol', 'Hansen', 'Carol.Hansen@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (42, 'Trevor', 'Haas', 'Trevor.Haas@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (43, 'Joseph', 'Davidson', 'Joseph.Davidson@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (44, 'John', 'Garcia', 'John.Garcia@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (45, 'Brandon', 'Harrison', 'Brandon.Harrison@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (46, 'Andrew', 'King', 'Andrew.King@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (47, 'Jorge', 'Wells', 'Jorge.Wells@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (48, 'Rebecca', 'Evans', 'Rebecca.Evans@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (49, 'Michaela', 'Bowers', 'Michaela.Bowers@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (50, 'Joseph', 'Harding', 'Joseph.Harding@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (51, 'Joseph', 'Hays', 'Joseph.Hays@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (52, 'Jennifer', 'Schwartz', 'Jennifer.Schwartz@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (53, 'Rebecca', 'Wilcox', 'Rebecca.Wilcox@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (54, 'Theodore', 'Campbell', 'Theodore.Campbell@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (55, 'Amanda', 'Scott', 'Amanda.Scott@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (56, 'Joanna', 'Torres', 'Joanna.Torres@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (57, 'Larry', 'Taylor', 'Larry.Taylor@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (58, 'Matthew', 'Arnold', 'Matthew.Arnold@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (59, 'Jonathan', 'Mcgee', 'Jonathan.Mcgee@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (60, 'Gabriela', 'Dean', 'Gabriela.Dean@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (61, 'Rhonda', 'Sanchez', 'Rhonda.Sanchez@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (62, 'Jacob', 'Campbell', 'Jacob.Campbell@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (63, 'Jessica', 'Rosales', 'Jessica.Rosales@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (64, 'Raymond', 'Coleman', 'Raymond.Coleman@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (65, 'Alfred', 'Young', 'Alfred.Young@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (66, 'Summer', 'Downs', 'Summer.Downs@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (67, 'Sara', 'Gilmore', 'Sara.Gilmore@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (68, 'Michael', 'Gallagher', 'Michael.Gallagher@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (69, 'Brian', 'Day', 'Brian.Day@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (70, 'David', 'Graham', 'David.Graham@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (71, 'Monique', 'Tucker', 'Monique.Tucker@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (72, 'William', 'Rivas', 'William.Rivas@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (73, 'Annette', 'Rivera', 'Annette.Rivera@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (74, 'Zachary', 'Thompson', 'Zachary.Thompson@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (75, 'Jessica', 'Wolf', 'Jessica.Wolf@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (76, 'Anna', 'Bennett', 'Anna.Bennett@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (77, 'Christine', 'Peterson', 'Christine.Peterson@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (78, 'Tara', 'Stanley', 'Tara.Stanley@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (79, 'Jennifer', 'Wilson', 'Jennifer.Wilson@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (80, 'Jeremy', 'Manning', 'Jeremy.Manning@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (81, 'Willie', 'Garcia', 'Willie.Garcia@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (82, 'Thomas', 'Moreno', 'Thomas.Moreno@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (83, 'Tara', 'Mclaughlin', 'Tara.Mclaughlin@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (84, 'Edward', 'Welch', 'Edward.Welch@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (85, 'Rebecca', 'Clark', 'Rebecca.Clark@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (86, 'Samuel', 'Clarke', 'Samuel.Clarke@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (87, 'William', 'Owens', 'William.Owens@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (88, 'Justin', 'Henry', 'Justin.Henry@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (89, 'April', 'Carson', 'April.Carson@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (90, 'Kimberly', 'Beasley', 'Kimberly.Beasley@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (91, 'Keith', 'Watson', 'Keith.Watson@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (92, 'Cassidy', 'Rodriguez', 'Cassidy.Rodriguez@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (93, 'Connie', 'Rowe', 'Connie.Rowe@email.com', 'Bronze');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (94, 'David', 'Tran', 'David.Tran@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (95, 'James', 'Allen', 'James.Allen@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (96, 'Jerry', 'Phelps', 'Jerry.Phelps@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (97, 'Thomas', 'Roberts', 'Thomas.Roberts@email.com', 'Silver');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (98, 'Joseph', 'Walker', 'Joseph.Walker@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (99, 'Sandra', 'Mccann', 'Sandra.Mccann@email.com', 'Gold');
INSERT INTO public.customers (customer_id, first_name, last_name, email, loyalty_tier) VALUES (100, 'Erika', 'Ayala', 'Erika.Ayala@email.com', 'Silver');


--
-- TOC entry 3504 (class 0 OID 16875)
-- Dependencies: 230
-- Data for Name: order_headers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (1, 62, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (2, 46, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (3, 54, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (4, 81, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (5, 21, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (6, 3, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (7, 32, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (8, 29, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (9, 79, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (10, 79, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (11, 86, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (12, 21, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (13, 77, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (14, 86, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (15, 61, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (16, 1, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (17, 5, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (18, 40, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (19, 64, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (20, 77, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (21, 67, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (22, 79, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (23, 80, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (24, 68, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (25, 49, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (26, 78, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (27, 84, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (28, 7, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (29, 55, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (30, 41, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (31, 18, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (32, 33, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (33, 61, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (34, 16, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (35, 12, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (36, 45, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (37, 37, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (38, 48, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (39, 46, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (40, 82, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (41, 95, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (42, 60, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (43, 10, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (44, 29, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (45, 12, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (46, 66, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (47, 32, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (48, 32, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (49, 47, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (50, 84, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (51, 86, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (52, 4, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (53, 2, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (54, 48, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (55, 16, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (56, 96, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (57, 4, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (58, 6, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (59, 36, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (60, 21, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (61, 77, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (62, 20, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (63, 38, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (64, 38, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (65, 89, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (66, 77, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (67, 54, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (68, 20, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (69, 29, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (70, 19, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (71, 95, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (72, 31, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (73, 19, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (74, 49, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (75, 4, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (76, 82, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (77, 73, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (78, 30, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (79, 86, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (80, 73, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (81, 94, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (82, 38, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (83, 46, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (84, 49, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (85, 33, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (86, 93, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (87, 11, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (88, 57, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (89, 9, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (90, 27, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (91, 30, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (92, 32, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (93, 47, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (94, 88, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (95, 7, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (96, 9, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (97, 21, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (98, 47, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (99, 70, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (100, 9, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (101, 62, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (102, 28, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (103, 73, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (104, 45, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (105, 31, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (106, 25, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (107, 44, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (108, 50, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (109, 51, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (110, 92, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (111, 51, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (112, 28, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (113, 15, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (114, 81, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (115, 24, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (116, 23, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (117, 19, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (118, 64, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (119, 31, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (120, 39, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (121, 86, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (122, 42, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (123, 15, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (124, 16, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (125, 52, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (126, 97, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (127, 44, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (128, 27, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (129, 50, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (130, 8, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (131, 45, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (132, 97, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (133, 58, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (134, 72, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (135, 25, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (136, 54, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (137, 80, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (138, 62, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (139, 84, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (140, 80, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (141, 27, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (142, 63, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (143, 74, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (144, 39, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (145, 82, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (146, 67, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (147, 58, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (148, 42, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (149, 76, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (150, 62, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (151, 81, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (152, 71, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (153, 26, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (154, 49, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (155, 9, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (156, 26, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (157, 93, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (158, 76, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (159, 65, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (160, 98, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (161, 69, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (162, 8, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (163, 77, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (164, 52, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (165, 7, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (166, 27, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (167, 61, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (168, 79, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (169, 1, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (170, 65, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (171, 82, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (172, 38, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (173, 81, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (174, 67, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (175, 3, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (176, 3, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (177, 54, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (178, 42, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (179, 40, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (180, 4, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (181, 14, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (182, 70, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (183, 69, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (184, 25, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (185, 28, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (186, 67, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (187, 87, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (188, 11, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (189, 38, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (190, 81, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (191, 53, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (192, 31, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (193, 12, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (194, 96, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (195, 13, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (196, 46, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (197, 90, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (198, 26, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (199, 32, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (200, 34, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (201, 49, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (202, 68, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (203, 50, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (204, 84, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (205, 30, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (206, 26, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (207, 61, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (208, 86, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (209, 100, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (210, 21, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (211, 24, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (212, 59, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (213, 31, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (214, 3, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (215, 73, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (216, 41, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (217, 70, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (218, 59, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (219, 36, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (220, 42, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (221, 92, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (222, 53, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (223, 84, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (224, 41, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (225, 20, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (226, 9, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (227, 91, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (228, 11, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (229, 19, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (230, 14, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (231, 42, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (232, 14, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (233, 93, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (234, 19, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (235, 78, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (236, 18, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (237, 42, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (238, 20, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (239, 57, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (240, 9, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (241, 98, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (242, 83, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (243, 75, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (244, 72, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (245, 19, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (246, 30, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (247, 88, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (248, 99, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (249, 44, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (250, 85, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (251, 88, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (252, 21, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (253, 16, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (254, 36, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (255, 16, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (256, 98, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (257, 79, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (258, 39, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (259, 75, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (260, 45, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (261, 11, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (262, 7, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (263, 37, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (264, 43, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (265, 87, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (266, 43, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (267, 83, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (268, 43, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (269, 23, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (270, 51, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (271, 94, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (272, 63, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (273, 2, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (274, 62, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (275, 84, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (276, 48, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (277, 41, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (278, 16, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (279, 61, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (280, 40, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (281, 10, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (282, 79, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (283, 12, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (284, 58, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (285, 13, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (286, 75, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (287, 89, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (288, 19, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (289, 13, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (290, 94, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (291, 93, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (292, 92, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (293, 98, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (294, 6, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (295, 44, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (296, 82, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (297, 94, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (298, 69, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (299, 44, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (300, 49, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (301, 11, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (302, 31, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (303, 8, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (304, 30, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (305, 56, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (306, 64, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (307, 93, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (308, 29, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (309, 25, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (310, 97, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (311, 67, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (312, 95, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (313, 83, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (314, 77, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (315, 55, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (316, 8, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (317, 53, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (318, 15, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (319, 49, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (320, 35, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (321, 81, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (322, 57, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (323, 49, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (324, 35, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (325, 41, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (326, 96, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (327, 10, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (328, 44, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (329, 75, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (330, 44, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (331, 79, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (332, 57, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (333, 15, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (334, 7, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (335, 13, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (336, 10, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (337, 35, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (338, 74, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (339, 36, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (340, 26, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (341, 10, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (342, 71, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (343, 99, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (344, 19, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (345, 13, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (346, 11, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (347, 34, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (348, 34, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (349, 95, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (350, 4, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (351, 31, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (352, 24, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (353, 79, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (354, 79, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (355, 83, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (356, 79, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (357, 88, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (358, 72, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (359, 26, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (360, 28, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (361, 46, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (362, 90, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (363, 29, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (364, 2, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (365, 50, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (366, 36, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (367, 21, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (368, 1, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (369, 7, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (370, 48, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (371, 29, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (372, 17, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (373, 8, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (374, 81, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (375, 80, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (376, 5, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (377, 22, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (378, 45, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (379, 61, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (380, 51, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (381, 23, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (382, 50, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (383, 80, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (384, 30, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (385, 85, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (386, 74, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (387, 34, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (388, 86, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (389, 15, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (390, 86, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (391, 28, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (392, 46, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (393, 38, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (394, 57, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (395, 55, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (396, 84, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (397, 81, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (398, 39, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (399, 80, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (400, 3, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (401, 72, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (402, 64, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (403, 75, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (404, 63, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (405, 16, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (406, 4, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (407, 86, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (408, 36, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (409, 10, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (410, 88, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (411, 99, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (412, 40, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (413, 7, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (414, 19, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (415, 22, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (416, 46, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (417, 35, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (418, 41, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (419, 66, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (420, 9, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (421, 56, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (422, 53, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (423, 99, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (424, 16, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (425, 76, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (426, 90, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (427, 41, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (428, 42, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (429, 89, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (430, 40, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (431, 54, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (432, 46, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (433, 3, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (434, 19, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (435, 86, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (436, 44, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (437, 9, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (438, 75, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (439, 37, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (440, 94, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (441, 69, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (442, 30, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (443, 84, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (444, 42, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (445, 12, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (446, 86, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (447, 64, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (448, 55, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (449, 4, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (450, 16, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (451, 96, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (452, 78, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (453, 29, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (454, 73, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (455, 13, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (456, 64, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (457, 29, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (458, 62, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (459, 17, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (460, 67, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (461, 77, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (462, 38, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (463, 62, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (464, 21, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (465, 89, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (466, 16, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (467, 63, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (468, 69, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (469, 2, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (470, 26, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (471, 9, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (472, 90, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (473, 91, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (474, 47, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (475, 74, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (476, 2, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (477, 68, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (478, 63, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (479, 30, 4, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (480, 2, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (481, 10, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (482, 29, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (483, 78, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (484, 88, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (485, 67, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (486, 19, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (487, 78, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (488, 78, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (489, 86, 1, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (490, 6, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (491, 94, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (492, 8, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (493, 97, 3, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (494, 13, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (495, 2, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (496, 89, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (497, 71, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (498, 65, 5, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (499, 37, 2, '2025-12-18 09:11:20.636397');
INSERT INTO public.order_headers (order_id, customer_id, branch_id, order_timestamp) VALUES (500, 17, 3, '2025-12-18 09:11:20.636397');


--
-- TOC entry 3506 (class 0 OID 16893)
-- Dependencies: 232
-- Data for Name: order_line_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1, 1, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (2, 2, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (3, 3, 23, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (4, 3, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (5, 4, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (6, 4, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (7, 4, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (8, 4, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (9, 4, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (10, 4, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (11, 5, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (12, 5, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (13, 5, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (14, 5, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (15, 5, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (16, 6, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (17, 6, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (18, 6, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (19, 7, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (20, 7, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (21, 7, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (22, 7, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (23, 7, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (24, 8, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (25, 8, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (26, 8, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (27, 8, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (28, 9, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (29, 9, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (30, 9, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (31, 9, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (32, 9, 10, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (33, 9, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (34, 10, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (35, 11, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (36, 11, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (37, 11, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (38, 11, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (39, 12, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (40, 12, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (41, 12, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (42, 13, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (43, 13, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (44, 14, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (45, 14, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (46, 14, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (47, 15, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (48, 15, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (49, 15, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (50, 15, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (51, 15, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (52, 15, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (53, 16, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (54, 16, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (55, 16, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (56, 16, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (57, 16, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (58, 17, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (59, 17, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (60, 18, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (61, 18, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (62, 18, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (63, 18, 1, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (64, 19, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (65, 19, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (66, 19, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (67, 19, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (68, 19, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (69, 19, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (70, 20, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (71, 21, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (72, 21, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (73, 21, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (74, 21, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (75, 21, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (76, 22, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (77, 23, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (78, 23, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (79, 24, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (80, 24, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (81, 25, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (82, 25, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (83, 25, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (84, 25, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (85, 25, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (86, 26, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (87, 26, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (88, 26, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (89, 27, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (90, 27, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (91, 27, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (92, 27, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (93, 27, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (94, 27, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (95, 28, 10, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (96, 28, 23, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (97, 28, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (98, 28, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (99, 29, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (100, 29, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (101, 29, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (102, 29, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (103, 29, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (104, 29, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (105, 30, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (106, 31, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (107, 31, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (108, 31, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (109, 31, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (110, 32, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (111, 32, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (112, 33, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (113, 33, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (114, 33, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (115, 33, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (116, 34, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (117, 34, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (118, 34, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (119, 34, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (120, 35, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (121, 35, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (122, 35, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (123, 35, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (124, 35, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (125, 35, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (126, 36, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (127, 36, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (128, 36, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (129, 36, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (130, 36, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (131, 36, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (132, 37, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (133, 37, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (134, 38, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (135, 38, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (136, 38, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (137, 38, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (138, 38, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (139, 39, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (140, 39, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (141, 39, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (142, 39, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (143, 39, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (144, 40, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (145, 41, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (146, 42, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (147, 43, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (148, 43, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (149, 43, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (150, 43, 11, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (151, 43, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (152, 43, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (153, 44, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (154, 44, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (155, 44, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (156, 45, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (157, 45, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (158, 46, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (159, 46, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (160, 46, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (161, 47, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (162, 47, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (163, 47, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (164, 47, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (165, 47, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (166, 48, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (167, 49, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (168, 49, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (169, 49, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (170, 49, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (171, 50, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (172, 50, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (173, 51, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (174, 52, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (175, 52, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (176, 53, 10, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (177, 54, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (178, 54, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (179, 54, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (180, 54, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (181, 54, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (182, 55, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (183, 55, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (184, 56, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (185, 56, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (186, 56, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (187, 56, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (188, 56, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (189, 56, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (190, 57, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (191, 57, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (192, 57, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (193, 57, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (194, 57, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (195, 57, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (196, 58, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (197, 58, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (198, 58, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (199, 58, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (200, 58, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (201, 59, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (202, 59, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (203, 59, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (204, 59, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (205, 59, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (206, 60, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (207, 60, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (208, 61, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (209, 61, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (210, 61, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (211, 61, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (212, 61, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (213, 61, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (214, 62, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (215, 63, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (216, 63, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (217, 63, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (218, 63, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (219, 64, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (220, 64, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (221, 64, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (222, 64, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (223, 65, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (224, 65, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (225, 66, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (226, 66, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (227, 66, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (228, 66, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (229, 66, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (230, 67, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (231, 67, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (232, 67, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (233, 68, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (234, 68, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (235, 68, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (236, 68, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (237, 68, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (238, 68, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (239, 69, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (240, 70, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (241, 70, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (242, 70, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (243, 70, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (244, 70, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (245, 70, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (246, 71, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (247, 71, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (248, 71, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (249, 71, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (250, 71, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (251, 71, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (252, 72, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (253, 72, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (254, 72, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (255, 72, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (256, 72, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (257, 72, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (258, 73, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (259, 73, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (260, 73, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (261, 73, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (262, 74, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (263, 74, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (264, 74, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (265, 74, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (266, 75, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (267, 75, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (268, 75, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (269, 75, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (270, 75, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (271, 75, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (272, 76, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (273, 76, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (274, 76, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (275, 76, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (276, 76, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (277, 76, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (278, 77, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (279, 77, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (280, 77, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (281, 77, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (282, 77, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (283, 78, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (284, 78, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (285, 78, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (286, 78, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (287, 78, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (288, 79, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (289, 79, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (290, 79, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (291, 79, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (292, 79, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (293, 79, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (294, 80, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (295, 80, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (296, 80, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (297, 80, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (298, 80, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (299, 81, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (300, 81, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (301, 81, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (302, 81, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (303, 81, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (304, 82, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (305, 82, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (306, 82, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (307, 82, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (308, 82, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (309, 82, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (310, 83, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (311, 84, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (312, 84, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (313, 85, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (314, 85, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (315, 86, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (316, 86, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (317, 86, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (318, 86, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (319, 86, 9, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (320, 87, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (321, 87, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (322, 87, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (323, 87, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (324, 87, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (325, 87, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (326, 88, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (327, 88, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (328, 88, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (329, 89, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (330, 90, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (331, 90, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (332, 90, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (333, 91, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (334, 91, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (335, 91, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (336, 91, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (337, 92, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (338, 92, 11, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (339, 92, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (340, 92, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (341, 92, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (342, 92, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (343, 93, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (344, 93, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (345, 93, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (346, 93, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (347, 93, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (348, 93, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (349, 94, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (350, 94, 11, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (351, 94, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (352, 94, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (353, 94, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (354, 94, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (355, 95, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (356, 95, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (357, 95, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (358, 95, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (359, 95, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (360, 96, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (361, 96, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (362, 96, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (363, 96, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (364, 97, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (365, 97, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (366, 97, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (367, 98, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (368, 98, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (369, 98, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (370, 98, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (371, 98, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (372, 98, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (373, 99, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (374, 99, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (375, 99, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (376, 99, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (377, 100, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (378, 100, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (379, 100, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (380, 100, 29, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (381, 100, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (382, 101, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (383, 101, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (384, 101, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (385, 101, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (386, 102, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (387, 102, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (388, 102, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (389, 102, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (390, 102, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (391, 103, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (392, 103, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (393, 104, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (394, 104, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (395, 104, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (396, 104, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (397, 104, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (398, 104, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (399, 105, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (400, 105, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (401, 105, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (402, 105, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (403, 105, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (404, 106, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (405, 107, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (406, 107, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (407, 107, 29, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (408, 107, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (409, 107, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (410, 107, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (411, 108, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (412, 108, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (413, 108, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (414, 109, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (415, 109, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (416, 109, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (417, 109, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (418, 109, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (419, 109, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (420, 110, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (421, 110, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (422, 111, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (423, 112, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (424, 112, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (425, 112, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (426, 112, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (427, 112, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (428, 113, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (429, 114, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (430, 114, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (431, 114, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (432, 115, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (433, 115, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (434, 115, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (435, 115, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (436, 115, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (437, 116, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (438, 117, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (439, 117, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (440, 117, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (441, 117, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (442, 117, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (443, 117, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (444, 118, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (445, 118, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (446, 119, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (447, 119, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (448, 119, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (449, 120, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (450, 120, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (451, 120, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (452, 120, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (453, 121, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (454, 122, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (455, 123, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (456, 123, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (457, 123, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (458, 123, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (459, 124, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (460, 124, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (461, 124, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (462, 124, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (463, 124, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (464, 124, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (465, 125, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (466, 125, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (467, 125, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (468, 125, 23, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (469, 126, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (470, 126, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (471, 126, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (472, 127, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (473, 128, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (474, 128, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (475, 128, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (476, 129, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (477, 129, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (478, 129, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (479, 129, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (480, 129, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (481, 130, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (482, 130, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (483, 130, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (484, 130, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (485, 130, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (486, 131, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (487, 131, 20, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (488, 131, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (489, 131, 22, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (490, 131, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (491, 132, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (492, 132, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (493, 132, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (494, 132, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (495, 132, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (496, 133, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (497, 134, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (498, 134, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (499, 134, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (500, 134, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (501, 134, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (502, 134, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (503, 135, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (504, 136, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (505, 137, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (506, 137, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (507, 137, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (508, 137, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (509, 137, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (510, 138, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (511, 138, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (512, 138, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (513, 138, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (514, 138, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (515, 138, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (516, 139, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (517, 139, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (518, 139, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (519, 139, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (520, 140, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (521, 140, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (522, 140, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (523, 140, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (524, 141, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (525, 141, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (526, 141, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (527, 141, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (528, 142, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (529, 142, 10, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (530, 142, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (531, 142, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (532, 143, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (533, 143, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (534, 143, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (535, 143, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (536, 144, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (537, 144, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (538, 144, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (539, 144, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (540, 144, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (541, 144, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (542, 145, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (543, 145, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (544, 146, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (545, 146, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (546, 146, 22, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (547, 146, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (548, 146, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (549, 147, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (550, 147, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (551, 147, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (552, 147, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (553, 147, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (554, 148, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (555, 148, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (556, 148, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (557, 148, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (558, 148, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (559, 148, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (560, 149, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (561, 150, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (562, 150, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (563, 150, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (564, 150, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (565, 150, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (566, 151, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (567, 152, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (568, 152, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (569, 152, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (570, 152, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (571, 153, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (572, 153, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (573, 153, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (574, 153, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (575, 154, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (576, 154, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (577, 154, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (578, 154, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (579, 154, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (580, 154, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (581, 155, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (582, 155, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (583, 155, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (584, 155, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (585, 155, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (586, 155, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (587, 156, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (588, 156, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (589, 156, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (590, 156, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (591, 157, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (592, 157, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (593, 157, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (594, 158, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (595, 158, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (596, 158, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (597, 158, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (598, 158, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (599, 158, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (600, 159, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (601, 159, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (602, 159, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (603, 159, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (604, 159, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (605, 159, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (606, 160, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (607, 160, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (608, 160, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (609, 161, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (610, 161, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (611, 161, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (612, 161, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (613, 162, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (614, 162, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (615, 162, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (616, 163, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (617, 163, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (618, 164, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (619, 164, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (620, 164, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (621, 165, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (622, 165, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (623, 165, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (624, 165, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (625, 166, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (626, 166, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (627, 166, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (628, 166, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (629, 166, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (630, 166, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (631, 167, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (632, 167, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (633, 167, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (634, 168, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (635, 168, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (636, 168, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (637, 168, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (638, 168, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (639, 168, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (640, 169, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (641, 170, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (642, 170, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (643, 170, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (644, 170, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (645, 170, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (646, 171, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (647, 172, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (648, 172, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (649, 172, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (650, 172, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (651, 172, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (652, 173, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (653, 173, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (654, 174, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (655, 175, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (656, 175, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (657, 175, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (658, 175, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (659, 175, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (660, 175, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (661, 176, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (662, 176, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (663, 176, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (664, 176, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (665, 176, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (666, 177, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (667, 177, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (668, 177, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (669, 177, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (670, 177, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (671, 177, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (672, 178, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (673, 178, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (674, 178, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (675, 178, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (676, 178, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (677, 178, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (678, 179, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (679, 179, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (680, 179, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (681, 180, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (682, 180, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (683, 180, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (684, 181, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (685, 181, 4, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (686, 182, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (687, 182, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (688, 182, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (689, 182, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (690, 183, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (691, 183, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (692, 183, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (693, 184, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (694, 184, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (695, 184, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (696, 184, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (697, 184, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (698, 184, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (699, 185, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (700, 185, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (701, 185, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (702, 185, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (703, 185, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (704, 186, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (705, 187, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (706, 188, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (707, 188, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (708, 189, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (709, 189, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (710, 189, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (711, 189, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (712, 190, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (713, 191, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (714, 191, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (715, 191, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (716, 191, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (717, 191, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (718, 192, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (719, 192, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (720, 192, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (721, 192, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (722, 192, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (723, 193, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (724, 193, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (725, 193, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (726, 193, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (727, 194, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (728, 194, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (729, 194, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (730, 195, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (731, 195, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (732, 195, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (733, 195, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (734, 195, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (735, 196, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (736, 196, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (737, 197, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (738, 197, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (739, 198, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (740, 198, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (741, 198, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (742, 199, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (743, 199, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (744, 199, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (745, 199, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (746, 200, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (747, 200, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (748, 200, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (749, 200, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (750, 201, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (751, 201, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (752, 202, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (753, 202, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (754, 202, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (755, 202, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (756, 202, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (757, 202, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (758, 203, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (759, 203, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (760, 203, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (761, 203, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (762, 203, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (763, 204, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (764, 204, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (765, 204, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (766, 204, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (767, 205, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (768, 205, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (769, 205, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (770, 205, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (771, 205, 23, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (772, 205, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (773, 206, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (774, 206, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (775, 207, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (776, 207, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (777, 207, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (778, 207, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (779, 207, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (780, 208, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (781, 208, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (782, 208, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (783, 208, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (784, 208, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (785, 208, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (786, 209, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (787, 209, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (788, 209, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (789, 210, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (790, 210, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (791, 210, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (792, 210, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (793, 211, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (794, 211, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (795, 211, 22, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (796, 211, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (797, 212, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (798, 212, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (799, 212, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (800, 213, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (801, 213, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (802, 213, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (803, 213, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (804, 214, 1, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (805, 214, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (806, 214, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (807, 214, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (808, 214, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (809, 214, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (810, 215, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (811, 215, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (812, 215, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (813, 215, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (814, 215, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (815, 216, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (816, 216, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (817, 217, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (818, 217, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (819, 217, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (820, 217, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (821, 218, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (822, 219, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (823, 220, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (824, 221, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (825, 221, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (826, 222, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (827, 222, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (828, 222, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (829, 223, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (830, 223, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (831, 223, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (832, 223, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (833, 224, 23, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (834, 224, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (835, 224, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (836, 224, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (837, 225, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (838, 225, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (839, 225, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (840, 226, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (841, 227, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (842, 227, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (843, 227, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (844, 227, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (845, 227, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (846, 227, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (847, 228, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (848, 228, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (849, 228, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (850, 228, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (851, 228, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (852, 228, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (853, 229, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (854, 229, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (855, 229, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (856, 229, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (857, 229, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (858, 230, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (859, 230, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (860, 230, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (861, 230, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (862, 230, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (863, 230, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (864, 231, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (865, 231, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (866, 231, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (867, 232, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (868, 232, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (869, 233, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (870, 233, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (871, 234, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (872, 234, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (873, 235, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (874, 235, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (875, 235, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (876, 235, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (877, 235, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (878, 235, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (879, 236, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (880, 237, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (881, 237, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (882, 238, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (883, 238, 10, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (884, 238, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (885, 238, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (886, 238, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (887, 239, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (888, 240, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (889, 240, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (890, 240, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (891, 240, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (892, 240, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (893, 241, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (894, 241, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (895, 242, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (896, 242, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (897, 242, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (898, 242, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (899, 242, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (900, 242, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (901, 243, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (902, 243, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (903, 243, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (904, 243, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (905, 243, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (906, 243, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (907, 244, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (908, 244, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (909, 245, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (910, 246, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (911, 246, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (912, 246, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (913, 247, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (914, 247, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (915, 247, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (916, 247, 10, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (917, 248, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (918, 248, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (919, 249, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (920, 249, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (921, 250, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (922, 250, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (923, 251, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (924, 251, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (925, 251, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (926, 251, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (927, 251, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (928, 251, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (929, 252, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (930, 252, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (931, 252, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (932, 253, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (933, 253, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (934, 253, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (935, 254, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (936, 254, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (937, 255, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (938, 255, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (939, 255, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (940, 255, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (941, 256, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (942, 256, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (943, 257, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (944, 257, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (945, 257, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (946, 258, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (947, 258, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (948, 258, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (949, 258, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (950, 259, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (951, 259, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (952, 259, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (953, 259, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (954, 259, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (955, 260, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (956, 260, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (957, 260, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (958, 260, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (959, 260, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (960, 260, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (961, 261, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (962, 261, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (963, 261, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (964, 262, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (965, 262, 1, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (966, 262, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (967, 262, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (968, 263, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (969, 263, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (970, 263, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (971, 263, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (972, 264, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (973, 264, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (974, 264, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (975, 264, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (976, 265, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (977, 265, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (978, 265, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (979, 266, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (980, 266, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (981, 266, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (982, 267, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (983, 267, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (984, 267, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (985, 267, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (986, 268, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (987, 268, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (988, 268, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (989, 268, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (990, 268, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (991, 269, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (992, 270, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (993, 271, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (994, 272, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (995, 272, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (996, 272, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (997, 272, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (998, 272, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (999, 272, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1000, 273, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1001, 273, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1002, 273, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1003, 274, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1004, 274, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1005, 274, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1006, 275, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1007, 275, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1008, 275, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1009, 275, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1010, 276, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1011, 276, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1012, 277, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1013, 278, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1014, 279, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1015, 279, 29, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1016, 279, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1017, 279, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1018, 279, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1019, 280, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1020, 280, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1021, 280, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1022, 280, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1023, 280, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1024, 281, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1025, 281, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1026, 281, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1027, 281, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1028, 281, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1029, 282, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1030, 283, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1031, 283, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1032, 284, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1033, 285, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1034, 285, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1035, 285, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1036, 285, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1037, 285, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1038, 286, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1039, 286, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1040, 287, 1, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1041, 287, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1042, 288, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1043, 289, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1044, 289, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1045, 290, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1046, 290, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1047, 290, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1048, 290, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1049, 290, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1050, 290, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1051, 291, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1052, 291, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1053, 291, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1054, 291, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1055, 291, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1056, 291, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1057, 292, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1058, 292, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1059, 292, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1060, 292, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1061, 292, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1062, 292, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1063, 293, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1064, 293, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1065, 293, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1066, 294, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1067, 294, 20, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1068, 294, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1069, 294, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1070, 294, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1071, 294, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1072, 295, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1073, 295, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1074, 296, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1075, 297, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1076, 297, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1077, 297, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1078, 297, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1079, 297, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1080, 298, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1081, 298, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1082, 298, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1083, 298, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1084, 299, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1085, 299, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1086, 299, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1087, 300, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1088, 300, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1089, 300, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1090, 300, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1091, 301, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1092, 301, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1093, 301, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1094, 302, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1095, 303, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1096, 303, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1097, 303, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1098, 303, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1099, 303, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1100, 303, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1101, 304, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1102, 304, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1103, 304, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1104, 304, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1105, 305, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1106, 306, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1107, 306, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1108, 306, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1109, 307, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1110, 307, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1111, 307, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1112, 307, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1113, 307, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1114, 308, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1115, 308, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1116, 309, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1117, 309, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1118, 309, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1119, 309, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1120, 309, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1121, 309, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1122, 310, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1123, 310, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1124, 310, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1125, 311, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1126, 311, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1127, 311, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1128, 311, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1129, 311, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1130, 312, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1131, 312, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1132, 312, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1133, 312, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1134, 312, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1135, 313, 10, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1136, 313, 9, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1137, 313, 9, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1138, 313, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1139, 313, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1140, 314, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1141, 314, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1142, 314, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1143, 314, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1144, 315, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1145, 315, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1146, 315, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1147, 315, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1148, 315, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1149, 316, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1150, 316, 20, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1151, 316, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1152, 316, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1153, 316, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1154, 316, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1155, 317, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1156, 317, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1157, 317, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1158, 317, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1159, 318, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1160, 319, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1161, 320, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1162, 320, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1163, 320, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1164, 320, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1165, 320, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1166, 320, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1167, 321, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1168, 321, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1169, 321, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1170, 321, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1171, 322, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1172, 322, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1173, 322, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1174, 322, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1175, 322, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1176, 322, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1177, 323, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1178, 324, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1179, 324, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1180, 325, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1181, 325, 10, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1182, 325, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1183, 325, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1184, 326, 1, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1185, 326, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1186, 327, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1187, 327, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1188, 327, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1189, 328, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1190, 328, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1191, 329, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1192, 329, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1193, 329, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1194, 329, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1195, 330, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1196, 330, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1197, 330, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1198, 331, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1199, 331, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1200, 331, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1201, 331, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1202, 331, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1203, 331, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1204, 332, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1205, 333, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1206, 333, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1207, 333, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1208, 334, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1209, 335, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1210, 335, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1211, 335, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1212, 335, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1213, 335, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1214, 335, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1215, 336, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1216, 337, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1217, 337, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1218, 337, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1219, 337, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1220, 337, 11, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1221, 338, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1222, 338, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1223, 339, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1224, 339, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1225, 340, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1226, 340, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1227, 340, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1228, 340, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1229, 340, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1230, 341, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1231, 341, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1232, 341, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1233, 342, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1234, 342, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1235, 342, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1236, 343, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1237, 343, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1238, 343, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1239, 343, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1240, 343, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1241, 344, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1242, 344, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1243, 344, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1244, 344, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1245, 345, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1246, 345, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1247, 345, 3, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1248, 346, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1249, 347, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1250, 347, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1251, 347, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1252, 347, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1253, 348, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1254, 348, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1255, 348, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1256, 348, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1257, 348, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1258, 349, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1259, 350, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1260, 350, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1261, 350, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1262, 350, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1263, 350, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1264, 350, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1265, 351, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1266, 351, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1267, 351, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1268, 351, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1269, 351, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1270, 351, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1271, 352, 22, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1272, 352, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1273, 352, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1274, 353, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1275, 353, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1276, 353, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1277, 353, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1278, 353, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1279, 354, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1280, 354, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1281, 354, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1282, 355, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1283, 355, 4, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1284, 355, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1285, 355, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1286, 355, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1287, 355, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1288, 356, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1289, 356, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1290, 356, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1291, 357, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1292, 357, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1293, 357, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1294, 357, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1295, 357, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1296, 358, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1297, 358, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1298, 358, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1299, 359, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1300, 359, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1301, 359, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1302, 359, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1303, 359, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1304, 360, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1305, 360, 12, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1306, 361, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1307, 361, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1308, 362, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1309, 362, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1310, 363, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1311, 363, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1312, 364, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1313, 364, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1314, 364, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1315, 364, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1316, 365, 11, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1317, 365, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1318, 365, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1319, 365, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1320, 365, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1321, 366, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1322, 367, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1323, 367, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1324, 367, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1325, 367, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1326, 367, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1327, 368, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1328, 368, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1329, 368, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1330, 368, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1331, 369, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1332, 369, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1333, 369, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1334, 369, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1335, 369, 28, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1336, 370, 10, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1337, 370, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1338, 370, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1339, 370, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1340, 370, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1341, 370, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1342, 371, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1343, 371, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1344, 371, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1345, 372, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1346, 372, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1347, 373, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1348, 373, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1349, 373, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1350, 373, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1351, 373, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1352, 374, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1353, 374, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1354, 375, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1355, 375, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1356, 376, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1357, 376, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1358, 377, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1359, 378, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1360, 378, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1361, 378, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1362, 379, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1363, 379, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1364, 380, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1365, 380, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1366, 380, 6, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1367, 381, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1368, 381, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1369, 381, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1370, 382, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1371, 382, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1372, 382, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1373, 382, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1374, 382, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1375, 382, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1376, 383, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1377, 384, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1378, 384, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1379, 384, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1380, 384, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1381, 384, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1382, 384, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1383, 385, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1384, 386, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1385, 386, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1386, 387, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1387, 387, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1388, 387, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1389, 388, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1390, 388, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1391, 388, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1392, 388, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1393, 388, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1394, 389, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1395, 389, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1396, 389, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1397, 390, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1398, 391, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1399, 392, 13, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1400, 392, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1401, 392, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1402, 392, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1403, 392, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1404, 393, 15, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1405, 393, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1406, 393, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1407, 393, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1408, 394, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1409, 394, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1410, 394, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1411, 395, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1412, 395, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1413, 396, 19, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1414, 396, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1415, 397, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1416, 397, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1417, 398, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1418, 399, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1419, 399, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1420, 399, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1421, 399, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1422, 399, 26, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1423, 399, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1424, 400, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1425, 400, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1426, 400, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1427, 400, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1428, 400, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1429, 401, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1430, 401, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1431, 401, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1432, 401, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1433, 401, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1434, 402, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1435, 402, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1436, 402, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1437, 402, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1438, 403, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1439, 403, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1440, 403, 23, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1441, 403, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1442, 403, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1443, 404, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1444, 404, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1445, 404, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1446, 405, 10, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1447, 405, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1448, 405, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1449, 405, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1450, 405, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1451, 405, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1452, 406, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1453, 406, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1454, 407, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1455, 407, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1456, 407, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1457, 407, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1458, 408, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1459, 408, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1460, 408, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1461, 408, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1462, 408, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1463, 409, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1464, 410, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1465, 410, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1466, 410, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1467, 410, 29, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1468, 410, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1469, 411, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1470, 411, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1471, 411, 14, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1472, 412, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1473, 413, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1474, 413, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1475, 414, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1476, 414, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1477, 414, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1478, 414, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1479, 414, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1480, 415, 5, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1481, 415, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1482, 415, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1483, 415, 27, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1484, 415, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1485, 415, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1486, 416, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1487, 416, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1488, 416, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1489, 417, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1490, 417, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1491, 417, 9, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1492, 418, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1493, 418, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1494, 419, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1495, 419, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1496, 419, 16, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1497, 420, 8, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1498, 420, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1499, 421, 8, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1500, 421, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1501, 421, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1502, 421, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1503, 421, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1504, 421, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1505, 422, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1506, 422, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1507, 422, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1508, 423, 1, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1509, 423, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1510, 423, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1511, 423, 28, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1512, 423, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1513, 423, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1514, 424, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1515, 424, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1516, 424, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1517, 424, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1518, 424, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1519, 425, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1520, 425, 21, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1521, 426, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1522, 426, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1523, 427, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1524, 427, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1525, 428, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1526, 428, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1527, 428, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1528, 429, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1529, 429, 7, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1530, 429, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1531, 429, 16, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1532, 429, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1533, 430, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1534, 430, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1535, 430, 2, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1536, 430, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1537, 430, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1538, 431, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1539, 431, 15, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1540, 432, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1541, 433, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1542, 433, 26, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1543, 433, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1544, 433, 11, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1545, 434, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1546, 434, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1547, 434, 28, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1548, 434, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1549, 435, 20, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1550, 435, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1551, 435, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1552, 435, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1553, 435, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1554, 436, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1555, 437, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1556, 437, 16, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1557, 437, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1558, 437, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1559, 437, 23, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1560, 438, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1561, 438, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1562, 438, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1563, 438, 14, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1564, 438, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1565, 438, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1566, 439, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1567, 439, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1568, 439, 9, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1569, 439, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1570, 439, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1571, 439, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1572, 440, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1573, 440, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1574, 440, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1575, 440, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1576, 440, 23, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1577, 441, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1578, 441, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1579, 441, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1580, 441, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1581, 441, 4, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1582, 441, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1583, 442, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1584, 442, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1585, 442, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1586, 442, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1587, 442, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1588, 442, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1589, 443, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1590, 443, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1591, 443, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1592, 443, 22, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1593, 443, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1594, 443, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1595, 444, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1596, 444, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1597, 444, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1598, 444, 5, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1599, 444, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1600, 445, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1601, 446, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1602, 446, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1603, 447, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1604, 447, 21, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1605, 447, 5, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1606, 447, 19, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1607, 447, 1, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1608, 447, 24, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1609, 448, 20, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1610, 448, 13, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1611, 448, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1612, 448, 14, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1613, 448, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1614, 449, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1615, 449, 9, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1616, 449, 13, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1617, 449, 6, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1618, 449, 15, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1619, 450, 30, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1620, 450, 26, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1621, 450, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1622, 450, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1623, 450, 23, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1624, 451, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1625, 451, 3, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1626, 451, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1627, 451, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1628, 451, 2, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1629, 452, 9, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1630, 452, 20, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1631, 452, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1632, 452, 14, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1633, 453, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1634, 453, 1, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1635, 453, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1636, 453, 7, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1637, 453, 5, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1638, 454, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1639, 455, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1640, 455, 16, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1641, 455, 9, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1642, 455, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1643, 455, 3, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1644, 455, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1645, 456, 25, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1646, 457, 29, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1647, 458, 15, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1648, 458, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1649, 459, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1650, 459, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1651, 459, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1652, 459, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1653, 459, 18, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1654, 459, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1655, 460, 21, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1656, 461, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1657, 461, 5, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1658, 461, 10, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1659, 461, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1660, 461, 11, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1661, 461, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1662, 462, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1663, 462, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1664, 463, 8, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1665, 463, 4, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1666, 463, 27, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1667, 464, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1668, 464, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1669, 464, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1670, 465, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1671, 465, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1672, 465, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1673, 465, 10, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1674, 466, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1675, 466, 3, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1676, 467, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1677, 467, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1678, 467, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1679, 467, 19, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1680, 468, 17, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1681, 468, 30, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1682, 469, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1683, 469, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1684, 469, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1685, 469, 26, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1686, 469, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1687, 470, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1688, 470, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1689, 470, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1690, 470, 2, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1691, 470, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1692, 470, 24, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1693, 471, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1694, 472, 11, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1695, 472, 1, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1696, 472, 11, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1697, 472, 7, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1698, 472, 4, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1699, 472, 20, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1700, 473, 10, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1701, 473, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1702, 473, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1703, 473, 30, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1704, 473, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1705, 474, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1706, 474, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1707, 474, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1708, 475, 11, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1709, 475, 22, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1710, 475, 9, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1711, 475, 23, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1712, 476, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1713, 476, 12, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1714, 476, 28, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1715, 477, 17, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1716, 477, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1717, 478, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1718, 478, 18, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1719, 479, 13, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1720, 479, 6, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1721, 479, 25, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1722, 479, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1723, 479, 12, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1724, 479, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1725, 480, 12, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1726, 480, 22, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1727, 480, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1728, 480, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1729, 480, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1730, 480, 18, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1731, 481, 20, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1732, 481, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1733, 482, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1734, 483, 24, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1735, 483, 29, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1736, 484, 26, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1737, 484, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1738, 484, 17, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1739, 485, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1740, 485, 6, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1741, 485, 27, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1742, 485, 19, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1743, 485, 18, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1744, 485, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1745, 486, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1746, 486, 23, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1747, 486, 17, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1748, 486, 1, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1749, 487, 25, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1750, 487, 24, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1751, 487, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1752, 487, 21, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1753, 487, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1754, 487, 8, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1755, 488, 1, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1756, 488, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1757, 488, 15, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1758, 489, 13, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1759, 490, 28, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1760, 490, 12, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1761, 490, 7, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1762, 491, 4, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1763, 491, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1764, 492, 29, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1765, 492, 4, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1766, 493, 20, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1767, 493, 29, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1768, 494, 21, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1769, 495, 6, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1770, 495, 17, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1771, 495, 29, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1772, 495, 20, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1773, 495, 2, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1774, 496, 3, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1775, 496, 27, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1776, 496, 11, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1777, 496, 30, 3);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1778, 496, 24, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1779, 496, 22, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1780, 497, 16, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1781, 497, 8, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1782, 498, 27, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1783, 498, 2, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1784, 498, 25, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1785, 498, 22, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1786, 498, 29, 5);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1787, 499, 19, 2);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1788, 499, 7, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1789, 499, 25, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1790, 499, 18, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1791, 500, 14, 1);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1792, 500, 30, 4);
INSERT INTO public.order_line_items (line_item_id, order_id, product_id, quantity) VALUES (1793, 500, 12, 5);


--
-- TOC entry 3502 (class 0 OID 16862)
-- Dependencies: 228
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (1, 'Venti Dragonfruit Mocha', 12.02, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (2, 'Blended Dragonfruit Latte', 13.75, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (3, 'Grande Oatmilk Latte', 10.17, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (4, 'Venti Caramel Flat White', 10.98, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (5, 'Decaf Caramel Mocha', 14.21, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (6, 'Grande Hazelnut Latte', 10.07, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (7, 'Iced Pumpkin Spice Cold Brew', 11.06, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (8, 'Iced Caramel Cold Brew', 12.19, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (9, 'Venti Oatmilk Frappuccino', 8.54, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (10, 'Venti Matcha Macchiato', 14.98, 1);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (11, 'Sausage & Cheddar Baguette', 24.88, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (12, 'Kale & Mushroom Focaccia', 17.79, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (13, 'Spinach & Feta Focaccia', 10.50, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (14, 'Turkey Bacon Panini', 14.15, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (15, 'Turkey Bacon Egg Bites', 10.86, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (16, 'Sausage & Cheddar Panini', 12.06, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (17, 'Bacon & Gruyère Wrap', 13.48, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (18, 'Ham & Swiss Oatmeal', 22.45, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (19, 'Tomato & Mozzarella Oatmeal', 18.10, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (20, 'Kale & Mushroom Sandwich', 22.70, 2);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (21, 'Pumpkin Doughnut', 14.77, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (22, 'Red Velvet Brownie', 8.46, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (23, 'Vanilla Bean Cookie', 7.79, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (24, 'Vanilla Bean Cookie', 11.13, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (25, 'Lemon Danish', 14.50, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (26, 'Vanilla Bean Croissant', 9.58, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (27, 'Cinnamon Doughnut', 13.06, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (28, 'Cinnamon Loaf', 5.04, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (29, 'Pumpkin Cake Pop', 13.68, 3);
INSERT INTO public.products (product_id, product_name, unit_price, category) VALUES (30, 'Red Velvet Cake Pop', 5.74, 3);


--
-- TOC entry 3494 (class 0 OID 16825)
-- Dependencies: 220
-- Data for Name: regions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.regions (region_id, region_name) VALUES (1, 'United States');


--
-- TOC entry 3520 (class 0 OID 0)
-- Dependencies: 225
-- Name: branches_branch_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.branches_branch_id_seq', 1, false);


--
-- TOC entry 3521 (class 0 OID 0)
-- Dependencies: 221
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 1, false);


--
-- TOC entry 3522 (class 0 OID 0)
-- Dependencies: 223
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- TOC entry 3523 (class 0 OID 0)
-- Dependencies: 229
-- Name: order_headers_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_headers_order_id_seq', 1, false);


--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 231
-- Name: order_line_items_line_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_line_items_line_item_id_seq', 1793, true);


--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 1, false);


--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 219
-- Name: regions_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.regions_region_id_seq', 1, false);


--
-- TOC entry 3333 (class 2606 OID 16855)
-- Name: branches branches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_pkey PRIMARY KEY (branch_id);


--
-- TOC entry 3329 (class 2606 OID 16839)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 3331 (class 2606 OID 16847)
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- TOC entry 3337 (class 2606 OID 16881)
-- Name: order_headers order_headers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_headers
    ADD CONSTRAINT order_headers_pkey PRIMARY KEY (order_id);


--
-- TOC entry 3339 (class 2606 OID 16899)
-- Name: order_line_items order_line_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_items
    ADD CONSTRAINT order_line_items_pkey PRIMARY KEY (line_item_id);


--
-- TOC entry 3335 (class 2606 OID 16868)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 3327 (class 2606 OID 16831)
-- Name: regions regions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (region_id);


--
-- TOC entry 3340 (class 2606 OID 16856)
-- Name: branches branches_region_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.branches
    ADD CONSTRAINT branches_region_id_fkey FOREIGN KEY (region_id) REFERENCES public.regions(region_id);


--
-- TOC entry 3342 (class 2606 OID 16887)
-- Name: order_headers order_headers_branch_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_headers
    ADD CONSTRAINT order_headers_branch_id_fkey FOREIGN KEY (branch_id) REFERENCES public.branches(branch_id);


--
-- TOC entry 3343 (class 2606 OID 16882)
-- Name: order_headers order_headers_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_headers
    ADD CONSTRAINT order_headers_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- TOC entry 3344 (class 2606 OID 16900)
-- Name: order_line_items order_line_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_items
    ADD CONSTRAINT order_line_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.order_headers(order_id);


--
-- TOC entry 3345 (class 2606 OID 16905)
-- Name: order_line_items order_line_items_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_line_items
    ADD CONSTRAINT order_line_items_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 3341 (class 2606 OID 16869)
-- Name: products products_category_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_fkey FOREIGN KEY (category) REFERENCES public.categories(category_id);


-- Completed on 2025-12-19 11:03:02 -03

--
-- PostgreSQL database dump complete
--

\unrestrict a3QmJOkGQjoaZvcls0xWDSFCfhmdOFVbfkmiW9cVKG33sVEaawNBipqbQqJeGEY

