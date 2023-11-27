--
-- PostgreSQL database dump
--

-- Dumped from database version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.9 (Ubuntu 14.9-0ubuntu0.22.04.1)

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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: webshop; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA webshop;


ALTER SCHEMA webshop OWNER TO postgres;

--
-- Name: category; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.category AS ENUM (
    'Apparel',
    'Footwear',
    'Sportswear',
    'Traditional',
    'Formal Wear',
    'Accessories',
    'Watches & Jewelry',
    'Luggage',
    'Cosmetics'
);


ALTER TYPE public.category OWNER TO postgres;

--
-- Name: TYPE category; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE public.category IS 'Sizes for US, UK and EU';


--
-- Name: gender; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gender AS ENUM (
    'male',
    'female',
    'unisex'
);


ALTER TYPE public.gender OWNER TO postgres;

--
-- Name: TYPE gender; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE public.gender IS 'Gender of customer or clothes';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: public_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.public_table (
);


ALTER TABLE public.public_table OWNER TO postgres;

--
-- Name: addresses; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.addresses (
    id integer NOT NULL,
    customer_id integer,
    firstname text,
    lastname text,
    address_line_1 text,
    address_line_2 text,
    city text,
    zip text,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.addresses OWNER TO postgres;

--
-- Name: TABLE addresses; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.addresses IS 'Addresses for receipts and shipping';


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.addresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.addresses_id_seq OWNER TO postgres;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.addresses_id_seq OWNED BY webshop.addresses.id;


--
-- Name: articles; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.articles (
    id integer NOT NULL,
    product_id integer,
    ean text,
    description text,
    original_price money,
    reduced_price money,
    taxrate numeric,
    discount_percent integer,
    is_active boolean,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.articles OWNER TO postgres;

--
-- Name: TABLE articles; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.articles IS 'Instance of a product with a size, color and price';


--
-- Name: articles_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.articles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.articles_id_seq OWNER TO postgres;

--
-- Name: articles_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.articles_id_seq OWNED BY webshop.articles.id;


--
-- Name: brands; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.brands (
    id integer NOT NULL,
    name text,
    slug text,
    icon bytea
);


ALTER TABLE webshop.brands OWNER TO postgres;

--
-- Name: TABLE brands; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.brands IS 'Brands / brands';


--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.brands_id_seq OWNED BY webshop.brands.id;


--
-- Name: clothes; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.clothes (
    id integer NOT NULL,
    color_id integer
);


ALTER TABLE webshop.clothes OWNER TO postgres;

--
-- Name: colors; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.colors (
    id integer NOT NULL,
    name text,
    rgb text
);


ALTER TABLE webshop.colors OWNER TO postgres;

--
-- Name: TABLE colors; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.colors IS 'Colors with name and rgb value';


--
-- Name: colors_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.colors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.colors_id_seq OWNER TO postgres;

--
-- Name: colors_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.colors_id_seq OWNED BY webshop.colors.id;


--
-- Name: customers; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.customers (
    id integer NOT NULL,
    firstname text,
    lastname text,
    gender public.gender,
    email text,
    data_of_birth date,
    current_address_id integer,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.customers OWNER TO postgres;

--
-- Name: TABLE customers; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.customers IS 'Basic customer data';


--
-- Name: customer_id_seq1; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.customer_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.customer_id_seq1 OWNER TO postgres;

--
-- Name: customer_id_seq1; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.customer_id_seq1 OWNED BY webshop.customers.id;


--
-- Name: customer_product_rating; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.customer_product_rating (
    customer_id integer NOT NULL,
    product_id integer NOT NULL,
    rating integer
);


ALTER TABLE webshop.customer_product_rating OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.orders (
    id integer NOT NULL,
    customer integer,
    order_timestamp timestamp with time zone DEFAULT now(),
    shipping_address_id integer,
    total money,
    shipping_cost money,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.orders OWNER TO postgres;

--
-- Name: TABLE orders; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.orders IS 'Metadata for an order, see order_positions as well';


--
-- Name: order_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.order_id_seq OWNER TO postgres;

--
-- Name: order_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.order_id_seq OWNED BY webshop.orders.id;


--
-- Name: order_positions; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.order_positions (
    id integer NOT NULL,
    order_id integer,
    article_id integer,
    amount smallint,
    price money,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.order_positions OWNER TO postgres;

--
-- Name: TABLE order_positions; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.order_positions IS 'Articles that are contained in an order';


--
-- Name: order_positions_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.order_positions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.order_positions_id_seq OWNER TO postgres;

--
-- Name: order_positions_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.order_positions_id_seq OWNED BY webshop.order_positions.id;


--
-- Name: products; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.products (
    id integer NOT NULL,
    name text,
    brand_id integer,
    category public.category,
    is_active boolean,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.products OWNER TO postgres;

--
-- Name: TABLE products; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.products IS 'Groups articles (differing in sizes/color)';


--
-- Name: products_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.products_id_seq OWNED BY webshop.products.id;


--
-- Name: sizes; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.sizes (
    id integer NOT NULL,
    gender public.gender,
    category public.category,
    size text,
    size_us int4range,
    size_uk int4range,
    size_eu int4range
);


ALTER TABLE webshop.sizes OWNER TO postgres;

--
-- Name: TABLE sizes; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.sizes IS 'Colors with name and rgb value';


--
-- Name: sizes_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.sizes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.sizes_id_seq OWNER TO postgres;

--
-- Name: sizes_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.sizes_id_seq OWNED BY webshop.sizes.id;


--
-- Name: stocks; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.stocks (
    id integer NOT NULL,
    article_id integer,
    count integer,
    created timestamp with time zone DEFAULT now(),
    updated timestamp with time zone
);


ALTER TABLE webshop.stocks OWNER TO postgres;

--
-- Name: TABLE stocks; Type: COMMENT; Schema: webshop; Owner: postgres
--

COMMENT ON TABLE webshop.stocks IS 'Amount of articles on stock';


--
-- Name: stocks_id_seq; Type: SEQUENCE; Schema: webshop; Owner: postgres
--

CREATE SEQUENCE webshop.stocks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE webshop.stocks_id_seq OWNER TO postgres;

--
-- Name: stocks_id_seq; Type: SEQUENCE OWNED BY; Schema: webshop; Owner: postgres
--

ALTER SEQUENCE webshop.stocks_id_seq OWNED BY webshop.stocks.id;


--
-- Name: trousers; Type: TABLE; Schema: webshop; Owner: postgres
--

CREATE TABLE webshop.trousers (
    id integer NOT NULL,
    length integer,
    waist_lenth integer
);


ALTER TABLE webshop.trousers OWNER TO postgres;

--
-- Name: addresses id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.addresses ALTER COLUMN id SET DEFAULT nextval('webshop.addresses_id_seq'::regclass);


--
-- Name: articles id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.articles ALTER COLUMN id SET DEFAULT nextval('webshop.articles_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.brands ALTER COLUMN id SET DEFAULT nextval('webshop.brands_id_seq'::regclass);


--
-- Name: colors id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.colors ALTER COLUMN id SET DEFAULT nextval('webshop.colors_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.customers ALTER COLUMN id SET DEFAULT nextval('webshop.customer_id_seq1'::regclass);


--
-- Name: order_positions id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.order_positions ALTER COLUMN id SET DEFAULT nextval('webshop.order_positions_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.orders ALTER COLUMN id SET DEFAULT nextval('webshop.order_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.products ALTER COLUMN id SET DEFAULT nextval('webshop.products_id_seq'::regclass);


--
-- Name: sizes id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.sizes ALTER COLUMN id SET DEFAULT nextval('webshop.sizes_id_seq'::regclass);


--
-- Name: stocks id; Type: DEFAULT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.stocks ALTER COLUMN id SET DEFAULT nextval('webshop.stocks_id_seq'::regclass);


--
-- Name: addresses address_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.addresses
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: articles articles_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.articles
    ADD CONSTRAINT articles_pkey PRIMARY KEY (id);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: clothes cloth_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.clothes
    ADD CONSTRAINT cloth_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: customers customer_pkey1; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.customers
    ADD CONSTRAINT customer_pkey1 PRIMARY KEY (id);


--
-- Name: customer_product_rating customer_product_rating_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.customer_product_rating
    ADD CONSTRAINT customer_product_rating_pkey PRIMARY KEY (customer_id, product_id);


--
-- Name: orders order_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.orders
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: order_positions order_positions_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.order_positions
    ADD CONSTRAINT order_positions_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sizes sizes_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.sizes
    ADD CONSTRAINT sizes_pkey PRIMARY KEY (id);


--
-- Name: stocks stock_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.stocks
    ADD CONSTRAINT stock_pkey PRIMARY KEY (id);


--
-- Name: trousers trousers_pkey; Type: CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.trousers
    ADD CONSTRAINT trousers_pkey PRIMARY KEY (id);


--
-- Name: articles articles_products_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.articles
    ADD CONSTRAINT articles_products_fkey FOREIGN KEY (product_id) REFERENCES webshop.products(id);


--
-- Name: clothes cloth_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.clothes
    ADD CONSTRAINT cloth_id_fkey FOREIGN KEY (id) REFERENCES webshop.articles(id);


--
-- Name: customers customer_address_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.customers
    ADD CONSTRAINT customer_address_fkey FOREIGN KEY (current_address_id) REFERENCES webshop.addresses(id);


--
-- Name: customer_product_rating customer_product_rating_customer_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.customer_product_rating
    ADD CONSTRAINT customer_product_rating_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES webshop.customers(id);


--
-- Name: customer_product_rating customer_product_rating_product_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.customer_product_rating
    ADD CONSTRAINT customer_product_rating_product_id_fkey FOREIGN KEY (product_id) REFERENCES webshop.products(id);


--
-- Name: orders order_customer_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.orders
    ADD CONSTRAINT order_customer_fkey FOREIGN KEY (customer) REFERENCES webshop.customers(id);


--
-- Name: order_positions order_positions_article_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.order_positions
    ADD CONSTRAINT order_positions_article_id_fkey FOREIGN KEY (article_id) REFERENCES webshop.articles(id);


--
-- Name: order_positions order_positions_order_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.order_positions
    ADD CONSTRAINT order_positions_order_id_fkey FOREIGN KEY (order_id) REFERENCES webshop.orders(id);


--
-- Name: orders order_shipping_address_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.orders
    ADD CONSTRAINT order_shipping_address_id_fkey FOREIGN KEY (shipping_address_id) REFERENCES webshop.addresses(id);


--
-- Name: products product_brands_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.products
    ADD CONSTRAINT product_brands_fkey FOREIGN KEY (brand_id) REFERENCES webshop.brands(id);


--
-- Name: stocks stock_article_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.stocks
    ADD CONSTRAINT stock_article_id_fkey FOREIGN KEY (article_id) REFERENCES webshop.articles(id);


--
-- Name: trousers trousers_id_fkey; Type: FK CONSTRAINT; Schema: webshop; Owner: postgres
--

ALTER TABLE ONLY webshop.trousers
    ADD CONSTRAINT trousers_id_fkey FOREIGN KEY (id) REFERENCES webshop.articles(id);


--
-- PostgreSQL database dump complete
--

