--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50) NOT NULL,
    width integer NOT NULL,
    mass integer,
    age numeric(10,2),
    notes text,
    metal boolean NOT NULL,
    hazard boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_count integer NOT NULL,
    size integer,
    age numeric(10,2),
    notes text,
    has_life boolean NOT NULL,
    visible boolean
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    size integer NOT NULL,
    orbit integer,
    age numeric(10,2),
    notes text,
    rocky boolean NOT NULL,
    visible boolean
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    diameter integer NOT NULL,
    distance integer,
    age numeric(10,2),
    notes text,
    has_life boolean NOT NULL,
    orbits boolean
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
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    temp integer NOT NULL,
    mass integer,
    age numeric(10,2),
    notes text,
    active boolean NOT NULL,
    visible boolean
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 946, 1, 4600.00, 'Dwarf', true, false);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 2, 4600.00, 'Large', true, true);
INSERT INTO public.asteroid VALUES (3, 'Juno', 233, 2, 4600.00, 'Medium', true, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky', 200, 1, 13600.00, 'Home', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 150, 2, 10000.00, 'Near', false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangle', 100, 3, 12000.00, 'Far', false, false);
INSERT INTO public.galaxy VALUES (4, 'Centarius', 120, 4, 13000.00, 'Active', false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 110, 5, 13000.00, 'Ring', false, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 130, 6, 12000.00, 'Spiral', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1, 3474, 27, 4500.00, 'Earth', true, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 3, 22, 0, 4500.00, 'Mars1', true, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 3, 12, 1, 4500.00, 'Mars2', false, false);
INSERT INTO public.moon VALUES (4, 'Io', 4, 3643, 2, 4600.00, 'Jup1', true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 4, 3122, 4, 4600.00, 'Jup2', true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, 5268, 7, 4600.00, 'Jup3', true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, 4821, 17, 4600.00, 'Jup4', false, true);
INSERT INTO public.moon VALUES (8, 'Titan', 5, 5150, 16, 4600.00, 'Sat1', true, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, 504, 1, 4600.00, 'Sat2', true, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, 396, 1, 4600.00, 'Sat3', false, false);
INSERT INTO public.moon VALUES (11, 'Rhea', 5, 1527, 5, 4600.00, 'Sat4', true, true);
INSERT INTO public.moon VALUES (12, 'Iapetus', 5, 1469, 79, 4600.00, 'Sat5', true, true);
INSERT INTO public.moon VALUES (13, 'Miranda', 6, 471, 1, 4600.00, 'Mer1', true, false);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 1158, 2, 300.00, 'S-A1', true, true);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 1169, 4, 300.00, 'S-A2', true, false);
INSERT INTO public.moon VALUES (16, 'Titania', 8, 1578, 9, 300.00, 'S-B1', true, true);
INSERT INTO public.moon VALUES (17, 'Oberon', 8, 1524, 14, 300.00, 'S-B2', false, true);
INSERT INTO public.moon VALUES (18, 'Puck', 9, 407, 0, 300.00, 'S-C1', true, false);
INSERT INTO public.moon VALUES (19, 'Cordelia', 10, 40, 0, 9.00, 'B-1', false, false);
INSERT INTO public.moon VALUES (20, 'Ophelia', 11, 42, 0, 9.00, 'B-2', false, false);
INSERT INTO public.moon VALUES (21, 'Bianca', 12, 51, 0, 4600.00, 'P-1A', true, true);
INSERT INTO public.moon VALUES (22, 'Desdemona', 12, 54, 1, 4600.00, 'P-1B', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, 0, 4600.00, 'Home', true, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, 42, 4600.00, 'Hot', false, true);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 6779, 78, 4600.00, 'Red', false, true);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, 139820, 628, 4600.00, 'Giant', false, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, 116460, 1275, 4600.00, 'Rings', false, true);
INSERT INTO public.planet VALUES (6, 'Mercury', 1, 4879, 77, 4600.00, 'Small', false, true);
INSERT INTO public.planet VALUES (7, 'S-1', 2, 9000, 86, 300.00, 'Hyp', false, true);
INSERT INTO public.planet VALUES (8, 'S-2', 2, 95000, 150, 300.00, 'Hyp', false, true);
INSERT INTO public.planet VALUES (9, 'S-3', 2, 8500, 200, 300.00, 'Hyp', true, true);
INSERT INTO public.planet VALUES (10, 'B-1', 3, 7000, 643, 9.00, 'Near', false, true);
INSERT INTO public.planet VALUES (11, 'B-2', 3, 100000, 1000, 9.00, 'Far', false, true);
INSERT INTO public.planet VALUES (12, 'P-1', 4, 8000, 40, 4600.00, 'Prox', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 5500, 1, 4600.00, 'Sun', true, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 9600, 2, 300.00, 'Bright', true, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 3500, 20, 9.00, 'Red', false, true);
INSERT INTO public.star VALUES (4, 'Proxima', 1, 3042, 0, 4600.00, 'Near', false, true);
INSERT INTO public.star VALUES (5, 'Vega', 2, 9602, 3, 400.00, 'Blue', true, true);
INSERT INTO public.star VALUES (6, 'Rigel', 2, 11000, 17, 9.00, 'Super', false, true);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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

