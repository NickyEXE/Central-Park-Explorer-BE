--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO flatironschool;

--
-- Name: facts; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.facts (
    id bigint NOT NULL,
    factoid character varying,
    location_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.facts OWNER TO flatironschool;

--
-- Name: facts_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.facts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.facts_id_seq OWNER TO flatironschool;

--
-- Name: facts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.facts_id_seq OWNED BY public.facts.id;


--
-- Name: interests; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.interests (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.interests OWNER TO flatironschool;

--
-- Name: interests_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.interests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.interests_id_seq OWNER TO flatironschool;

--
-- Name: interests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.interests_id_seq OWNED BY public.interests.id;


--
-- Name: landmarks; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.landmarks (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    location_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    image character varying
);


ALTER TABLE public.landmarks OWNER TO flatironschool;

--
-- Name: landmarks_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.landmarks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.landmarks_id_seq OWNER TO flatironschool;

--
-- Name: landmarks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.landmarks_id_seq OWNED BY public.landmarks.id;


--
-- Name: location_tags; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.location_tags (
    id bigint NOT NULL,
    location_id bigint,
    tag_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    review character varying,
    user_id bigint
);


ALTER TABLE public.location_tags OWNER TO flatironschool;

--
-- Name: location_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.location_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.location_tags_id_seq OWNER TO flatironschool;

--
-- Name: location_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.location_tags_id_seq OWNED BY public.location_tags.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying,
    description character varying,
    geom public.geometry(MultiPolygon,4326),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO flatironschool;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO flatironschool;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: locimages; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.locimages (
    id bigint NOT NULL,
    url character varying,
    alt character varying,
    location_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.locimages OWNER TO flatironschool;

--
-- Name: locimages_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.locimages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locimages_id_seq OWNER TO flatironschool;

--
-- Name: locimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.locimages_id_seq OWNED BY public.locimages.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO flatironschool;

--
-- Name: tags; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.tags (
    id bigint NOT NULL,
    tag character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    interest_id bigint
);


ALTER TABLE public.tags OWNER TO flatironschool;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO flatironschool;

--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.tags_id_seq OWNED BY public.tags.id;


--
-- Name: userinterests; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.userinterests (
    id bigint NOT NULL,
    user_id bigint,
    interest_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.userinterests OWNER TO flatironschool;

--
-- Name: userinterests_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.userinterests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.userinterests_id_seq OWNER TO flatironschool;

--
-- Name: userinterests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.userinterests_id_seq OWNED BY public.userinterests.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: flatironschool
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    username character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.users OWNER TO flatironschool;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: flatironschool
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO flatironschool;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: flatironschool
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: facts id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.facts ALTER COLUMN id SET DEFAULT nextval('public.facts_id_seq'::regclass);


--
-- Name: interests id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.interests ALTER COLUMN id SET DEFAULT nextval('public.interests_id_seq'::regclass);


--
-- Name: landmarks id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.landmarks ALTER COLUMN id SET DEFAULT nextval('public.landmarks_id_seq'::regclass);


--
-- Name: location_tags id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.location_tags ALTER COLUMN id SET DEFAULT nextval('public.location_tags_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: locimages id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.locimages ALTER COLUMN id SET DEFAULT nextval('public.locimages_id_seq'::regclass);


--
-- Name: tags id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.tags ALTER COLUMN id SET DEFAULT nextval('public.tags_id_seq'::regclass);


--
-- Name: userinterests id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.userinterests ALTER COLUMN id SET DEFAULT nextval('public.userinterests_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-05-30 03:43:43.767322	2019-05-30 03:43:43.767322
\.


--
-- Data for Name: facts; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.facts (id, factoid, location_id, created_at, updated_at) FROM stdin;
1	Meer is Dutch for lake	11	2019-05-30 03:43:45.567815	2019-05-30 03:43:45.567815
2	This meer was once a brackish portion of wetland that drained into the East River.	11	2019-05-30 03:43:45.57834	2019-05-30 03:43:45.57834
3	The Pond is one of Central Park's seven naturalistic water bodies.	10	2019-05-30 03:43:45.620256	2019-05-30 03:43:45.620256
4	The Pond holds Hallett Nature Sanctuary, a wooded promontory with a 3.5-acre ecosystem.	10	2019-05-30 03:43:45.624175	2019-05-30 03:43:45.624175
5	The Central Park Carousel heavily featured in Catcher in the Rye.	1	2019-05-30 03:43:45.696334	2019-05-30 03:43:45.696334
6	This was the first spot where Central Park tested shutting down portions of the lawn at times when the grass was vulnerable. It's now a common occurance across the park.	14	2019-05-30 03:43:45.740016	2019-05-30 03:43:45.740016
7	There are no trash cans in the Ramble.	15	2019-05-30 03:43:45.792038	2019-05-30 03:43:45.792038
8	In the 1960s and 70s, Sheep Meadow became a haven for the hippie movement. After the city government refused to upkeep it in the face of hippies, it was a virtual dust bowl by the 1970s.	8	2019-05-30 03:43:45.839902	2019-05-30 03:43:45.839902
9	Shakespeare's roots run deep in this area. An early fixture of New York City entertainment, the infamous Astor Place Riots were initially kicked off due to a feud between two Shakespearean actors.	13	2019-05-30 03:43:45.911772	2019-05-30 03:43:45.911772
10	The Mall is the only formalistic section of Central Park, which otherwise strived towards a naturalism in its design.	13	2019-05-30 03:43:45.915504	2019-05-30 03:43:45.915504
11	The Bethesda fountain was a popular gathering place for the Hair generation before becoming a notorious drug spot in the 1970s.	12	2019-05-30 03:43:45.943456	2019-05-30 03:43:45.943456
12	The Loeb Boathouse is where Carrie Fisher pulls out her rolodex in When Harry Met Sally to try to find Sally a man.	12	2019-05-30 03:43:45.947192	2019-05-30 03:43:45.947192
13	The Model Boat Pond features in the film Stuart Little.	9	2019-05-30 03:43:46.034448	2019-05-30 03:43:46.034448
14	The National Weather Service's measurement of the weather in New York is taken from Belvedere castle.	16	2019-05-30 03:43:46.089841	2019-05-30 03:43:46.089841
15	The Great Lawn was originally part of New York's reservoir system.	6	2019-05-30 03:43:46.146537	2019-05-30 03:43:46.146537
16	The full name of the Reservoir is the Jacqueline Kennedy Onassis reservoir, after Jackie Kennedy Onassis, who used to jog along this path.	7	2019-05-30 03:43:46.206115	2019-05-30 03:43:46.206115
17	Seriously this is the best place for picnicking in the park.	5	2019-05-30 03:43:46.243038	2019-05-30 03:43:46.243038
18	The North Meadow Butterfly Gardens provide habitat for Monarch butterflies migrating through New York City on their way to and from Mexico.	4	2019-05-30 03:43:46.279067	2019-05-30 03:43:46.279067
19	The pool was originally built by damming a natural stream that was known as Montayne's Rivulet, but now is made of New York City drinking water that comes from a pipe hidden in the rocks on the southern shoreline of the Pool.	2	2019-05-30 03:43:46.321133	2019-05-30 03:43:46.321133
20	The City lets fallen trees lie here, preferring to leave this place to plants and wildlife.	3	2019-05-30 03:43:46.382624	2019-05-30 03:43:46.382624
\.


--
-- Data for Name: interests; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.interests (id, name, created_at, updated_at) FROM stdin;
1	Fishing	2019-05-30 03:43:45.342234	2019-05-30 03:43:45.342234
2	Wildlife	2019-05-30 03:43:45.376749	2019-05-30 03:43:45.376749
3	Flora	2019-05-30 03:43:45.380808	2019-05-30 03:43:45.380808
4	History	2019-05-30 03:43:45.385038	2019-05-30 03:43:45.385038
5	Art	2019-05-30 03:43:45.388787	2019-05-30 03:43:45.388787
6	Architecture	2019-05-30 03:43:45.392649	2019-05-30 03:43:45.392649
7	Kids	2019-05-30 03:43:45.39641	2019-05-30 03:43:45.39641
8	Hiking	2019-05-30 03:43:45.400108	2019-05-30 03:43:45.400108
9	Strolling	2019-05-30 03:43:45.403816	2019-05-30 03:43:45.403816
10	Picnics	2019-05-30 03:43:45.407869	2019-05-30 03:43:45.407869
11	Exercise	2019-05-30 03:43:45.410936	2019-05-30 03:43:45.410936
12	Dogs	2019-05-30 03:43:45.414484	2019-05-30 03:43:45.414484
\.


--
-- Data for Name: landmarks; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.landmarks (id, name, description, location_id, created_at, updated_at, image) FROM stdin;
1	Fort Clinton	Formerly a military fortification during the Revolutionary War and War of 1812, a cannon still marks the spot overlooking the Meer, along with some picnic benches.	11	2019-05-30 03:43:45.268333	2019-05-30 03:43:45.268333	https://forgotten-ny.com/wp-content/uploads/2017/05/fort.clinton1.jpg
2	Conservatory Garden	A six acre garden in the middle of New York City, depending on the time of year you'll feel like you're either in The Favourite or The Shining.	11	2019-05-30 03:43:45.278724	2019-05-30 03:43:45.278724	http://assets.centralparknyc.org/images/things-to-see-and-do/conservatory-garden-l.jpg
3	Lasker Rink and Swimming Pool	Just south of Farmers Gate off the 2/3 train, Lasker Rink is a go-to for swimming during the summer and skating/hockey during the winter. It is currently cancelled though, as it is run by the Trump Organization.	11	2019-05-30 03:43:45.293403	2019-05-30 03:43:45.293403	http://michaelminn.net/newyork/parks/central-park/lasker-rink/2004-03-07_16-09-41.jpg
4	Central Park Zoo	A zoo, plus a petting zoo, in the heart of the city. Come for the seals, stay for the incredibly energetic red pandas. NY 12th Congressional District Representative Carolyn Maloney has been pushing to get pandas in here for years.	10	2019-05-30 03:43:45.637679	2019-05-30 03:43:45.637679	https://c532f75abb9c1c021b8c-e46e473f8aadb72cf2a8ea564b4e6a76.ssl.cf5.rackcdn.com/2016/10/20/9kn6or4r6j_cp_photo_sg_large.jpg
5	Wollman Rink	Can you name a more iconic (or expensive) place to skate in New York City? ...Apart from Rockefeller Center.	10	2019-05-30 03:43:45.641975	2019-05-30 03:43:45.641975	https://upload.wikimedia.org/wikipedia/commons/6/66/WollmanRink.jpg
6	Grand Army Plaza	If you want to pay your respects to the guy who absolutely trashed the South, there's a giant statue of General William Tecumseh Sherman at the Southeast corner of the park.	10	2019-05-30 03:43:45.64717	2019-05-30 03:43:45.64717	http://assets.centralparknyc.org/images/things-to-see-and-do/Sherman-750.jpg
7	Statues of Latin American Leaders	If you want to check out a statue of Simón Bolívar or General José de San Martín, walk along the Southern end of the park.	10	2019-05-30 03:43:45.651004	2019-05-30 03:43:45.651004	https://static.wixstatic.com/media/99078f_7faf7be9a7bb440380f8aad14b70e176~mv2_d_1900_1267_s_2.jpg
8	Horse Riding	If you want to waste money like a tourist, Mayor Bill DeBlasio was unsuccessful on his promise to get the horses out of Central Park.	10	2019-05-30 03:43:45.656481	2019-05-30 03:43:45.656481	http://www.centralpark.com/downloads/7996/download/Horse%20Carriage%20riders.JPG?cb=c646d57e74c95949370a4b474b132b4e&w=640
9	Central Park Carousel	An iconic carousel, this is a great place to bring kids on the way to Sheep Meadow.	1	2019-05-30 03:43:45.66632	2019-05-30 03:43:45.66632	https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Central_Park_Carousel_snow_jeh.JPG/1920px-Central_Park_Carousel_snow_jeh.JPG
10	Heckscher Playground	This fountain heavy playground is great for burning off kids' energy.	1	2019-05-30 03:43:45.670663	2019-05-30 03:43:45.670663	http://assets.centralparknyc.org/images/things-to-see-and-do/heckscher-playground-l.jpg
11	Columbus Circle	At the Southwest corner of the park, a giant statue of Columbus sits in the center of malls, skateboarders, fountains, and often a holiday market.	1	2019-05-30 03:43:45.675245	2019-05-30 03:43:45.675245	https://theknickerbocker.com/wp-content/uploads/2017/02/Columbus-Circle-NYC-Midtown-Guide-Knickerbocker-Hotel.jpg
12	Still Hunt Statue	A statue of a crouching panther set directly on top of a ledge of rock, designed by Edward Kemeys, an American sculptor who also worked as an axe-man building central park.	14	2019-05-30 03:43:45.715292	2019-05-30 03:43:45.715292	http://assets.centralparknyc.org/images/things-to-see-and-do/still-hunt-l.jpg
13	Glade Arch	An arch originally serving as an access road for carriages, this is a classic example of a Centarl Park arch.	14	2019-05-30 03:43:45.719389	2019-05-30 03:43:45.719389	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Glade_Arch_north_cloudy_jeh.jpg/2560px-Glade_Arch_north_cloudy_jeh.jpg
14	Ramble Stone Arch	A bridge with a narrow arch below and covered in foliage, in addition to being gorgeous, it contains the remains of a cave that was covered in the 1920s after a series of crimes.	15	2019-05-30 03:43:45.761408	2019-05-30 03:43:45.761408	http://assets.centralparknyc.org/images/things-to-see-and-do/ramble-stone-arch-l.jpg
15	The Point	Protruding into the Lake, this place offers a great vantage point over Bethesday Terrace.	15	2019-05-30 03:43:45.765657	2019-05-30 03:43:45.765657	http://assets.centralparknyc.org/images/things-to-see-and-do/point-l.jpg
16	The Gill	A stream that travels the Ramble to the lake, it's actually entirely artificial: It can be turned off like a faucet.	15	2019-05-30 03:43:45.77004	2019-05-30 03:43:45.77004	http://assets.centralparknyc.org/images/things-to-see-and-do/gill-l.jpg
17	Tavern on the Green	While this restaurant located in Central Park continues to change hands, as of 2007, at $38 million, it was the second-highest-grossing independent restaurant in the United States, second only to Las Vegas's Tao restaurant at the Venetian.	8	2019-05-30 03:43:45.814692	2019-05-30 03:43:45.814692	https://www.nycgo.com/images/venues/5721/headertavern-on-the-green-courtyarda-maura-daley__x_large.jpg
18	Adventure Playground	Adventure Playground features a conical climber with tunnels and a slide, a fortress, maze-like structures, a circular water spray feature, sand play areas and safety carpet.	8	2019-05-30 03:43:45.818618	2019-05-30 03:43:45.818618	https://tclf.org/sites/default/files/features/2015-12-15%20Adventure%20Playground/HistoricAdventurePlayground-2cropped.jpg
19	Literary Walk	A statuary devoted to the great figures of literature, it contains statues of William Shakespeare, Sir Walter Scott, Robert Burns, and more.	13	2019-05-30 03:43:45.857599	2019-05-30 03:43:45.857599	https://www.nycgo.com/images/venues/2975/literary-walk-will-steacy-8__x_large.jpg
20	Balto Statue	A statue to the dog hero of Nome, just visiting it gets you within two degrees of Kevin Bacon (the Disney film Balto, which he starred in, ends with a shot of this statue).	13	2019-05-30 03:43:45.861686	2019-05-30 03:43:45.861686	http://www.centralpark.com/downloads/7892/download/Balto.jpg?cb=fc63c0c9515ce5c7d341e9da08f89ec4&w=640
21	Rumsey Playfield	The site of numerous events including the SummerStage event festival, you can picnic outside and hear the music for free.	13	2019-05-30 03:43:45.873935	2019-05-30 03:43:45.873935	http://www.centralpark.com/downloads/5626/download/summerstage.jpg.jpe?cb=783665e2e86dabe11fdbe675f24e26c4
22	307th Infantry Regiment Memorial Grove	The 307th Infantry Regiment Memorial Grove is an area dedicated to the memory of soldiers who gave their lives during World War I. Following the war, several young trees were planted in the grove- one for each of the Regiment’s companies. Each tree was marked with a plaque containing the names of men in that company who died in battle.	13	2019-05-30 03:43:45.877812	2019-05-30 03:43:45.877812	http://assets.centralparknyc.org/images/things-to-see-and-do/307-infantry-memorial-grove.jpg
23	Bethesda Mall and Terrace	Centered around the Angel of the Waters statue, this classic fountain and terrace serves as the location for the ending of John Wick 2	12	2019-05-30 03:43:45.931194	2019-05-30 03:43:45.931194	https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Angel_of_the_Waters_Fountain_and_Bethesda_Terrace%2C_Central_Park%2C_NYC.jpg/1920px-Angel_of_the_Waters_Fountain_and_Bethesda_Terrace%2C_Central_Park%2C_NYC.jpg
24	Strawberry Fields	A memorial to John Lennon, the entrance to this field at 72nd Street sits right by where the Beatle was murdered outside of his home.	12	2019-05-30 03:43:45.935174	2019-05-30 03:43:45.935174	https://upload.wikimedia.org/wikipedia/commons/thumb/2/2d/2960-Central_Park-Strawberry_Fields.JPG/1920px-2960-Central_Park-Strawberry_Fields.JPG
25	Loeb Boathouse	In addition to being a great spot to rent a boat, this boathouse sports a bar for drinking over the pond.	12	2019-05-30 03:43:45.939215	2019-05-30 03:43:45.939215	http://onthesetofnewyork.com/locations/whenharrymetsally/Whenharrymetsally109.jpg
26	Model Boat Pond	Overlooked by Kerbs Boathouse, visitors can bring or rent a model boat to cruise along a pond featured in many childrens' movies. It's also open for ice skating in the winter.	9	2019-05-30 03:43:46.022474	2019-05-30 03:43:46.022474	https://live.staticflickr.com/5296/5542816184_600688df0d_b.jpg
27	Alice in Wonderland Sculpture	An 11 foot tall bronze sculpture of Alice and her friends, this sculture is actually approved for climbing by the park.	9	2019-05-30 03:43:46.026645	2019-05-30 03:43:46.026645	http://www.centralpark.com/downloads/5135/download/alice.jpe?cb=adffc2e95381fc3159eb65b17097d5f8&w=1800&h=
28	Hans Christian Andersen Monument	Central Park's Hans Christian Andersen statue was erected in 1956 to commemorate the author's 150th birthday. The large, bronze statue depicts Andersen seated upon a granite bench, reading from his book The Ugly Duckling. Sculpted by Georg John Lober, this children's statue is meant to be climbed on and is a popular attraction for kids.	9	2019-05-30 03:43:46.030506	2019-05-30 03:43:46.030506	http://www.centralpark.com/downloads/1748/download/hans-christian-anderson.jpe?cb=783665e2e86dabe11fdbe675f24e26c4&w=800&h=
29	Belvedere Castle	Functioning as a visitor center, Belvedere Castle looks out on the Great Lawn to the North and the Ramble to the South, and is named for its incredible view. It translates to 'Beautiful View' in Italian.	16	2019-05-30 03:43:46.073886	2019-05-30 03:43:46.073886	https://bikerentalcentralpark.com/central-park-bike-guide/wp-content/uploads/2017/06/Belvedere-castle-min.jpg
30	Delacorte Theater	The home of Shakespeare in New York City, this stage is operated by The Public Theater and produces two plays each summer.	16	2019-05-30 03:43:46.077586	2019-05-30 03:43:46.077586	https://imgs.6sqft.com/wp-content/uploads/2018/11/01105908/delacorte-theater-flickr.jpg
31	Swedish Cottage Marionette Theatre	An actual Swedish Cottage built in 1876 as part of Sweden's exhibit for the Centennial Exposition in Philadelphia, this was brought to Central Park where it remains a permanent theater for marionette and puppet performances	16	2019-05-30 03:43:46.081604	2019-05-30 03:43:46.081604	https://live.staticflickr.com/94/247028304_58264b15c0_b.jpg
32	King Jagiello Monument	A monument to the King of Poland and Grand Duke of Lithuania who lived from 1386-1434, the monument celebrates his victory over the Teutonic ORder in 1410 at the Battle of Grunwald, because someone has to.	16	2019-05-30 03:43:46.08534	2019-05-30 03:43:46.08534	http://michaelminn.net/newyork/parks/central-park/monuments/king-jagiello/2007-08-28_15-40-51.jpg
33	The Obelisk	Known as "Cleopatra's Needle" by New Yorkers, this is the oldest outdoor monument in New York City, the oldest man-made object in Central Park, and dates to around 1450 BCE, when it was erected along with its partner. Both stood in Alexandria since 18 CE, after which one was moved to London while the other was moved to Central Park, after being offered by the Egyptian Khedive to America in exchange for funds to monetize the country.	6	2019-05-30 03:43:46.127457	2019-05-30 03:43:46.127457	http://assets.dnainfo.com/generated/photo/2016/04/obelisk-1459878569.jpg/extralarge.jpg
34	Alexander Hamilton Monument	Donated to Central Park by Alexander Hamilton's son (he had some that didn't die -- they were cut out of the play), this was placed in 1880.	6	2019-05-30 03:43:46.130988	2019-05-30 03:43:46.130988	http://assets.centralparknyc.org/images/things-to-see-and-do/hamilton-l.jpg
35	Arthur Ross Pinetum	A four acre landscape that is host to 17 different species of pine trees.	6	2019-05-30 03:43:46.134805	2019-05-30 03:43:46.134805	http://assets.centralparknyc.org/images/things-to-see-and-do/arthur-ross-pinetum-l.jpg
36	The Metropolitan Museum of Art	On the East side of Central Park right by the Obelisk is the largest museum in New York and one of the greatest museums in the world.	6	2019-05-30 03:43:46.138671	2019-05-30 03:43:46.138671	http://footage.framepool.com/shotimg/qf/705943334-metropolitan-museum-of-art-jacqueline-kennedy-onassis-reservoir-5th-avenue-visions-of-new-york-city.jpg
37	Summit Rock	West of the Great Lawn lies the highest point of natural elevation in the park. From the West side, you can even see New Jersey, should you want to.	6	2019-05-30 03:43:46.142511	2019-05-30 03:43:46.142511	http://www.centralpark.com/downloads/8305/download/summit-rock1.jpg?cb=91f112082dc29141d32bcb6a0438a3fb&w=2048
38	South Gatehouse	A small gatehouse overlooking the reservoir.	7	2019-05-30 03:43:46.188603	2019-05-30 03:43:46.188603	https://upload.wikimedia.org/wikipedia/commons/e/e2/Central_Park_Reservoir_South_Gatehouse_spring_jeh.jpg
39	Gothic Bridge	A gothic style cast iron bridge.	7	2019-05-30 03:43:46.192711	2019-05-30 03:43:46.192711	http://assets.centralparknyc.org/images/things-to-see-and-do/bridge-28-l.jpg
40	Playgrounds	The reservoir is practically flanked by playgrounds, including the Ancient Playground, Safari Playground, and Tarr-Coyne Wild West Playground	7	2019-05-30 03:43:46.196557	2019-05-30 03:43:46.196557	http://assets.centralparknyc.org/images/things-to-see-and-do/ancient-playground-l.jpg
41	John Purroy Mitchel Memorial	A monument to the youngest ever mayor in New York City who, after a failed re-election bid, enlisted in WWI to serve in the aviation corps, but fell from his plane during a training flight. This is also where the 23rd mile of the marathon is, at the peak of a fairly long incline. If you want to see New Yorkers at their most miserable, this is the place to go.	7	2019-05-30 03:43:46.20098	2019-05-30 03:43:46.20098	http://assets.centralparknyc.org/images/things-to-see-and-do/john-puroy-mitchell-l.jpg
42	Robert Bendheim Playground	A small playground if you're uncomfortable with kids just playing on the rocks.	5	2019-05-30 03:43:46.238396	2019-05-30 03:43:46.238396	http://www.centralpark.com/downloads/7734/download/DianaRoss1.jpg?cb=9275f2bc77b6559f12ed438bb40884d7&w=640
43	North Meadow Recreation Center	With a preserved outdoor facade, the interior has basketball and handball courts, as well as a community room for classes, gatherings, and recreational activities. They will loan balls, bats, frisbees, and jump ropes.	4	2019-05-30 03:43:46.267244	2019-05-30 03:43:46.267244	http://www.centralpark.com/downloads/8591/download/north-meadow-recreation-center.jpg?cb=3d8658d0ca84f9528be9411c0393c953&w=640
44	North Meadow Butterfly Gardens	These four butterfly gardens are run by volunteers to support butterfly populations.	4	2019-05-30 03:43:46.27129	2019-05-30 03:43:46.27129	https://s3.amazonaws.com/assets.centralparknyc.org/images/blog/blooms-2.jpg
45	Springbanks Arch	Connecting the North Meadow to the Loch, this stone span also has a cascade that used to be known as Sabrina's Pool.	4	2019-05-30 03:43:46.2751	2019-05-30 03:43:46.2751	http://michaelminn.net/newyork/parks/central-park/bridges/springbanks-arch/2007-08-02_18-51-49.jpg
46	Peter J. Sharp Children's Glade	Designed specifically as a glade for children to explore nature and play, the segment features stone and tree trunk seating and fun paths.	2	2019-05-30 03:43:46.313186	2019-05-30 03:43:46.313186	http://c3314642.r42.cf0.rackcdn.com/00050798-still1.jpg
47	Glen Span Arch	Glen Span is one of two rustic arches that form the boundaries of the Ravine, the stream valley of the North Woods. Glen Span arches over the stream, called the Loch, at its south end, with Huddlestone Arch at its north end. Both stone structures are sunken into the Park's landscape.	2	2019-05-30 03:43:46.316841	2019-05-30 03:43:46.316841	http://assets.centralparknyc.org/images/things-to-see-and-do/glenspan-arch-l.jpg
48	Loch	This winding, partially natural watercourse runs through the Ravine, and is dammed to create three waterfalls, which are perfect for stumbling upon after a long hike.	3	2019-05-30 03:43:46.370074	2019-05-30 03:43:46.370074	http://assets.centralparknyc.org/images/things-to-see-and-do/loch-l.jpg
49	Huddlestone Arch	This arch built from huge stones and with a stream running through it is perhaps the only way to separate the North Woods from the Meer.	3	2019-05-30 03:43:46.373962	2019-05-30 03:43:46.373962	http://assets.centralparknyc.org/images/things-to-see-and-do/huddlestone-arch-l.jpg
50	Blockhouse No. 1	This small fort in Central Park, overrun with vines, is the second oldest structure in the park after Cleopatra's Needle.	3	2019-05-30 03:43:46.377731	2019-05-30 03:43:46.377731	https://upload.wikimedia.org/wikipedia/commons/1/1b/New_York_City_Blockhouse.JPG
\.


--
-- Data for Name: location_tags; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.location_tags (id, location_id, tag_id, created_at, updated_at, review, user_id) FROM stdin;
1	11	4	2019-05-30 03:43:45.529813	2019-05-30 03:43:45.529813	In addition to the turtles, there's several excellent places for catch and release.	1
2	11	5	2019-05-30 03:43:45.539331	2019-05-30 03:43:45.539331	It's just turtles all the way down.	1
3	11	6	2019-05-30 03:43:45.547959	2019-05-30 03:43:45.547959	Check out the conservatory garden!	1
4	10	9	2019-05-30 03:43:45.598259	2019-05-30 03:43:45.598259	With the Central Park Zoo here as well as rocks for climbing, this is a great place for kids.	1
5	10	7	2019-05-30 03:43:45.607748	2019-05-30 03:43:45.607748	Nobody burns down Georgia like Sherman.	1
6	10	5	2019-05-30 03:43:45.615762	2019-05-30 03:43:45.615762	Two words: Hot Duck.	1
7	1	11	2019-05-30 03:43:45.683971	2019-05-30 03:43:45.683971	This is a great part of the park to get lost in.	1
8	1	9	2019-05-30 03:43:45.69192	2019-05-30 03:43:45.69192	If you're going to the carousel, watch out. Your kid will not leave without a plastic sword.	1
9	14	3	2019-05-30 03:43:45.727614	2019-05-30 03:43:45.727614	This is the spot to go for a quieter picnic. Love being stared at by cats of prey while I hang out with my friends and quietly sip from a box of Trader Joe's Red.	1
10	14	2	2019-05-30 03:43:45.735562	2019-05-30 03:43:45.735562	Pay no attention to the cat statue. Before 9AM, this spot is Woodstock for dogs.	1
11	15	11	2019-05-30 03:43:45.77835	2019-05-30 03:43:45.77835	If they unboarded the cave in 2019, it would make a fortune on AirBNB.	1
12	15	2	2019-05-30 03:43:45.786917	2019-05-30 03:43:45.786917	My dog loves an adventure, but heads up: There are no trash cans in the Ramble. If your dog takes a dump, you're taking it with you.	1
13	8	3	2019-05-30 03:43:45.827213	2019-05-30 03:43:45.827213	Get out early if you want to get a spot under a tree in July.	1
14	8	9	2019-05-30 03:43:45.835205	2019-05-30 03:43:45.835205	The Adventure Playground feels fresh after the new renovation.	1
15	13	9	2019-05-30 03:43:45.8848	2019-05-30 03:43:45.8848	A statue to a dog in a Disney movie. This is simply the best way to a kid's heart.	1
16	13	7	2019-05-30 03:43:45.892777	2019-05-30 03:43:45.892777	The Memorial Grove is a classy and understated thing to stumble into.	1
17	13	12	2019-05-30 03:43:45.900146	2019-05-30 03:43:45.900146	Love strolling down the mall feeling like old timey 5th Avenue aristocracy.	1
18	13	10	2019-05-30 03:43:45.907803	2019-05-30 03:43:45.907803	Murdered a guy for Shakespeare in the Park tickets.	1
19	12	8	2019-05-30 03:43:45.976093	2019-05-30 03:43:45.976093	That bridge tho.	1
20	12	12	2019-05-30 03:43:45.990025	2019-05-30 03:43:45.990025	This is simply one of my favorite places to walk.	1
21	12	9	2019-05-30 03:43:45.99721	2019-05-30 03:43:45.99721	Trying to get my kid into the Beatles by bringing her to the place where John Lennon was shot.	1
22	9	9	2019-05-30 03:43:46.042492	2019-05-30 03:43:46.042492	My kid yelled 'just like Stuart Little!' while pointing at a rat that crossed us on the way to the Model Boat Pond.	1
23	9	10	2019-05-30 03:43:46.049224	2019-05-30 03:43:46.049224	Got kicked out of the Met for touching sculptures, and then I came here and it was entirely legal. Exciting!	1
24	9	8	2019-05-30 03:43:46.057055	2019-05-30 03:43:46.057055	They really don't make buildings the way they used to, do they?	1
25	16	9	2019-05-30 03:43:46.096398	2019-05-30 03:43:46.096398	Where else can you go for a permanent puppet theater in a Swedish cottage? Nowhere. That's why New York's the best friggin city in the world. God bless.	1
26	16	8	2019-05-30 03:43:46.103347	2019-05-30 03:43:46.103347	This small area has a castle, a theater, and a Swedish Cottage. It's like a zoo for buildings.	1
27	16	5	2019-05-30 03:43:46.110392	2019-05-30 03:43:46.110392	Am I turtly enough for the turtle club?	1
28	6	9	2019-05-30 03:43:46.156375	2019-05-30 03:43:46.156375	With more playgrounds than you can shake a stick at and more sticks than you can shake a playground at, your kid will have fun here.	1
29	6	10	2019-05-30 03:43:46.16358	2019-05-30 03:43:46.16358	That Obelisk! Wow! And right by the Met.	1
30	6	3	2019-05-30 03:43:46.17102	2019-05-30 03:43:46.17102	Even on the most crowded day you can always find a spot.	1
31	7	1	2019-05-30 03:43:46.213562	2019-05-30 03:43:46.213562	When I used to jog, I used to aspire to jog here. Of course, I never made it further than my street.	1
32	7	9	2019-05-30 03:43:46.220938	2019-05-30 03:43:46.220938	It's tragic that they got rid of the rope swing in the Ancient Playground in the renovation. That used to be the best, most dangerous plaground in the city.	1
33	5	3	2019-05-30 03:43:46.250734	2019-05-30 03:43:46.250734	Grill here on Memorial Day. Everyone does.	1
34	4	1	2019-05-30 03:43:46.289897	2019-05-30 03:43:46.289897	Handball! Now that's a sport you don't see much of in movies anymore.	1
35	4	12	2019-05-30 03:43:46.29711	2019-05-30 03:43:46.29711	You can see so many butterflies!	1
36	2	12	2019-05-30 03:43:46.327872	2019-05-30 03:43:46.327872	One of the prettiest areas of the park.	1
37	2	6	2019-05-30 03:43:46.334875	2019-05-30 03:43:46.334875	That weeping willow at the Pool tho	1
38	2	5	2019-05-30 03:43:46.342683	2019-05-30 03:43:46.342683	You can see a bunch of different birds, fish, amphibians, anything in the pool!	1
39	2	3	2019-05-30 03:43:46.34917	2019-05-30 03:43:46.34917	The Great Hill is the spot for picnicking on the West Side.	1
40	3	11	2019-05-30 03:43:46.390322	2019-05-30 03:43:46.390322	I saw actual hikers here with a fully packed backpack. It's legit.	1
41	3	5	2019-05-30 03:43:46.398106	2019-05-30 03:43:46.398106	The North Woods: Not just for raccoons baby.	1
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.locations (id, name, description, geom, created_at, updated_at) FROM stdin;
11	Harlem Meer	At the northeast end of the park and surrounded by the North Woods, North Meadow, and Conservatory Garden, the Harlem Meer's pastoral pond is\n an absolutely dope place to go for a lazy stroll.	0106000020E6100000010000000103000000010000000E0000005DD957A4147D52C00C42F842306644409B9CB272F47C52C0C44231772B664440D377A565BC7C52C03A31C22B066644407C4F5552B87C52C0F55890A0FB6544402D664F82BB7C52C009763BD0F565444025856AA2C17C52C0A8F1A9B6F5654440602D5913FA7C52C0A215850853654440AEE683EE207D52C0939C2CA075654440875403791D7D52C0265E5720AF654440561C5E74077D52C067F9C968CB65444017D608400B7D52C090DEFB64DF654440557D61FE247D52C07AE2D5E1D06544407B6836B1297D52C05B60FC42E56544405DD957A4147D52C00C42F84230664440	2019-05-30 03:43:44.712363	2019-05-30 03:43:45.206136
10	The Pond	The southeast corner of the park is often the most crowded with tourists, but sports a gorgeous park, some great activites, and occasionally, one really hot duck.	0106000020E6100000010000000103000000010000000F000000111B52B00A7E52C021295CC560624440A9D3EAAC437E52C03AFB2BB5D261444059F71C34AA7E52C00F5B00BB26624440C302CA289F7E52C0DFA9EC2B3B624440B76F1526867E52C0B9B2DA3132624440C117314F7B7E52C0CEC5812A4162444010A6EE30677E52C055EFFD1F81624440127AEBCD5E7E52C0F7EB2FA08D6244403F45A2AD547E52C031D0575E916244405AD5A01E497E52C04A477D8A8A6244406C1A8AC13A7E52C06774DC5782624440382D569D2A7E52C0A29D89C7746244405DB7C482197E52C01212AF536B62444048163E960D7E52C000B1311463624440111B52B00A7E52C021295CC560624440	2019-05-30 03:43:44.66219	2019-05-30 03:43:45.22318
1	Columbus Circle - Southwest Park	The Southwest corner of the park has walking paths to get lost in and parks and attractions for kids	0106000020E6100000010000000103000000010000000E0000006C10BFDEA47E52C01EA18F45E0624440987036ED617E52C0D0C979CF89624440F798B2DA837E52C09FC4920D316244401758F8FA9E7E52C02C65231E3A6244404CF6B4B6A47E52C07B5965A12F6244403D46F541A97E52C09BFB2B6528624440CD2D4F81B77E52C02A709D9D33624440DC07F5DDCE7E52C041D169914862444058F8F898D57E52C0AA468FC842624440ECBCA2BEE07E52C038B8A05C4A62444006B54F48DF7E52C0D93A623455624440960ACA12DB7E52C0D8A426B85B624440DAAF5AD0CF7E52C08E282FBF646244406C10BFDEA47E52C01EA18F45E0624440	2019-05-30 03:43:44.200489	2019-05-30 03:43:45.661264
14	Cedar Hill	A popular hillside meadow, this is a go-to in the park for quiet picnicking in the summer, and sledding in the winter. It also features a number of flowers in spring. It's named for the red cedars on its crest.	0106000020E6100000010000000103000000010000000E00000096597799DC7D52C0C54840A09D63444004513182C87D52C0194CB7D399634440F59B717EAD7D52C0CE1C02E073634440EFA5005AAF7D52C08D67DB9870634440464E52DDB67D52C0215D8D787563444023421120B97D52C02500317B7663444068D52BFAC17D52C0ABDC1C0D6C63444091F38E55C97D52C0933D6ED864634440D7B78770D17D52C0EB95A96163634440A68D0117D87D52C0B228AF3060634440286E2934E07D52C0B1CD346F5A6344401C670147E87D52C01903BCFE556344407B03CE46E87D52C05DDE55975B63444096597799DC7D52C0C54840A09D634440	2019-05-30 03:43:44.896625	2019-05-30 03:43:45.710533
15	The Ramble	Perhaps the section of the park with the most "nature" (it's entirely artificial) and easily the most notorious section of the park (frequently appearing as "the place where they found the body" in episodes of Law and Order) Central Park's Ramble has served as a gathering spot for New York's hikers, birdwatchers, and serves as an important part of NYC LGBTQ history as a place where LGBTQ people could have private encounters.	0106000020E61000000100000001030000000100000016000000A9580EE8267E52C0C6CD8550D7634440A7A8F50ADC7D52C00A3576959C634440CFB06C72E87D52C04B85B9FF55634440770B6460F77D52C06EA49FCE3363444020CFFC52FB7D52C0F2BDDBFE2F634440C1C2F700FA7D52C04BCE4F8E36634440B3F2A724FA7D52C0094D45113C6344402667AE40FC7D52C03C4354BB44634440D5E2B234FE7D52C06ACBAFED49634440C09F54C91A7E52C015C086202D634440E172A1B71E7E52C0688534FC38634440A687BFD31B7E52C0827E620B47634440154737406B7E52C04B0246D479634440727687E3407E52C0362127D1EC63444086CD3D88317E52C0F8B7A1481A64444056CC61F02D7E52C0BDC3467617644440775D9D3F2B7E52C09C3BDEF80C6444404FC18BDF2B7E52C0AADFD3B7036444409BB1B4122C7E52C05BD7AA94F9634440A88D23262D7E52C07D96644DE86344409D8464612B7E52C0F86E7FE5DE634440A9580EE8267E52C0C6CD8550D7634440	2019-05-30 03:43:44.960418	2019-05-30 03:43:45.756615
8	Sheep Meadow	Sheep Meadow was designed as a placid expanse, and, without ballfields and with organized sports and gatherings forbidden, it serves as a quiet space in the middle of Central Park.	0106000020E610000001000000010300000001000000120000005D3CA6B7A47E52C0D0DEBD6DDF6244404F749749777E52C0D1BE62EB5D634440DAA233A96E7E52C02991A769566344400242076F6E7E52C0308BDE0741634440915D04376E7E52C0BDECAD40356344400DBAACEE6A7E52C0A9AA8EFE2D634440845665785F7E52C042A5C0E42A6344405638E3FE567E52C0194D31CE26634440795B17EB577E52C0D8A1AA26236344402E175CF4497E52C0EBB3994E1063444026528392437E52C0A9DC54510A6344406435BBCC367E52C02AB96D140C63444003C6CA903C7E52C09458EA5A036344405DF5448E3C7E52C01E78AAE5FC624440994321A23B7E52C030AD4956EC624440E3E863B3557E52C0873A470B9062444039718D61607E52C0A26BF17C8A6244405D3CA6B7A47E52C0D0DEBD6DDF624440	2019-05-30 03:43:44.521281	2019-05-30 03:43:45.809144
13	The Mall	The only formalistic section of Central Park, this iconic walk leading from the Literary Walk to Bethesda Fountain was a favored place for the rich to mingle with the lower classes in an afternoon stroll at the the turn of the 20th century.	0106000020E61000000100000001030000000100000011000000E9E09B78DF7D52C004903408DF6244401A163373117E52C03702AABE6362444094692039577E52C0BC31001F8F624440B736A34C4C7E52C0B8AB3C63C46244404E5FA6FC3E7E52C062951190E4624440C5932C403C7E52C0A91627ECF6624440B405BE153E7E52C0FE263617FB624440BD63E5433C7E52C0DC50164904634440E8CAAA3B397E52C0D01997CD09634440491C98E3357E52C05092169E0B63444033940E68307E52C064D0380A0B6344406738A28E2B7E52C0AB5BB71A0A634440AAD838ED1D7E52C0914DA6A20463444036456C96097E52C05C0381A300634440FD3C0869017E52C0B0FF348AFB6244400B170180E27D52C0556A3A7EDF624440E9E09B78DF7D52C004903408DF624440	2019-05-30 03:43:44.838807	2019-05-30 03:43:45.852683
12	The Lake (South Shore)	The Southern end of Central Park's Lake hosts some of Central Park's most iconic attractions, including Strawberry Fields and the Bethesda Fountain and Terrace	0106000020E61000000100000001030000000100000013000000DA4635D06A7E52C013195B7B79634440BA24B2A2197E52C0CAFB066745634440BF8312B31D7E52C0F4C54BF73863444027808B601A7E52C0FEF000942D63444088257CEE137E52C010F6E2AD39634440DA2D746BFD7D52C0380683C54A634440AB8C63B9F97D52C08F81399435634440BCA81CD4047E52C00BA118C510634440CBC8066C037E52C0AB871D9EFB624440CC61BB27257E52C0D70FCE19066344402E43C1F6407E52C02889664005634440053F3825577E52C07D45799F1F634440217AB54F5D7E52C03BC1D94428634440C920AB71687E52C0C2A60EE22B634440F0C852046F7E52C0ED33F34635634440087A89DD6E7E52C00B54453C45634440826CAD2A707E52C0416CAC185363444061892E27767E52C0D6FD5E535C634440DA4635D06A7E52C013195B7B79634440	2019-05-30 03:43:44.793053	2019-05-30 03:43:45.92712
9	Conservatory Water	Inspired by the design of the Grand Basin model boat pond in Paris’ Luxembourg Gardens, Conservatory Water was created by Frederick Law Olmsted and Calvert Vaux as a place where children and adults alike could experience the pleasure of boating.	0106000020E61000000100000001030000000100000010000000A5158186AF7D52C042669517706344408035252BE27D52C0AA2C2A57DF6244401D809FA9E47D52C0309758B9E06244404F975D99E57D52C0FFBB4E66E162444072088A9AEF7D52C0C4242482E9624440487EB202FC7D52C013170013F262444040A6201A017E52C06EAFC712F8624440E9F7B641037E52C0983A440FFE62444037A68BE6057E52C0D5884E981063444076F8EF14E97D52C05A0CEFFA55634440E7733377D67D52C0A194F92862634440C2F6F8EECA7D52C0406594DF65634440D5E98192C57D52C07935C3D268634440B86FF55ABE7D52C0D125AF87716344401134CAAFB77D52C0ACDAFF7475634440A5158186AF7D52C04266951770634440	2019-05-30 03:43:44.58147	2019-05-30 03:43:46.018099
6	The Great Lawn	The heart of Central Park, this is home to countless baseball games, playgrounds, an Obelisk, and more.	0106000020E6100000010000000103000000010000000D000000EFD5B90F307E52C0452E75D6216444405D1898F5097E52C0D94FC2DB88644440BC42B891B67D52C01C69CC92486444408A690D027D7D52C00AF79087F16344408EC01A11AD7D52C094E3E12875634440904EB805DD7D52C0B73CD0259E634440C9310ADCCC7D52C02D7A103BB86344400D166561EA7D52C0EFC57554DA6344405A78323FF67D52C0A56C9806E5634440EA4D7B16277E52C091CBD20A066444405E82BDBC2D7E52C0C857A8F81764444021DEFF69307E52C004374D911B644440EFD5B90F307E52C0452E75D621644440	2019-05-30 03:43:44.429095	2019-05-30 03:43:46.123013
7	The Reservoir	Built to hold a billion gallons of water as a temporary water supply while the Croton Water system was shut down for repairs for two weeks, New York now goes through that supply in just four hours. It was decommissioned in 1993, made obsolete by the Third Water Tunnel. It's now a go to spot for joggers.	0106000020E61000000100000001030000000100000009000000BCEDE0D30A7E52C0A63AAD74876444401CEF4EA0B57D52C002A9371972654440797783A8227D52C09B04F18FF0644440183D5631727D52C0AD325C3818644440B7D159AB7D7D52C02BE3E33AF3634440C0DD803A8F7D52C03140A0480B644440306C4F46B17D52C0ED218D0140644440C12A41D8B67D52C0F6A52F4E48644440BCEDE0D30A7E52C0A63AAD7487644440	2019-05-30 03:43:44.476431	2019-05-30 03:43:46.183618
4	North Meadow	Centered around a series of baseball diamonds, this area also is a great place for a stroll.	0106000020E6100000010000000103000000010000000D000000DBE089CB207D52C07109DF2275654440933594124B7D52C05E07203F13654440C7B710AE997D52C07E7F02FA57654440361B21E0907D52C06F31EA1181654440CC8214097E7D52C01581E5749B654440E9B54F0D637D52C066906F56AA6544406120C7C7517D52C0F37079FE97654440E924EF40467D52C04763AFD89965444092170E4C3A7D52C0DF0147B9A0654440B2D6211C2F7D52C0AE7FA825AF65444087C4B1102A7D52C04675F024B065444069B943A61D7D52C0C10F2525AD654440DBE089CB207D52C07109DF2275654440	2019-05-30 03:43:44.33573	2019-05-30 03:43:46.262419
3	The North Woods	The closest you can come to a hike in Manhattan and built around the Ravine. While locals will go for a stroll here, it's not unusual to find people in full hiking wear.	0106000020E6100000010000000103000000010000001B00000031A9021B667D52C0C33125C5AD6544400C66BE235E7D52C03815BFB0C76544400A6791DE577D52C001545F97CC654440BAD623F23F7D52C0C78F96E1E5654440B51D404B3C7D52C00F543057EB65444047CE0CD73B7D52C02E5E63BAF76544409FF70C8C3E7D52C0750885BF06664440DC9C52DA3F7D52C01BFB2BA01D6644403B4ECD7F577D52C03EBF1E4B3366444071C55D5D587D52C0C492687741664440E371CF66507D52C0E06569485C6644409BDFB133547D52C06A9C2A987C664440CEE25A984D7D52C0EDBA1EA37A664440E2118EE6247D52C0D92B34C154664440A4EBCC040F7D52C0F8E050B941664440368373C0F47C52C0C2563B452C66444016B16A61147D52C03B9277A12E6644404D53F653287D52C0A1A61DE3E7654440FEA6E509257D52C0D533BD89D1654440C255A3650B7D52C09E54663DDF65444047428909077D52C0B958D90FCB654440916B238F1F7D52C069809193AD6544401FE103F72D7D52C04C6C15C9AF6544406636FA24347D52C006271184A7654440CA24B1A33F7D52C0A7A47C99996544409134FF70517D52C00A7D44E99765444031A9021B667D52C0C33125C5AD654440	2019-05-30 03:43:44.291643	2019-05-30 03:43:46.365626
16	Turtle Pond	A quiet area in the park including a castle and an idyllic swamp, this place gets its name for its large turtle population, released into the pond by owners in the 1980s. This area is also home to the Delacorte Theater, New York's home of Shakespeare.	0106000020E6100000010000000103000000010000000A00000055E2ED3D2B7E52C035E934F60C6444405D88D02BEB7D52C00FFC22BADE634440E5D885A9CC7D52C0710CD451B7634440B921B07BDD7D52C0EB39B1969C634440BBE8DE26EB7D52C0196667F6A4634440792E86EC037E52C0AE32C859BA63444032960E53107E52C05EC76BC1C563444079323D13237E52C06932A1CBCF63444006EDFEE92E7E52C0C8A89C0AE463444055E2ED3D2B7E52C035E934F60C644440	2019-05-30 03:43:45.010273	2019-05-30 03:43:46.069088
5	East Meadow	The best spot for picnicking in the park, this sprawling high set of hills gives everyone a place to carve out for themselves.	0106000020E61000000100000001030000000100000005000000D63273B0FD7C52C004108BDB55654440A8E29318227D52C042EF5A1AEF644440D10423D04B7D52C0B099AE0F15654440A86963B3217D52C004D7BA1E76654440D63273B0FD7C52C004108BDB55654440	2019-05-30 03:43:44.381185	2019-05-30 03:43:46.233921
2	Great Hill and the Pool	The Northwest corner of the park features a hill perfect for picnics and a segment of wetlands that is beautiful in every season.	0106000020E6100000010000000103000000010000000F0000008BAB6095637D52C09653130EAA6544403BF3D8CE997D52C036CF8AC85865444000B4CD0BB57D52C0178C56B870654440FB7B2317547D52C07F7C57EB7C66444061DC9861507D52C0423E16B95B6644406C7FEBFE587D52C07073AD143A66444078C8F10C557D52C004BB851C32664440F28225A33E7D52C03A266B901E6644401B80E8CE3D7D52C0F1A8DD5D05664440BD1635623A7D52C09A5F18CAF5654440C4A275F83C7D52C05FCCEAFAE9654440DE93A0AC467D52C0125A345FDC6544409D06B615607D52C0DC25F88AC46544407B8406C2657D52C024309CB3AD6544408BAB6095637D52C09653130EAA654440	2019-05-30 03:43:44.248199	2019-05-30 03:43:46.309068
\.


--
-- Data for Name: locimages; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.locimages (id, url, alt, location_id, created_at, updated_at) FROM stdin;
1	http://www.centralpark.com/downloads/2613/download/fishing-in-the-meer.jpe?cb=783665e2e86dabe11fdbe675f24e26c4&w=640	Fishing at the Harlem Meer	11	2019-05-30 03:43:45.315243	2019-05-30 03:43:45.315243
2	https://upload.wikimedia.org/wikipedia/commons/8/89/Dana_Discovery_Center%2C_Central_Park_NY.JPG	The Dana Discovery Center at the Harlem Meer	11	2019-05-30 03:43:45.584064	2019-05-30 03:43:45.584064
3	https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Central_Park_New_York_October_2016_panorama_1.jpg/1200px-Central_Park_New_York_October_2016_panorama_1.jpg	view of water at meer	11	2019-05-30 03:43:45.590049	2019-05-30 03:43:45.590049
4	http://assets.centralparknyc.org/images/things-to-see-and-do/pond-l.jpg	pond with view of Gapstow Bridge	10	2019-05-30 03:43:45.627513	2019-05-30 03:43:45.627513
5	https://static01.nyt.com/images/2018/11/02/business/01XP-DUCK/31XP-DUCK-videoSixteenByNine3000.jpg	Central Park's legendary Hot Duck	10	2019-05-30 03:43:45.63212	2019-05-30 03:43:45.63212
6	http://assets.centralparknyc.org/images/things-to-see-and-do/greyshot-arch-l.jpg	Greyshot Arch	1	2019-05-30 03:43:45.700626	2019-05-30 03:43:45.700626
7	http://www.starrwhitehouse.com/wp-content/uploads/2018/04/DSC02953-1.jpg	Summit Rock	1	2019-05-30 03:43:45.705046	2019-05-30 03:43:45.705046
8	https://live.staticflickr.com/90/247029617_5d50aae013_b.jpg	Cedar Hill with sign.	14	2019-05-30 03:43:45.744429	2019-05-30 03:43:45.744429
9	https://imgs.6sqft.com/wp-content/uploads/2015/12/20035528/Central-Park-Cedar-Hill-today-1024x711.jpg	Cedar Hill in the fall.	14	2019-05-30 03:43:45.747394	2019-05-30 03:43:45.747394
10	http://www.centralpark.com/downloads/6013/download/Cedar_Hill.jpg.jpe?cb=783665e2e86dabe11fdbe675f24e26c4&w=640	Cedar Hill sledding in winter.	14	2019-05-30 03:43:45.751576	2019-05-30 03:43:45.751576
11	https://i1.wp.com/travellingboomer.com/wp-content/uploads/Central-Park-The-Ramble-sign-1.jpg	A sign at the entrance to the Ramble.	15	2019-05-30 03:43:45.796252	2019-05-30 03:43:45.796252
12	http://www.aviewoncities.com/img/nyc/kveus11259s.jpg	A bridge in the Ramble.	15	2019-05-30 03:43:45.800172	2019-05-30 03:43:45.800172
13	http://www.centralparksunsettours.com/wp-content/uploads/2016/06/IMG_20160624_141258.jpg	A tree protrudes in front of a rough path in the Ramble.	15	2019-05-30 03:43:45.804214	2019-05-30 03:43:45.804214
14	https://www.walksofnewyork.com/blog/wp-content/uploads/2012/04/Sheep-Meadow.jpg	Sheep Meadow in the summer.	8	2019-05-30 03:43:45.844165	2019-05-30 03:43:45.844165
15	https://outbuzz.com/wp-content/uploads/2017/08/second-sundays-central-park.jpg	Crowded summer Sheep Meadow.	8	2019-05-30 03:43:45.848241	2019-05-30 03:43:45.848241
16	https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/The_Mall,_Central_Park,_June_2000.JPG/800px-The_Mall,_Central_Park,_June_2000.JPG	The Mall in early fall.	13	2019-05-30 03:43:45.9194	2019-05-30 03:43:45.9194
17	http://assets.centralparknyc.org/images/things-to-see-and-do/shakespeare-l.jpg	Shakespeare's statue in the Literary Walk	13	2019-05-30 03:43:45.923429	2019-05-30 03:43:45.923429
18	https://thenypost.files.wordpress.com/2015/08/boathouse-e1524795555719.jpg?quality=90&strip=all&w=618&h=410&crop=1	The Loeb Boathouse	12	2019-05-30 03:43:46.001358	2019-05-30 03:43:46.001358
19	https://ephemeralnewyork.files.wordpress.com/2009/05/bethesdafountain.jpg	Bethesda Fountain	12	2019-05-30 03:43:46.005849	2019-05-30 03:43:46.005849
20	http://www.centralpark.com/downloads/3396/download/strawberry-fields.jpe?cb=19e288a218f8d4023ee173a221087d2d&w=640	Strawberry Fields	12	2019-05-30 03:43:46.009799	2019-05-30 03:43:46.009799
21	https://www.straitstimes.com/sites/default/files/styles/article_pictrure_780x520_/public/articles/2015/10/10/lennon10.jpg?itok=htCiB-Ov&timestamp=1444421248	Imagine mosaic on Lennon's 75th birthday.	12	2019-05-30 03:43:46.013284	2019-05-30 03:43:46.013284
22	http://www.centralpark.com/downloads/1995/download/conservatory-water.jpe?cb=1c0c259b0b32ab1de90a5a84c9ac0c69&w=1200	Boat pond with view of skyline	9	2019-05-30 03:43:46.061314	2019-05-30 03:43:46.061314
23	http://assets.centralparknyc.org/images/things-to-see-and-do/kerbs-l.jpg	Kerbs Boathouse	9	2019-05-30 03:43:46.064985	2019-05-30 03:43:46.064985
24	http://www.centralpark.com/downloads/2713/download/turtle-pond.jpe?cb=6438982d0020a2297541b1f816d86c27&w=640	A picture overlooking turtle pond.	16	2019-05-30 03:43:46.114434	2019-05-30 03:43:46.114434
25	https://live.staticflickr.com/7367/26752795904_c6d4d178c3_b.jpg	The pond from Belvedere Castle.	16	2019-05-30 03:43:46.118273	2019-05-30 03:43:46.118273
26	http://www.centralpark.com/downloads/5274/download/great-city-great-lawn.jpe?cb=783665e2e86dabe11fdbe675f24e26c4&w=4032	The lawn with the city in the background.	6	2019-05-30 03:43:46.175203	2019-05-30 03:43:46.175203
27	https://d1smv7h0armdzg.cloudfront.net/wp-content/uploads/2014/07/great-lawn-l.jpg	Crowded day at the Great Lawn as seen overlooking from Turtle Pond.	6	2019-05-30 03:43:46.179047	2019-05-30 03:43:46.179047
28	http://assets.centralparknyc.org/images/things-to-see-and-do/reservoir.jpg	Reservoir with Ghostbusters building in background.	7	2019-05-30 03:43:46.225533	2019-05-30 03:43:46.225533
29	http://footage.framepool.com/shotimg/qf/691818177-jacqueline-kennedy-onassis-reservoir-central-park-manhattan-megacity.jpg	Reservoir as seen from the sky.	7	2019-05-30 03:43:46.229252	2019-05-30 03:43:46.229252
30	https://imgs.6sqft.com/wp-content/uploads/2015/12/20035547/Central-Park-East-Meadow-today-1024x679.jpg	East Meadow from above	5	2019-05-30 03:43:46.254774	2019-05-30 03:43:46.254774
31	http://michaelminn.net/newyork/parks/central-park/east-meadow/2007-08-28_15-58-37.jpg	East Meadow with one sunbather.	5	2019-05-30 03:43:46.258178	2019-05-30 03:43:46.258178
32	http://www.kermitproject.org/newdeal/centralpark/northmeadow6.jpg	North Meadow baseball field.	4	2019-05-30 03:43:46.301521	2019-05-30 03:43:46.301521
33	http://assets.centralparknyc.org/images/things-to-see-and-do/North-Meadow-landscape.jpg	Natural rock in the back of a North Meadow field, shaded by a tree.	4	2019-05-30 03:43:46.305756	2019-05-30 03:43:46.305756
34	http://assets.centralparknyc.org/images/things-to-see-and-do/great-hill-l.jpg	Bird's eye view of the pool.	2	2019-05-30 03:43:46.353623	2019-05-30 03:43:46.353623
35	http://www.centralpark.com/downloads/4803/download/the-pool.jpe?cb=783665e2e86dabe11fdbe675f24e26c4&w=1200	The pool, with a weeping willow.	2	2019-05-30 03:43:46.357677	2019-05-30 03:43:46.357677
36	http://assets.centralparknyc.org/images/things-to-see-and-do/pool-l.jpg	rushing water at the pool	2	2019-05-30 03:43:46.361478	2019-05-30 03:43:46.361478
37	https://walksofnewyork.com/blog/wp-content/uploads/2014/05/Ravine-600x381.jpg	One of the Loch's waterfalls.	3	2019-05-30 03:43:46.402239	2019-05-30 03:43:46.402239
38	https://tclf.org/sites/default/files/thumbnails/image/7678127744_dc00a81dcd_o.jpg	Huddlestone Arch as seen from the South.	3	2019-05-30 03:43:46.406008	2019-05-30 03:43:46.406008
39	https://www.twotravelingtexans.com/wp-content/uploads/2016/03/IMG_3039.jpg	The woods in fall.	3	2019-05-30 03:43:46.409655	2019-05-30 03:43:46.409655
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.schema_migrations (version) FROM stdin;
20190523153332
20190515192720
20190516195652
20190515192049
20190515155342
20190514222931
20190515194208
20190515190204
20190515191756
20190515155431
20190517150303
20190520191738
20190515192329
20190515190420
20190521162219
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.tags (id, tag, created_at, updated_at, interest_id) FROM stdin;
1	exercise	2019-05-30 03:43:45.448895	2019-05-30 03:43:45.448895	11
2	dogs	2019-05-30 03:43:45.454016	2019-05-30 03:43:45.454016	12
3	picnics	2019-05-30 03:43:45.458446	2019-05-30 03:43:45.458446	10
4	fishing	2019-05-30 03:43:45.463024	2019-05-30 03:43:45.463024	1
5	wildlife	2019-05-30 03:43:45.467004	2019-05-30 03:43:45.467004	2
6	flora	2019-05-30 03:43:45.47143	2019-05-30 03:43:45.47143	3
7	history	2019-05-30 03:43:45.476447	2019-05-30 03:43:45.476447	4
8	architecture	2019-05-30 03:43:45.480862	2019-05-30 03:43:45.480862	6
9	kids	2019-05-30 03:43:45.485176	2019-05-30 03:43:45.485176	7
10	art	2019-05-30 03:43:45.490252	2019-05-30 03:43:45.490252	5
11	hiking	2019-05-30 03:43:45.494476	2019-05-30 03:43:45.494476	8
12	strolling	2019-05-30 03:43:45.499271	2019-05-30 03:43:45.499271	9
\.


--
-- Data for Name: userinterests; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.userinterests (id, user_id, interest_id, created_at, updated_at) FROM stdin;
1	2	4	2019-05-30 04:00:40.421836	2019-05-30 04:00:40.421836
2	2	5	2019-05-30 04:00:40.433729	2019-05-30 04:00:40.433729
3	2	6	2019-05-30 04:00:40.440331	2019-05-30 04:00:40.440331
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: flatironschool
--

COPY public.users (id, username, password_digest, created_at, updated_at) FROM stdin;
1	The Cheese	$2a$10$OUiafbIelMjbjTxM4gjDz.DR4Y4GfuHY8WF0natvKvoHEPvGgH/zq	2019-05-30 03:43:45.172531	2019-05-30 03:43:45.172531
2	Nicky	$2a$10$Gm4nCY9v1AXEld71ic2I5O6xjSwD4oEtXpoEnkO/HFflqlb6fFzZu	2019-05-30 04:00:30.450528	2019-05-30 04:00:30.450528
\.


--
-- Name: facts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.facts_id_seq', 20, true);


--
-- Name: interests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.interests_id_seq', 12, true);


--
-- Name: landmarks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.landmarks_id_seq', 50, true);


--
-- Name: location_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.location_tags_id_seq', 41, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.locations_id_seq', 16, true);


--
-- Name: locimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.locimages_id_seq', 39, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.tags_id_seq', 12, true);


--
-- Name: userinterests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.userinterests_id_seq', 3, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: flatironschool
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: facts facts_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.facts
    ADD CONSTRAINT facts_pkey PRIMARY KEY (id);


--
-- Name: interests interests_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.interests
    ADD CONSTRAINT interests_pkey PRIMARY KEY (id);


--
-- Name: landmarks landmarks_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.landmarks
    ADD CONSTRAINT landmarks_pkey PRIMARY KEY (id);


--
-- Name: location_tags location_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.location_tags
    ADD CONSTRAINT location_tags_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: locimages locimages_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.locimages
    ADD CONSTRAINT locimages_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: userinterests userinterests_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.userinterests
    ADD CONSTRAINT userinterests_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_facts_on_location_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_facts_on_location_id ON public.facts USING btree (location_id);


--
-- Name: index_landmarks_on_location_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_landmarks_on_location_id ON public.landmarks USING btree (location_id);


--
-- Name: index_location_tags_on_location_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_location_tags_on_location_id ON public.location_tags USING btree (location_id);


--
-- Name: index_location_tags_on_tag_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_location_tags_on_tag_id ON public.location_tags USING btree (tag_id);


--
-- Name: index_location_tags_on_user_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_location_tags_on_user_id ON public.location_tags USING btree (user_id);


--
-- Name: index_locimages_on_location_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_locimages_on_location_id ON public.locimages USING btree (location_id);


--
-- Name: index_tags_on_interest_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_tags_on_interest_id ON public.tags USING btree (interest_id);


--
-- Name: index_userinterests_on_interest_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_userinterests_on_interest_id ON public.userinterests USING btree (interest_id);


--
-- Name: index_userinterests_on_user_id; Type: INDEX; Schema: public; Owner: flatironschool
--

CREATE INDEX index_userinterests_on_user_id ON public.userinterests USING btree (user_id);


--
-- Name: landmarks fk_rails_0f228be7cd; Type: FK CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.landmarks
    ADD CONSTRAINT fk_rails_0f228be7cd FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: facts fk_rails_245d62b600; Type: FK CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.facts
    ADD CONSTRAINT fk_rails_245d62b600 FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: userinterests fk_rails_69dac8f622; Type: FK CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.userinterests
    ADD CONSTRAINT fk_rails_69dac8f622 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: location_tags fk_rails_8ef841d771; Type: FK CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.location_tags
    ADD CONSTRAINT fk_rails_8ef841d771 FOREIGN KEY (tag_id) REFERENCES public.tags(id);


--
-- Name: locimages fk_rails_aed0ac889a; Type: FK CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.locimages
    ADD CONSTRAINT fk_rails_aed0ac889a FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: userinterests fk_rails_b2e82d14e8; Type: FK CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.userinterests
    ADD CONSTRAINT fk_rails_b2e82d14e8 FOREIGN KEY (interest_id) REFERENCES public.interests(id);


--
-- Name: location_tags fk_rails_fd361f5dbc; Type: FK CONSTRAINT; Schema: public; Owner: flatironschool
--

ALTER TABLE ONLY public.location_tags
    ADD CONSTRAINT fk_rails_fd361f5dbc FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- PostgreSQL database dump complete
--

