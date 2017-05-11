--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: genre_listings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "genre_listings" (
    "id" integer NOT NULL,
    "genre_id" integer,
    "listing_id" integer,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL
);


--
-- Name: genre_listings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "genre_listings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genre_listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "genre_listings_id_seq" OWNED BY "genre_listings"."id";


--
-- Name: genres; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "genres" (
    "id" integer NOT NULL,
    "name" character varying,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL
);


--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "genres_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "genres_id_seq" OWNED BY "genres"."id";


--
-- Name: genres_listings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "genres_listings" (
    "genre_id" integer,
    "listing_id" integer
);


--
-- Name: import_failures; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "import_failures" (
    "id" integer NOT NULL,
    "title" character varying,
    "year" character varying,
    "failed_attempt" character varying,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL
);


--
-- Name: import_failures_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "import_failures_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: import_failures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "import_failures_id_seq" OWNED BY "import_failures"."id";


--
-- Name: listings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "listings" (
    "id" integer NOT NULL,
    "title" character varying,
    "media_type" character varying,
    "location" character varying,
    "owner" character varying,
    "created_at" timestamp without time zone NOT NULL,
    "updated_at" timestamp without time zone NOT NULL,
    "imdb_rating" integer DEFAULT 0 NOT NULL,
    "eg_rating" double precision,
    "year" character varying,
    "runtime" character varying,
    "plot" "text",
    "poster_url" "text",
    "rt_rating" integer DEFAULT 0 NOT NULL,
    "notes" "text",
    "imdb_id" character varying
);


--
-- Name: listings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "listings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "listings_id_seq" OWNED BY "listings"."id";


--
-- Name: listings_people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "listings_people" (
    "listing_id" integer,
    "person_id" integer
);


--
-- Name: people; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "people" (
    "id" integer NOT NULL,
    "name" character varying,
    "role" character varying,
    "created_at" timestamp without time zone,
    "updated_at" timestamp without time zone
);


--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "people_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "people_id_seq" OWNED BY "people"."id";


--
-- Name: person_listings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "person_listings" (
    "id" integer NOT NULL,
    "person_id" integer,
    "listing_id" integer
);


--
-- Name: person_listings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "person_listings_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: person_listings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "person_listings_id_seq" OWNED BY "person_listings"."id";


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE "schema_migrations" (
    "version" character varying NOT NULL
);


--
-- Name: genre_listings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "genre_listings" ALTER COLUMN "id" SET DEFAULT "nextval"('"genre_listings_id_seq"'::"regclass");


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "genres" ALTER COLUMN "id" SET DEFAULT "nextval"('"genres_id_seq"'::"regclass");


--
-- Name: import_failures id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "import_failures" ALTER COLUMN "id" SET DEFAULT "nextval"('"import_failures_id_seq"'::"regclass");


--
-- Name: listings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "listings" ALTER COLUMN "id" SET DEFAULT "nextval"('"listings_id_seq"'::"regclass");


--
-- Name: people id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "people" ALTER COLUMN "id" SET DEFAULT "nextval"('"people_id_seq"'::"regclass");


--
-- Name: person_listings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "person_listings" ALTER COLUMN "id" SET DEFAULT "nextval"('"person_listings_id_seq"'::"regclass");


--
-- Data for Name: genre_listings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "genre_listings" ("id", "genre_id", "listing_id", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: genre_listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"genre_listings_id_seq"', 682, true);


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "genres" ("id", "name", "created_at", "updated_at") FROM stdin;
1	Drama	2017-01-05 03:10:08.094231	2017-01-05 03:10:08.094231
2	Animated	2017-01-05 03:10:08.127796	2017-01-05 03:10:08.127796
3	Crime	2017-01-05 03:16:43.588042	2017-01-05 03:16:43.588042
4	Mystery	2017-01-05 03:18:00.027036	2017-01-05 03:18:00.027036
5	Thriller	2017-01-05 03:18:00.038922	2017-01-05 03:18:00.038922
6	Comedy	2017-01-05 03:18:41.283959	2017-01-05 03:18:41.283959
7	Action	2017-01-05 03:24:17.652832	2017-01-05 03:24:17.652832
8	Adventure	2017-01-05 03:24:17.678999	2017-01-05 03:24:17.678999
9	Sci-Fi	2017-01-05 03:29:57.976967	2017-01-05 03:29:57.976967
10	Romance	2017-01-05 03:36:57.648995	2017-01-05 03:36:57.648995
11	Fantasy	2017-01-05 03:36:57.670468	2017-01-05 03:36:57.670468
12	Musical	2017-01-05 03:39:06.863024	2017-01-05 03:39:06.863024
13	Sports	2017-01-05 03:40:48.369094	2017-01-05 03:40:48.369094
14	Family	2017-01-05 03:44:31.693608	2017-01-05 03:44:31.693608
15	War	2017-01-05 21:28:13.858286	2017-01-05 21:28:13.858286
16	Christmas	2017-01-05 21:32:25.868779	2017-01-05 21:32:25.868779
17	Documentary	2017-01-05 21:34:34.656923	2017-01-05 21:34:34.656923
18	Children	2017-01-05 21:39:33.599838	2017-01-05 21:39:33.599838
19	Horror	2017-01-05 21:43:42.239188	2017-01-05 21:43:42.239188
20	Western	2017-01-05 22:00:53.902377	2017-01-05 22:00:53.902377
21	Biography	2017-01-05 22:07:49.848356	2017-01-05 22:07:49.848356
22	Music	2017-01-05 22:07:49.871765	2017-01-05 22:07:49.871765
23	Reality	2017-01-05 22:17:31.626746	2017-01-05 22:17:31.626746
24	Talk Show	2017-01-05 22:20:19.046279	2017-01-05 22:20:19.046279
25	Parody	2017-01-05 22:21:43.887384	2017-01-05 22:21:43.887384
26	History	2017-01-05 22:39:30.579186	2017-01-05 22:39:30.579186
27	Martial Arts	2017-01-05 22:41:32.700467	2017-01-05 22:41:32.700467
28	Military	2017-01-05 23:59:27.716222	2017-01-05 23:59:27.716222
29	Political	2017-01-06 01:02:23.692855	2017-01-06 01:02:23.692855
30	Halloween	2017-01-06 13:39:24.374862	2017-01-06 13:39:24.374862
31	Patriotic	2017-01-06 14:33:45.260644	2017-01-06 14:33:45.260644
\.


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"genres_id_seq"', 31, true);


--
-- Data for Name: genres_listings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "genres_listings" ("genre_id", "listing_id") FROM stdin;
1	1
2	1
1	2
3	2
4	3
5	3
6	4
6	5
1	6
5	6
7	7
8	7
6	7
7	8
3	8
6	9
6	10
6	11
9	11
6	12
9	12
6	13
9	13
6	14
7	15
8	15
3	15
7	16
8	16
3	16
1	17
6	18
10	18
11	18
6	19
6	20
12	20
1	21
3	21
6	22
13	22
6	23
6	24
3	25
1	25
3	26
1	26
9	26
2	27
14	27
11	27
6	28
13	28
3	29
1	29
4	29
3	30
1	30
4	30
3	31
1	31
4	31
3	32
1	32
4	32
6	33
6	34
1	34
6	35
2	36
14	36
8	36
1	37
10	37
15	37
1	38
5	38
6	39
6	40
1	40
10	40
6	41
16	41
6	42
8	42
6	43
9	43
13	44
17	44
7	45
7	46
6	47
7	47
9	47
1	48
5	48
2	49
18	49
8	49
1	50
11	50
7	51
8	51
9	51
1	52
19	52
4	52
9	53
2	53
6	53
9	54
2	54
6	54
9	55
2	55
6	55
9	56
2	56
6	56
1	57
4	57
5	57
4	58
9	58
6	59
9	59
6	60
9	60
6	61
19	61
9	61
16	61
6	62
11	62
10	62
20	63
7	63
2	64
8	64
11	64
8	65
6	65
9	65
21	66
1	66
22	66
7	67
8	67
9	67
6	68
6	69
23	70
6	71
16	71
6	72
24	72
6	73
19	73
25	73
7	74
1	74
9	74
7	75
5	75
9	75
6	76
10	76
6	77
6	78
6	79
6	80
6	81
10	81
2	82
18	82
26	82
11	82
17	83
27	84
6	84
7	84
6	85
26	85
11	85
6	86
26	86
11	86
7	87
8	87
3	87
6	88
7	88
3	88
6	89
8	89
6	90
18	90
16	90
6	91
3	91
10	91
5	92
3	92
1	92
5	93
3	93
1	93
1	94
1	95
1	96
6	97
27	97
7	97
6	98
6	99
19	99
7	99
2	100
6	100
16	100
2	101
6	101
16	101
13	102
6	102
1	102
6	103
25	103
6	104
25	104
6	105
1	105
10	105
9	106
2	106
8	106
6	107
3	107
4	107
6	108
6	109
6	110
6	111
28	111
6	112
6	113
25	113
2	114
18	114
11	114
6	115
3	115
11	116
18	116
7	116
3	116
11	117
18	117
7	117
3	117
11	118
18	118
7	118
2	118
24	119
6	119
6	120
1	120
10	120
21	121
1	121
6	122
6	123
16	123
6	124
15	124
6	125
1	125
10	125
1	126
3	126
2	127
18	127
6	127
2	128
18	128
6	128
7	129
10	130
6	130
6	131
29	131
15	132
1	132
7	132
2	133
6	133
4	133
2	134
6	134
8	134
1	135
13	135
10	136
6	136
10	137
6	137
1	137
6	138
6	139
1	140
3	140
6	142
6	143
6	144
3	145
1	145
1	146
8	146
26	146
3	147
6	147
7	147
6	148
6	149
3	149
13	149
6	150
13	150
6	151
7	152
21	152
1	152
2	153
8	153
6	153
6	154
1	154
10	154
6	155
13	155
6	156
3	156
7	156
6	157
1	157
10	157
6	158
12	158
9	158
6	159
16	159
6	160
30	160
6	161
1	161
7	162
8	162
14	162
6	163
8	163
6	164
10	164
2	165
8	165
6	165
18	165
6	166
3	166
6	167
7	168
8	168
5	168
6	169
1	170
3	170
11	170
3	171
7	171
6	171
11	171
6	172
8	172
6	173
13	173
6	174
16	174
6	175
11	175
30	175
6	176
3	176
6	177
3	177
7	177
6	178
6	179
11	179
8	179
6	180
11	180
1	180
6	181
1	182
29	182
6	183
7	183
9	183
31	183
7	184
6	184
4	185
9	185
5	185
3	186
1	186
5	186
1	187
5	187
6	188
1	188
14	188
18	188
6	189
10	189
9	189
2	190
18	190
12	190
8	190
11	190
16	190
30	190
1	191
1	192
11	192
15	192
19	193
19	194
6	195
3	195
7	195
1	196
4	196
9	196
6	197
6	198
1	199
3	199
5	199
6	200
3	200
3	201
1	201
4	202
5	202
3	203
5	203
4	204
10	204
9	204
7	205
8	205
9	205
7	206
8	206
9	206
6	207
6	208
1	208
11	208
6	209
13	209
18	210
2	210
11	210
6	210
7	210
8	210
6	211
11	211
6	212
25	212
6	213
1	213
7	214
6	214
6	215
6	216
6	217
6	218
10	218
6	219
10	219
6	220
19	220
8	220
19	221
5	221
4	221
19	222
5	222
4	222
19	223
5	223
4	223
19	224
5	224
4	224
7	225
3	225
5	225
7	226
3	226
5	226
7	227
3	227
5	227
7	228
3	228
5	228
7	229
8	229
9	229
7	230
8	230
9	230
7	231
8	231
9	231
7	232
5	232
7	233
5	233
7	234
5	234
7	235
5	235
3	236
1	236
5	236
7	238
8	238
6	238
6	239
3	239
6	240
6	241
4	241
3	242
1	242
4	242
3	243
1	243
4	243
3	244
1	244
4	244
3	245
1	245
4	245
2	246
6	246
6	247
1	247
6	248
6	249
2	249
6	250
6	251
6	253
6	254
6	255
6	256
6	257
1	258
11	258
16	258
6	259
11	259
16	259
1	260
7	261
5	261
1	261
8	262
6	262
8	263
6	263
1	263
6	264
6	265
8	265
3	266
1	266
6	266
6	267
3	267
1	267
15	268
7	268
1	268
5	268
7	269
3	269
5	269
4	270
5	270
2	271
6	271
8	271
3	272
6	272
4	272
3	273
1	273
5	273
21	274
3	274
1	274
7	275
8	275
5	275
7	276
8	276
5	276
7	277
8	277
5	277
7	278
8	278
5	278
7	279
8	279
5	279
7	280
8	280
5	280
7	281
8	281
5	281
3	282
5	282
7	283
3	283
5	283
7	284
3	284
1	284
7	285
1	285
13	285
3	286
1	286
5	286
6	287
3	287
12	287
8	288
1	288
11	288
7	289
11	289
8	291
1	291
11	291
1	292
10	292
21	293
1	293
13	293
21	294
3	294
1	294
1	295
9	296
8	296
1	296
\.


--
-- Data for Name: import_failures; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "import_failures" ("id", "title", "year", "failed_attempt", "created_at", "updated_at") FROM stdin;
\.


--
-- Name: import_failures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"import_failures_id_seq"', 1, false);


--
-- Data for Name: listings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "listings" ("id", "title", "media_type", "location", "owner", "created_at", "updated_at", "imdb_rating", "eg_rating", "year", "runtime", "plot", "poster_url", "rt_rating", "notes", "imdb_id") FROM stdin;
4	40-Year-Old Virgin, The	Movie	DVD, HDD	Erik	2017-01-05 03:18:41.270087	2017-05-09 18:53:14.541313	7	\N	\N	\N	\N	\N	0	\N	\N
45	Fast and the Furious, The	Movie	DVD	Erik	2017-01-05 21:36:03.989879	2017-05-09 18:53:14.562123	7	\N	\N	\N	\N	\N	0	\N	\N
29	Dexter (S01)	TV	DVD	Erik	2017-01-05 18:48:46.122117	2017-05-09 18:53:14.584752	9	\N	\N	\N	\N	\N	0	\N	\N
21	Breaking Bad (S03)	TV	DVD	Erik	2017-01-05 03:40:03.368226	2017-05-09 18:53:14.60939	10	\N	\N	\N	\N	\N	0	\N	\N
48	Fight Club	Movie	DVD	Erik	2017-01-05 21:38:23.92326	2017-05-09 18:53:14.654877	9	\N	\N	\N	\N	\N	0	\N	\N
51	Flash Gordon Conquers the Universe	Miniseries	DVD	Erik	2017-01-05 21:42:32.191019	2017-05-09 18:53:14.67534	7	\N	\N	\N	\N	\N	0	\N	\N
53	Futurama (S01)	TV	DVD	Erik	2017-01-05 21:46:40.914947	2017-05-09 18:53:14.697421	8	\N	\N	\N	\N	\N	0	\N	\N
60	Ghostbusters II	Movie	DVD	Erik	2017-01-05 21:54:10.509832	2017-05-09 18:53:14.707676	6	\N	\N	\N	\N	\N	0	\N	\N
66	Immortal Beloved	Movie	DVD	Erik	2017-01-05 22:07:49.833159	2017-05-09 18:53:14.718045	8	\N	\N	\N	\N	\N	0	\N	\N
5	Airplane	Movie	DVD	Erik	2017-01-05 03:20:31.472611	2017-05-09 18:53:14.73178	8	\N	\N	\N	\N	\N	0	\N	\N
1	9	Movie	DVD	Erik	2017-01-05 03:10:08.078511	2017-05-09 18:53:14.743649	7	\N	\N	\N	\N	\N	0	\N	\N
27	Coraline	Movie	DVD	Erik	2017-01-05 03:44:31.678172	2017-05-09 18:53:14.759876	8	\N	\N	\N	\N	\N	0	\N	\N
8	A-Team, The (S01)	TV	DVD	Erik	2017-01-05 03:25:58.833246	2017-05-09 18:53:14.768533	8	\N	\N	\N	\N	\N	0	\N	\N
68	It's Always Sunny in Philadelphia (S03)	TV	DVD	Erik	2017-01-05 22:12:43.148534	2017-05-09 18:53:14.777784	9	\N	\N	\N	\N	\N	0	\N	\N
12	Back to the Future Part III	Movie	DVD	Erik	2017-01-05 03:30:54.427041	2017-05-09 18:53:14.792306	7	\N	\N	\N	\N	\N	0	\N	\N
14	Bad Grandpa	Movie	DVD	Erik	2017-01-05 03:32:37.757219	2017-05-09 18:53:14.811322	7	\N	\N	\N	\N	\N	0	\N	\N
18	Bell, Book and Candle	Movie	DVD	Erik	2017-01-05 03:36:57.6293	2017-05-09 18:53:14.838288	7	\N	\N	\N	\N	\N	0	\N	\N
6	All the King's Men	Movie	DVD	Erik	2017-01-05 03:23:10.937914	2017-05-09 18:53:14.856643	6	\N	\N	\N	\N	\N	0	\N	\N
11	Back to the Future	Movie	DVD	Erik	2017-01-05 03:29:57.965548	2017-05-09 18:53:14.873085	8	\N	\N	\N	\N	\N	0	\N	\N
13	Back to the Future Part II	Movie	DVD	Erik	2017-01-05 03:31:42.535986	2017-05-09 18:53:14.886354	8	\N	\N	\N	\N	\N	0	\N	\N
2	12 Angry Men	Movie	DVD, HDD	Erik	2017-01-05 03:16:43.574712	2017-05-09 18:53:14.912206	9	\N	\N	\N	\N	\N	0	\N	\N
7	Ant-Man	Movie	DVD	Erik	2017-01-05 03:24:17.64482	2017-05-09 18:53:14.932169	7	\N	\N	\N	\N	\N	0	\N	\N
10	Austin Powers: Goldmember	Movie	DVD, HDD	Erik	2017-01-05 03:27:13.292029	2017-05-09 18:53:14.956473	6	\N	\N	\N	\N	\N	0	\N	\N
15	Batman Begins	Movie	DVD	Erik	2017-01-05 03:34:09.474298	2017-05-09 18:53:14.970275	8	\N	\N	\N	\N	\N	0	\N	\N
17	Beautiful Mind, A	Movie	DVD	Erik, Mitch	2017-01-05 03:35:58.895395	2017-05-09 18:53:14.993619	8	\N	\N	\N	\N	\N	0	\N	\N
19	Beverly Hills Ninja	Movie	DVD	Erik	2017-01-05 03:37:45.186495	2017-05-09 18:53:15.012599	6	\N	\N	\N	\N	\N	0	\N	\N
28	Blades of Glory	Movie	DVD	Erik	2017-01-05 18:43:08.692993	2017-05-09 18:53:15.024628	6	\N	\N	\N	\N	\N	0	\N	\N
20	Blue Brothers 2000	Movie	DVD	Erik	2017-01-05 03:39:06.851813	2017-05-09 18:53:15.042595	5	\N	\N	\N	\N	\N	0	\N	\N
36	Brave Little Toaster, The	Movie	DVD	Erik	2017-01-05 21:27:09.286286	2017-05-09 18:53:15.052585	7	\N	\N	\N	\N	\N	0	\N	\N
37	Casablanca	Movie	DVD	Erik	2017-01-05 21:28:13.811538	2017-05-09 18:53:15.060185	9	\N	\N	\N	\N	\N	0	\N	\N
22	Celtic Pride	Movie	DVD	Erik	2017-01-05 03:40:48.344819	2017-05-09 18:53:15.067067	5	\N	\N	\N	\N	\N	0	\N	\N
25	City of God	Movie	DVD	Erik	2017-01-05 03:42:33.641454	2017-05-09 18:53:15.082634	9	\N	\N	\N	\N	\N	0	\N	\N
33	Corky Romano	Movie	DVD	Erik	2017-01-05 21:24:14.391839	2017-05-09 18:53:15.102732	5	\N	\N	\N	\N	\N	0	\N	\N
34	Dan in Real Life	Movie	DVD	Erik	2017-01-05 21:25:03.87815	2017-05-09 18:53:15.110799	7	\N	\N	\N	\N	\N	0	\N	\N
16	Dark Knight, The	Movie	DVD	Erik	2017-01-05 03:35:08.603936	2017-05-09 18:53:15.12153	9	\N	\N	\N	\N	\N	0	\N	\N
30	Dexter (S02)	TV	DVD	Erik	2017-01-05 18:49:08.587847	2017-05-09 18:53:15.133436	9	\N	\N	\N	\N	\N	0	\N	\N
31	Dexter (S03)	TV	DVD	Erik	2017-01-05 18:49:52.569897	2017-05-09 18:53:15.161136	9	\N	\N	\N	\N	\N	0	\N	\N
32	Dexter (S04)	TV	DVD	Erik	2017-01-05 18:50:03.250923	2017-05-09 18:53:15.17093	9	\N	\N	\N	\N	\N	0	\N	\N
35	Dirty Rotten Scoundrels	Movie	DVD	Erik	2017-01-05 21:26:12.961558	2017-05-09 18:53:15.181489	7	\N	\N	\N	\N	\N	0	\N	\N
39	Don't be a Menace	Movie	DVD	Erik	2017-01-05 21:30:48.226979	2017-05-09 18:53:15.189135	7	\N	\N	\N	\N	\N	0	\N	\N
38	Donnie Darko	Movie	DVD	Erik	2017-01-05 21:30:05.991813	2017-05-09 18:53:15.206268	8	\N	\N	\N	\N	\N	0	\N	\N
44	E-A-G-L-E-S!	Movie	DVD	Erik	2017-01-05 21:34:34.637894	2017-05-09 18:53:15.218872	0	\N	\N	\N	\N	\N	0	\N	\N
41	Ernest Saves Christmas	Movie	DVD	Erik	2017-01-05 21:32:25.839654	2017-05-09 18:53:15.231414	6	\N	\N	\N	\N	\N	0	\N	\N
42	Evan Almighty	Movie	DVD	Erik	2017-01-05 21:33:11.827451	2017-05-09 18:53:15.244737	5	\N	\N	\N	\N	\N	0	\N	\N
43	Evolution	Movie	DVD, HDD	Erik	2017-01-05 21:33:58.863661	2017-05-09 18:53:15.274491	6	\N	\N	\N	\N	\N	0	\N	\N
52	Forgotten, The	Movie	DVD	Erik	2017-01-05 21:43:42.201232	2017-05-09 18:53:15.290876	6	\N	\N	\N	\N	\N	0	\N	\N
56	Futurama: Bender's Game	Movie	DVD	Erik	2017-01-05 21:47:51.969732	2017-05-09 18:53:15.297544	7	\N	\N	\N	\N	\N	0	\N	\N
54	Futurama: The Beast with a Billion Backs	Movie	DVD	Erik	2017-01-05 21:47:13.917286	2017-05-09 18:53:15.314375	7	\N	\N	\N	\N	\N	0	\N	\N
57	Game, The	Movie	Blu-Ray	Erik	2017-01-05 21:48:37.486222	2017-05-09 18:53:15.329008	8	\N	\N	\N	\N	\N	0	\N	\N
58	Grand Tour: Disaster in Time	Movie	DVD	Erik	2017-01-05 21:51:51.883298	2017-05-09 18:53:15.340584	7	\N	\N	\N	\N	\N	0	\N	\N
61	Gremlins	Movie	DVD	Erik	2017-01-05 21:55:24.13517	2017-05-09 18:53:15.34814	7	\N	\N	\N	\N	\N	0	\N	\N
62	Groundhog Day	Movie	DVD	Erik	2017-01-05 21:56:58.124505	2017-05-09 18:53:15.356402	8	\N	\N	\N	\N	\N	0	\N	\N
63	Gun Justice (Old Westerns Variety)	TV	DVD	Erik	2017-01-05 22:00:53.894851	2017-05-09 18:53:15.366694	0	\N	\N	\N	\N	\N	0	\N	\N
69	Head of State	Movie	DVD	Erik	2017-01-05 22:15:57.837002	2017-05-09 18:53:15.389689	5	\N	\N	\N	\N	\N	0	\N	\N
64	Heavy Metal	Movie	Blu-Ray	Erik	2017-01-05 22:02:53.25493	2017-05-09 18:53:15.397795	7	\N	\N	\N	\N	\N	0	\N	\N
67	Inception	Movie	DVD, HDD	Erik	2017-01-05 22:09:03.88473	2017-05-09 18:53:15.431625	9	\N	\N	\N	\N	\N	0	\N	\N
70	Jackass 2.5	Movie	DVD	Erik	2017-01-05 22:17:31.619392	2017-05-09 18:53:15.441525	6	\N	\N	\N	\N	\N	0	\N	\N
72	Johnny Carson (Best of)	TV	DVD	Erik	2017-01-05 22:20:19.024895	2017-05-09 18:53:15.472501	8	\N	\N	\N	\N	\N	0	\N	\N
73	Little Shop of Horrors, The (Rifftrax)	Movie	DVD	Erik	2017-01-05 22:21:43.861293	2017-05-09 18:53:15.490769	6	\N	\N	\N	\N	\N	0	\N	\N
74	Meteor	Miniseries	DVD	Erik	2017-01-05 22:23:56.320894	2017-05-09 18:53:15.511163	4	\N	\N	\N	\N	\N	0	\N	\N
78	Monty Python and the Holy Grail	Movie	DVD	Erik	2017-01-05 22:28:51.557617	2017-05-09 18:53:15.522193	8	\N	\N	\N	\N	\N	0	\N	\N
80	Monty Python's Life of Brian	Movie	DVD	Erik	2017-01-05 22:30:21.940722	2017-05-09 18:53:15.540194	8	\N	\N	\N	\N	\N	0	\N	\N
79	Monty Python's The Meaning of Life	Movie	DVD	Erik	2017-01-05 22:30:03.298975	2017-05-09 18:53:15.552582	8	\N	\N	\N	\N	\N	0	\N	\N
75	Moon 44	Movie	DVD	Erik	2017-01-05 22:25:10.519517	2017-05-09 18:53:15.566355	5	\N	\N	\N	\N	\N	0	\N	\N
76	Moon Over Parador	Movie	DVD	Erik	2017-01-05 22:25:59.91072	2017-05-09 18:53:15.58183	6	\N	\N	\N	\N	\N	0	\N	\N
81	Mr. Deeds	Movie	DVD	Erik	2017-01-05 22:31:21.740202	2017-05-09 18:53:15.602151	6	\N	\N	\N	\N	\N	0	\N	\N
82	Mr. Peabody and Sherman	Movie	Blu-Ray	Erik	2017-01-05 22:39:30.541246	2017-05-09 18:53:15.621354	7	\N	\N	\N	\N	\N	0	\N	\N
83	Mustang, The Complete	Movie	DVD	Erik	2017-01-05 22:40:39.213176	2017-05-09 18:53:15.645783	0	\N	\N	\N	\N	\N	0	\N	\N
84	New Police Story	Movie	DVD	Erik	2017-01-05 22:41:32.691173	2017-05-09 18:53:15.673242	7	\N	\N	\N	\N	\N	0	\N	\N
3	39 Steps, The	Movie	DVD	Erik	2017-01-05 03:18:00.020448	2017-05-09 18:53:14.49965	8	\N	\N	\N	\N	\N	0	\N	\N
102	Slap Shot	Movie	DVD	Erik	2017-01-05 23:03:31.530424	2017-05-09 18:53:15.701994	7	\N	\N	\N	\N	\N	0	\N	\N
169	Grandma's Boy	Movie	HDD	Erik	2017-01-06 14:08:32.990353	2017-05-09 18:53:15.713594	7	\N	\N	\N	\N	\N	0	\N	\N
113	Superhero Movie	Movie	DVD	Erik	2017-01-06 00:42:45.418616	2017-05-09 18:53:15.739108	4	\N	\N	\N	\N	\N	0	\N	\N
125	Truman Show, The	Movie	DVD	Erik	2017-01-06 00:56:06.837198	2017-05-09 18:53:15.770794	8	\N	\N	\N	\N	\N	0	\N	\N
105	Spanglish	Movie	DVD	Erik	2017-01-05 23:30:21.11301	2017-05-09 18:53:15.784572	6	\N	\N	\N	\N	\N	0	\N	\N
145	American Psycho	Movie	HDD	Erik	2017-01-06 03:29:29.2322	2017-05-09 18:53:15.814064	8	\N	\N	\N	\N	\N	0	\N	\N
136	27 Dresses	Movie	HDD	Erik	2017-01-06 03:19:26.725949	2017-05-09 18:53:15.828332	6	\N	\N	\N	\N	\N	0	\N	\N
137	500 Days of Summer	Movie	HDD	Erik	2017-01-06 03:20:51.353116	2017-05-09 18:53:15.852603	8	\N	\N	\N	\N	\N	0	\N	\N
138	Ace Ventura: Pet Detective	Movie	HDD	Erik	2017-01-06 03:21:45.366382	2017-05-09 18:53:15.880793	7	\N	\N	\N	\N	\N	0	\N	\N
139	Ace Ventura: When Nature Calls	Movie	HDD	Erik	2017-01-06 03:22:38.352461	2017-05-09 18:53:15.904142	6	\N	\N	\N	\N	\N	0	\N	\N
140	American History X	Movie	HDD	Erik	2017-01-06 03:23:29.281764	2017-05-09 18:53:15.922204	9	\N	\N	\N	\N	\N	0	\N	\N
142	American Pie	Movie	HDD, DVD	Erik, Mitch	2017-01-06 03:26:02.627628	2017-05-09 18:53:15.94878	7	\N	\N	\N	\N	\N	0	\N	\N
146	Apollo 13	Movie	HDD	Erik	2017-01-06 03:30:36.292174	2017-05-09 18:53:15.964836	8	\N	\N	\N	\N	\N	0	\N	\N
147	Bad Boys II	Movie	HDD	Erik	2017-01-06 03:31:30.399201	2017-05-09 18:53:15.990806	7	\N	\N	\N	\N	\N	0	\N	\N
148	Bad Teacher	Movie	HDD	Erik	2017-01-06 03:32:22.80846	2017-05-09 18:53:16.004057	6	\N	\N	\N	\N	\N	0	\N	\N
149	Balls of Fury	Movie	HDD	Erik	2017-01-06 03:33:42.537216	2017-05-09 18:53:16.024554	5	\N	\N	\N	\N	\N	0	\N	\N
150	Beerfest	Movie	HDD	Erik	2017-01-06 03:35:43.28178	2017-05-09 18:53:16.04075	6	\N	\N	\N	\N	\N	0	\N	\N
151	Billy Madison	Movie	HDD	Erik	2017-01-06 03:36:44.841031	2017-05-09 18:53:16.060475	6	\N	\N	\N	\N	\N	0	\N	\N
152	Bloodsport	Movie	HDD	Erik	2017-01-06 03:37:38.365543	2017-05-09 18:53:16.081158	7	\N	\N	\N	\N	\N	0	\N	\N
156	Cop Out	Movie	HDD	Erik	2017-01-06 03:42:53.744327	2017-05-09 18:53:16.116939	6	\N	\N	\N	\N	\N	0	\N	\N
157	Crazy, Stupid, Love	Movie	HDD	Erik	2017-01-06 13:36:06.476634	2017-05-09 18:53:16.132205	7	\N	\N	\N	\N	\N	0	\N	\N
107	Dead Men Don't Wear Plaid	Movie	DVD	Erik	2017-01-05 23:55:28.112007	2017-05-09 18:53:16.144541	7	\N	\N	\N	\N	\N	0	\N	\N
158	Dr. Horrible's Sing-Along Blog	Movie	HDD	Erik	2017-01-06 13:37:34.696935	2017-05-09 18:53:16.155192	9	\N	\N	\N	\N	\N	0	\N	\N
159	Elf	Movie	HDD	Erik	2017-01-06 13:38:42.773747	2017-05-09 18:53:16.168351	7	\N	\N	\N	\N	\N	0	\N	\N
160	Ernest Scared Stupid	Movie	HDD	Erik	2017-01-06 13:39:24.360968	2017-05-09 18:53:16.197331	6	\N	\N	\N	\N	\N	0	\N	\N
161	Extract	Movie	HDD	Erik	2017-01-06 13:40:57.085842	2017-05-09 18:53:16.216614	6	\N	\N	\N	\N	\N	0	\N	\N
163	Ferris Bueller's Day Off	Movie	HDD	Erik	2017-01-06 13:43:03.303505	2017-05-09 18:53:16.232283	8	\N	\N	\N	\N	\N	0	\N	\N
164	Forgetting Sarah Marshall	Movie	HDD	Erik	2017-01-06 13:44:30.467078	2017-05-09 18:53:16.248969	7	\N	\N	\N	\N	\N	0	\N	\N
165	Frozen	Movie	HDD	Erik	2017-01-06 13:59:46.916358	2017-05-09 18:53:16.264317	8	\N	\N	\N	\N	\N	0	\N	\N
167	Get Him to the Greek	Movie	HDD	Erik	2017-01-06 14:02:55.331013	2017-05-09 18:53:16.312775	6	\N	\N	\N	\N	\N	0	\N	\N
59	Ghostbusters	Movie	DVD	Erik	2017-01-05 21:52:50.286463	2017-05-09 18:53:16.328535	8	\N	\N	\N	\N	\N	0	\N	\N
170	Green Mile, The	Movie	HDD	Erik	2017-01-06 14:10:57.00023	2017-05-09 18:53:16.340884	8	\N	\N	\N	\N	\N	0	\N	\N
171	Hancock	Movie	HDD	Erik	2017-01-06 14:12:29.678258	2017-05-09 18:53:16.357472	6	\N	\N	\N	\N	\N	0	\N	\N
108	Jerk, The	Movie	DVD	Erik	2017-01-05 23:56:23.942792	2017-05-09 18:53:16.375153	7	\N	\N	\N	\N	\N	0	\N	\N
85	Night at the Museum	Movie	DVD	Erik	2017-01-05 22:42:55.718356	2017-05-09 18:53:16.392072	6	\N	\N	\N	\N	\N	0	\N	\N
87	North by Northwest	Movie	DVD	Erik	2017-01-05 22:45:59.867083	2017-05-09 18:53:16.404313	8	\N	\N	\N	\N	\N	0	\N	\N
88	Other Guys, The	Movie	DVD	Erik	2017-01-05 22:47:06.867139	2017-05-09 18:53:16.440196	7	\N	\N	\N	\N	\N	0	\N	\N
89	Pee-Wee's Big Adventure	Movie	DVD	Erik	2017-01-05 22:48:02.511984	2017-05-09 18:53:16.449457	7	\N	\N	\N	\N	\N	0	\N	\N
96	Pi	Movie	DVD	Erik	2017-01-05 22:56:36.158925	2017-05-09 18:53:16.463202	8	\N	\N	\N	\N	\N	0	\N	\N
91	Pink Panther, The	Movie	DVD	Erik	2017-01-05 22:51:02.255474	2017-05-09 18:53:16.48721	7	\N	\N	\N	\N	\N	0	\N	\N
92	Primal Fear	Movie	DVD	Erik	2017-01-05 22:51:54.69381	2017-05-09 18:53:16.501121	8	\N	\N	\N	\N	\N	0	\N	\N
94	Rain Man	Movie	DVD	Erik	2017-01-05 22:54:18.349301	2017-05-09 18:53:16.520605	8	\N	\N	\N	\N	\N	0	\N	\N
97	Rush Hour 3	Movie	DVD	Erik	2017-01-05 22:57:38.919148	2017-05-09 18:53:16.5661	6	\N	\N	\N	\N	\N	0	\N	\N
98	Saturday Night Life (Best of Dan Aykroyd)	TV	DVD	Erik	2017-01-05 22:58:09.932139	2017-05-09 18:53:16.5822	8	\N	\N	\N	\N	\N	0	\N	\N
99	Shaun of the Dead	Movie	DVD	Erik	2017-01-05 22:58:57.129512	2017-05-09 18:53:16.595408	8	\N	\N	\N	\N	\N	0	\N	\N
101	Simpsons, The (Christmas 2)	TV	DVD	Erik	2017-01-05 23:01:57.697544	2017-05-09 18:53:16.607103	9	\N	\N	\N	\N	\N	0	\N	\N
100	Simpsons, The (Christmas)	TV	DVD	Erik	2017-01-05 23:01:41.610861	2017-05-09 18:53:16.613633	9	\N	\N	\N	\N	\N	0	\N	\N
106	Star Wars: The Padawan Menace (Lego)	Movie	DVD, Blu-Ray	Erik	2017-01-05 23:35:36.993804	2017-05-09 18:53:16.62518	7	\N	\N	\N	\N	\N	0	\N	\N
110	Strange Brew	Movie	DVD	Erik	2017-01-05 23:58:25.50394	2017-05-09 18:53:16.63201	7	\N	\N	\N	\N	\N	0	\N	\N
111	Stripes	Movie	DVD	Erik	2017-01-05 23:59:27.69458	2017-05-09 18:53:16.654867	7	\N	\N	\N	\N	\N	0	\N	\N
114	Super Mario Bros Super Show, The (Best of)	TV	DVD	Erik	2017-01-06 00:43:44.622313	2017-05-09 18:53:16.668078	6	\N	\N	\N	\N	\N	0	\N	\N
115	Super Troopers	Movie	DVD	Erik	2017-01-06 00:46:08.835764	2017-05-09 18:53:16.674419	7	\N	\N	\N	\N	\N	0	\N	\N
116	Teenage Mutant Ninja Turtles	Movie	DVD	Erik	2017-01-06 00:46:58.161375	2017-05-09 18:53:16.68059	7	\N	\N	\N	\N	\N	0	\N	\N
118	Teenage Mutant Ninja Turtles: Turtles Forever	Movie	DVD	Erik	2017-01-06 00:48:48.53533	2017-05-09 18:53:16.696078	8	\N	\N	\N	\N	\N	0	\N	\N
120	Terminal, The	Movie	DVD	Erik	2017-01-06 00:50:49.223742	2017-05-09 18:53:16.706688	7	\N	\N	\N	\N	\N	0	\N	\N
135	The Wrestler	Movie	DVD	Erik	2017-01-06 01:08:03.742455	2017-05-09 18:53:16.715975	8	\N	\N	\N	\N	\N	0	\N	\N
121	This Boy's Life	Movie	DVD	Erik	2017-01-06 00:52:10.202588	2017-05-09 18:53:16.722005	7	\N	\N	\N	\N	\N	0	\N	\N
122	Three Stooges, The	TV	DVD	Erik	2017-01-06 00:53:10.688569	2017-05-09 18:53:16.733295	9	\N	\N	\N	\N	\N	0	\N	\N
123	Trading Places	Movie	DVD	Erik	2017-01-06 00:54:05.612353	2017-05-09 18:53:16.745846	8	\N	\N	\N	\N	\N	0	\N	\N
124	Tropic Thunder	Movie	DVD, HDD	Erik	2017-01-06 00:55:26.046977	2017-05-09 18:53:16.772559	7	\N	\N	\N	\N	\N	0	\N	\N
126	Untouchables, The	Movie	DVD	Erik	2017-01-06 00:57:39.896227	2017-05-09 18:53:16.790552	8	\N	\N	\N	\N	\N	0	\N	\N
127	Up	Movie	DVD	Erik	2017-01-06 00:58:38.120366	2017-05-09 18:53:16.816638	8	\N	\N	\N	\N	\N	0	\N	\N
128	Wall-E	Movie	DVD	Erik	2017-01-06 00:59:41.791004	2017-05-09 18:53:16.823489	8	\N	\N	\N	\N	\N	0	\N	\N
129	Wanted	Movie	DVD	Erik	2017-01-06 01:01:02.586497	2017-05-09 18:53:16.829968	7	\N	\N	\N	\N	\N	0	\N	\N
130	Wedding Singer, The	Movie	DVD	Erik	2017-01-06 01:01:43.702275	2017-05-09 18:53:16.835702	7	\N	\N	\N	\N	\N	0	\N	\N
131	Welcome to Mooseport	Movie	DVD	Erik	2017-01-06 01:02:23.662059	2017-05-09 18:53:16.84454	5	\N	\N	\N	\N	\N	0	\N	\N
133	Who Framed Roger Rabbit	Movie	DVD	Erik	2017-01-06 01:05:44.255613	2017-05-09 18:53:16.851552	8	\N	\N	\N	\N	\N	0	\N	\N
132	Windtalkers	Movie	DVD	Erik	2017-01-06 01:04:01.810301	2017-05-09 18:53:16.860223	6	\N	\N	\N	\N	\N	0	\N	\N
104	Young Frankenstein	Movie	DVD	Erik	2017-01-05 23:29:05.592959	2017-05-09 18:53:16.884682	8	\N	\N	\N	\N	\N	0	\N	\N
153	Brave	Movie	HDD	Erik	2017-01-06 03:38:54.515651	2017-05-09 18:53:16.891583	7	\N	\N	\N	\N	\N	0	\N	\N
86	Night at the Museum: Battle of the Smithsonian	Movie	DVD	Erik	2017-01-05 22:44:28.101691	2017-05-09 18:53:15.690448	6	\N	\N	\N	\N	\N	0	\N	\N
216	Wayne's World	Movie	HDD	Erik	2017-01-06 16:26:15.158444	2017-05-09 18:53:16.911154	7	\N	\N	\N	\N	\N	0	\N	\N
240	Arrested Development (Complete)	TV	HDD	Erik	2017-01-06 17:11:30.827636	2017-05-09 18:53:16.920626	9	\N	\N	\N	\N	\N	0	\N	\N
238	Austin Powers: The Spy Who Shagged Me	Movie	HDD	Erik	2017-01-06 17:08:11.595097	2017-05-09 18:53:16.929716	7	\N	\N	\N	\N	\N	0	\N	\N
256	Bo Burnham: Words, Words, Words	Comedy Special	HDD	Erik	2017-01-06 17:37:20.915983	2017-05-09 18:53:16.937361	8	\N	\N	\N	\N	\N	0	\N	\N
241	Bored to Death	TV	HDD	Erik	2017-01-06 17:14:26.186641	2017-05-09 18:53:16.943444	8	\N	\N	\N	\N	\N	0	\N	\N
258	Christmas Carol, A	Movie	Amazon	Erik	2017-01-06 17:40:19.437091	2017-05-09 18:53:16.955133	7	\N	\N	\N	\N	\N	0	\N	\N
253	Demetri Martin: These Are Jokes	Comedy Special	HDD	Erik	2017-01-06 17:36:19.301954	2017-05-09 18:53:16.966828	8	\N	\N	\N	\N	\N	0	\N	\N
242	Dexter (S05)	TV	HDD	Erik	2017-01-06 17:20:09.000301	2017-05-09 18:53:16.976155	9	\N	\N	\N	\N	\N	0	\N	\N
243	Dexter (S06)	TV	HDD	Erik	2017-01-06 17:20:58.270959	2017-05-09 18:53:17.001581	9	\N	\N	\N	\N	\N	0	\N	\N
245	Dexter (S08)	TV	HDD	Erik	2017-01-06 17:23:09.946657	2017-05-09 18:53:17.008459	9	\N	\N	\N	\N	\N	0	\N	\N
232	Die Hard	Movie	HDD	Erik	2017-01-06 16:56:27.389703	2017-05-09 18:53:17.015681	8	\N	\N	\N	\N	\N	0	\N	\N
233	Die Hard 2	Movie	HDD	Erik	2017-01-06 16:58:24.224429	2017-05-09 18:53:17.023247	7	\N	\N	\N	\N	\N	0	\N	\N
246	Frisky Dingo (Complete)	TV	HDD	Erik	2017-01-06 17:27:34.114887	2017-05-09 18:53:17.040023	8	\N	\N	\N	\N	\N	0	\N	\N
172	Hangover, The	Movie	HDD	Erik	2017-01-06 14:13:50.260126	2017-05-09 18:53:17.047583	8	\N	\N	\N	\N	\N	0	\N	\N
174	Hebrew Hammer, The	Movie	HDD	Erik	2017-01-06 14:16:39.369622	2017-05-09 18:53:17.054589	6	\N	\N	\N	\N	\N	0	\N	\N
247	Hello Ladies (Complete)	TV	HDD	Erik	2017-01-06 17:28:21.742174	2017-05-09 18:53:17.066342	8	\N	\N	\N	\N	\N	0	\N	\N
175	Hocus Pocus	Movie	HDD	Erik	2017-01-06 14:22:02.786245	2017-05-09 18:53:17.073062	7	\N	\N	\N	\N	\N	0	\N	\N
176	Horrible Bosses	Movie	HDD	Erik	2017-01-06 14:23:24.818869	2017-05-09 18:53:17.079511	7	\N	\N	\N	\N	\N	0	\N	\N
177	Hot Fuzz	Movie	HDD	Erik	2017-01-06 14:24:40.295254	2017-05-09 18:53:17.086859	8	\N	\N	\N	\N	\N	0	\N	\N
178	Hot Rod	Movie	HDD	Erik	2017-01-06 14:26:27.959147	2017-05-09 18:53:17.094841	7	\N	\N	\N	\N	\N	0	\N	\N
179	Hot Tub Time Machine	Movie	HDD	Erik	2017-01-06 14:27:27.395417	2017-05-09 18:53:17.12463	6	\N	\N	\N	\N	\N	0	\N	\N
180	Hudsucker Proxy, The	Movie	HDD	Erik	2017-01-06 14:28:38.963154	2017-05-09 18:53:17.137457	7	\N	\N	\N	\N	\N	0	\N	\N
182	Ides of March, The	Movie	HDD	Erik	2017-01-06 14:31:40.890491	2017-05-09 18:53:17.148612	7	\N	\N	\N	\N	\N	0	\N	\N
183	Independence Day	Movie	HDD	Erik	2017-01-06 14:33:45.207946	2017-05-09 18:53:17.162856	7	\N	\N	\N	\N	\N	0	\N	\N
229	Iron Man	Movie	HDD	Erik	2017-01-06 16:51:55.173867	2017-05-09 18:53:17.171874	8	\N	\N	\N	\N	\N	0	\N	\N
230	Iron Man 2	Movie	HDD	Erik	2017-01-06 16:52:53.450302	2017-05-09 18:53:17.178157	7	\N	\N	\N	\N	\N	0	\N	\N
231	Iron Man 3	Movie	HDD	Erik	2017-01-06 16:54:03.452483	2017-05-09 18:53:17.191799	7	\N	\N	\N	\N	\N	0	\N	\N
225	Lethal Weapon	Movie	HDD	Erik	2017-01-06 16:48:31.908416	2017-05-09 18:53:17.224468	8	\N	\N	\N	\N	\N	0	\N	\N
227	Lethal Weapon 3	Movie	HDD	Erik	2017-01-06 16:49:38.762134	2017-05-09 18:53:17.23858	7	\N	\N	\N	\N	\N	0	\N	\N
228	Lethal Weapon 4	Movie	HDD	Erik	2017-01-06 16:50:40.747263	2017-05-09 18:53:17.245288	7	\N	\N	\N	\N	\N	0	\N	\N
185	Limitless	Movie	HDD	Erik	2017-01-06 14:36:52.800049	2017-05-09 18:53:17.259546	8	\N	\N	\N	\N	\N	0	\N	\N
235	Live Free or Die Hard	Movie	HDD	Erik	2017-01-06 17:01:41.416499	2017-05-09 18:53:17.275836	7	\N	\N	\N	\N	\N	0	\N	\N
187	Machinist, The	Movie	HDD	Erik	2017-01-06 14:39:27.439214	2017-05-09 18:53:17.282977	8	\N	\N	\N	\N	\N	0	\N	\N
211	Mask, The	Movie	HDD	Erik	2017-01-06 16:18:26.583488	2017-05-09 18:53:17.289422	7	\N	\N	\N	\N	\N	0	\N	\N
188	Mighty Ducks, The	Movie	HDD	Erik	2017-01-06 14:40:44.575185	2017-05-09 18:53:17.299615	6	\N	\N	\N	\N	\N	0	\N	\N
189	Multiplicity	Movie	HDD	Erik	2017-01-06 14:42:05.814802	2017-05-09 18:53:17.311957	6	\N	\N	\N	\N	\N	0	\N	\N
248	Muppets Tonight (Complete)	TV	HDD	Erik	2017-01-06 17:29:35.828636	2017-05-09 18:53:17.345906	8	\N	\N	\N	\N	\N	0	\N	\N
255	Nick Swardson: Seriously, Who Farted?	Comedy Special	HDD	Erik	2017-01-06 17:37:02.856271	2017-05-09 18:53:17.357211	7	\N	\N	\N	\N	\N	0	\N	\N
190	Nightmare Before Christmas, The	Movie	HDD	Erik	2017-01-06 14:43:29.565266	2017-05-09 18:53:17.36581	8	\N	\N	\N	\N	\N	0	\N	\N
191	One Flew Over the Cuckoo's Nest	Movie	HDD	Erik	2017-01-06 14:45:44.701593	2017-05-09 18:53:17.372243	9	\N	\N	\N	\N	\N	0	\N	\N
192	Pan's Labrynth	Movie	HDD	Erik	2017-01-06 14:47:36.630498	2017-05-09 18:53:17.378137	8	\N	\N	\N	\N	\N	0	\N	\N
193	Paranormal Activity	Movie	HDD	Erik	2017-01-06 14:48:24.444086	2017-05-09 18:53:17.384441	6	\N	\N	\N	\N	\N	0	\N	\N
195	Pineapple Express	Movie	HDD	Erik	2017-01-06 14:51:16.112047	2017-05-09 18:53:17.392399	7	\N	\N	\N	\N	\N	0	\N	\N
196	Prestige, The	Movie	HDD	Erik	2017-01-06 14:52:35.725589	2017-05-09 18:53:17.398942	8	\N	\N	\N	\N	\N	0	\N	\N
93	Rainmaker, The	Movie	DVD, HDD	Erik	2017-01-05 22:53:12.537999	2017-05-09 18:53:17.404988	7	\N	\N	\N	\N	\N	0	\N	\N
257	Ricky Gervais: Out of England	Comedy Special	HDD	Erik	2017-01-06 17:37:42.183981	2017-05-09 18:53:17.41088	8	\N	\N	\N	\N	\N	0	\N	\N
249	Rocko's Modern Life (Complete)	TV	HDD	Erik	2017-01-06 17:30:56.703322	2017-05-09 18:53:17.417843	8	\N	\N	\N	\N	\N	0	\N	\N
197	Role Models	Movie	HDD	Erik	2017-01-06 14:54:46.32842	2017-05-09 18:53:17.423919	7	\N	\N	\N	\N	\N	0	\N	\N
221	Saw	Movie	HDD	Erik	2017-01-06 16:43:42.165551	2017-05-09 18:53:17.448386	8	\N	\N	\N	\N	\N	0	\N	\N
222	Saw II	Movie	HDD	Erik	2017-01-06 16:44:31.884559	2017-05-09 18:53:17.470904	7	\N	\N	\N	\N	\N	0	\N	\N
224	Saw IV	Movie	HDD	Erik	2017-01-06 16:46:19.649446	2017-05-09 18:53:17.478712	6	\N	\N	\N	\N	\N	0	\N	\N
259	Scrooged	Movie	DVD	Erik	2017-01-06 23:46:51.558511	2017-05-09 18:53:17.491871	7	\N	\N	\N	\N	\N	0	\N	\N
199	Se7en	Movie	HDD	Erik	2017-01-06 15:59:40.408589	2017-05-09 18:53:17.498356	9	\N	\N	\N	\N	\N	0	\N	\N
250	Seinfeld (Complete)	TV	HDD	Erik	2017-01-06 17:32:15.846136	2017-05-09 18:53:17.512542	9	\N	\N	\N	\N	\N	0	\N	\N
200	Seven Psychopaths	Movie	HDD	Erik	2017-01-06 16:01:42.091895	2017-05-09 18:53:17.520249	7	\N	\N	\N	\N	\N	0	\N	\N
202	Shutter Island	Movie	HDD	Erik	2017-01-06 16:08:48.467897	2017-05-09 18:53:17.527073	8	\N	\N	\N	\N	\N	0	\N	\N
203	Sin City	Movie	HDD	Erik	2017-01-06 16:09:36.672839	2017-05-09 18:53:17.542426	8	\N	\N	\N	\N	\N	0	\N	\N
204	Source Code	Movie	HDD	Erik	2017-01-06 16:10:30.361348	2017-05-09 18:53:17.56159	8	\N	\N	\N	\N	\N	0	\N	\N
260	Stand and Deliver	Movie	DVD	Mitch	2017-01-08 16:43:53.325671	2017-05-09 18:53:17.57921	7	\N	\N	\N	\N	\N	0	\N	\N
206	Star Trek	Movie	HDD	Erik	2017-01-06 16:13:03.702554	2017-05-09 18:53:17.592256	8	\N	\N	\N	\N	\N	0	\N	\N
205	Star Trek Into Darkness	Movie	HDD	Erik	2017-01-06 16:12:03.653602	2017-05-09 18:53:17.604134	8	\N	\N	\N	\N	\N	0	\N	\N
207	Step Brothers	Movie	HDD	Erik	2017-01-06 16:14:05.012589	2017-05-09 18:53:17.611739	7	\N	\N	\N	\N	\N	0	\N	\N
210	Tangled	Movie	HDD	Erik	2017-01-06 16:17:39.727971	2017-05-09 18:53:17.639483	8	\N	\N	\N	\N	\N	0	\N	\N
212	Top Secret!	Movie	HDD	Erik	2017-01-06 16:20:07.017444	2017-05-09 18:53:17.645688	7	\N	\N	\N	\N	\N	0	\N	\N
213	UHF	Movie	HDD	Erik	2017-01-06 16:21:59.504549	2017-05-09 18:53:17.652208	7	\N	\N	\N	\N	\N	0	\N	\N
214	Undercover Brother	Movie	HDD	Erik	2017-01-06 16:23:16.91522	2017-05-09 18:53:17.667844	6	\N	\N	\N	\N	\N	0	\N	\N
215	Waiting...	Movie	HDD, DVD	Erik, Mitch	2017-01-06 16:25:27.240327	2017-05-09 18:53:17.678855	7	\N	\N	\N	\N	\N	0	\N	\N
217	What about Bob?	Movie	HDD	Erik	2017-01-06 16:28:07.162334	2017-05-09 18:53:17.691959	7	\N	\N	\N	\N	\N	0	\N	\N
218	Yes Man	Movie	HDD	Erik	2017-01-06 16:29:15.996491	2017-05-09 18:53:17.711522	7	\N	\N	\N	\N	\N	0	\N	\N
219	Zack and Miri Make a Porno	Movie	HDD	Erik	2017-01-06 16:30:31.130337	2017-05-09 18:53:17.719388	7	\N	\N	\N	\N	\N	0	\N	\N
220	Zombieland	Movie	HDD	Erik	2017-01-06 16:31:20.55783	2017-05-09 18:53:17.727882	8	\N	\N	\N	\N	\N	0	\N	\N
271	Stewie Griffin: The Untold Story	Movie	DVD	Mitch	2017-01-08 17:03:07.089494	2017-05-09 18:53:17.736193	8	\N	\N	\N	\N	\N	0	\N	\N
112	Superbad	Movie	DVD, HDD	Erik	2017-01-06 00:41:12.353353	2017-05-09 18:53:17.742347	8	\N	\N	\N	\N	\N	0	\N	\N
119	Triumph the Insult Comic Dog (Best of)	TV	DVD	Erik	2017-01-06 00:49:54.872393	2017-05-09 18:53:17.783634	8	\N	\N	\N	\N	\N	0	\N	\N
46	2Fast 2Furious	Movie	DVD	Erik	2017-01-05 21:36:46.296443	2017-05-09 18:53:17.822476	6	\N	\N	\N	\N	\N	0	\N	\N
144	American Wedding	Movie	HDD	Erik	2017-01-06 03:28:27.947795	2017-05-09 18:53:17.84131	6	\N	\N	\N	\N	\N	0	\N	\N
268	Behind Enemy Lines	Movie	DVD	Mitch	2017-01-08 17:00:10.045615	2017-05-09 18:53:17.895476	6	\N	\N	\N	\N	\N	0	\N	\N
288	Big Fish	Movie	DVD	Mitch	2017-01-08 17:22:14.425476	2017-05-09 18:53:17.908603	8	\N	\N	\N	\N	\N	0	\N	\N
155	Caddyshack	Movie	HDD	Erik	2017-01-06 03:42:00.869259	2017-05-09 18:53:17.936267	7	\N	\N	\N	\N	\N	0	\N	\N
287	Chicago	Movie	DVD	Mitch	2017-01-08 17:21:03.662717	2017-05-09 18:53:17.964964	7	\N	\N	\N	\N	\N	0	\N	\N
293	Cinderella Man	Movie	DVD	Mitch	2017-01-08 17:27:02.820222	2017-05-09 18:53:17.990233	8	\N	\N	\N	\N	\N	0	\N	\N
273	Collateral	Movie	DVD	Mitch	2017-01-08 17:06:01.624147	2017-05-09 18:53:18.004496	8	\N	\N	\N	\N	\N	0	\N	\N
282	Confidence	Movie	DVD	Mitch	2017-01-08 17:15:41.216633	2017-05-09 18:53:18.011777	7	\N	\N	\N	\N	\N	0	\N	\N
236	Departed, The	Movie	HDD, DVD	Erik, Mitch	2017-01-06 17:03:12.455765	2017-05-09 18:53:18.020054	8	\N	\N	\N	\N	\N	0	\N	\N
244	Dexter (S07)	TV	HDD	Erik	2017-01-06 17:22:23.49779	2017-05-09 18:53:18.038672	9	\N	\N	\N	\N	\N	0	\N	\N
40	Drumline	Movie	DVD	Erik	2017-01-05 21:31:48.041452	2017-05-09 18:53:18.066245	6	\N	\N	\N	\N	\N	0	\N	\N
285	Friday Night Lights	Movie	DVD	Mitch	2017-01-08 17:18:46.744004	2017-05-09 18:53:18.134692	7	\N	\N	\N	\N	\N	0	\N	\N
55	Futurama: Bender's Big Score	Movie	DVD	Erik	2017-01-05 21:47:36.463698	2017-05-09 18:53:18.154837	8	\N	\N	\N	\N	\N	0	\N	\N
274	Goodfellas	Movie	DVD	Mitch	2017-01-08 17:07:00.863104	2017-05-09 18:53:18.168845	9	\N	\N	\N	\N	\N	0	\N	\N
173	Happy Gilmore	Movie	HDD	Erik	2017-01-06 14:15:06.321787	2017-05-09 18:53:18.174741	7	\N	\N	\N	\N	\N	0	\N	\N
65	Hitchhiker's Guide to the Galaxy, The	Movie	DVD	Erik	2017-01-05 22:05:02.540504	2017-05-09 18:53:18.187185	7	\N	\N	\N	\N	\N	0	\N	\N
283	Italian Job, The	Movie	DVD	Mitch	2017-01-08 17:16:34.042355	2017-05-09 18:53:18.208597	7	\N	\N	\N	\N	\N	0	\N	\N
280	James Bond: Casino Royale	Movie	DVD	Mitch	2017-01-08 17:11:27.142355	2017-05-09 18:53:18.227831	8	\N	\N	\N	\N	\N	0	\N	\N
277	James Bond: Dr. No	Movie	DVD	Mitch	2017-01-08 17:09:10.088836	2017-05-09 18:53:18.235117	7	\N	\N	\N	\N	\N	0	\N	\N
168	James Bond: GoldenEye	Movie	HDD, DVD	Erik, Mitch	2017-01-06 14:06:58.506827	2017-05-09 18:53:18.244916	7	\N	\N	\N	\N	\N	0	\N	\N
276	James Bond: Goldfinger	Movie	DVD	Mitch	2017-01-08 17:08:35.196327	2017-05-09 18:53:18.251753	8	\N	\N	\N	\N	\N	0	\N	\N
278	James Bond: Never Say Never Again	Movie	DVD	Mitch	2017-01-08 17:10:11.720262	2017-05-09 18:53:18.269121	6	\N	\N	\N	\N	\N	0	\N	\N
281	James Bond: Quantum of Solace	Movie	DVD	Mitch	2017-01-08 17:12:37.592764	2017-05-09 18:53:18.276573	7	\N	\N	\N	\N	\N	0	\N	\N
275	James Bond: Tomorrow Never Dies	Movie	DVD	Mitch	2017-01-08 17:07:52.995559	2017-05-09 18:53:18.282965	6	\N	\N	\N	\N	\N	0	\N	\N
261	Last Castle, The	Movie	DVD	Mitch	2017-01-08 16:44:43.451179	2017-05-09 18:53:18.288567	7	\N	\N	\N	\N	\N	0	\N	\N
226	Lethal Weapon 2	Movie	HDD	Erik	2017-01-06 16:49:09.263325	2017-05-09 18:53:18.295187	7	\N	\N	\N	\N	\N	0	\N	\N
77	Monty Python's Flying Circus (Complete collection)	TV	DVD	Erik	2017-01-05 22:27:51.43601	2017-05-09 18:53:18.323709	8	\N	\N	\N	\N	\N	0	\N	\N
264	Old School	Movie	DVD	Mitch	2017-01-08 16:54:23.160996	2017-05-09 18:53:18.357233	7	\N	\N	\N	\N	\N	0	\N	\N
194	Paranormal Activity 2	Movie	HDD	Erik	2017-01-06 14:49:34.967353	2017-05-09 18:53:18.383459	6	\N	\N	\N	\N	\N	0	\N	\N
286	Reservoir Dogs	Movie	DVD	Mitch	2017-01-08 17:19:52.766227	2017-05-09 18:53:18.412638	8	\N	\N	\N	\N	\N	0	\N	\N
223	Saw III	Movie	HDD	Erik	2017-01-06 16:45:30.063422	2017-05-09 18:53:18.420421	6	\N	\N	\N	\N	\N	0	\N	\N
201	Shawshank Redemption, The	Movie	HDD	Erik	2017-01-06 16:04:26.216266	2017-05-09 18:53:18.456486	9	\N	\N	\N	\N	\N	0	\N	\N
296	Firefly (Complete)	TV	DVD	Erik	2017-02-02 23:06:20.559931	2017-05-09 18:53:18.49919	9	\N	\N	\N	\N	\N	0	\N	\N
47	Fifth Element, The	Movie	DVD	Erik	2017-01-05 21:37:31.003227	2017-05-09 18:53:14.641286	8	\N	\N	\N	\N	\N	0	\N	\N
24	Christopher Titus: Norman Rockwell is Bleeding	Comedy Special	DVD	Erik	2017-01-05 03:41:34.338947	2017-05-09 18:53:14.823308	9	\N	\N	\N	\N	\N	0	\N	\N
26	Clockwork Orange, A	Movie	Blu-Ray	Erik	2017-01-05 03:43:39.63673	2017-05-09 18:53:15.092361	8	\N	\N	\N	\N	\N	0	\N	\N
50	Five People You Meet in Heaven, The	Movie	DVD	Erik	2017-01-05 21:40:42.22438	2017-05-09 18:53:15.284299	7	\N	\N	\N	\N	\N	0	\N	\N
71	Jeff Dunham's Very Special Christmas Special	Comedy Special	DVD	Erik	2017-01-05 22:19:31.276076	2017-05-09 18:53:15.462691	8	\N	\N	\N	\N	\N	0	\N	\N
143	American Pie 2	Movie	HDD, DVD	Erik, Mitch	2017-01-06 03:27:07.613417	2017-05-09 18:53:15.798885	6	\N	\N	\N	\N	\N	0	\N	\N
154	Bridesmaids	Movie	HDD	Erik	2017-01-06 03:41:11.165326	2017-05-09 18:53:16.10238	7	\N	\N	\N	\N	\N	0	\N	\N
166	Fun with Dick and Jane	Movie	HDD	Erik	2017-01-06 14:01:21.782756	2017-05-09 18:53:16.276551	6	\N	\N	\N	\N	\N	0	\N	\N
95	Requiem for a Dream	Movie	DVD	Erik	2017-01-05 22:55:56.252291	2017-05-09 18:53:16.547268	8	\N	\N	\N	\N	\N	0	\N	\N
209	Talladega Nights:  The Ballad of Ricky Bobby	Movie	HDD	Erik	2017-01-06 16:16:34.045414	2017-05-09 18:53:17.749058	7	\N	\N	\N	\N	\N	0	\N	\N
265	Tommy Boy	Movie	DVD	Mitch	2017-01-08 16:55:36.654784	2017-05-09 18:53:17.767826	7	\N	\N	\N	\N	\N	0	\N	\N
279	James Bond: Die Another Day	Movie	DVD	Mitch	2017-01-08 17:10:47.650815	2017-05-09 18:53:17.81269	6	\N	\N	\N	\N	\N	0	\N	\N
289	300	Movie	DVD	Mitch	2017-01-08 17:23:44.482196	2017-05-09 18:53:17.832872	8	\N	\N	\N	\N	\N	0	\N	\N
239	Andy Barker, P.I. (Complete)	TV	HDD	Erik	2017-01-06 17:10:18.923326	2017-05-09 18:53:17.856452	8	\N	\N	\N	\N	\N	0	\N	\N
9	Austin Powers: International Man of Mystery	Movie	DVD, HDD	Erik	2017-01-05 03:26:39.591327	2017-05-09 18:53:17.866514	7	\N	\N	\N	\N	\N	0	\N	\N
267	Bandits	Movie	DVD	Mitch	2017-01-08 16:59:27.38514	2017-05-09 18:53:17.8772	6	\N	\N	\N	\N	\N	0	\N	\N
294	Catch Me If You Can	Movie	DVD	Mitch	2017-01-08 17:27:49.287853	2017-05-09 18:53:17.949046	8	\N	\N	\N	\N	\N	0	\N	\N
263	Dogma	Movie	DVD	Mitch	2017-01-08 16:52:29.504461	2017-05-09 18:53:18.058041	7	\N	\N	\N	\N	\N	0	\N	\N
162	Fantastic 4: Rise of the Silver Surfer	Movie	HDD	Erik	2017-01-06 13:41:55.225977	2017-05-09 18:53:18.076218	6	\N	\N	\N	\N	\N	0	\N	\N
49	Finding Nemo	Movie	DVD	Erik	2017-01-05 21:39:33.580461	2017-05-09 18:53:18.089859	8	\N	\N	\N	\N	\N	0	\N	\N
284	Four Brothers	Movie	DVD	Mitch	2017-01-08 17:17:40.046579	2017-05-09 18:53:18.123607	7	\N	\N	\N	\N	\N	0	\N	\N
269	Gone in 60 Seconds	Movie	DVD	Mitch	2017-01-08 17:01:09.695355	2017-05-09 18:53:18.16231	6	\N	\N	\N	\N	\N	0	\N	\N
181	I Love You, Man	Movie	HDD	Erik	2017-01-06 14:30:28.598104	2017-05-09 18:53:18.194905	7	\N	\N	\N	\N	\N	0	\N	\N
270	Identity	Movie	DVD	Mitch	2017-01-08 17:01:56.624946	2017-05-09 18:53:18.201841	7	\N	\N	\N	\N	\N	0	\N	\N
109	Lonely Guy, The	Movie	DVD	Erik	2017-01-05 23:57:30.319977	2017-05-09 18:53:18.310767	6	\N	\N	\N	\N	\N	0	\N	\N
291	Lord of the Rings: The Fellowship of the Ring	Movie	DVD	Mitch	2017-01-08 17:25:30.676013	2017-05-09 18:53:18.316865	9	\N	\N	\N	\N	\N	0	\N	\N
272	My Cousin Vinny	Movie	DVD	Mitch	2017-01-08 17:05:06.404413	2017-05-09 18:53:18.344639	8	\N	\N	\N	\N	\N	0	\N	\N
90	Pee-Wee's Playhouse Christmas Special	Movie	DVD	Erik	2017-01-05 22:49:57.963178	2017-05-09 18:53:18.39206	8	\N	\N	\N	\N	\N	0	\N	\N
266	Pulp Fiction	Movie	DVD	Mitch	2017-01-08 16:58:26.44889	2017-05-09 18:53:18.404176	9	\N	\N	\N	\N	\N	0	\N	\N
103	Spaceballs	Movie	DVD, Amazon	Erik	2017-01-05 23:28:32.422666	2017-05-09 18:53:18.469087	7	\N	\N	\N	\N	\N	0	\N	\N
134	Wreck-It Ralph	Movie	DVD	Erik	2017-01-06 01:07:22.963919	2017-05-09 18:53:18.475006	8	\N	\N	\N	\N	\N	0	\N	\N
295	Mud	Movie	DVD	Erik	2017-01-18 20:14:42.879812	2017-05-09 18:53:18.480949	7	\N	\N	\N	\N	\N	0	\N	\N
117	Teenage Mutant Ninja Turtles II:  The Secret of the Ooze	Movie	DVD	Erik	2017-01-06 00:47:40.895591	2017-05-09 18:53:16.686837	6	\N	\N	\N	\N	\N	0	\N	\N
254	Daniel Tosh: Happy Thoughts	Comedy Special	HDD	Erik	2017-01-06 17:36:40.463368	2017-05-09 18:53:16.901097	8	\N	\N	\N	\N	\N	0	\N	\N
234	Die Hard with a Vengeance	Movie	HDD	Erik	2017-01-06 17:00:28.166034	2017-05-09 18:53:17.030662	8	\N	\N	\N	\N	\N	0	\N	\N
184	Kick Ass	Movie	HDD	Erik	2017-01-06 14:35:25.98293	2017-05-09 18:53:17.203895	8	\N	\N	\N	\N	\N	0	\N	\N
251	Muppet Show, The (Complete)	TV	HDD	Erik	2017-01-06 17:33:23.291982	2017-05-09 18:53:17.332338	8	\N	\N	\N	\N	\N	0	\N	\N
198	School for Scoundrels	Movie	HDD	Erik	2017-01-06 14:57:49.546773	2017-05-09 18:53:17.485024	6	\N	\N	\N	\N	\N	0	\N	\N
208	Stranger than Fiction	Movie	HDD	Erik	2017-01-06 16:14:47.805647	2017-05-09 18:53:17.62717	8	\N	\N	\N	\N	\N	0	\N	\N
23	Christopher Titus: Love is Evol	Comedy Special	DVD, HDD	Erik	2017-01-05 03:41:27.939199	2017-05-09 18:53:17.977181	8	\N	\N	\N	\N	\N	0	\N	\N
262	Harold & Kumar Go to White Castle	Movie	DVD	Mitch	2017-01-08 16:45:46.884527	2017-05-09 18:53:18.18074	7	\N	\N	\N	\N	\N	0	\N	\N
186	Lincoln Lawyer, The	Movie	HDD	Erik	2017-01-06 14:37:54.850425	2017-05-09 18:53:18.304247	7	\N	\N	\N	\N	\N	0	\N	\N
292	Seven Pounds	Movie	DVD	Mitch	2017-01-08 17:26:16.305102	2017-05-09 18:53:18.432902	8	\N	\N	\N	\N	\N	0	\N	\N
\.


--
-- Name: listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"listings_id_seq"', 296, true);


--
-- Data for Name: listings_people; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "listings_people" ("listing_id", "person_id") FROM stdin;
1	1
1	2
1	3
1	4
1	5
2	6
2	7
2	8
2	9
3	10
3	11
3	12
4	13
4	14
4	15
4	16
5	17
5	18
5	19
5	20
5	21
5	22
6	23
6	24
6	25
6	26
6	27
6	28
6	29
6	30
7	15
7	31
7	32
7	33
7	34
7	35
7	36
8	37
8	38
8	39
8	40
9	41
9	42
9	43
10	41
10	44
10	45
10	43
11	46
11	47
11	48
11	49
11	4
11	50
12	46
12	47
12	48
12	49
12	51
12	50
13	46
13	47
13	48
13	49
13	50
14	52
14	53
15	45
15	54
15	55
15	56
15	57
15	58
15	59
16	45
16	60
16	55
16	56
16	61
16	58
16	62
16	59
17	63
17	1
17	64
17	65
17	66
18	67
18	68
18	69
19	70
19	71
19	72
19	73
20	74
20	75
20	76
21	77
21	78
21	79
21	80
22	74
22	81
22	82
22	83
23	84
23	85
24	84
24	85
25	86
25	87
25	88
26	89
26	90
26	91
26	92
27	93
27	94
27	95
28	96
28	97
28	98
28	99
29	100
29	101
29	102
29	103
30	100
30	101
30	102
30	104
31	100
31	101
31	102
31	105
32	100
32	101
32	102
32	106
33	107
33	108
33	109
33	110
34	13
34	111
34	112
34	113
35	114
35	45
35	115
35	116
36	117
36	118
36	119
37	120
37	121
37	122
38	123
38	60
38	124
38	125
38	126
38	127
38	128
39	129
39	130
39	131
40	132
40	133
40	134
40	135
41	136
41	137
42	13
42	138
42	75
42	139
42	140
43	141
43	142
43	134
43	143
43	144
45	145
45	146
45	147
46	145
46	148
46	149
46	150
47	151
47	56
47	152
47	153
47	154
47	88
48	155
48	156
48	157
48	158
49	159
49	160
49	161
50	162
50	163
50	164
50	165
51	166
51	167
51	168
51	169
51	170
52	143
52	171
52	172
52	173
53	174
53	175
53	176
53	177
53	178
54	174
54	175
54	176
54	179
54	177
54	178
55	174
55	175
55	176
55	177
55	178
56	174
56	175
56	176
56	177
56	178
57	35
57	23
57	158
58	164
58	180
58	181
58	182
59	183
59	184
59	74
59	185
59	186
59	187
59	144
60	183
60	184
60	74
60	185
60	186
60	187
60	188
60	144
59	188
61	189
61	190
61	191
62	183
62	192
62	193
62	194
63	195
63	196
63	197
63	198
64	199
64	184
64	200
65	201
65	202
65	203
65	204
65	205
65	206
65	207
65	208
66	56
66	209
66	210
66	211
67	212
67	213
67	214
67	215
67	57
67	216
67	59
68	217
68	218
68	219
68	220
68	221
68	222
68	223
69	71
69	224
69	225
70	52
70	226
70	227
70	53
71	228
71	229
72	230
72	231
73	232
73	233
73	234
73	235
73	236
74	237
74	238
74	47
74	239
74	240
75	241
75	242
75	243
75	244
76	245
76	246
76	247
76	248
77	249
77	250
77	251
77	252
77	253
77	254
78	249
78	250
78	251
78	252
78	253
78	254
78	255
78	256
79	249
79	250
79	251
79	252
79	253
79	254
79	256
80	249
80	250
80	251
80	252
80	253
80	254
80	256
81	257
81	258
81	259
81	260
81	261
82	262
82	263
84	264
84	265
84	266
84	267
84	268
85	269
85	270
85	271
85	272
85	273
85	274
85	275
86	269
86	276
86	277
86	278
86	279
86	280
86	274
86	281
86	275
85	281
87	282
87	283
87	284
87	12
88	285
88	96
88	286
88	287
88	288
88	148
88	289
89	290
89	291
89	292
89	293
89	294
89	295
90	290
90	296
90	297
90	298
90	299
90	300
91	301
91	302
91	303
91	304
91	305
92	155
92	306
92	307
92	308
92	309
92	310
93	311
93	221
93	312
93	162
93	313
93	314
93	315
94	316
94	317
94	318
94	319
95	163
95	320
95	1
95	130
95	321
96	322
96	323
96	324
96	325
96	326
96	327
96	328
96	321
97	264
97	153
97	329
98	74
98	330
99	331
99	332
99	333
99	334
99	335
99	336
100	337
100	338
100	339
100	340
100	278
100	341
100	177
101	337
101	338
101	339
101	340
101	278
101	341
101	177
102	342
102	343
102	344
102	345
102	346
102	347
102	348
102	349
102	350
102	351
103	352
103	199
103	186
103	353
103	354
103	355
104	356
104	357
104	358
104	359
104	355
105	257
105	360
105	361
105	359
105	362
106	363
106	364
106	365
106	366
107	114
107	367
107	368
107	369
108	114
108	370
108	371
108	372
108	369
109	114
109	373
109	374
109	375
109	376
109	377
110	186
110	378
110	379
110	380
110	381
110	382
111	183
111	184
111	199
111	383
111	384
111	144
112	385
112	386
112	387
112	14
112	388
112	389
113	390
113	391
113	392
113	393
113	394
113	395
113	19
113	396
113	397
114	398
114	399
115	400
115	401
115	402
115	403
115	404
115	405
115	406
115	407
115	408
115	409
116	410
116	411
116	412
116	413
117	414
117	415
117	416
119	417
119	418
120	419
120	420
120	421
120	422
121	212
121	423
121	424
121	425
122	426
122	427
122	428
122	429
123	74
123	430
123	431
123	432
123	433
123	434
123	76
124	435
124	269
124	436
124	437
124	438
124	439
124	440
124	387
124	441
124	316
124	442
124	443
125	444
125	307
125	64
125	445
125	446
125	447
126	448
126	449
126	450
126	423
126	451
126	452
127	453
127	161
128	454
128	455
128	456
128	457
128	161
129	458
129	138
129	459
129	460
130	257
130	125
130	461
130	462
131	463
131	464
131	465
131	466
131	467
132	468
132	469
132	470
132	446
132	26
132	471
132	472
133	473
133	47
133	474
133	475
133	50
134	2
134	476
134	477
134	478
134	479
134	480
134	481
135	313
135	482
135	483
135	321
136	484
136	485
136	486
136	487
137	214
137	202
137	488
137	489
138	444
138	490
138	140
139	444
139	491
139	492
139	493
140	155
140	494
140	495
140	496
142	497
142	498
142	499
142	500
142	501
142	502
142	503
142	142
142	504
142	505
142	506
143	497
143	498
143	499
143	500
143	501
143	502
143	503
143	142
143	504
143	508
144	497
144	499
144	500
144	503
144	142
144	504
144	509
145	55
145	510
145	511
145	512
145	513
146	419
146	514
146	172
146	515
146	64
146	66
147	516
147	517
147	518
147	519
147	520
148	521
148	522
148	523
148	524
148	525
149	526
149	527
149	528
149	529
149	530
149	531
149	532
149	533
149	534
149	535
150	402
150	401
150	400
150	359
150	403
150	404
150	408
150	409
151	257
151	536
151	537
151	538
151	539
151	540
152	541
152	542
152	543
152	544
153	545
153	546
153	161
154	547
154	548
154	549
154	550
154	551
154	552
155	553
155	554
155	555
155	556
155	183
155	194
156	151
156	557
156	558
156	559
157	13
157	560
157	143
157	561
157	562
158	563
158	564
158	565
158	566
159	96
159	567
159	51
159	202
159	568
159	569
160	136
160	570
160	571
160	137
161	572
161	573
161	547
161	574
161	575
161	576
162	577
162	578
162	579
162	580
163	581
163	582
163	583
163	584
163	585
163	586
164	523
164	587
164	573
164	588
164	387
164	385
164	15
164	589
164	478
164	590
165	587
165	591
165	592
165	593
165	594
166	444
166	360
166	595
166	596
167	588
167	385
167	551
167	597
167	590
168	598
168	599
168	600
168	601
168	602
168	603
168	604
169	605
169	606
169	607
169	608
169	609
169	610
169	611
169	612
169	613
170	419
170	614
170	615
170	616
170	204
170	617
170	618
171	516
171	572
171	619
171	620
172	621
172	622
172	623
172	624
172	625
172	395
172	626
173	257
173	392
173	627
173	628
173	629
173	73
174	630
174	631
174	632
174	633
174	634
175	635
175	636
175	637
175	638
175	639
175	640
176	572
176	641
176	218
176	642
176	643
176	644
176	645
177	331
177	334
177	646
177	335
178	647
178	648
178	387
178	649
178	650
178	651
178	652
178	653
178	654
178	655
178	656
179	657
179	658
179	659
179	660
179	661
180	662
180	663
180	342
180	664
180	665
181	15
181	523
181	666
181	667
181	668
181	647
181	575
181	669
181	670
181	671
181	672
181	673
182	560
182	674
182	675
182	676
182	483
182	482
182	677
183	516
183	678
183	353
183	679
183	680
183	681
183	682
183	244
184	683
184	468
184	684
184	388
184	685
185	621
185	423
185	686
185	687
185	688
186	442
186	482
186	689
186	690
186	691
187	55
187	663
187	692
187	693
188	694
188	695
188	696
188	697
188	698
188	699
189	286
189	192
189	504
189	194
190	700
190	701
190	702
190	703
190	295
191	704
191	235
191	705
191	706
191	221
191	47
191	707
191	708
192	709
192	710
192	711
192	712
193	713
193	714
193	715
193	716
194	717
194	718
194	713
194	719
194	714
194	720
195	14
195	721
195	439
195	659
195	722
195	723
195	724
196	55
196	725
196	45
196	726
196	727
196	728
196	59
197	15
197	142
197	729
197	388
197	476
197	730
197	731
197	732
197	733
197	734
198	97
198	735
198	736
198	614
198	477
198	179
198	626
199	156
199	138
199	641
199	737
199	158
200	738
200	204
200	739
200	527
200	740
200	741
201	662
201	138
201	742
201	743
201	744
201	745
201	746
201	747
201	618
202	212
202	26
202	748
202	380
202	749
202	750
202	751
203	313
203	151
203	752
203	578
203	753
203	754
204	123
204	755
204	756
204	757
205	758
205	133
205	759
205	760
205	331
205	761
205	762
205	763
205	764
206	758
206	133
206	759
206	760
206	331
206	761
206	762
206	765
206	766
206	767
206	764
207	96
207	2
207	51
207	768
207	769
207	770
207	289
208	96
208	771
208	317
208	772
209	96
209	2
209	773
209	722
209	476
209	276
209	614
209	478
209	774
209	289
210	775
210	776
210	777
210	778
210	779
211	444
211	521
211	780
211	781
211	782
212	783
212	784
212	785
212	786
212	787
212	20
212	21
213	788
213	789
213	790
213	791
213	792
213	793
213	794
214	795
214	107
214	796
214	797
214	798
214	563
214	799
215	800
215	801
215	802
215	803
215	804
215	805
215	112
215	806
215	807
216	41
216	808
216	809
216	810
216	811
217	183
217	245
217	18
217	812
217	813
217	116
218	444
218	202
218	621
218	814
218	815
218	816
218	817
218	36
219	14
219	729
219	659
219	559
220	818
220	739
220	819
220	820
220	723
220	821
221	822
221	823
221	824
221	825
221	826
221	827
222	828
222	829
222	830
222	831
223	832
223	833
223	834
223	831
224	832
224	835
224	836
224	831
225	837
225	824
225	838
225	839
226	837
226	824
226	840
226	695
226	839
227	837
227	824
227	840
227	841
227	839
228	837
228	824
228	840
228	841
228	71
228	842
228	839
229	436
229	737
229	843
229	844
229	774
229	569
230	436
230	737
230	313
230	204
230	845
230	728
230	287
230	569
231	436
231	737
231	846
231	845
231	727
231	668
231	748
231	847
232	151
232	207
232	848
232	849
232	850
233	151
233	744
233	848
233	851
233	849
233	852
234	151
234	853
234	287
234	854
234	855
234	850
235	151
235	801
235	856
235	530
235	857
235	858
235	859
236	212
236	311
236	235
236	285
236	860
236	861
236	751
238	41
238	624
238	862
238	303
238	809
238	863
238	864
238	42
238	43
239	865
239	866
239	867
239	868
239	869
240	572
240	651
240	395
240	870
240	871
240	872
240	386
240	868
241	873
241	622
241	874
241	875
241	876
241	877
242	100
242	101
242	878
242	879
243	100
243	101
243	205
243	880
243	881
244	100
244	101
244	882
244	883
245	100
245	101
245	884
246	885
246	886
246	887
246	888
246	889
246	890
246	891
247	892
247	893
247	894
247	895
247	896
250	897
250	239
250	789
250	898
253	899
253	900
254	901
254	902
255	611
255	903
256	904
256	905
257	281
257	906
258	907
258	908
258	909
258	910
259	183
259	911
259	912
259	913
259	839
260	880
260	914
260	915
260	916
261	917
261	27
261	26
261	918
262	919
262	762
262	920
262	563
262	921
263	574
263	311
263	922
263	71
263	207
263	923
263	924
263	858
263	925
263	926
263	927
263	559
264	928
264	929
264	96
264	930
264	931
264	932
264	933
264	934
264	626
265	70
265	935
265	74
265	936
265	937
265	809
265	938
265	939
266	151
266	940
266	287
266	941
266	365
266	942
266	943
266	944
267	151
267	735
267	945
267	319
268	464
268	277
268	946
268	947
269	468
269	459
269	948
269	949
269	950
269	951
270	657
270	952
270	953
270	954
271	955
271	863
271	956
271	573
271	957
271	958
272	840
272	482
272	959
272	960
272	961
272	696
272	962
273	963
273	316
273	964
273	26
273	109
273	965
274	423
274	952
274	840
274	966
274	751
275	598
275	967
275	968
275	969
276	451
276	970
276	971
276	972
277	451
277	973
277	974
277	975
278	451
278	976
278	977
278	978
279	598
279	979
279	980
279	981
280	982
280	983
280	601
280	604
281	982
281	984
281	985
281	772
282	986
282	317
282	987
282	988
283	644
283	285
283	155
283	989
283	990
283	991
284	285
284	992
284	993
284	994
284	843
284	150
285	735
285	994
285	995
285	996
285	620
286	997
286	998
286	999
286	1000
286	1001
286	944
287	1002
287	420
287	306
287	1003
287	1004
288	1005
288	1006
288	1007
288	1008
288	157
288	295
289	1009
289	1010
289	171
289	1011
289	1012
289	1013
291	1014
291	1015
291	1016
291	1017
292	516
292	1018
292	739
292	1019
293	63
293	1002
293	1020
293	66
294	212
294	1021
294	527
294	422
295	442
295	1022
295	1023
295	1024
296	564
296	1025
296	479
296	1026
296	1027
296	1028
296	1029
296	1030
296	1031
296	566
\.


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "people" ("id", "name", "role", "created_at", "updated_at") FROM stdin;
1	Jennifer Connelly	actor	2017-01-05 03:10:08.147352	2017-01-05 03:10:08.147352
2	John C. Reilly	actor	2017-01-05 03:10:08.167551	2017-01-05 03:10:08.167551
3	Christopher Plummer	actor	2017-01-05 03:10:08.185402	2017-01-05 03:10:08.185402
4	Crispin Glover	actor	2017-01-05 03:10:08.2032	2017-01-05 03:10:08.2032
5	Shane Acker	director	2017-01-05 03:14:22.091351	2017-01-05 03:14:22.091351
6	Henry Fonda	actor	2017-01-05 03:16:43.598985	2017-01-05 03:16:43.598985
7	Lee Cobb	actor	2017-01-05 03:16:43.609099	2017-01-05 03:16:43.609099
8	Ed Begley	actor	2017-01-05 03:16:43.618592	2017-01-05 03:16:43.618592
9	Sidney Lumet	director	2017-01-05 03:16:43.628308	2017-01-05 03:16:43.628308
10	Robert Donat	actor	2017-01-05 03:18:00.048979	2017-01-05 03:18:00.048979
11	Madeleine Carroll	actor	2017-01-05 03:18:00.059965	2017-01-05 03:18:00.059965
12	Alfred Hitchcock	director	2017-01-05 03:18:00.073931	2017-01-05 03:18:00.073931
13	Steve Carrell	actor	2017-01-05 03:18:41.316518	2017-01-05 03:18:41.316518
15	Paul Rudd	actor	2017-01-05 03:18:41.350128	2017-01-05 03:18:41.350128
16	Judd Apatow	director	2017-01-05 03:18:41.362933	2017-01-05 03:18:41.362933
17	Robert Hays	actor	2017-01-05 03:20:31.488713	2017-01-05 03:20:31.488713
19	Leslie Nielsen	actor	2017-01-05 03:20:31.506714	2017-01-05 03:20:31.506714
20	Jim Abrahams	director	2017-01-05 03:20:31.515881	2017-01-05 03:20:31.515881
21	David Zucker	director	2017-01-05 03:20:31.525583	2017-01-05 03:20:31.525583
22	Jerry Zucker	director	2017-01-05 03:20:31.53528	2017-01-05 03:20:31.53528
23	Sean Penn	actor	2017-01-05 03:23:10.965256	2017-01-05 03:23:10.965256
24	Jude Law	actor	2017-01-05 03:23:10.976725	2017-01-05 03:23:10.976725
25	Kate Winslet	actor	2017-01-05 03:23:10.987608	2017-01-05 03:23:10.987608
26	Mark Ruffalo	actor	2017-01-05 03:23:10.998169	2017-01-05 03:23:10.998169
27	James Gandolfini	actor	2017-01-05 03:23:11.009033	2017-01-05 03:23:11.009033
28	Patricia Clarkson	actor	2017-01-05 03:23:11.029667	2017-01-05 03:23:11.029667
29	Anthony Hopkins	actor	2017-01-05 03:23:11.045831	2017-01-05 03:23:11.045831
30	Steve Zaillian	director	2017-01-05 03:23:11.055788	2017-01-05 03:23:11.055788
31	Evangeline Lilly	actor	2017-01-05 03:24:17.717565	2017-01-05 03:24:17.717565
32	Corey Stoll	actor	2017-01-05 03:24:17.738756	2017-01-05 03:24:17.738756
33	Bobby Cannavale	actor	2017-01-05 03:24:17.752687	2017-01-05 03:24:17.752687
34	Michael Pena	actor	2017-01-05 03:24:17.766415	2017-01-05 03:24:17.766415
35	Michael Douglas	actor	2017-01-05 03:24:17.790708	2017-01-05 03:24:17.790708
36	Peyton Reed	director	2017-01-05 03:24:17.810749	2017-01-05 03:24:17.810749
37	Mr. T	actor	2017-01-05 03:25:58.850842	2017-01-05 03:25:58.850842
38	George Peppard	actor	2017-01-05 03:25:58.860522	2017-01-05 03:25:58.860522
39	Dirk Benedict	actor	2017-01-05 03:25:58.876716	2017-01-05 03:25:58.876716
40	Dwight Schultz	actor	2017-01-05 03:25:58.888013	2017-01-05 03:25:58.888013
41	Mike Myers	actor	2017-01-05 03:26:39.607334	2017-01-05 03:26:39.607334
42	Elizabeth Hurley	actor	2017-01-05 03:26:39.618404	2017-01-05 03:26:39.618404
43	Jay Roach	director	2017-01-05 03:26:39.638231	2017-01-05 03:26:39.638231
44	Beyonce Knowles	actor	2017-01-05 03:27:13.309794	2017-01-05 03:27:13.309794
45	Michael Caine	actor	2017-01-05 03:27:13.319891	2017-01-05 03:27:13.319891
46	Michael J. Fox	actor	2017-01-05 03:29:57.986054	2017-01-05 03:29:57.986054
47	Christopher Lloyd	actor	2017-01-05 03:29:57.995465	2017-01-05 03:29:57.995465
48	Lea Thompson	actor	2017-01-05 03:29:58.004123	2017-01-05 03:29:58.004123
49	Tom Wilson	actor	2017-01-05 03:29:58.013821	2017-01-05 03:29:58.013821
50	Robert Zemeckis	director	2017-01-05 03:29:58.034026	2017-01-05 03:29:58.034026
51	Mary Steenburgen	actor	2017-01-05 03:30:54.473399	2017-01-05 03:30:54.473399
52	Johnny Knoxville	actor	2017-01-05 03:32:37.784103	2017-01-05 03:32:37.784103
53	Jeff Tremaine	director	2017-01-05 03:32:37.816568	2017-01-05 03:32:37.816568
54	Katie Holmes	actor	2017-01-05 03:34:09.517348	2017-01-05 03:34:09.517348
55	Christian Bale	actor	2017-01-05 03:34:09.53039	2017-01-05 03:34:09.53039
56	Gary Oldman	actor	2017-01-05 03:34:09.548056	2017-01-05 03:34:09.548056
57	Cillian Murphy	actor	2017-01-05 03:34:09.558801	2017-01-05 03:34:09.558801
58	Liam Neeson	actor	2017-01-05 03:34:09.582402	2017-01-05 03:34:09.582402
59	Christopher Nolan	director	2017-01-05 03:34:09.592494	2017-01-05 03:34:09.592494
60	Maggie Gyllenhaal	actor	2017-01-05 03:35:08.647025	2017-01-05 03:35:08.647025
61	Heath Ledger	actor	2017-01-05 03:35:08.671648	2017-01-05 03:35:08.671648
62	Aaron Eckhart	actor	2017-01-05 03:35:08.69927	2017-01-05 03:35:08.69927
63	Russell Crowe	actor	2017-01-05 03:35:58.909574	2017-01-05 03:35:58.909574
64	Ed Harris	actor	2017-01-05 03:35:58.928538	2017-01-05 03:35:58.928538
65	Paul Bettany	actor	2017-01-05 03:35:58.947955	2017-01-05 03:35:58.947955
66	Ron Howard	director	2017-01-05 03:35:58.958965	2017-01-05 03:35:58.958965
67	James Stewart	actor	2017-01-05 03:36:57.688548	2017-01-05 03:36:57.688548
68	Kim Novak	actor	2017-01-05 03:36:57.703339	2017-01-05 03:36:57.703339
69	Richard Quine	director	2017-01-05 03:36:57.733697	2017-01-05 03:36:57.733697
70	Chris Farley	actor	2017-01-05 03:37:45.202779	2017-01-05 03:37:45.202779
71	Chris Rock	actor	2017-01-05 03:37:45.212269	2017-01-05 03:37:45.212269
72	Nicolette Sheridan	actor	2017-01-05 03:37:45.221161	2017-01-05 03:37:45.221161
73	Dennis Dugan	director	2017-01-05 03:37:45.2305	2017-01-05 03:37:45.2305
74	Dan Aykroyd	actor	2017-01-05 03:39:06.872861	2017-01-05 03:39:06.872861
75	John Goodman	actor	2017-01-05 03:39:06.882449	2017-01-05 03:39:06.882449
76	John Landis	director	2017-01-05 03:39:06.897979	2017-01-05 03:39:06.897979
77	Bryan Cranston	actor	2017-01-05 03:40:03.396432	2017-01-05 03:40:03.396432
78	Aaron Paul	actor	2017-01-05 03:40:03.407139	2017-01-05 03:40:03.407139
79	Dean Norris,	actor	2017-01-05 03:40:03.416936	2017-01-05 03:40:03.416936
80	Vince Gilligan	director	2017-01-05 03:40:03.431454	2017-01-05 03:40:03.431454
81	Damon Wayans	actor	2017-01-05 03:40:48.396717	2017-01-05 03:40:48.396717
82	Daniel Stern	actor	2017-01-05 03:40:48.411634	2017-01-05 03:40:48.411634
83	Tom De Cerchio	director	2017-01-05 03:40:48.428277	2017-01-05 03:40:48.428277
84	Christopher Titus	actor	2017-01-05 03:41:27.954939	2017-01-05 03:41:27.954939
85	Christopher Titus	director	2017-01-05 03:41:27.966147	2017-01-05 03:41:27.966147
86	Alexandre Rodrigues	actor	2017-01-05 03:42:33.663651	2017-01-05 03:42:33.663651
87	Leandro Firmino	actor	2017-01-05 03:42:33.674696	2017-01-05 03:42:33.674696
88	Luc Besson	director	2017-01-05 03:42:33.691828	2017-01-05 03:42:33.691828
89	Malcolm McDowell	actor	2017-01-05 03:43:39.669795	2017-01-05 03:43:39.669795
90	Patrick Magee	actor	2017-01-05 03:43:39.681035	2017-01-05 03:43:39.681035
91	Michael Bates	actor	2017-01-05 03:43:39.691581	2017-01-05 03:43:39.691581
92	Stanley Kubrick	director	2017-01-05 03:43:39.702528	2017-01-05 03:43:39.702528
93	Dakota Fanning	actor	2017-01-05 03:44:31.719636	2017-01-05 03:44:31.719636
94	Teri Hatcher	actor	2017-01-05 03:44:31.72971	2017-01-05 03:44:31.72971
95	Henry Sellick	director	2017-01-05 03:44:31.739277	2017-01-05 03:44:31.739277
96	Will Ferrell	actor	2017-01-05 18:43:08.732097	2017-01-05 18:43:08.732097
97	Jon Heder	actor	2017-01-05 18:43:08.751658	2017-01-05 18:43:08.751658
98	Josh Gordon	director	2017-01-05 18:43:08.77243	2017-01-05 18:43:08.77243
99	Will Speck	director	2017-01-05 18:43:08.791216	2017-01-05 18:43:08.791216
100	Michael C. Hall	actor	2017-01-05 18:48:46.14832	2017-01-05 18:48:46.14832
101	Jennifer Carpenter	actor	2017-01-05 18:48:46.157855	2017-01-05 18:48:46.157855
102	Julie Benz	actor	2017-01-05 18:48:46.167055	2017-01-05 18:48:46.167055
103	Christian Camargo	actor	2017-01-05 18:48:46.176301	2017-01-05 18:48:46.176301
104	Erik King	actor	2017-01-05 18:49:08.711808	2017-01-05 18:49:08.711808
105	Jimmy Smits	actor	2017-01-05 18:49:52.614641	2017-01-05 18:49:52.614641
106	John Lithgow	actor	2017-01-05 18:50:03.422871	2017-01-05 18:50:03.422871
107	Chris Kattan	actor	2017-01-05 21:24:14.47607	2017-01-05 21:24:14.47607
108	Peter Falk	actor	2017-01-05 21:24:14.539511	2017-01-05 21:24:14.539511
109	Peter Berg	actor	2017-01-05 21:24:14.569042	2017-01-05 21:24:14.569042
110	Rob Pritts	director	2017-01-05 21:24:14.59649	2017-01-05 21:24:14.59649
111	Juliette Binoche	actor	2017-01-05 21:25:03.924354	2017-01-05 21:25:03.924354
112	Dane Cook	actor	2017-01-05 21:25:03.940977	2017-01-05 21:25:03.940977
113	Peter Hedges	director	2017-01-05 21:25:03.956447	2017-01-05 21:25:03.956447
18	Julie Hagerty	actor	2017-01-05 03:20:31.497981	2017-01-06 16:27:22.409987
114	Steve Martin	actor	2017-01-05 21:26:12.983487	2017-01-05 21:26:12.983487
115	Glenne Headly	actor	2017-01-05 21:26:13.013008	2017-01-05 21:26:13.013008
116	Frank Oz	director	2017-01-05 21:26:13.029855	2017-01-05 21:26:13.029855
117	Phil Hartman	actor	2017-01-05 21:27:09.334356	2017-01-05 21:27:09.334356
118	Jon Lovitz	actor	2017-01-05 21:27:09.351387	2017-01-05 21:27:09.351387
119	Jerry Rees	director	2017-01-05 21:27:09.373425	2017-01-05 21:27:09.373425
120	Humphrey Bogart	actor	2017-01-05 21:28:13.894356	2017-01-05 21:28:13.894356
121	Ingrid Bergman	actor	2017-01-05 21:28:13.913166	2017-01-05 21:28:13.913166
122	Michael Curtiz	director	2017-01-05 21:28:13.93558	2017-01-05 21:28:13.93558
123	Jake Gyllenhaal	actor	2017-01-05 21:30:06.027785	2017-01-05 21:30:06.027785
124	Patrick Swayze	actor	2017-01-05 21:30:06.057136	2017-01-05 21:30:06.057136
125	Drew Barrymore	actor	2017-01-05 21:30:06.077747	2017-01-05 21:30:06.077747
126	Noah Wyle	actor	2017-01-05 21:30:06.099527	2017-01-05 21:30:06.099527
127	Jena Malone	actor	2017-01-05 21:30:06.121426	2017-01-05 21:30:06.121426
128	Richard Kelly	director	2017-01-05 21:30:06.141441	2017-01-05 21:30:06.141441
129	Shawn Wayans	actor	2017-01-05 21:30:48.250019	2017-01-05 21:30:48.250019
130	Marlon Wayans	actor	2017-01-05 21:30:48.28432	2017-01-05 21:30:48.28432
131	Paris Barclay	director	2017-01-05 21:30:48.323373	2017-01-05 21:30:48.323373
132	Nick Cannon	actor	2017-01-05 21:31:48.074915	2017-01-05 21:31:48.074915
133	Zoe Saldana	actor	2017-01-05 21:31:48.089003	2017-01-05 21:31:48.089003
134	Orlando Jones	actor	2017-01-05 21:31:48.107502	2017-01-05 21:31:48.107502
135	Charles Stone III	director	2017-01-05 21:31:48.120852	2017-01-05 21:31:48.120852
136	Jim Varney	actor	2017-01-05 21:32:25.899905	2017-01-05 21:32:25.899905
137	John Cherry	director	2017-01-05 21:32:26.001073	2017-01-05 21:32:26.001073
138	Morgan Freeman	actor	2017-01-05 21:33:11.863983	2017-01-05 21:33:11.863983
139	Lauren Graham	actor	2017-01-05 21:33:11.88658	2017-01-05 21:33:11.88658
140	Tom Shadyac	director	2017-01-05 21:33:11.919134	2017-01-05 21:33:11.919134
141	David Duchovny	actor	2017-01-05 21:33:58.891328	2017-01-05 21:33:58.891328
142	Seann William Scott	actor	2017-01-05 21:33:58.905494	2017-01-05 21:33:58.905494
143	Julianne Moore	actor	2017-01-05 21:33:58.933587	2017-01-05 21:33:58.933587
144	Ivan Reitman	director	2017-01-05 21:33:58.947004	2017-01-05 21:33:58.947004
145	Paul Walker	actor	2017-01-05 21:36:04.006527	2017-01-05 21:36:04.006527
146	Vin Diesel	actor	2017-01-05 21:36:04.036006	2017-01-05 21:36:04.036006
147	Rob Cohen	director	2017-01-05 21:36:04.049974	2017-01-05 21:36:04.049974
148	Eva Mendes	actor	2017-01-05 21:36:46.327382	2017-01-05 21:36:46.327382
149	Ludacris	actor	2017-01-05 21:36:46.340763	2017-01-05 21:36:46.340763
150	John Singleton	director	2017-01-05 21:36:46.355453	2017-01-05 21:36:46.355453
151	Bruce Willis	actor	2017-01-05 21:37:31.051622	2017-01-05 21:37:31.051622
152	Ian Holm	actor	2017-01-05 21:37:31.076388	2017-01-05 21:37:31.076388
153	Chris Tucker	actor	2017-01-05 21:37:31.090984	2017-01-05 21:37:31.090984
154	Milla Jovovich	actor	2017-01-05 21:37:31.104296	2017-01-05 21:37:31.104296
155	Edward Norton	actor	2017-01-05 21:38:23.957237	2017-01-05 21:38:23.957237
156	Brad Pitt	actor	2017-01-05 21:38:23.970607	2017-01-05 21:38:23.970607
157	Helena Bonham Carter	actor	2017-01-05 21:38:23.983721	2017-01-05 21:38:23.983721
158	David Fincher	director	2017-01-05 21:38:24.000063	2017-01-05 21:38:24.000063
159	Albert Brooks	actor	2017-01-05 21:39:33.62107	2017-01-05 21:39:33.62107
160	Ellen Degeneres	actor	2017-01-05 21:39:33.639576	2017-01-05 21:39:33.639576
161	Pixar	director	2017-01-05 21:39:33.652038	2017-01-05 21:39:33.652038
162	Jon Voight	actor	2017-01-05 21:40:42.251621	2017-01-05 21:40:42.251621
163	Ellen Burstyn	actor	2017-01-05 21:40:42.265711	2017-01-05 21:40:42.265711
164	Jeff Daniels	actor	2017-01-05 21:40:42.280354	2017-01-05 21:40:42.280354
165	Lloyd Kramer	director	2017-01-05 21:40:42.301259	2017-01-05 21:40:42.301259
166	Buster Crabbe	actor	2017-01-05 21:42:32.252321	2017-01-05 21:42:32.252321
167	Carol Hughes	actor	2017-01-05 21:42:32.267438	2017-01-05 21:42:32.267438
168	Charles Middleton	actor	2017-01-05 21:42:32.280643	2017-01-05 21:42:32.280643
169	Ford Beebe	director	2017-01-05 21:42:32.294684	2017-01-05 21:42:32.294684
170	Ray Taylor	director	2017-01-05 21:42:32.308381	2017-01-05 21:42:32.308381
171	Dominic West	actor	2017-01-05 21:43:42.29281	2017-01-05 21:43:42.29281
172	Gary Sinise	actor	2017-01-05 21:43:42.315243	2017-01-05 21:43:42.315243
173	Joseph Ruben	director	2017-01-05 21:43:42.333757	2017-01-05 21:43:42.333757
174	Billy West	actor	2017-01-05 21:46:40.957871	2017-01-05 21:46:40.957871
175	John DiMaggio	actor	2017-01-05 21:46:40.971913	2017-01-05 21:46:40.971913
176	Katey Sagal	actor	2017-01-05 21:46:40.985487	2017-01-05 21:46:40.985487
177	Matt Groening	director	2017-01-05 21:46:40.998867	2017-01-05 21:46:40.998867
178	David Cohen	director	2017-01-05 21:46:41.020647	2017-01-05 21:46:41.020647
179	David Cross	actor	2017-01-05 21:47:14.006606	2017-01-05 21:47:14.006606
180	Ariana Richards	actor	2017-01-05 21:51:51.925045	2017-01-05 21:51:51.925045
181	Emilia Crow	actor	2017-01-05 21:51:51.949716	2017-01-05 21:51:51.949716
182	David Twohy	director	2017-01-05 21:51:51.963524	2017-01-05 21:51:51.963524
183	Bill Murray	actor	2017-01-05 21:52:50.311462	2017-01-05 21:52:50.311462
184	Harold Ramis	actor	2017-01-05 21:52:50.325161	2017-01-05 21:52:50.325161
185	Ernie Hudson	actor	2017-01-05 21:52:50.346058	2017-01-05 21:52:50.346058
186	Rick Moranis	actor	2017-01-05 21:52:50.358981	2017-01-05 21:52:50.358981
187	Annie Potts	actor	2017-01-05 21:52:50.378487	2017-01-05 21:52:50.378487
188	Sigourney Weaver	actor	2017-01-05 21:54:10.601936	2017-01-05 21:54:10.601936
189	Zach Galligan	actor	2017-01-05 21:55:24.178517	2017-01-05 21:55:24.178517
190	Phoebe Cates	actor	2017-01-05 21:55:24.203081	2017-01-05 21:55:24.203081
191	Joe Dante	director	2017-01-05 21:55:24.223064	2017-01-05 21:55:24.223064
192	Andie MacDowell	actor	2017-01-05 21:56:58.18942	2017-01-05 21:56:58.18942
193	Chris Elliott	actor	2017-01-05 21:56:58.213532	2017-01-05 21:56:58.213532
194	Harold Ramis	director	2017-01-05 21:56:58.234735	2017-01-05 21:56:58.234735
195	Clayton Moore	actor	2017-01-05 22:00:53.92642	2017-01-05 22:00:53.92642
196	Jay Silverheels	actor	2017-01-05 22:00:53.941113	2017-01-05 22:00:53.941113
197	Duncan Renaldo	actor	2017-01-05 22:00:53.964071	2017-01-05 22:00:53.964071
198	Roy Rogers	actor	2017-01-05 22:00:53.979071	2017-01-05 22:00:53.979071
199	John Candy	actor	2017-01-05 22:02:53.297785	2017-01-05 22:02:53.297785
200	Gerald Potterton	director	2017-01-05 22:02:53.326297	2017-01-05 22:02:53.326297
201	Martin Freeman	actor	2017-01-05 22:05:02.576033	2017-01-05 22:05:02.576033
202	Zooey Deschanel	actor	2017-01-05 22:05:02.592801	2017-01-05 22:05:02.592801
203	Warwick Davis	actor	2017-01-05 22:05:02.606961	2017-01-05 22:05:02.606961
204	Sam Rockwell	actor	2017-01-05 22:05:02.621463	2017-01-05 22:05:02.621463
205	Mos Def	actor	2017-01-05 22:05:02.654078	2017-01-05 22:05:02.654078
206	John Malkovich	actor	2017-01-05 22:05:02.675714	2017-01-05 22:05:02.675714
207	Alan Rickman	actor	2017-01-05 22:05:02.692176	2017-01-05 22:05:02.692176
208	Garth Jennings	director	2017-01-05 22:05:02.707303	2017-01-05 22:05:02.707303
209	Jeroen Krabbe	actor	2017-01-05 22:07:49.894845	2017-01-05 22:07:49.894845
210	Isabella Rossellini	actor	2017-01-05 22:07:49.908213	2017-01-05 22:07:49.908213
211	Bernard Rose	director	2017-01-05 22:07:49.921236	2017-01-05 22:07:49.921236
212	Leonardo DiCaprio	actor	2017-01-05 22:09:03.936958	2017-01-05 22:09:03.936958
213	Ellen Page	actor	2017-01-05 22:09:03.952746	2017-01-05 22:09:03.952746
214	Joseph Gordon-Levitt	actor	2017-01-05 22:09:03.96673	2017-01-05 22:09:03.96673
215	Tom Hardy	actor	2017-01-05 22:09:03.989275	2017-01-05 22:09:03.989275
216	Ken Watanabe	actor	2017-01-05 22:09:04.017039	2017-01-05 22:09:04.017039
217	Glenn Howerton	actor	2017-01-05 22:12:43.165195	2017-01-05 22:12:43.165195
218	Charlie Day	actor	2017-01-05 22:12:43.179698	2017-01-05 22:12:43.179698
219	Rob McElhenney	actor	2017-01-05 22:12:43.196279	2017-01-05 22:12:43.196279
220	Kaitlin Olson	actor	2017-01-05 22:12:43.217762	2017-01-05 22:12:43.217762
222	Glenn Howerton	director	2017-01-05 22:12:43.257376	2017-01-05 22:12:43.257376
223	Rob McElhenney	director	2017-01-05 22:12:43.270628	2017-01-05 22:12:43.270628
224	Bernie Mac	actor	2017-01-05 22:15:57.865123	2017-01-05 22:15:57.865123
225	Chris Rock	director	2017-01-05 22:15:57.893345	2017-01-05 22:15:57.893345
226	Steve-O	actor	2017-01-05 22:17:31.651475	2017-01-05 22:17:31.651475
227	Bam Margera	actor	2017-01-05 22:17:31.665322	2017-01-05 22:17:31.665322
228	Jeff Dunham	actor	2017-01-05 22:19:31.303041	2017-01-05 22:19:31.303041
229	Jeff Dunham	director	2017-01-05 22:19:31.317754	2017-01-05 22:19:31.317754
230	Johnny Carson	actor	2017-01-05 22:20:19.06154	2017-01-05 22:20:19.06154
231	Johnny Carson	director	2017-01-05 22:20:19.080186	2017-01-05 22:20:19.080186
232	Jonathan Haze	actor	2017-01-05 22:21:43.901923	2017-01-05 22:21:43.901923
233	Jackie Joseph	actor	2017-01-05 22:21:43.920871	2017-01-05 22:21:43.920871
234	Mel Welles	actor	2017-01-05 22:21:43.934939	2017-01-05 22:21:43.934939
235	Jack Nicholson	actor	2017-01-05 22:21:43.948355	2017-01-05 22:21:43.948355
236	Roger Corman	director	2017-01-05 22:21:43.965557	2017-01-05 22:21:43.965557
237	Billy Campbell	actor	2017-01-05 22:23:56.375799	2017-01-05 22:23:56.375799
238	Marla Sokoloff	actor	2017-01-05 22:23:56.394305	2017-01-05 22:23:56.394305
239	Jason Alexander	actor	2017-01-05 22:23:56.423231	2017-01-05 22:23:56.423231
240	Ernie Barbarash	director	2017-01-05 22:23:56.442453	2017-01-05 22:23:56.442453
241	Michael Pare	actor	2017-01-05 22:25:10.557231	2017-01-05 22:25:10.557231
242	Lisa Eichhorn	actor	2017-01-05 22:25:10.572471	2017-01-05 22:25:10.572471
243	Dean Devlin	actor	2017-01-05 22:25:10.586678	2017-01-05 22:25:10.586678
244	Roland Emmerich	director	2017-01-05 22:25:10.600956	2017-01-05 22:25:10.600956
245	Richard Dreyfuss	actor	2017-01-05 22:25:59.948641	2017-01-05 22:25:59.948641
246	Paul Julia	actor	2017-01-05 22:25:59.967401	2017-01-05 22:25:59.967401
247	Sonia Braga	actor	2017-01-05 22:25:59.985267	2017-01-05 22:25:59.985267
248	Paul Mazursky	director	2017-01-05 22:26:00.000483	2017-01-05 22:26:00.000483
249	Graham Chapman	actor	2017-01-05 22:27:51.45742	2017-01-05 22:27:51.45742
250	Eric Idle	actor	2017-01-05 22:27:51.483518	2017-01-05 22:27:51.483518
251	Terry Jones	actor	2017-01-05 22:27:51.505488	2017-01-05 22:27:51.505488
252	Michael Palin	actor	2017-01-05 22:27:51.524173	2017-01-05 22:27:51.524173
253	Terry Gilliam	actor	2017-01-05 22:27:51.543626	2017-01-05 22:27:51.543626
254	John Cleese	actor	2017-01-05 22:27:51.561218	2017-01-05 22:27:51.561218
255	Terry Gilliam	director	2017-01-05 22:28:51.639278	2017-01-05 22:28:51.639278
256	Terry Jones	director	2017-01-05 22:28:51.654303	2017-01-05 22:28:51.654303
257	Adam Sandler	actor	2017-01-05 22:31:21.7712	2017-01-05 22:31:21.7712
258	Winona Ryder	actor	2017-01-05 22:31:21.787043	2017-01-05 22:31:21.787043
259	John Turturro	actor	2017-01-05 22:31:21.802283	2017-01-05 22:31:21.802283
260	Peter Gallagher	actor	2017-01-05 22:31:21.819864	2017-01-05 22:31:21.819864
261	Steven Brill	director	2017-01-05 22:31:21.839541	2017-01-05 22:31:21.839541
262	Rob Minkoff	director	2017-01-05 22:39:30.627605	2017-01-05 22:39:30.627605
263	Dreamworks	director	2017-01-05 22:39:30.648536	2017-01-05 22:39:30.648536
264	Jackie Chan	actor	2017-01-05 22:41:32.739082	2017-01-05 22:41:32.739082
265	Nicholas Tse	actor	2017-01-05 22:41:32.75975	2017-01-05 22:41:32.75975
266	Charlie Young	actor	2017-01-05 22:41:32.789764	2017-01-05 22:41:32.789764
267	Charlene Choi	actor	2017-01-05 22:41:32.8088	2017-01-05 22:41:32.8088
268	Benny Chan	director	2017-01-05 22:41:32.827624	2017-01-05 22:41:32.827624
269	Ben Stiller	actor	2017-01-05 22:42:55.767318	2017-01-05 22:42:55.767318
270	Carla Gugino	actor	2017-01-05 22:42:55.786061	2017-01-05 22:42:55.786061
271	Dick Van Dyke	actor	2017-01-05 22:42:55.810817	2017-01-05 22:42:55.810817
272	Mickey Rooney	actor	2017-01-05 22:42:55.829835	2017-01-05 22:42:55.829835
273	Bill Cobbs	actor	2017-01-05 22:42:55.845624	2017-01-05 22:42:55.845624
274	Robin Williams	actor	2017-01-05 22:42:55.861122	2017-01-05 22:42:55.861122
275	Shawn Levy	director	2017-01-05 22:42:55.878655	2017-01-05 22:42:55.878655
276	Amy Adams	actor	2017-01-05 22:44:28.473731	2017-01-05 22:44:28.473731
277	Owen Wilson	actor	2017-01-05 22:44:28.587781	2017-01-05 22:44:28.587781
278	Hank Azaria	actor	2017-01-05 22:44:28.683146	2017-01-05 22:44:28.683146
279	Christopher Guest	actor	2017-01-05 22:44:28.791932	2017-01-05 22:44:28.791932
280	Alain Chabat	actor	2017-01-05 22:44:28.912877	2017-01-05 22:44:28.912877
281	Ricky Gervais	actor	2017-01-05 22:44:29.03216	2017-01-05 22:44:29.03216
282	Cary Grant	actor	2017-01-05 22:45:59.918977	2017-01-05 22:45:59.918977
283	Eva Marie Saint	actor	2017-01-05 22:45:59.936349	2017-01-05 22:45:59.936349
284	James Mason	actor	2017-01-05 22:45:59.955392	2017-01-05 22:45:59.955392
285	Mark Wahlberg	actor	2017-01-05 22:47:06.922343	2017-01-05 22:47:06.922343
286	Michael Keaton	actor	2017-01-05 22:47:06.960127	2017-01-05 22:47:06.960127
287	Samuel L. Jackson	actor	2017-01-05 22:47:06.98039	2017-01-05 22:47:06.98039
288	Dwayne Johnson	actor	2017-01-05 22:47:07.005186	2017-01-05 22:47:07.005186
289	Adam McKay	director	2017-01-05 22:47:07.05285	2017-01-05 22:47:07.05285
290	Paul Reubens	actor	2017-01-05 22:48:02.542158	2017-01-05 22:48:02.542158
291	Elizabeth Daily	actor	2017-01-05 22:48:02.572926	2017-01-05 22:48:02.572926
292	Judd Omen	actor	2017-01-05 22:48:02.589162	2017-01-05 22:48:02.589162
293	Diane Salinger	actor	2017-01-05 22:48:02.605642	2017-01-05 22:48:02.605642
294	Mark Holton	actor	2017-01-05 22:48:02.620532	2017-01-05 22:48:02.620532
295	Tim Burton	director	2017-01-05 22:48:02.63734	2017-01-05 22:48:02.63734
296	Frankie Avalon	actor	2017-01-05 22:49:58.039069	2017-01-05 22:49:58.039069
297	Annette Funicello	actor	2017-01-05 22:49:58.064972	2017-01-05 22:49:58.064972
298	Laurence Fishburne	actor	2017-01-05 22:49:58.095524	2017-01-05 22:49:58.095524
299	John Paragon	actor	2017-01-05 22:49:58.113652	2017-01-05 22:49:58.113652
300	Paul Reubens	director	2017-01-05 22:49:58.129715	2017-01-05 22:49:58.129715
301	David Niven	actor	2017-01-05 22:51:02.321271	2017-01-05 22:51:02.321271
302	Peter Sellers	actor	2017-01-05 22:51:02.341127	2017-01-05 22:51:02.341127
303	Robert Wagner	actor	2017-01-05 22:51:02.36105	2017-01-05 22:51:02.36105
304	Capucine	actor	2017-01-05 22:51:02.380287	2017-01-05 22:51:02.380287
305	Blake Edwards	director	2017-01-05 22:51:02.403219	2017-01-05 22:51:02.403219
306	Richard Gere	actor	2017-01-05 22:51:54.752671	2017-01-05 22:51:54.752671
307	Laura Linney	actor	2017-01-05 22:51:54.768834	2017-01-05 22:51:54.768834
308	John Mahoney	actor	2017-01-05 22:51:54.785713	2017-01-05 22:51:54.785713
309	Frances McDormand	actor	2017-01-05 22:51:54.802749	2017-01-05 22:51:54.802749
310	Gregory Hoblit	director	2017-01-05 22:51:54.826513	2017-01-05 22:51:54.826513
311	Matt Damon	actor	2017-01-05 22:53:12.587237	2017-01-05 22:53:12.587237
312	Claire Danes	actor	2017-01-05 22:53:12.616712	2017-01-05 22:53:12.616712
313	Mickey Rourke	actor	2017-01-05 22:53:12.642932	2017-01-05 22:53:12.642932
314	Mary Kay Place	actor	2017-01-05 22:53:12.662318	2017-01-05 22:53:12.662318
315	Francis Ford Coppola	director	2017-01-05 22:53:12.683123	2017-01-05 22:53:12.683123
316	Tom Cruise	actor	2017-01-05 22:54:18.379013	2017-01-05 22:54:18.379013
317	Dustin Hoffman	actor	2017-01-05 22:54:18.394022	2017-01-05 22:54:18.394022
318	Valeria Golino	actor	2017-01-05 22:54:18.409425	2017-01-05 22:54:18.409425
319	Barry Levinson	director	2017-01-05 22:54:18.429558	2017-01-05 22:54:18.429558
320	Jared Leto	actor	2017-01-05 22:55:56.286484	2017-01-05 22:55:56.286484
321	Darren Aronofsky	director	2017-01-05 22:55:56.333048	2017-01-05 22:55:56.333048
322	Sean Guillette	actor	2017-01-05 22:56:36.187498	2017-01-05 22:56:36.187498
323	Mark Margolis	actor	2017-01-05 22:56:36.204072	2017-01-05 22:56:36.204072
324	Ben Shenkman	actor	2017-01-05 22:56:36.220023	2017-01-05 22:56:36.220023
325	Samia Shoaib	actor	2017-01-05 22:56:36.240587	2017-01-05 22:56:36.240587
326	Pamela Hart	actor	2017-01-05 22:56:36.256396	2017-01-05 22:56:36.256396
327	Ajay Naidu	actor	2017-01-05 22:56:36.272707	2017-01-05 22:56:36.272707
328	Joanne Gordon	actor	2017-01-05 22:56:36.298017	2017-01-05 22:56:36.298017
329	Brett Ratner	director	2017-01-05 22:57:39.258633	2017-01-05 22:57:39.258633
330	Lorne Michaels	director	2017-01-05 22:58:09.966644	2017-01-05 22:58:09.966644
331	Simon Pegg	actor	2017-01-05 22:58:57.186818	2017-01-05 22:58:57.186818
332	Kate Ashfield	actor	2017-01-05 22:58:57.269103	2017-01-05 22:58:57.269103
333	Lucy Davis	actor	2017-01-05 22:58:57.318264	2017-01-05 22:58:57.318264
334	Nick Frost	actor	2017-01-05 22:58:57.350496	2017-01-05 22:58:57.350496
335	Edgar Wright	director	2017-01-05 22:58:57.383448	2017-01-05 22:58:57.383448
336	Simon Pegg	director	2017-01-05 22:58:57.411469	2017-01-05 22:58:57.411469
337	Dan Castellaneta	actor	2017-01-05 23:01:41.644094	2017-01-05 23:01:41.644094
338	Julie Kavner	actor	2017-01-05 23:01:41.662415	2017-01-05 23:01:41.662415
339	Nancy Cartwright	actor	2017-01-05 23:01:41.68545	2017-01-05 23:01:41.68545
340	Yeardley Smith	actor	2017-01-05 23:01:41.705549	2017-01-05 23:01:41.705549
341	Harry Shearer	actor	2017-01-05 23:01:41.737515	2017-01-05 23:01:41.737515
342	Paul Newman	actor	2017-01-05 23:03:31.601409	2017-01-05 23:03:31.601409
343	Michael Ontkean	actor	2017-01-05 23:03:31.622428	2017-01-05 23:03:31.622428
344	Lindsay Crouse	actor	2017-01-05 23:03:31.638381	2017-01-05 23:03:31.638381
345	Jennifer Warren	actor	2017-01-05 23:03:31.661629	2017-01-05 23:03:31.661629
346	Jerry Houser	actor	2017-01-05 23:03:31.678786	2017-01-05 23:03:31.678786
347	Strother Martin	actor	2017-01-05 23:03:31.695534	2017-01-05 23:03:31.695534
348	Jeff Carlson	actor	2017-01-05 23:03:31.720323	2017-01-05 23:03:31.720323
349	Steve Carlson	actor	2017-01-05 23:03:31.742506	2017-01-05 23:03:31.742506
350	David Hanson	actor	2017-01-05 23:03:31.767604	2017-01-05 23:03:31.767604
351	George Roy Hill	director	2017-01-05 23:03:31.785424	2017-01-05 23:03:31.785424
352	Mel Brooks	actor	2017-01-05 23:28:32.448146	2017-01-05 23:28:32.448146
353	Bill Pullman	actor	2017-01-05 23:28:32.488868	2017-01-05 23:28:32.488868
354	Daphne Zuniga	actor	2017-01-05 23:28:32.505335	2017-01-05 23:28:32.505335
355	Mel Brooks	director	2017-01-05 23:28:32.527079	2017-01-05 23:28:32.527079
356	Gene Wilder	actor	2017-01-05 23:29:05.631826	2017-01-05 23:29:05.631826
357	Peter Boyle	actor	2017-01-05 23:29:05.653581	2017-01-05 23:29:05.653581
358	Marty Feldman	actor	2017-01-05 23:29:05.669449	2017-01-05 23:29:05.669449
359	Cloris Leachman	actor	2017-01-05 23:29:05.695994	2017-01-05 23:29:05.695994
360	Tea Leoni	actor	2017-01-05 23:30:21.167299	2017-01-05 23:30:21.167299
361	Paz Vega	actor	2017-01-05 23:30:21.190586	2017-01-05 23:30:21.190586
362	James L. Brooks	director	2017-01-05 23:30:21.24484	2017-01-05 23:30:21.24484
363	Anthony Daniels	actor	2017-01-05 23:35:37.027676	2017-01-05 23:35:37.027676
364	Nika Futterman	actor	2017-01-05 23:35:37.042075	2017-01-05 23:35:37.042075
365	Phil LaMarr	actor	2017-01-05 23:35:37.065267	2017-01-05 23:35:37.065267
366	David Scott	director	2017-01-05 23:35:37.079099	2017-01-05 23:35:37.079099
367	Rachel Ward	actor	2017-01-05 23:55:28.167308	2017-01-05 23:55:28.167308
368	Alan Ladd	actor	2017-01-05 23:55:28.183126	2017-01-05 23:55:28.183126
369	Carl Reiner	director	2017-01-05 23:55:28.206959	2017-01-05 23:55:28.206959
370	Bernadette Peters	actor	2017-01-05 23:56:23.971535	2017-01-05 23:56:23.971535
371	Caitlan Adams	actor	2017-01-05 23:56:23.99412	2017-01-05 23:56:23.99412
372	Jackie Mason	actor	2017-01-05 23:56:24.011483	2017-01-05 23:56:24.011483
373	Charles Grodin	actor	2017-01-05 23:57:30.350982	2017-01-05 23:57:30.350982
374	Judith Ivey	actor	2017-01-05 23:57:30.377436	2017-01-05 23:57:30.377436
375	Steve Lawrence	actor	2017-01-05 23:57:30.39296	2017-01-05 23:57:30.39296
376	Robyn Douglass	actor	2017-01-05 23:57:30.409417	2017-01-05 23:57:30.409417
377	Arthur Hiller	director	2017-01-05 23:57:30.425594	2017-01-05 23:57:30.425594
378	Dave Thomas	actor	2017-01-05 23:58:25.54905	2017-01-05 23:58:25.54905
379	Paul Dooley	actor	2017-01-05 23:58:25.565859	2017-01-05 23:58:25.565859
380	Max von Sydow	actor	2017-01-05 23:58:25.590747	2017-01-05 23:58:25.590747
381	Dave Thomas	director	2017-01-05 23:58:25.607259	2017-01-05 23:58:25.607259
382	Rick Moranis	director	2017-01-05 23:58:25.626214	2017-01-05 23:58:25.626214
383	Warren Oates	actor	2017-01-05 23:59:27.769398	2017-01-05 23:59:27.769398
384	P.J. Soles	actor	2017-01-05 23:59:27.787772	2017-01-05 23:59:27.787772
385	Jonah Hill	actor	2017-01-06 00:41:12.422452	2017-01-06 00:41:12.422452
386	Michael Cera	actor	2017-01-06 00:41:12.447454	2017-01-06 00:41:12.447454
387	Bill Hader	actor	2017-01-06 00:41:12.458916	2017-01-06 00:41:12.458916
388	Christopher Mintz-Plasse	actor	2017-01-06 00:41:12.479439	2017-01-06 00:41:12.479439
389	Greg Mottola	director	2017-01-06 00:41:12.492179	2017-01-06 00:41:12.492179
390	Drake Bell	actor	2017-01-06 00:42:45.456683	2017-01-06 00:42:45.456683
391	Sara Paxton	actor	2017-01-06 00:42:45.483301	2017-01-06 00:42:45.483301
392	Christopher McDonald	actor	2017-01-06 00:42:45.515335	2017-01-06 00:42:45.515335
393	Kevin Hart	actor	2017-01-06 00:42:45.527233	2017-01-06 00:42:45.527233
394	Brent Spiner	actor	2017-01-06 00:42:45.538094	2017-01-06 00:42:45.538094
395	Jeffrey Tambor	actor	2017-01-06 00:42:45.555559	2017-01-06 00:42:45.555559
396	Pamela Anderson	actor	2017-01-06 00:42:45.577524	2017-01-06 00:42:45.577524
397	Craig Mazin	director	2017-01-06 00:42:45.599329	2017-01-06 00:42:45.599329
398	Harvey Atkin	actor	2017-01-06 00:43:44.660088	2017-01-06 00:43:44.660088
399	John Stocker	actor	2017-01-06 00:43:44.67465	2017-01-06 00:43:44.67465
400	Kevin Heffernan	actor	2017-01-06 00:46:08.862799	2017-01-06 00:46:08.862799
401	Steve Lemme	actor	2017-01-06 00:46:08.876187	2017-01-06 00:46:08.876187
402	Jay Chandrasekhar	actor	2017-01-06 00:46:08.890091	2017-01-06 00:46:08.890091
403	Paul Soter	actor	2017-01-06 00:46:08.91202	2017-01-06 00:46:08.91202
404	Erik Stolhanske	actor	2017-01-06 00:46:08.923927	2017-01-06 00:46:08.923927
405	Brian Cox	actor	2017-01-06 00:46:08.937823	2017-01-06 00:46:08.937823
406	Daniel von Bargen	actor	2017-01-06 00:46:08.952412	2017-01-06 00:46:08.952412
407	Mariso Coughlan	actor	2017-01-06 00:46:08.966497	2017-01-06 00:46:08.966497
408	Broken Lizard	actor	2017-01-06 00:46:08.980592	2017-01-06 00:46:08.980592
409	Jay Chandrasekhar	director	2017-01-06 00:46:08.995043	2017-01-06 00:46:08.995043
410	Judith Hoag	actor	2017-01-06 00:46:58.2045	2017-01-06 00:46:58.2045
411	Elias Koteas	actor	2017-01-06 00:46:58.224027	2017-01-06 00:46:58.224027
412	Corey Feldman	actor	2017-01-06 00:46:58.242661	2017-01-06 00:46:58.242661
413	Steve Barron	director	2017-01-06 00:46:58.255604	2017-01-06 00:46:58.255604
414	Paige Turco	actor	2017-01-06 00:47:40.955839	2017-01-06 00:47:40.955839
415	David Warner	actor	2017-01-06 00:47:40.975735	2017-01-06 00:47:40.975735
416	Michael Pressman	director	2017-01-06 00:47:40.989769	2017-01-06 00:47:40.989769
417	Robert Smigel	actor	2017-01-06 00:49:54.893059	2017-01-06 00:49:54.893059
418	Conan O'Brien	actor	2017-01-06 00:49:54.904776	2017-01-06 00:49:54.904776
419	Tom Hanks	actor	2017-01-06 00:50:49.281478	2017-01-06 00:50:49.281478
420	Catherine Zeta-Jones	actor	2017-01-06 00:50:49.304926	2017-01-06 00:50:49.304926
421	Stanley Tucci	actor	2017-01-06 00:50:49.31834	2017-01-06 00:50:49.31834
422	Steven Spielberg	director	2017-01-06 00:50:49.335446	2017-01-06 00:50:49.335446
423	Robert De Niro	actor	2017-01-06 00:52:10.246598	2017-01-06 00:52:10.246598
424	Ellen Barkin	actor	2017-01-06 00:52:10.260735	2017-01-06 00:52:10.260735
425	Michael Caton-Jones	director	2017-01-06 00:52:10.286124	2017-01-06 00:52:10.286124
426	Moe Howard	actor	2017-01-06 00:53:10.718047	2017-01-06 00:53:10.718047
427	Larry Fine	actor	2017-01-06 00:53:10.735374	2017-01-06 00:53:10.735374
428	Curly Howard	actor	2017-01-06 00:53:10.74973	2017-01-06 00:53:10.74973
429	Shemp Howard	actor	2017-01-06 00:53:10.77232	2017-01-06 00:53:10.77232
430	Eddie Murphy	actor	2017-01-06 00:54:05.650524	2017-01-06 00:54:05.650524
431	Jamie Lee Curtis	actor	2017-01-06 00:54:05.660909	2017-01-06 00:54:05.660909
432	Ralph Bellamy	actor	2017-01-06 00:54:05.67098	2017-01-06 00:54:05.67098
433	Don Ameche	actor	2017-01-06 00:54:05.684634	2017-01-06 00:54:05.684634
434	Denholm Elliott	actor	2017-01-06 00:54:05.695097	2017-01-06 00:54:05.695097
435	Jack Black	actor	2017-01-06 00:55:26.072891	2017-01-06 00:55:26.072891
436	Robert Downey Jr.	actor	2017-01-06 00:55:26.10233	2017-01-06 00:55:26.10233
437	Steve Coogan	actor	2017-01-06 00:55:26.116236	2017-01-06 00:55:26.116236
438	Jay Baruchel	actor	2017-01-06 00:55:26.130239	2017-01-06 00:55:26.130239
439	Danny McBride	actor	2017-01-06 00:55:26.152818	2017-01-06 00:55:26.152818
440	Brandon T. Jackson	actor	2017-01-06 00:55:26.165021	2017-01-06 00:55:26.165021
441	Nick Nolte	actor	2017-01-06 00:55:26.185746	2017-01-06 00:55:26.185746
442	Matthew McConaughey	actor	2017-01-06 00:55:26.210449	2017-01-06 00:55:26.210449
443	Ben Stiller	director	2017-01-06 00:55:26.222161	2017-01-06 00:55:26.222161
444	Jim Carrey	actor	2017-01-06 00:56:06.880979	2017-01-06 00:56:06.880979
445	Natascha McElhone	actor	2017-01-06 00:56:06.909286	2017-01-06 00:56:06.909286
446	Noah Emmerich	actor	2017-01-06 00:56:06.922683	2017-01-06 00:56:06.922683
447	Peter Weir	director	2017-01-06 00:56:06.936076	2017-01-06 00:57:28.134578
448	Kevin Costner	actor	2017-01-06 00:57:39.948031	2017-01-06 00:57:39.948031
449	Charles Martin Smith	actor	2017-01-06 00:57:39.963527	2017-01-06 00:57:39.963527
450	Andy Garcia	actor	2017-01-06 00:57:39.981094	2017-01-06 00:57:39.981094
451	Sean Connery	actor	2017-01-06 00:57:40.012609	2017-01-06 00:57:40.012609
452	Brian De Palma	director	2017-01-06 00:57:40.026425	2017-01-06 00:57:40.026425
453	Pete Docter	director	2017-01-06 00:58:38.159451	2017-01-06 00:58:38.159451
454	Jeff Garlin	actor	2017-01-06 00:59:41.8269	2017-01-06 00:59:41.8269
455	Ben Burtt	actor	2017-01-06 00:59:41.844734	2017-01-06 00:59:41.844734
456	Elissa Knight	actor	2017-01-06 00:59:41.86415	2017-01-06 00:59:41.86415
457	Andrew Stanton	director	2017-01-06 00:59:41.880656	2017-01-06 00:59:41.880656
458	James McAvoy	actor	2017-01-06 01:01:02.612356	2017-01-06 01:01:02.612356
459	Angelina Jolie	actor	2017-01-06 01:01:02.651321	2017-01-06 01:01:02.651321
460	Timur Bekmambetov	director	2017-01-06 01:01:02.66534	2017-01-06 01:01:02.66534
461	Christine Taylor	actor	2017-01-06 01:01:43.753198	2017-01-06 01:01:43.753198
462	Frank Coraci	director	2017-01-06 01:01:43.76609	2017-01-06 01:01:43.76609
463	Ray Romano	actor	2017-01-06 01:02:23.704904	2017-01-06 01:02:23.704904
464	Gene Hackman	actor	2017-01-06 01:02:23.716711	2017-01-06 01:02:23.716711
465	Maura Tierney	actor	2017-01-06 01:02:23.732717	2017-01-06 01:02:23.732717
466	Rip Torn	actor	2017-01-06 01:02:23.743811	2017-01-06 01:02:23.743811
467	Donald Petrie	director	2017-01-06 01:02:23.75678	2017-01-06 01:02:23.75678
468	Nicolas Cage	actor	2017-01-06 01:04:01.875289	2017-01-06 01:04:01.875289
469	Adam Beach	actor	2017-01-06 01:04:01.901912	2017-01-06 01:04:01.901912
470	Peter Stormare	actor	2017-01-06 01:04:01.922482	2017-01-06 01:04:01.922482
471	Christian Slater	actor	2017-01-06 01:04:01.959364	2017-01-06 01:04:01.959364
472	John Woo	director	2017-01-06 01:04:01.975349	2017-01-06 01:04:01.975349
473	Bob Hoskins	actor	2017-01-06 01:05:44.302583	2017-01-06 01:05:44.302583
474	Joanna Cassidy	actor	2017-01-06 01:05:44.32161	2017-01-06 01:05:44.32161
475	Charles Fleischer	actor	2017-01-06 01:05:44.333503	2017-01-06 01:05:44.333503
476	Jane Lynch	actor	2017-01-06 01:07:23.025611	2017-01-06 01:07:23.025611
477	Sarah Silverman	actor	2017-01-06 01:07:23.040097	2017-01-06 01:07:23.040097
478	Jack McBrayer	actor	2017-01-06 01:07:23.054321	2017-01-06 01:07:23.054321
479	Alan Tudyk	actor	2017-01-06 01:07:23.087702	2017-01-06 01:07:23.087702
480	Mindy Kaling	actor	2017-01-06 01:07:23.105582	2017-01-06 01:07:23.105582
481	Rich Moore	director	2017-01-06 01:07:23.123643	2017-01-06 01:07:23.123643
482	Marisa Tomei	actor	2017-01-06 01:08:03.804656	2017-01-06 01:08:03.804656
483	Evan Rachel Wood	actor	2017-01-06 01:08:03.830379	2017-01-06 01:08:03.830379
484	Katherine Heigl	actor	2017-01-06 03:19:26.808731	2017-01-06 03:19:26.808731
485	James Marsden	actor	2017-01-06 03:19:26.837574	2017-01-06 03:19:26.837574
486	Malin Akerman	actor	2017-01-06 03:19:26.858027	2017-01-06 03:19:26.858027
487	Anne Fletcher	director	2017-01-06 03:19:26.876486	2017-01-06 03:19:26.876486
488	Geoffrey Arend	actor	2017-01-06 03:20:51.41186	2017-01-06 03:20:51.41186
489	Marc Webb	director	2017-01-06 03:20:51.432935	2017-01-06 03:20:51.432935
490	Courteney Cox	actor	2017-01-06 03:21:45.401931	2017-01-06 03:21:45.401931
491	Ian McNeice	actor	2017-01-06 03:22:38.374924	2017-01-06 03:22:38.374924
492	Simon Callow	actor	2017-01-06 03:22:38.386524	2017-01-06 03:22:38.386524
493	Steve Oedekerk	director	2017-01-06 03:22:38.399501	2017-01-06 03:22:38.399501
494	Edward Furlong	actor	2017-01-06 03:23:29.318332	2017-01-06 03:23:29.318332
495	Beverly D'Angelo	actor	2017-01-06 03:23:29.331925	2017-01-06 03:23:29.331925
496	Tony Kaye	director	2017-01-06 03:23:29.35053	2017-01-06 03:23:29.35053
497	Jason Biggs	actor	2017-01-06 03:24:47.384621	2017-01-06 03:24:47.384621
498	Chris Klein	actor	2017-01-06 03:24:47.39667	2017-01-06 03:24:47.39667
499	Thomas Ian Nicholas	actor	2017-01-06 03:24:47.409455	2017-01-06 03:24:47.409455
500	Alyson Hannigan	actor	2017-01-06 03:24:47.430383	2017-01-06 03:24:47.430383
501	Shannon Elizabeth	actor	2017-01-06 03:24:47.443861	2017-01-06 03:24:47.443861
502	Tara Reid	actor	2017-01-06 03:24:47.457241	2017-01-06 03:24:47.457241
503	Eddie Kaye Thomas	actor	2017-01-06 03:24:47.47632	2017-01-06 03:24:47.47632
504	Eugene Levy	actor	2017-01-06 03:24:47.498715	2017-01-06 03:24:47.498715
505	Paul Weitz	director	2017-01-06 03:26:02.720619	2017-01-06 03:26:02.720619
506	Chris Weitz	director	2017-01-06 03:26:02.742346	2017-01-06 03:26:02.742346
508	J.B. Rogers	director	2017-01-06 03:27:07.758144	2017-01-06 03:27:07.758144
509	Jesse Dylan	director	2017-01-06 03:28:28.025106	2017-01-06 03:28:28.025106
510	Justin Theroux	actor	2017-01-06 03:29:29.272522	2017-01-06 03:29:29.272522
511	Josh Lucas	actor	2017-01-06 03:29:29.286877	2017-01-06 03:29:29.286877
512	Reese Witherspoon	actor	2017-01-06 03:29:29.301041	2017-01-06 03:29:29.301041
513	Mary Harron	director	2017-01-06 03:29:29.324251	2017-01-06 03:29:29.324251
514	Bill Paxton	actor	2017-01-06 03:30:36.341682	2017-01-06 03:30:36.341682
515	Kevin Bacon	actor	2017-01-06 03:30:36.366151	2017-01-06 03:30:36.366151
516	Will Smith	actor	2017-01-06 03:31:30.433455	2017-01-06 03:31:30.433455
517	Martin Lawrence	actor	2017-01-06 03:31:30.447864	2017-01-06 03:31:30.447864
518	Gabrielle Union	actor	2017-01-06 03:31:30.468933	2017-01-06 03:31:30.468933
519	Joe Pantoliano	actor	2017-01-06 03:31:30.481316	2017-01-06 03:31:30.481316
520	Michael Bay	director	2017-01-06 03:31:30.495181	2017-01-06 03:31:30.495181
521	Cameron Diaz	actor	2017-01-06 03:32:22.83247	2017-01-06 03:32:22.83247
522	Lucy Punch	actor	2017-01-06 03:32:22.847364	2017-01-06 03:32:22.847364
523	Jason Segel	actor	2017-01-06 03:32:22.862219	2017-01-06 03:32:22.862219
524	Justin Timberlake	actor	2017-01-06 03:32:22.875283	2017-01-06 03:32:22.875283
525	Jake Kasden	director	2017-01-06 03:32:22.891554	2017-01-06 03:32:22.891554
526	Dan Fogler	actor	2017-01-06 03:33:42.567879	2017-01-06 03:33:42.567879
527	Christopher Walken	actor	2017-01-06 03:33:42.579404	2017-01-06 03:33:42.579404
528	Thomas Lennon	actor	2017-01-06 03:33:42.590585	2017-01-06 03:33:42.590585
529	George Lopez	actor	2017-01-06 03:33:42.608263	2017-01-06 03:33:42.608263
530	Maggie Q	actor	2017-01-06 03:33:42.636213	2017-01-06 03:33:42.636213
531	James Hong	actor	2017-01-06 03:33:42.651839	2017-01-06 03:33:42.651839
532	Diedrich Bader	actor	2017-01-06 03:33:42.663462	2017-01-06 03:33:42.663462
533	Terry Crews	actor	2017-01-06 03:33:42.674226	2017-01-06 03:33:42.674226
534	Aisha Tyler	actor	2017-01-06 03:33:42.684773	2017-01-06 03:33:42.684773
535	Robert Ben Garant	director	2017-01-06 03:33:42.695867	2017-01-06 03:33:42.695867
536	Darren McGavin	actor	2017-01-06 03:36:44.869999	2017-01-06 03:36:44.869999
537	Bridgette Wilson	actor	2017-01-06 03:36:44.892136	2017-01-06 03:36:44.892136
538	Bradley Whitford	actor	2017-01-06 03:36:44.904897	2017-01-06 03:36:44.904897
539	Norm MacDonald,	actor	2017-01-06 03:36:44.916788	2017-01-06 03:36:44.916788
540	Tamra Davis	director	2017-01-06 03:36:44.937706	2017-01-06 03:36:44.937706
541	Jean-Claude Van Damme	actor	2017-01-06 03:37:38.399326	2017-01-06 03:37:38.399326
542	Donald Gibb	actor	2017-01-06 03:37:38.412659	2017-01-06 03:37:38.412659
543	Leah Ayres	actor	2017-01-06 03:37:38.425068	2017-01-06 03:37:38.425068
544	Newt Arnold	director	2017-01-06 03:37:38.437916	2017-01-06 03:37:38.437916
545	Mark Andrews	director	2017-01-06 03:38:54.549286	2017-01-06 03:38:54.549286
546	Brenda Chapman	director	2017-01-06 03:38:54.561043	2017-01-06 03:38:54.561043
547	Kristen Wiig	actor	2017-01-06 03:41:11.206128	2017-01-06 03:41:11.206128
548	Maya Rudolph	actor	2017-01-06 03:41:11.218539	2017-01-06 03:41:11.218539
549	Melissa McCarthy	actor	2017-01-06 03:41:11.230507	2017-01-06 03:41:11.230507
550	Chris O'Dowd	actor	2017-01-06 03:41:11.242633	2017-01-06 03:41:11.242633
551	Rose Byrne	actor	2017-01-06 03:41:11.254119	2017-01-06 03:41:11.254119
552	Paul Feig	director	2017-01-06 03:41:11.274214	2017-01-06 03:41:11.274214
553	Chevy Chase	actor	2017-01-06 03:42:00.897256	2017-01-06 03:42:00.897256
554	Rodney Dangerfield	actor	2017-01-06 03:42:00.919651	2017-01-06 03:42:00.919651
555	Ted Knight	actor	2017-01-06 03:42:00.930666	2017-01-06 03:42:00.930666
556	Michael O'Keefe	actor	2017-01-06 03:42:00.942031	2017-01-06 03:42:00.942031
557	Tracy Morgan	actor	2017-01-06 03:42:53.798446	2017-01-06 03:42:53.798446
558	Juan Carlos Hernandez	actor	2017-01-06 03:42:53.813242	2017-01-06 03:42:53.813242
559	Kevin Smith	director	2017-01-06 03:42:53.828515	2017-01-06 03:42:53.828515
560	Ryan Gosling	actor	2017-01-06 13:36:06.572803	2017-01-06 13:36:06.572803
561	Glenn Ficarra	director	2017-01-06 13:36:06.593142	2017-01-06 13:36:06.593142
562	John Requa	director	2017-01-06 13:36:06.604228	2017-01-06 13:36:06.604228
563	Neil Patrick Harris	actor	2017-01-06 13:37:34.726307	2017-01-06 13:37:34.726307
564	Nathan Fillion	actor	2017-01-06 13:37:34.739417	2017-01-06 13:37:34.739417
565	Felicia Day	actor	2017-01-06 13:37:34.763963	2017-01-06 13:37:34.763963
566	Joss Whedon	director	2017-01-06 13:37:34.775898	2017-01-06 13:37:34.775898
567	James Caan	actor	2017-01-06 13:38:42.81566	2017-01-06 13:38:42.81566
568	Bob Newhart	actor	2017-01-06 13:38:42.854633	2017-01-06 13:38:42.854633
569	Jon Favreau	director	2017-01-06 13:38:42.868687	2017-01-06 13:38:42.868687
570	Eartha Kitt	actor	2017-01-06 13:39:24.396438	2017-01-06 13:39:24.396438
571	Austin Nagler	actor	2017-01-06 13:39:24.414308	2017-01-06 13:39:24.414308
572	Jason Bateman	actor	2017-01-06 13:40:57.109024	2017-01-06 13:40:57.109024
573	Mila Kunis	actor	2017-01-06 13:40:57.120146	2017-01-06 13:40:57.120146
574	Ben Affleck	actor	2017-01-06 13:40:57.139165	2017-01-06 13:40:57.139165
575	J.K. Simmons	actor	2017-01-06 13:40:57.15852	2017-01-06 13:40:57.15852
576	Mike Judge	director	2017-01-06 13:40:57.168809	2017-01-06 13:40:57.168809
577	Ioan Gruffudd	actor	2017-01-06 13:41:55.25986	2017-01-06 13:41:55.25986
578	Jessica Alba	actor	2017-01-06 13:41:55.270882	2017-01-06 13:41:55.270882
579	Chris Evans	actor	2017-01-06 13:41:55.281107	2017-01-06 13:41:55.281107
580	Tim Story	director	2017-01-06 13:41:55.291198	2017-01-06 13:41:55.291198
581	Matthew Broderick	actor	2017-01-06 13:43:03.323708	2017-01-06 13:43:03.323708
582	Alan Ruck	actor	2017-01-06 13:43:03.34292	2017-01-06 13:43:03.34292
583	Jeffrey Jones	actor	2017-01-06 13:43:03.353168	2017-01-06 13:43:03.353168
584	Mia Sara	actor	2017-01-06 13:43:03.363519	2017-01-06 13:43:03.363519
585	Jennifer Grey	actor	2017-01-06 13:43:03.373645	2017-01-06 13:43:03.373645
586	John Hughes	director	2017-01-06 13:43:03.384429	2017-01-06 13:43:03.384429
587	Kristen Bell	actor	2017-01-06 13:44:30.504109	2017-01-06 13:44:30.504109
588	Russell Brand	actor	2017-01-06 13:44:30.534823	2017-01-06 13:44:30.534823
589	Liz Cackowski	actor	2017-01-06 13:44:30.58289	2017-01-06 13:44:30.58289
590	Nicholas Stoller	director	2017-01-06 13:44:30.601914	2017-01-06 13:44:30.601914
591	Idina Menzel	actor	2017-01-06 13:59:46.972327	2017-01-06 13:59:46.972327
592	Jonathan Groff	actor	2017-01-06 13:59:46.983866	2017-01-06 13:59:46.983866
593	Chris Buck	director	2017-01-06 13:59:46.996372	2017-01-06 13:59:46.996372
594	Jennifer Lee	director	2017-01-06 13:59:47.009799	2017-01-06 13:59:47.009799
595	Alec Baldwin	actor	2017-01-06 14:01:21.821282	2017-01-06 14:01:21.821282
596	Dean Parisot	director	2017-01-06 14:01:21.838969	2017-01-06 14:01:21.838969
597	Elisabeth Moss,	actor	2017-01-06 14:02:55.370202	2017-01-06 14:02:55.370202
598	Pierce Brosnan	actor	2017-01-06 14:06:58.536398	2017-01-06 14:06:58.536398
599	Sean Bean	actor	2017-01-06 14:06:58.561181	2017-01-06 14:06:58.561181
600	Alan Cumming	actor	2017-01-06 14:06:58.574421	2017-01-06 14:06:58.574421
601	Judi Dench	actor	2017-01-06 14:06:58.585823	2017-01-06 14:06:58.585823
602	Izabella Scorupco	actor	2017-01-06 14:06:58.607212	2017-01-06 14:06:58.607212
603	Famke Janssen	actor	2017-01-06 14:06:58.618907	2017-01-06 14:06:58.618907
604	Martin Campbell	director	2017-01-06 14:06:58.630974	2017-01-06 14:06:58.630974
605	Linda Cardellini	actor	2017-01-06 14:08:33.00535	2017-01-06 14:08:33.00535
606	Allen Covert	actor	2017-01-06 14:08:33.018023	2017-01-06 14:08:33.018023
607	Peter Dante	actor	2017-01-06 14:08:33.028876	2017-01-06 14:08:33.028876
608	Shirley Jones	actor	2017-01-06 14:08:33.039704	2017-01-06 14:08:33.039704
609	Shirley Knight	actor	2017-01-06 14:08:33.054094	2017-01-06 14:08:33.054094
610	Doris Roberts	actor	2017-01-06 14:08:33.064927	2017-01-06 14:08:33.064927
611	Nick Swardson	actor	2017-01-06 14:08:33.07553	2017-01-06 14:08:33.07553
612	Joel David Moore	actor	2017-01-06 14:08:33.085689	2017-01-06 14:08:33.085689
613	Nicholaus Goossen	director	2017-01-06 14:08:33.108629	2017-01-06 14:08:33.108629
614	Michael Clarke Duncan	actor	2017-01-06 14:10:57.120769	2017-01-06 14:10:57.120769
615	David Morse	actor	2017-01-06 14:10:57.151395	2017-01-06 14:10:57.151395
616	Bonnie Hunt	actor	2017-01-06 14:10:57.171237	2017-01-06 14:10:57.171237
617	James Cromwell	actor	2017-01-06 14:10:57.206404	2017-01-06 14:10:57.206404
618	Frank Darabont	director	2017-01-06 14:10:57.22447	2017-01-06 14:10:57.22447
619	Charlize Theron,	actor	2017-01-06 14:12:29.74862	2017-01-06 14:12:29.74862
620	Peter Berg	director	2017-01-06 14:12:29.75974	2017-01-06 14:12:29.75974
621	Bradley Cooper	actor	2017-01-06 14:13:50.293022	2017-01-06 14:13:50.293022
623	Ed Helms	actor	2017-01-06 14:13:50.328693	2017-01-06 14:13:50.328693
624	Heather Graham	actor	2017-01-06 14:13:50.341782	2017-01-06 14:13:50.341782
625	Justin Bartha	actor	2017-01-06 14:13:50.353595	2017-01-06 14:13:50.353595
626	Todd Phillips	director	2017-01-06 14:13:50.373111	2017-01-06 14:13:50.373111
627	Julie Bowen	actor	2017-01-06 14:15:06.384201	2017-01-06 14:15:06.384201
628	Frances Bay	actor	2017-01-06 14:15:06.399677	2017-01-06 14:15:06.399677
629	Joe Flaherty,	actor	2017-01-06 14:15:06.416034	2017-01-06 14:15:06.416034
630	Adam Goldberg	actor	2017-01-06 14:16:39.390141	2017-01-06 14:16:39.390141
631	Andy Dick	actor	2017-01-06 14:16:39.401874	2017-01-06 14:16:39.401874
632	Judy Greer	actor	2017-01-06 14:16:39.413105	2017-01-06 14:16:39.413105
633	Mario Van Peebles	actor	2017-01-06 14:16:39.424016	2017-01-06 14:16:39.424016
634	Jonathan Kesselman	director	2017-01-06 14:16:39.434683	2017-01-06 14:16:39.434683
635	Bette Midler	actor	2017-01-06 14:22:02.831513	2017-01-06 14:22:02.831513
636	Sarah Jessica Parker	actor	2017-01-06 14:22:02.853877	2017-01-06 14:22:02.853877
637	Kathy Najimy	actor	2017-01-06 14:22:02.869889	2017-01-06 14:22:02.869889
638	Omri Katz	actor	2017-01-06 14:22:02.895026	2017-01-06 14:22:02.895026
639	Thora Birch	actor	2017-01-06 14:22:02.916717	2017-01-06 14:22:02.916717
640	Kenny Ortega	director	2017-01-06 14:22:02.933296	2017-01-06 14:22:02.933296
641	Kevin Spacey	actor	2017-01-06 14:23:24.852925	2017-01-06 14:23:24.852925
642	Jennifer Aniston	actor	2017-01-06 14:23:24.876136	2017-01-06 14:23:24.876136
643	Jason Sudeikis	actor	2017-01-06 14:23:24.899153	2017-01-06 14:23:24.899153
644	Donald Sutherland	actor	2017-01-06 14:23:24.916074	2017-01-06 14:23:24.916074
645	Seth Gordon	director	2017-01-06 14:23:24.928794	2017-01-06 14:23:24.928794
646	Martin Freeman,	actor	2017-01-06 14:24:40.341353	2017-01-06 14:24:40.341353
647	Andy Samberg	actor	2017-01-06 14:26:27.983889	2017-01-06 14:26:27.983889
648	Jorma Taccone	actor	2017-01-06 14:26:27.996083	2017-01-06 14:26:27.996083
649	Dann McBride	actor	2017-01-06 14:26:28.019438	2017-01-06 14:26:28.019438
650	Isla Fisher	actor	2017-01-06 14:26:28.030425	2017-01-06 14:26:28.030425
651	Will Arnett	actor	2017-01-06 14:26:28.041776	2017-01-06 14:26:28.041776
652	Chris Parnell	actor	2017-01-06 14:26:28.05424	2017-01-06 14:26:28.05424
653	Sissy Spacek	actor	2017-01-06 14:26:28.067523	2017-01-06 14:26:28.067523
654	Ian McShane	actor	2017-01-06 14:26:28.083411	2017-01-06 14:26:28.083411
655	Lonely Island	actor	2017-01-06 14:26:28.100248	2017-01-06 14:26:28.100248
656	Akiva Schaffer	director	2017-01-06 14:26:28.111375	2017-01-06 14:26:28.111375
657	John Cusack	actor	2017-01-06 14:27:27.430024	2017-01-06 14:27:27.430024
658	Clark Duke	actor	2017-01-06 14:27:27.44864	2017-01-06 14:27:27.44864
659	Craig Robinson	actor	2017-01-06 14:27:27.462987	2017-01-06 14:27:27.462987
660	Rob Corddry	actor	2017-01-06 14:27:27.484374	2017-01-06 14:27:27.484374
661	Steve Pink	director	2017-01-06 14:27:27.500005	2017-01-06 14:27:27.500005
662	Tim Robbins	actor	2017-01-06 14:28:38.998777	2017-01-06 14:28:38.998777
663	Jennifer Jason Leigh	actor	2017-01-06 14:28:39.023517	2017-01-06 14:28:39.023517
664	Joel Coen	director	2017-01-06 14:28:39.045332	2017-01-06 14:28:39.045332
665	Ethan Coen	director	2017-01-06 14:28:39.057436	2017-01-06 14:28:39.057436
666	Rashida Jones	actor	2017-01-06 14:30:28.635567	2017-01-06 14:30:28.635567
667	Jaime Pressly	actor	2017-01-06 14:30:28.648392	2017-01-06 14:30:28.648392
668	Jon Favreau	actor	2017-01-06 14:30:28.662282	2017-01-06 14:30:28.662282
669	Lou Ferigno	actor	2017-01-06 14:30:28.711847	2017-01-06 14:30:28.711847
670	Jane Curtin	actor	2017-01-06 14:30:28.729702	2017-01-06 14:30:28.729702
671	Rob Hubel	actor	2017-01-06 14:30:28.744986	2017-01-06 14:30:28.744986
672	Sarah Burns	actor	2017-01-06 14:30:28.762034	2017-01-06 14:30:28.762034
673	John Hamburg	director	2017-01-06 14:30:28.777469	2017-01-06 14:30:28.777469
674	George Clooney	actor	2017-01-06 14:31:40.917989	2017-01-06 14:31:40.917989
675	Philip Seymour Hoffman	actor	2017-01-06 14:31:40.928658	2017-01-06 14:31:40.928658
676	Paul Giamatti	actor	2017-01-06 14:31:40.949046	2017-01-06 14:31:40.949046
677	George Clooney	director	2017-01-06 14:31:40.974098	2017-01-06 14:31:40.974098
678	Jeff Goldblum	actor	2017-01-06 14:33:45.281747	2017-01-06 14:33:45.281747
679	Mary McDonnell	actor	2017-01-06 14:33:45.304265	2017-01-06 14:33:45.304265
680	Randy Quaid	actor	2017-01-06 14:33:45.316867	2017-01-06 14:33:45.316867
681	Robert Loggia	actor	2017-01-06 14:33:45.331642	2017-01-06 14:33:45.331642
682	Vivica A. Fox	actor	2017-01-06 14:33:45.343757	2017-01-06 14:33:45.343757
683	Aaron Taylor-Johnson	actor	2017-01-06 14:35:26.017945	2017-01-06 14:35:26.017945
684	Chloe Grace Moretz	actor	2017-01-06 14:35:26.053906	2017-01-06 14:35:26.053906
685	Matthew Vaughn	director	2017-01-06 14:35:26.079385	2017-01-06 14:35:26.079385
686	Abby Cornish	actor	2017-01-06 14:36:52.857497	2017-01-06 14:36:52.857497
687	Anna Friel	actor	2017-01-06 14:36:52.871832	2017-01-06 14:36:52.871832
688	Neil Burger	director	2017-01-06 14:36:52.894057	2017-01-06 14:36:52.894057
689	Ryan Phillippe	actor	2017-01-06 14:37:54.909275	2017-01-06 14:37:54.909275
690	William H. Macy	actor	2017-01-06 14:37:54.931146	2017-01-06 14:37:54.931146
691	Brad Furman	director	2017-01-06 14:37:54.943105	2017-01-06 14:37:54.943105
692	Aitana Sanchez-Gijon	actor	2017-01-06 14:39:27.543659	2017-01-06 14:39:27.543659
693	Brad Anderson	director	2017-01-06 14:39:27.590226	2017-01-06 14:39:27.590226
694	Emilio Estevez	actor	2017-01-06 14:40:44.622148	2017-01-06 14:40:44.622148
695	Joss Ackland	actor	2017-01-06 14:40:44.633879	2017-01-06 14:40:44.633879
696	Lane Smith	actor	2017-01-06 14:40:44.645829	2017-01-06 14:40:44.645829
697	Shaun Weiss	actor	2017-01-06 14:40:44.667333	2017-01-06 14:40:44.667333
698	Joshua Jackson	actor	2017-01-06 14:40:44.679886	2017-01-06 14:40:44.679886
699	Stephen Herek	director	2017-01-06 14:40:44.693257	2017-01-06 14:40:44.693257
700	Danny Elfman	actor	2017-01-06 14:43:29.633504	2017-01-06 14:43:29.633504
701	Chris Sarandon	actor	2017-01-06 14:43:29.644912	2017-01-06 14:43:29.644912
702	Catherine O'Hara	actor	2017-01-06 14:43:29.655501	2017-01-06 14:43:29.655501
703	Henry Selick	director	2017-01-06 14:43:29.665765	2017-01-06 14:43:29.665765
704	Michael Berryman	actor	2017-01-06 14:45:44.724834	2017-01-06 14:45:44.724834
705	Louise Fletcher	actor	2017-01-06 14:45:44.75351	2017-01-06 14:45:44.75351
706	Scatman Crothers	actor	2017-01-06 14:45:44.769126	2017-01-06 14:45:44.769126
707	Brad Dourif	actor	2017-01-06 14:45:44.816791	2017-01-06 14:45:44.816791
708	Milos Forman	director	2017-01-06 14:45:44.830687	2017-01-06 14:45:44.830687
221	Danny DeVito	actor	2017-01-05 22:12:43.2339	2017-01-06 14:46:17.303447
709	Ivana Baquero	actor	2017-01-06 14:47:36.657982	2017-01-06 14:47:36.657982
710	Ariadna Gil	actor	2017-01-06 14:47:36.669087	2017-01-06 14:47:36.669087
711	Sergi Lopez	actor	2017-01-06 14:47:36.679153	2017-01-06 14:47:36.679153
712	Guillermo Del Toro	director	2017-01-06 14:47:36.689178	2017-01-06 14:47:36.689178
713	Katie Featherston	actor	2017-01-06 14:48:24.461623	2017-01-06 14:48:24.461623
714	Micah Sloat	actor	2017-01-06 14:48:24.474149	2017-01-06 14:48:24.474149
715	Mark Fredrichs	actor	2017-01-06 14:48:24.492242	2017-01-06 14:48:24.492242
716	Oren Peli	director	2017-01-06 14:48:24.505297	2017-01-06 14:48:24.505297
717	Brian Boland	actor	2017-01-06 14:49:34.988659	2017-01-06 14:49:34.988659
718	Molly Ephraim	actor	2017-01-06 14:49:35.000285	2017-01-06 14:49:35.000285
719	Seth Ginsberg	actor	2017-01-06 14:49:35.03677	2017-01-06 14:49:35.03677
720	Tod Williams	director	2017-01-06 14:49:35.058258	2017-01-06 14:49:35.058258
14	Seth Rogen	actor	2017-01-05 03:18:41.335344	2017-01-06 14:50:34.393304
721	James Franco	actor	2017-01-06 14:51:16.161955	2017-01-06 14:51:16.161955
722	Gary Cole	actor	2017-01-06 14:51:16.196613	2017-01-06 14:51:16.196613
723	Amber Heard	actor	2017-01-06 14:51:16.208022	2017-01-06 14:51:16.208022
724	David Gordon Green	director	2017-01-06 14:51:16.231193	2017-01-06 14:51:16.231193
725	Hugh Jackman	actor	2017-01-06 14:52:35.774579	2017-01-06 14:52:35.774579
726	Piper Perabo	actor	2017-01-06 14:52:35.79357	2017-01-06 14:52:35.79357
727	Rebecca Hall	actor	2017-01-06 14:52:35.805592	2017-01-06 14:52:35.805592
728	Scarlett Johansson	actor	2017-01-06 14:52:35.817325	2017-01-06 14:52:35.817325
729	Elizabeth Banks	actor	2017-01-06 14:54:46.370002	2017-01-06 14:54:46.370002
730	Bobb'e J. Thompson	actor	2017-01-06 14:54:46.404771	2017-01-06 14:54:46.404771
731	Ken Jeong	actor	2017-01-06 14:54:46.421584	2017-01-06 14:54:46.421584
732	Ken Marino	actor	2017-01-06 14:54:46.443798	2017-01-06 14:54:46.443798
733	Kerri Kenney	actor	2017-01-06 14:54:46.469262	2017-01-06 14:54:46.469262
734	David Wain	director	2017-01-06 14:54:46.49037	2017-01-06 14:54:46.49037
735	Billy Bob Thornton	actor	2017-01-06 14:57:49.577668	2017-01-06 14:57:49.577668
736	Jacinda Barrett	actor	2017-01-06 14:57:49.592411	2017-01-06 14:57:49.592411
737	Gwyneth Paltrow	actor	2017-01-06 15:59:40.523646	2017-01-06 15:59:40.523646
738	Colin Farrell	actor	2017-01-06 16:01:42.132698	2017-01-06 16:01:42.132698
739	Woody Harrelson	actor	2017-01-06 16:01:42.166147	2017-01-06 16:01:42.166147
740	Abbie Cornish	actor	2017-01-06 16:01:42.195401	2017-01-06 16:01:42.195401
741	Martin McDonagh	director	2017-01-06 16:01:42.214643	2017-01-06 16:01:42.214643
742	Gil Bellows	actor	2017-01-06 16:04:26.289224	2017-01-06 16:04:26.289224
743	Bob Gunton	actor	2017-01-06 16:04:26.308017	2017-01-06 16:04:26.308017
744	William Sadler	actor	2017-01-06 16:04:26.323306	2017-01-06 16:04:26.323306
745	Clancy Brown	actor	2017-01-06 16:04:26.340046	2017-01-06 16:04:26.340046
746	Mark Rolston	actor	2017-01-06 16:04:26.372955	2017-01-06 16:04:26.372955
747	James Whitmore	actor	2017-01-06 16:04:26.387503	2017-01-06 16:04:26.387503
748	Ben Kingsley	actor	2017-01-06 16:08:48.533391	2017-01-06 16:08:48.533391
749	Michelle Williams	actor	2017-01-06 16:08:48.577584	2017-01-06 16:08:48.577584
750	Ted Levine	actor	2017-01-06 16:08:48.593917	2017-01-06 16:08:48.593917
751	Martin Scorsese	director	2017-01-06 16:08:48.616573	2017-01-06 16:08:48.616573
752	Clive Owen	actor	2017-01-06 16:09:36.731663	2017-01-06 16:09:36.731663
753	Frank Miller	director	2017-01-06 16:09:36.758375	2017-01-06 16:09:36.758375
754	Robert Rodriguez	director	2017-01-06 16:09:36.778475	2017-01-06 16:09:36.778475
755	Michelle Monaghan	actor	2017-01-06 16:10:30.409789	2017-01-06 16:10:30.409789
756	Vera Farmiga,	actor	2017-01-06 16:10:30.433072	2017-01-06 16:10:30.433072
757	Duncan Jones	director	2017-01-06 16:10:30.465762	2017-01-06 16:10:30.465762
758	Chris Pine	actor	2017-01-06 16:12:03.699095	2017-01-06 16:12:03.699095
759	Zachary Quinto	actor	2017-01-06 16:12:03.734784	2017-01-06 16:12:03.734784
760	Karl Urban	actor	2017-01-06 16:12:03.749489	2017-01-06 16:12:03.749489
761	Anton Yelchin	actor	2017-01-06 16:12:03.773596	2017-01-06 16:12:03.773596
762	John Cho	actor	2017-01-06 16:12:03.798638	2017-01-06 16:12:03.798638
763	Benedict Cumberbatch	actor	2017-01-06 16:12:03.812924	2017-01-06 16:12:03.812924
764	J.J. Abrams	director	2017-01-06 16:12:03.834993	2017-01-06 16:12:03.834993
765	Leonard Nimoy	actor	2017-01-06 16:13:03.844224	2017-01-06 16:13:03.844224
766	Eric Bana	actor	2017-01-06 16:13:03.859985	2017-01-06 16:13:03.859985
767	Bruce Greenwood	actor	2017-01-06 16:13:03.876093	2017-01-06 16:13:03.876093
768	Adam Scott	actor	2017-01-06 16:14:05.072498	2017-01-06 16:14:05.072498
769	Richard Jenkins	actor	2017-01-06 16:14:05.09235	2017-01-06 16:14:05.09235
770	Kathryn Hahn	actor	2017-01-06 16:14:05.109152	2017-01-06 16:14:05.109152
771	Emma Thompson	actor	2017-01-06 16:14:47.858423	2017-01-06 16:14:47.858423
772	Marc Forster	director	2017-01-06 16:14:47.884861	2017-01-06 16:14:47.884861
773	Sacha Baron Cohen	actor	2017-01-06 16:16:34.10558	2017-01-06 16:16:34.10558
774	Leslie Bibb	actor	2017-01-06 16:16:34.171014	2017-01-06 16:16:34.171014
775	Mandy Moore	actor	2017-01-06 16:17:39.815109	2017-01-06 16:17:39.815109
776	Zachary Levi	actor	2017-01-06 16:17:39.833102	2017-01-06 16:17:39.833102
777	Donna Murphy	actor	2017-01-06 16:17:39.84767	2017-01-06 16:17:39.84767
778	Nathan Greno	director	2017-01-06 16:17:39.873215	2017-01-06 16:17:39.873215
779	Byron Howard	director	2017-01-06 16:17:39.895791	2017-01-06 16:17:39.895791
780	Peter Riegert	actor	2017-01-06 16:18:26.630232	2017-01-06 16:18:26.630232
781	Peter Greene,	actor	2017-01-06 16:18:26.644191	2017-01-06 16:18:26.644191
782	Chuck Russell	director	2017-01-06 16:18:26.663363	2017-01-06 16:18:26.663363
783	Val Kilmer	actor	2017-01-06 16:20:07.042611	2017-01-06 16:20:07.042611
784	Lucy Gutteridge	actor	2017-01-06 16:20:07.062991	2017-01-06 16:20:07.062991
785	Peter Cushing	actor	2017-01-06 16:20:07.078084	2017-01-06 16:20:07.078084
786	Christopher Gilliers	actor	2017-01-06 16:20:07.092104	2017-01-06 16:20:07.092104
787	Jeremy Kemp	actor	2017-01-06 16:20:07.105848	2017-01-06 16:20:07.105848
788	Weird Al Yankovic	actor	2017-01-06 16:21:59.538599	2017-01-06 16:21:59.538599
789	Michael Richards	actor	2017-01-06 16:21:59.552782	2017-01-06 16:21:59.552782
790	Victoria Jackson	actor	2017-01-06 16:21:59.57964	2017-01-06 16:21:59.57964
791	Kevin McCarthy	actor	2017-01-06 16:21:59.596164	2017-01-06 16:21:59.596164
792	Fran Drescher	actor	2017-01-06 16:21:59.610726	2017-01-06 16:21:59.610726
793	Anthony Geary	actor	2017-01-06 16:21:59.624534	2017-01-06 16:21:59.624534
794	Jay Levey	director	2017-01-06 16:21:59.647514	2017-01-06 16:21:59.647514
795	Eddie Griffin	actor	2017-01-06 16:23:16.947447	2017-01-06 16:23:16.947447
796	Denise Richards	actor	2017-01-06 16:23:16.976972	2017-01-06 16:23:16.976972
797	Aunjanue Ellis	actor	2017-01-06 16:23:17.006934	2017-01-06 16:23:17.006934
798	Dave Chappelle	actor	2017-01-06 16:23:17.03328	2017-01-06 16:23:17.03328
799	Malcolm D. Lee	director	2017-01-06 16:23:17.097606	2017-01-06 16:23:17.097606
800	Ryan Reynolds	actor	2017-01-06 16:25:27.264814	2017-01-06 16:25:27.264814
801	Justin Long	actor	2017-01-06 16:25:27.283544	2017-01-06 16:25:27.283544
802	Anna Faris	actor	2017-01-06 16:25:27.298076	2017-01-06 16:25:27.298076
803	David Koechner	actor	2017-01-06 16:25:27.312415	2017-01-06 16:25:27.312415
804	Luis Guzman	actor	2017-01-06 16:25:27.328	2017-01-06 16:25:27.328
805	Chi McBride	actor	2017-01-06 16:25:27.34384	2017-01-06 16:25:27.34384
806	John Francis Daley	actor	2017-01-06 16:25:27.393328	2017-01-06 16:25:27.393328
807	Rob McKittrick	director	2017-01-06 16:25:27.408179	2017-01-06 16:25:27.408179
808	Dana Carvey	actor	2017-01-06 16:26:15.194231	2017-01-06 16:26:15.194231
809	Rob Lowe	actor	2017-01-06 16:26:15.21207	2017-01-06 16:26:15.21207
811	Penelope Spheeris	director	2017-01-06 16:26:15.261648	2017-01-06 16:26:15.261648
812	Charlie Krosmo	actor	2017-01-06 16:28:07.225369	2017-01-06 16:28:07.225369
813	Kathryn Erbe	actor	2017-01-06 16:28:07.240568	2017-01-06 16:28:07.240568
814	John Michael Higgins	actor	2017-01-06 16:29:16.053757	2017-01-06 16:29:16.053757
815	Rhys Darby	actor	2017-01-06 16:29:16.067368	2017-01-06 16:29:16.067368
816	Danny Masterson	actor	2017-01-06 16:29:16.081087	2017-01-06 16:29:16.081087
817	Terence Stamp	actor	2017-01-06 16:29:16.103081	2017-01-06 16:29:16.103081
818	Jesse Eisenberg	actor	2017-01-06 16:31:20.623079	2017-01-06 16:31:20.623079
819	Emma Stone	actor	2017-01-06 16:31:20.656399	2017-01-06 16:31:20.656399
820	Abigail Breslin	actor	2017-01-06 16:31:20.695813	2017-01-06 16:31:20.695813
821	Ruben Fleischer	director	2017-01-06 16:31:20.732274	2017-01-06 16:31:20.732274
822	Cary Elwes	actor	2017-01-06 16:43:42.217068	2017-01-06 16:43:42.217068
823	Leigh Whannell	actor	2017-01-06 16:43:42.232835	2017-01-06 16:43:42.232835
824	Danny Glover	actor	2017-01-06 16:43:42.248126	2017-01-06 16:43:42.248126
825	Ken Leung	actor	2017-01-06 16:43:42.264275	2017-01-06 16:43:42.264275
826	Dina Meyer	actor	2017-01-06 16:43:42.284993	2017-01-06 16:43:42.284993
827	James Wan	director	2017-01-06 16:43:42.300078	2017-01-06 16:43:42.300078
828	Donnie Wahlberg	actor	2017-01-06 16:44:31.92555	2017-01-06 16:44:31.92555
829	Beverley Mitchell	actor	2017-01-06 16:44:31.939932	2017-01-06 16:44:31.939932
830	Franky G	actor	2017-01-06 16:44:31.954559	2017-01-06 16:44:31.954559
831	Darren Lynn Bousman	director	2017-01-06 16:44:31.978872	2017-01-06 16:44:31.978872
832	Tobin Bell	actor	2017-01-06 16:45:30.101919	2017-01-06 16:45:30.101919
833	Shawnee Smith	actor	2017-01-06 16:45:30.116752	2017-01-06 16:45:30.116752
834	Angus Macfadyen	actor	2017-01-06 16:45:30.132289	2017-01-06 16:45:30.132289
835	Scott Patterson	actor	2017-01-06 16:46:19.755097	2017-01-06 16:46:19.755097
836	Costas Mandylor	actor	2017-01-06 16:46:19.781474	2017-01-06 16:46:19.781474
837	Mel Gibson	actor	2017-01-06 16:48:31.96676	2017-01-06 16:48:31.96676
838	Gary Busey	actor	2017-01-06 16:48:31.992066	2017-01-06 16:48:31.992066
839	Richard Donner	director	2017-01-06 16:48:32.007197	2017-01-06 16:48:32.007197
840	Joe Pesci	actor	2017-01-06 16:49:09.325701	2017-01-06 16:49:09.325701
841	Rene Russo	actor	2017-01-06 16:49:38.842514	2017-01-06 16:49:38.842514
842	Jet Li	actor	2017-01-06 16:50:40.860458	2017-01-06 16:50:40.860458
843	Terrence Howard	actor	2017-01-06 16:51:55.230763	2017-01-06 16:51:55.230763
844	Jeff Bridges	actor	2017-01-06 16:51:55.252063	2017-01-06 16:51:55.252063
845	Don Cheadle	actor	2017-01-06 16:52:53.539854	2017-01-06 16:52:53.539854
846	Guy Pearce	actor	2017-01-06 16:54:03.50512	2017-01-06 16:54:03.50512
847	Shane Black	director	2017-01-06 16:54:03.566567	2017-01-06 16:54:03.566567
848	Bonnie Bedelia	actor	2017-01-06 16:56:27.435252	2017-01-06 16:56:27.435252
849	Reginald VelJohnson	actor	2017-01-06 16:56:27.449461	2017-01-06 16:56:27.449461
850	John McTiernan	director	2017-01-06 16:56:27.463975	2017-01-06 16:56:27.463975
851	William Atherton	actor	2017-01-06 16:58:24.286271	2017-01-06 16:58:24.286271
852	Renny Harlin	director	2017-01-06 16:58:24.312284	2017-01-06 16:58:24.312284
853	Jeremy Irons	actor	2017-01-06 17:00:28.209957	2017-01-06 17:00:28.209957
854	Graham Greene	actor	2017-01-06 17:00:28.244584	2017-01-06 17:00:28.244584
855	Colleen Camp	actor	2017-01-06 17:00:28.265314	2017-01-06 17:00:28.265314
856	Timothy Olyphant	actor	2017-01-06 17:01:41.481518	2017-01-06 17:01:41.481518
857	Cliff Curtis	actor	2017-01-06 17:01:41.524568	2017-01-06 17:01:41.524568
858	Kevin Smith	actor	2017-01-06 17:01:41.561571	2017-01-06 17:01:41.561571
859	Len Wiseman	director	2017-01-06 17:01:41.601393	2017-01-06 17:01:41.601393
860	Martin Sheen	actor	2017-01-06 17:03:12.551142	2017-01-06 17:03:12.551142
861	Vera Farmiga	actor	2017-01-06 17:03:12.580908	2017-01-06 17:03:12.580908
862	Michael York	actor	2017-01-06 17:08:11.665593	2017-01-06 17:08:11.665593
863	Seth Green	actor	2017-01-06 17:08:11.712347	2017-01-06 17:08:11.712347
864	Verne Troyer	actor	2017-01-06 17:08:11.728175	2017-01-06 17:08:11.728175
865	Andy Richter	actor	2017-01-06 17:10:18.955684	2017-01-06 17:10:18.955684
866	Clea Lewis	actor	2017-01-06 17:10:18.977491	2017-01-06 17:10:18.977491
867	Harve Presnell	actor	2017-01-06 17:10:18.995111	2017-01-06 17:10:18.995111
868	Tony Hale	actor	2017-01-06 17:10:19.011848	2017-01-06 17:10:19.011848
869	Marshall Manesh	actor	2017-01-06 17:10:19.039152	2017-01-06 17:10:19.039152
870	Jessica Walter	actor	2017-01-06 17:11:30.901585	2017-01-06 17:11:30.901585
871	Portia de Rossi	actor	2017-01-06 17:11:30.918584	2017-01-06 17:11:30.918584
872	Alia Shawkat	actor	2017-01-06 17:11:30.934522	2017-01-06 17:11:30.934522
622	Zach Galifianakis	actor	2017-01-06 14:13:50.315065	2017-01-06 17:12:31.458501
873	Jason Schwartzman	actor	2017-01-06 17:14:26.214008	2017-01-06 17:14:26.214008
874	Ted Danson	actor	2017-01-06 17:14:26.239063	2017-01-06 17:14:26.239063
875	John Hodgman	actor	2017-01-06 17:14:26.254879	2017-01-06 17:14:26.254879
876	Heather Burns	actor	2017-01-06 17:14:26.269281	2017-01-06 17:14:26.269281
877	Oliver Platt	actor	2017-01-06 17:14:26.290031	2017-01-06 17:14:26.290031
878	Julia Stiles	actor	2017-01-06 17:20:09.079855	2017-01-06 17:20:09.079855
879	Jonny Lee Miller	actor	2017-01-06 17:20:09.126668	2017-01-06 17:20:09.126668
880	Edward James Olmos	actor	2017-01-06 17:20:58.458762	2017-01-06 17:20:58.458762
881	Colin Hanks	actor	2017-01-06 17:20:58.503996	2017-01-06 17:20:58.503996
882	Yvonne Strahovski	actor	2017-01-06 17:22:23.622792	2017-01-06 17:22:23.622792
883	Ray Stevenson	actor	2017-01-06 17:22:23.650861	2017-01-06 17:22:23.650861
884	Charlotte Rampling	actor	2017-01-06 17:23:10.051043	2017-01-06 17:23:10.051043
885	Adam Reed	actor	2017-01-06 17:27:34.151942	2017-01-06 17:27:34.151942
886	Eric Sims	actor	2017-01-06 17:27:34.171612	2017-01-06 17:27:34.171612
887	Neal Holman	actor	2017-01-06 17:27:34.20179	2017-01-06 17:27:34.20179
888	Stuart Culpepper	actor	2017-01-06 17:27:34.230191	2017-01-06 17:27:34.230191
889	Christian Danley	actor	2017-01-06 17:27:34.248849	2017-01-06 17:27:34.248849
890	Casey Willis	actor	2017-01-06 17:27:34.272035	2017-01-06 17:27:34.272035
891	Amber Nash	actor	2017-01-06 17:27:34.307127	2017-01-06 17:27:34.307127
892	Stephen Merchant	actor	2017-01-06 17:28:21.792798	2017-01-06 17:28:21.792798
893	Christine Woods	actor	2017-01-06 17:28:21.815076	2017-01-06 17:28:21.815076
894	Nate Torrence	actor	2017-01-06 17:28:21.830631	2017-01-06 17:28:21.830631
895	Kevin Weisman	actor	2017-01-06 17:28:21.849069	2017-01-06 17:28:21.849069
896	Kyle Mooney	actor	2017-01-06 17:28:21.867747	2017-01-06 17:28:21.867747
897	Jerry Seinfeld	actor	2017-01-06 17:32:15.879096	2017-01-06 17:32:15.879096
898	Julia Louis-Dreyfus	actor	2017-01-06 17:32:15.946567	2017-01-06 17:32:15.946567
899	Demetri Martin	actor	2017-01-06 17:36:19.419171	2017-01-06 17:36:19.419171
900	Demetri Martin	director	2017-01-06 17:36:19.502297	2017-01-06 17:36:19.502297
901	Daniel Tosh	actor	2017-01-06 17:36:40.497198	2017-01-06 17:36:40.497198
902	Daniel Tosh	director	2017-01-06 17:36:40.585784	2017-01-06 17:36:40.585784
903	Nick Swardson	director	2017-01-06 17:37:03.034582	2017-01-06 17:37:03.034582
904	Bo Burnham	actor	2017-01-06 17:37:20.973358	2017-01-06 17:37:20.973358
905	Bo Burnham	director	2017-01-06 17:37:21.005061	2017-01-06 17:37:21.005061
906	Ricky Gervais	director	2017-01-06 17:37:42.250595	2017-01-06 17:37:42.250595
907	Patrick Stewart	actor	2017-01-06 17:40:19.493174	2017-01-06 17:40:19.493174
908	Richard E. Grant	actor	2017-01-06 17:40:19.531029	2017-01-06 17:40:19.531029
909	Joel Grey	actor	2017-01-06 17:40:19.554515	2017-01-06 17:40:19.554515
910	David Hugh Jones	director	2017-01-06 17:40:19.577922	2017-01-06 17:40:19.577922
911	Karen Allen	actor	2017-01-06 23:46:51.717439	2017-01-06 23:46:51.717439
912	John Forsythe	actor	2017-01-06 23:46:51.778133	2017-01-06 23:46:51.778133
913	Bobcat Goldthwait	actor	2017-01-06 23:46:51.858262	2017-01-06 23:46:51.858262
914	Estelle Harris	actor	2017-01-08 16:43:53.37275	2017-01-08 16:43:53.37275
915	Mark Phelan	actor	2017-01-08 16:43:53.386405	2017-01-08 16:43:53.386405
916	Ramon Menendez	director	2017-01-08 16:43:53.400283	2017-01-08 16:43:53.400283
917	Robert Redford	actor	2017-01-08 16:44:43.480999	2017-01-08 16:44:43.480999
918	Rod Lurie	director	2017-01-08 16:44:43.517307	2017-01-08 16:44:43.517307
919	Kal Penn	actor	2017-01-08 16:45:46.921791	2017-01-08 16:45:46.921791
920	Ethan Embry	actor	2017-01-08 16:45:46.939279	2017-01-08 16:45:46.939279
921	Danny Leiner	director	2017-01-08 16:45:46.957463	2017-01-08 16:45:46.957463
922	Linda Fiorentino	actor	2017-01-08 16:52:29.587388	2017-01-08 16:52:29.587388
923	George Carlin	actor	2017-01-08 16:52:29.613686	2017-01-08 16:52:29.613686
924	Janeane Garofalo	actor	2017-01-08 16:52:29.631243	2017-01-08 16:52:29.631243
925	Jason Mewes	actor	2017-01-08 16:52:29.650999	2017-01-08 16:52:29.650999
926	Jason Lee	actor	2017-01-08 16:52:29.660046	2017-01-08 16:52:29.660046
927	Salma Hayek	actor	2017-01-08 16:52:29.668877	2017-01-08 16:52:29.668877
928	Luke Wilson	actor	2017-01-08 16:54:23.176292	2017-01-08 16:54:23.176292
929	Vince Vaughn	actor	2017-01-08 16:54:23.188301	2017-01-08 16:54:23.188301
930	Jeremy Piven	actor	2017-01-08 16:54:23.215218	2017-01-08 16:54:23.215218
931	Ellen Pompeo	actor	2017-01-08 16:54:23.231208	2017-01-08 16:54:23.231208
932	Juliette Lewis	actor	2017-01-08 16:54:23.243407	2017-01-08 16:54:23.243407
933	Leah Remini	actor	2017-01-08 16:54:23.271528	2017-01-08 16:54:23.271528
934	Perrey Reeves	actor	2017-01-08 16:54:23.295305	2017-01-08 16:54:23.295305
935	David Spade	actor	2017-01-08 16:55:36.689923	2017-01-08 16:55:36.689923
936	Brian Dennehy	actor	2017-01-08 16:55:36.716118	2017-01-08 16:55:36.716118
937	Bo Derek	actor	2017-01-08 16:55:36.728762	2017-01-08 16:55:36.728762
938	Julie Warner	actor	2017-01-08 16:55:36.746545	2017-01-08 16:55:36.746545
939	Peter Segal	director	2017-01-08 16:55:36.756393	2017-01-08 16:55:36.756393
940	John Travolta	actor	2017-01-08 16:58:26.512668	2017-01-08 16:58:26.512668
941	Ving Rhames	actor	2017-01-08 16:58:26.541139	2017-01-08 16:58:26.541139
942	Rosanna Arquette	actor	2017-01-08 16:58:26.56238	2017-01-08 16:58:26.56238
943	Uma Thurman	actor	2017-01-08 16:58:26.578255	2017-01-08 16:58:26.578255
944	Quentin Tarantino	director	2017-01-08 16:58:26.589873	2017-01-08 16:58:26.589873
945	Cate Blanchett	actor	2017-01-08 16:59:27.439623	2017-01-08 16:59:27.439623
946	Gabriel Macht	actor	2017-01-08 17:00:10.101789	2017-01-08 17:00:10.101789
947	John Moore	director	2017-01-08 17:00:10.113048	2017-01-08 17:00:10.113048
948	Giovanni Ribisi	actor	2017-01-08 17:01:09.771132	2017-01-08 17:01:09.771132
949	Scott Caan	actor	2017-01-08 17:01:09.790099	2017-01-08 17:01:09.790099
950	James Duval	actor	2017-01-08 17:01:09.814857	2017-01-08 17:01:09.814857
951	Dominic Sena	director	2017-01-08 17:01:09.84226	2017-01-08 17:01:09.84226
952	Ray Liotta	actor	2017-01-08 17:01:56.672554	2017-01-08 17:01:56.672554
953	Amanda Peet	actor	2017-01-08 17:01:56.683238	2017-01-08 17:01:56.683238
954	James Mangold	director	2017-01-08 17:01:56.702185	2017-01-08 17:01:56.702185
955	Seth MacFarlane	actor	2017-01-08 17:03:07.115085	2017-01-08 17:03:07.115085
956	Alex Borstein	actor	2017-01-08 17:03:07.143227	2017-01-08 17:03:07.143227
957	Pete Michels	director	2017-01-08 17:03:07.166813	2017-01-08 17:03:07.166813
958	Peter Shin	director	2017-01-08 17:03:07.19601	2017-01-08 17:03:07.19601
959	Ralph Macchio	actor	2017-01-08 17:05:06.452956	2017-01-08 17:05:06.452956
960	Mitchell Whitfield	actor	2017-01-08 17:05:06.46387	2017-01-08 17:05:06.46387
961	Fred Gwynne	actor	2017-01-08 17:05:06.472987	2017-01-08 17:05:06.472987
962	Jonathan Lynn	director	2017-01-08 17:05:06.489462	2017-01-08 17:05:06.489462
963	Jamie Foxx	actor	2017-01-08 17:06:01.65917	2017-01-08 17:06:01.65917
964	Jada Pinkett Smith	actor	2017-01-08 17:06:01.684748	2017-01-08 17:06:01.684748
965	Michael Mann	director	2017-01-08 17:06:01.714983	2017-01-08 17:06:01.714983
966	Lorraine Bracco	actor	2017-01-08 17:07:01.023699	2017-01-08 17:07:01.023699
967	Jonathan Pryce	actor	2017-01-08 17:07:53.07028	2017-01-08 17:07:53.07028
968	Michelle Yeoh	actor	2017-01-08 17:07:53.094213	2017-01-08 17:07:53.094213
969	Roger Spottiswoode	director	2017-01-08 17:07:53.116754	2017-01-08 17:07:53.116754
970	Gert Frobe	actor	2017-01-08 17:08:35.382609	2017-01-08 17:08:35.382609
971	Honor Blackman	actor	2017-01-08 17:08:35.461999	2017-01-08 17:08:35.461999
972	Guy Hamilton	director	2017-01-08 17:08:35.54773	2017-01-08 17:08:35.54773
973	Ursula Andress	actor	2017-01-08 17:09:10.203624	2017-01-08 17:09:10.203624
974	Bernard Lee	actor	2017-01-08 17:09:10.22613	2017-01-08 17:09:10.22613
975	Terence Young	director	2017-01-08 17:09:10.244738	2017-01-08 17:09:10.244738
976	Kim Basinger	actor	2017-01-08 17:10:11.770478	2017-01-08 17:10:11.770478
977	Klaus Maria Brandauer	actor	2017-01-08 17:10:11.78447	2017-01-08 17:10:11.78447
978	Irvin Kershner	director	2017-01-08 17:10:11.806974	2017-01-08 17:10:11.806974
979	Halle Berry	actor	2017-01-08 17:10:47.699251	2017-01-08 17:10:47.699251
980	Rosamund Pike	actor	2017-01-08 17:10:47.750528	2017-01-08 17:10:47.750528
981	Lee Tamahori	director	2017-01-08 17:10:47.811777	2017-01-08 17:10:47.811777
982	Daniel Craig	actor	2017-01-08 17:11:27.220063	2017-01-08 17:11:27.220063
983	Eva Green	actor	2017-01-08 17:11:27.24158	2017-01-08 17:11:27.24158
984	Olga Kurylenko	actor	2017-01-08 17:12:37.625991	2017-01-08 17:12:37.625991
985	Mathieu Amalric	actor	2017-01-08 17:12:37.637276	2017-01-08 17:12:37.637276
986	Edward Burns	actor	2017-01-08 17:15:41.262349	2017-01-08 17:15:41.262349
987	Rachel Weisz	actor	2017-01-08 17:15:41.307231	2017-01-08 17:15:41.307231
988	James Foley	director	2017-01-08 17:15:41.327068	2017-01-08 17:15:41.327068
989	Jason Statham	actor	2017-01-08 17:16:34.230132	2017-01-08 17:16:34.230132
990	Charlize Theron	actor	2017-01-08 17:16:34.285336	2017-01-08 17:16:34.285336
991	F. Gary Gray	director	2017-01-08 17:16:34.338152	2017-01-08 17:16:34.338152
992	Tyrese Gibson	actor	2017-01-08 17:17:40.167007	2017-01-08 17:17:40.167007
993	Andre Benjamin	actor	2017-01-08 17:17:40.188455	2017-01-08 17:17:40.188455
994	Garrett Hedlund	actor	2017-01-08 17:17:40.226192	2017-01-08 17:17:40.226192
995	Lucas Black	actor	2017-01-08 17:18:46.85881	2017-01-08 17:18:46.85881
996	Derek Luke	actor	2017-01-08 17:18:46.89196	2017-01-08 17:18:46.89196
997	Harvey Keitel	actor	2017-01-08 17:19:52.878536	2017-01-08 17:19:52.878536
998	Tim Roth	actor	2017-01-08 17:19:52.925995	2017-01-08 17:19:52.925995
999	Michael Madsen	actor	2017-01-08 17:19:52.960223	2017-01-08 17:19:52.960223
1000	Chris Penn	actor	2017-01-08 17:19:53.054773	2017-01-08 17:19:53.054773
1001	Steve Buscemi	actor	2017-01-08 17:19:53.082668	2017-01-08 17:19:53.082668
1002	Renee Zellweger	actor	2017-01-08 17:21:03.772939	2017-01-08 17:21:03.772939
1003	Taye Diggs	actor	2017-01-08 17:21:03.878878	2017-01-08 17:21:03.878878
1004	Rob Marshall	director	2017-01-08 17:21:03.962147	2017-01-08 17:21:03.962147
1005	Ewan McGregor	actor	2017-01-08 17:22:14.488842	2017-01-08 17:22:14.488842
1006	Albert Finney	actor	2017-01-08 17:22:14.507482	2017-01-08 17:22:14.507482
1007	Billy Crudup	actor	2017-01-08 17:22:14.541495	2017-01-08 17:22:14.541495
1008	Jessica Lange	actor	2017-01-08 17:22:14.568107	2017-01-08 17:22:14.568107
1009	Gerard Butler	actor	2017-01-08 17:23:44.524693	2017-01-08 17:23:44.524693
1010	Lena Headley	actor	2017-01-08 17:23:44.543469	2017-01-08 17:23:44.543469
1011	David Wenham	actor	2017-01-08 17:23:44.563941	2017-01-08 17:23:44.563941
1012	Michael Fassbender	actor	2017-01-08 17:23:44.576935	2017-01-08 17:23:44.576935
1013	Zack Snyder	director	2017-01-08 17:23:44.588166	2017-01-08 17:23:44.588166
1014	Elijah Wood	actor	2017-01-08 17:25:30.729842	2017-01-08 17:25:30.729842
1015	Ian McKellen	actor	2017-01-08 17:25:30.743358	2017-01-08 17:25:30.743358
1016	Orlando Bloom	actor	2017-01-08 17:25:30.762375	2017-01-08 17:25:30.762375
1017	Peter Jackson	director	2017-01-08 17:25:30.788981	2017-01-08 17:25:30.788981
1018	Rosario Dawson	actor	2017-01-08 17:26:16.388007	2017-01-08 17:26:16.388007
1019	Gabriele Muccino	director	2017-01-08 17:26:16.412161	2017-01-08 17:26:16.412161
1020	Craig Bierko	actor	2017-01-08 17:27:02.888091	2017-01-08 17:27:02.888091
1021	Tom  Hanks	actor	2017-01-08 17:27:49.340435	2017-01-08 17:27:49.340435
810	Tia Carrere	actor	2017-01-06 16:26:15.234245	2017-01-09 22:11:40.598981
1022	Tye Sheridan	actor	2017-01-18 20:14:42.935916	2017-01-18 20:14:42.935916
1023	Jacob Lofland	actor	2017-01-18 20:14:42.950071	2017-01-18 20:14:42.950071
1024	Jeff Nichols	director	2017-01-18 20:14:42.971286	2017-01-18 20:14:42.971286
1025	Gina Torres	actor	2017-02-02 23:06:20.647177	2017-02-02 23:06:20.647177
1026	Morena Baccarin	actor	2017-02-02 23:06:20.683539	2017-02-02 23:06:20.683539
1027	Adam Baldwin	actor	2017-02-02 23:06:20.69897	2017-02-02 23:06:20.69897
1028	Summer Glau	actor	2017-02-02 23:06:20.720175	2017-02-02 23:06:20.720175
1029	Jewel Staite	actor	2017-02-02 23:06:20.735571	2017-02-02 23:06:20.735571
1030	Sean Maher	actor	2017-02-02 23:06:20.751267	2017-02-02 23:06:20.751267
1031	Sean Glass	actor	2017-02-02 23:06:20.771945	2017-02-02 23:06:20.771945
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"people_id_seq"', 1031, true);


--
-- Data for Name: person_listings; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "person_listings" ("id", "person_id", "listing_id") FROM stdin;
\.


--
-- Name: person_listings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('"person_listings_id_seq"', 1552, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY "schema_migrations" ("version") FROM stdin;
20170103234128
20170104135708
20170104135726
20170104140625
20170104141622
20170114041342
20170421162045
20170423001441
20170423144518
20170423204134
20170509182642
20170509182857
20170509183342
20170511182217
\.


--
-- Name: genre_listings genre_listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "genre_listings"
    ADD CONSTRAINT "genre_listings_pkey" PRIMARY KEY ("id");


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "genres"
    ADD CONSTRAINT "genres_pkey" PRIMARY KEY ("id");


--
-- Name: import_failures import_failures_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "import_failures"
    ADD CONSTRAINT "import_failures_pkey" PRIMARY KEY ("id");


--
-- Name: listings listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "listings"
    ADD CONSTRAINT "listings_pkey" PRIMARY KEY ("id");


--
-- Name: people people_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "people"
    ADD CONSTRAINT "people_pkey" PRIMARY KEY ("id");


--
-- Name: person_listings person_listings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY "person_listings"
    ADD CONSTRAINT "person_listings_pkey" PRIMARY KEY ("id");


--
-- Name: index_genres_listings_on_genre_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX "index_genres_listings_on_genre_id" ON "genres_listings" USING "btree" ("genre_id");


--
-- Name: index_genres_listings_on_listing_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX "index_genres_listings_on_listing_id" ON "genres_listings" USING "btree" ("listing_id");


--
-- Name: index_listings_people_on_listing_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX "index_listings_people_on_listing_id" ON "listings_people" USING "btree" ("listing_id");


--
-- Name: index_listings_people_on_person_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX "index_listings_people_on_person_id" ON "listings_people" USING "btree" ("person_id");


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" USING "btree" ("version");


--
-- PostgreSQL database dump complete
--

