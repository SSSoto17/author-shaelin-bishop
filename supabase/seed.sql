SET session_replication_role = replica;

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8
-- Dumped by pg_dump version 15.8

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
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: one_time_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--



--
-- Data for Name: header; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."header" ("id", "updated_at", "created_at") VALUES
	(1, '2025-05-04 21:16:07.641+00', '2025-05-04 21:16:07.527+00');


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."pages" ("id", "title", "path", "updated_at", "created_at") VALUES
	(1, 'Home', '/', '2025-05-04 21:13:52.643+00', '2025-05-04 21:13:52.589+00'),
	(2, 'Work', '/work', '2025-05-04 21:14:13.291+00', '2025-05-04 21:14:13.24+00'),
	(3, 'Editorial Services', '/services', '2025-05-04 21:14:40.203+00', '2025-05-04 21:14:40.15+00'),
	(4, 'Events', '/events', '2025-05-04 21:15:09.898+00', '2025-05-04 21:15:09.848+00'),
	(5, 'About', '/about', '2025-05-04 21:15:22.081+00', '2025-05-04 21:15:22.03+00'),
	(6, 'Test', '/test', '2025-05-07 19:21:30.734+00', '2025-05-07 19:21:30.738+00');


--
-- Data for Name: header_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."header_items" ("_order", "_parent_id", "id", "page_id") VALUES
	(1, 1, '6817d8f4da07a486e9b8c4e4', 1),
	(2, 1, '6817d8fdda07a486e9b8c4e5', 2),
	(3, 1, '6817d904da07a486e9b8c4e6', 3),
	(4, 1, '6817d90ada07a486e9b8c4e7', 4),
	(5, 1, '6817d90eda07a486e9b8c4e8', 5),
	(1, 1, '681794d219bd691fa825dbc2', 1),
	(2, 1, '681799a626cd636b2a799973', 2),
	(3, 1, '681799b826cd636b2a799975', 3),
	(4, 1, '681799bf26cd636b2a799979', 5),
	(5, 1, '681799bb26cd636b2a799977', 4);


--
-- Data for Name: media; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: payload_locked_documents; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."users" ("id", "updated_at", "created_at", "email", "reset_password_token", "reset_password_expiration", "salt", "hash", "login_attempts", "lock_until") VALUES
	(1, '2025-05-04 21:06:23.358+00', '2025-05-04 21:06:22.54+00', 'saso0001@stud.kea.dk', NULL, NULL, '8afa8f461992baa27ebabbe2f77cb25939c230d766550c822a96ad206d30a9e7', '58c45d5a9ee3a86aeace4bd9ecdfeb879df67148b4560024fe47b0248b689a1dadb61e58e9f9e17510bde867146bab5c80e45ef52d998f1d443fc1bac29afbac721197cb77943e2d112607969bacf28843b3f82bbeaf4e434deedd629b42400987ecc8bb166ba0ad2aaf4b5f6ea229e0a9ccda2a8bc6c82f18e36cd7d4d0f7a2849c7e798001e64d525792f6f9876146e7f335aa61d9bfe1ce2fcf150560804cb5d44cf4cdbfc81326faadc889b2baf924b963ad002fde285cb067dd2214fd4064192ccc19373f29e0111ba5f9ca05e4fcf2e260504aef6006da863bc5a5c4c7bc827926d1d3f37f1fcb59f5b52629faf6df2827c6d65bc0be8638590eb9768c09e2da476f86f36549b6eec34441b7ce2589859baf3e9fea71b7e9b88e2cf83f739908855a912d996203a4362735955d3b764f3a0e263f9be9322bfabcf70dc19ff4ba4893d60fb5740357ec7fbbea25e20d5056b6bff62079145af30fa7ddb1b2bc884f390621f54c34ca67c8fb811354e6e9a99e8f79dc0f71e4b291ad9d52858b9b5b08ca95ae5dcb0d2dae6c5da7be6f3df62f14e6e3ce7bc6fe205d022762c9087a54071961e19086f3eb2cdbdbdc74bbc4d840591b9e168fa49780a882b6d43c2d39aa146eaa3d553df78e063aa078d9fae78fe82006f07c3363bd88f6416ceb9020ef7a35b712ed3da04f86be0323a7113e22835dc6d2329f57afb43c', 0, NULL);


--
-- Data for Name: payload_locked_documents_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: payload_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."payload_migrations" ("id", "name", "batch", "updated_at", "created_at") VALUES
	(1, 'dev', -1, '2025-05-07 19:18:42.322+00', '2025-05-04 15:02:30.782+00');


--
-- Data for Name: payload_preferences; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."payload_preferences" ("id", "key", "value", "updated_at", "created_at") VALUES
	(1, 'pages-list', '{"sort": "path", "limit": 10, "preset": null}', '2025-05-04 21:14:22.912+00', '2025-05-04 21:06:40.66+00');


--
-- Data for Name: payload_preferences_rels; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "public"."payload_preferences_rels" ("id", "order", "parent_id", "path", "users_id") VALUES
	(2, NULL, 1, 'user', 1);


--
-- Data for Name: buckets; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: objects; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: s3_multipart_uploads_parts; Type: TABLE DATA; Schema: storage; Owner: supabase_storage_admin
--



--
-- Data for Name: hooks; Type: TABLE DATA; Schema: supabase_functions; Owner: supabase_functions_admin
--



--
-- Data for Name: secrets; Type: TABLE DATA; Schema: vault; Owner: supabase_admin
--



--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('"auth"."refresh_tokens_id_seq"', 1, false);


--
-- Name: header_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."header_id_seq"', 1, true);


--
-- Name: media_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."media_id_seq"', 1, false);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."pages_id_seq"', 6, true);


--
-- Name: payload_locked_documents_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."payload_locked_documents_id_seq"', 6, true);


--
-- Name: payload_locked_documents_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."payload_locked_documents_rels_id_seq"', 6, true);


--
-- Name: payload_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."payload_migrations_id_seq"', 1, true);


--
-- Name: payload_preferences_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."payload_preferences_id_seq"', 5, true);


--
-- Name: payload_preferences_rels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."payload_preferences_rels_id_seq"', 38, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"public"."users_id_seq"', 1, true);


--
-- Name: hooks_id_seq; Type: SEQUENCE SET; Schema: supabase_functions; Owner: supabase_functions_admin
--

SELECT pg_catalog.setval('"supabase_functions"."hooks_id_seq"', 1, false);


--
-- PostgreSQL database dump complete
--

RESET ALL;
