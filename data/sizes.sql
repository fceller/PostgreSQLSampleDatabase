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
-- Data for Name: sizes; Type: TABLE DATA; Schema: webshop; Owner: postgres
--

COPY webshop.sizes (id, gender, category, size, size_us, size_uk, size_eu) FROM stdin;
1	female	Apparel	XS	[2,4)	[4,6)	[32,36)
2	female	Apparel	S	[4,6)	[6,10)	[36,40)
3	female	Apparel	M	[6,8)	[10,14)	[40,44)
4	female	Apparel	L	[8,10)	[14,18)	[44,46)
5	female	Apparel	XL	[10,12)	[18,22)	[46,50)
6	male	Apparel	XS	[30,32)	[30,32)	[40,42)
7	male	Apparel	S	[32,36)	[32,36)	[42,48)
8	male	Apparel	M	[36,40)	[36,40)	[48,50)
9	male	Apparel	L	[40,44)	[40,44)	[50,54)
10	male	Apparel	XL	[44,50)	[44,50)	[54,58)
11	unisex	Footwear	XS	[6,7)	[5,6)	[38,40)
12	unisex	Footwear	S	[7,8)	[6,7)	[40,42)
13	unisex	Footwear	M	[7,9)	[7,8)	[42,43)
14	unisex	Footwear	L	[9,10)	[8,9)	[43,44)
15	unisex	Footwear	XL	[10,11)	[9,10)	[44,45)
\.


--
-- Name: sizes_id_seq; Type: SEQUENCE SET; Schema: webshop; Owner: postgres
--

SELECT pg_catalog.setval('webshop.sizes_id_seq', 15, true);


--
-- PostgreSQL database dump complete
--

