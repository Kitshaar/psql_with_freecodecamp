--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(40) NOT NULL,
    size_in_km_square numeric
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(40),
    size_in_km_square numeric(36,2),
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    size_in_km numeric(12,2),
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40),
    population integer,
    continents integer,
    size_in_km numeric(12,2),
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40),
    size_in_km_square numeric(36,2),
    description text NOT NULL,
    is_spherical boolean NOT NULL,
    has_life boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'First', 84783.84);
INSERT INTO public.black_hole VALUES (2, 'Second', 83787628689);
INSERT INTO public.black_hole VALUES (3, 'Third', 782929483);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 567943456.54, 'This is our home galaxy.', false, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 534543456.54, 'This is our neibhor galaxy.', false, true);
INSERT INTO public.galaxy VALUES (3, 'Antennea', 8739278343.54, 'It is a galaxy.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Backward', 783792784987.32, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', false, true);
INSERT INTO public.galaxy VALUES (5, 'Cigar', 6748836.24, 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Butterfly', 792675456.54, 'This is another home galaxy.', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'First', 5000.00, 'first', true, false, 1);
INSERT INTO public.moon VALUES (2, 'Second', 5500.00, 'second', true, false, 10);
INSERT INTO public.moon VALUES (3, 'Third', 4500.00, 'third', true, false, 10);
INSERT INTO public.moon VALUES (4, 'Fourth', 9500.00, 'fourth', true, false, 10);
INSERT INTO public.moon VALUES (5, 'Fifth', 9000.00, 'fifth', true, false, 11);
INSERT INTO public.moon VALUES (6, 'Sixth', 8000.00, 'sixth', true, false, 11);
INSERT INTO public.moon VALUES (7, 'Seventh', 8600.00, 'seventh', true, false, 12);
INSERT INTO public.moon VALUES (8, 'Eight', 5600.00, 'eigth', true, false, 12);
INSERT INTO public.moon VALUES (9, 'Nine', 4600.00, 'nine', true, false, 12);
INSERT INTO public.moon VALUES (10, 'Ten', 870.00, 'ten', true, false, 12);
INSERT INTO public.moon VALUES (11, 'Eleventh', 8700.00, 'eleventh', true, false, 12);
INSERT INTO public.moon VALUES (12, 'Twelve', 7900.00, 'twelve', true, false, 12);
INSERT INTO public.moon VALUES (13, 'Thirteen', 7983.00, 'thirteen', true, false, 2);
INSERT INTO public.moon VALUES (14, 'Fourteen', 9483.00, 'fourteen', true, false, 3);
INSERT INTO public.moon VALUES (15, 'Fifteen', 4483.00, 'fifteen', true, false, 4);
INSERT INTO public.moon VALUES (16, 'Sixteen', 8833.00, 'sixteen', true, false, 5);
INSERT INTO public.moon VALUES (17, 'Seventeen', 8843.00, 'seventeen', true, false, 6);
INSERT INTO public.moon VALUES (18, 'Eighteen', 8843.00, 'eighteen', true, false, 7);
INSERT INTO public.moon VALUES (19, 'Nineteen', 8843.00, 'nineteen', true, false, 8);
INSERT INTO public.moon VALUES (20, 'Twenty', 8843.00, 'twenty', true, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 78468593, 5, 7600.43, 'This is our home planet.', true, true, 1);
INSERT INTO public.planet VALUES (10, 'Venus', NULL, 1, 1200.00, 'Second planet in the solar systum.', true, false, 1);
INSERT INTO public.planet VALUES (11, 'Mercury', NULL, 1, 2500.00, 'First planet in solar systum.', true, false, 1);
INSERT INTO public.planet VALUES (12, 'Mars', NULL, 3, 18600.00, 'Fifth planet in solar systum.', true, false, 1);
INSERT INTO public.planet VALUES (2, 'Terravale', 8758593, 5, 12000.00, 'Terravale is a lush, Earth-like world known for its stunning forests, diverse wildlife, and vibrant cities.', true, true, 2);
INSERT INTO public.planet VALUES (3, 'Aquaterra', 3075200, 7, 14500.00, 'Aquaterra is a water-dominated planet with vast oceans and floating cities, home to an aquatic civilization.', true, true, 3);
INSERT INTO public.planet VALUES (4, 'Volcanis', 798932987, 4, 9200.00, ' Volcanis is a fiery world of constant volcanic activity, where hardy settlers harness geothermal energy.', true, true, 4);
INSERT INTO public.planet VALUES (5, 'Zephyria', 67837829, 9, 10800.00, 'ephyria is a planet with endless windy plains and wind-powered cities, known for its airship industry.', true, true, 4);
INSERT INTO public.planet VALUES (6, 'Verdantia', 5678593, 1, 1200.00, 'Verdantia is a densely populated planet with vast urban jungles and advanced technology.', true, true, 5);
INSERT INTO public.planet VALUES (7, 'Cryoheim', 68787200, 4, 15700.00, 'Cryoheim is an icy tundra world with small, hardy communities struggling to survive the extreme cold.', true, true, 5);
INSERT INTO public.planet VALUES (8, 'Luxoria', 7982987, 8, 27500.00, 'Luxoria is a world of perpetual daylight, featuring magnificent crystalline cities and advanced energy technologies.', true, true, 6);
INSERT INTO public.planet VALUES (9, 'Novasphere', 83790829, 3, 186500.00, 'Novasphere is a planet with interconnected floating islands, linked by advanced skybridges.', true, true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 79267.54, 'This is our home star.', true, false, 1);
INSERT INTO public.star VALUES (2, 'Lynx', 7694567.54, 'This is a star.', true, false, 1);
INSERT INTO public.star VALUES (3, 'Leo', 97882.54, 'This is an another star.', true, false, 1);
INSERT INTO public.star VALUES (4, 'Orion', 76382.54, 'This is also a star.', true, false, 1);
INSERT INTO public.star VALUES (5, 'Lyra;', 873262.00, 'This is the famous star.', true, false, 1);
INSERT INTO public.star VALUES (6, 'Pegasus', 873262.00, 'This is the last star on the table.', true, false, 1);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: black_hole black_hole_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_id UNIQUE (black_hole_id);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_population_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_population_key UNIQUE (population);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

