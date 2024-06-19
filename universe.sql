--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(255) NOT NULL,
    mass numeric,
    composition text NOT NULL,
    discovered boolean NOT NULL,
    size integer NOT NULL,
    orbit_period integer
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
    name character varying(255) NOT NULL,
    description text,
    number_of_stars integer NOT NULL,
    average_star_mass numeric,
    habitable boolean NOT NULL,
    age integer NOT NULL,
    distance_from_earth integer
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
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    mass numeric,
    radius numeric,
    has_atmosphere boolean NOT NULL,
    orbital_period integer NOT NULL,
    distance_from_planet integer
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
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    mass numeric,
    radius numeric,
    has_moons boolean NOT NULL,
    orbital_period integer NOT NULL,
    number_of_moons integer
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
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    type character varying(50) NOT NULL,
    mass numeric,
    has_planets boolean NOT NULL,
    age integer NOT NULL,
    luminosity integer
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

INSERT INTO public.asteroid VALUES (1, 'Ceres', 9.39, 'Rock, ice', true, 945, 1680);
INSERT INTO public.asteroid VALUES (2, 'Pallas', 2.14, 'Rock', true, 512, 1680);
INSERT INTO public.asteroid VALUES (3, 'Vesta', 2.59, 'Rock', true, 525, 1325);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 1000000000, 1.0, true, 13700, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large galaxy', 1000000000, 1.5, true, 10000, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest in Local Group', 40000000, 1.2, false, 12000, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Famous spiral galaxy', 300000000, 1.4, true, 8000, 23000000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Unusual shape with large bulge', 100000000, 2.0, false, 12000, 29000000);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Large elliptical galaxy', 1200000000, 2.5, true, 14000, 53000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 0.0123, 1737, false, 27, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 0.000000001, 11, false, 0, 9376);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 0.0000000001, 6, false, 1, 23460);
INSERT INTO public.moon VALUES (4, 'Ganymede', 3, 0.025, 2634, true, 7, 1070400);
INSERT INTO public.moon VALUES (5, 'Titan', 3, 0.0225, 2575, true, 16, 1221870);
INSERT INTO public.moon VALUES (6, 'Europa', 3, 0.008, 1560, true, 4, 670900);
INSERT INTO public.moon VALUES (7, 'Io', 3, 0.015, 1821, false, 2, 421700);
INSERT INTO public.moon VALUES (8, 'Callisto', 3, 0.018, 2410, false, 17, 1882700);
INSERT INTO public.moon VALUES (9, 'Triton', 5, 0.003, 1353, true, 6, 354759);
INSERT INTO public.moon VALUES (10, 'Nereid', 5, 0.0001, 170, false, 360, 5513818);
INSERT INTO public.moon VALUES (11, 'Oberon', 6, 0.0003, 761, false, 14, 582600);
INSERT INTO public.moon VALUES (12, 'Titania', 6, 0.0004, 789, false, 9, 435900);
INSERT INTO public.moon VALUES (13, 'Rhea', 7, 0.0005, 764, false, 5, 527040);
INSERT INTO public.moon VALUES (14, 'Iapetus', 7, 0.0003, 734, false, 79, 3560820);
INSERT INTO public.moon VALUES (15, 'Dione', 7, 0.0004, 561, false, 3, 377400);
INSERT INTO public.moon VALUES (16, 'Tethys', 7, 0.0003, 529, false, 2, 294619);
INSERT INTO public.moon VALUES (17, 'Enceladus', 7, 0.0002, 252, true, 1, 237948);
INSERT INTO public.moon VALUES (18, 'Mimas', 7, 0.00001, 198, false, 1, 185539);
INSERT INTO public.moon VALUES (19, 'Charon', 8, 0.0003, 606, true, 6, 19591);
INSERT INTO public.moon VALUES (20, 'Nix', 8, 0.00001, 70, false, 25, 48694);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1.0, 6371, true, 365, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 0.107, 3390, true, 687, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 0.815, 6052, false, 225, 0);
INSERT INTO public.planet VALUES (4, 'Mercury', 1, 0.055, 2439, false, 88, 0);
INSERT INTO public.planet VALUES (5, 'Proxima b', 2, 1.3, 6371, false, 11, 0);
INSERT INTO public.planet VALUES (6, 'Alpha Centauri Bb', 5, 0.5, 5000, false, 3, 0);
INSERT INTO public.planet VALUES (7, 'Sirius b', 3, 0.9, 4500, false, 50, 0);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bc', 6, 0.8, 6000, true, 36, 2);
INSERT INTO public.planet VALUES (9, 'Betelgeuse b', 4, 1.5, 7000, true, 365, 1);
INSERT INTO public.planet VALUES (10, 'Betelgeuse c', 4, 2.5, 8000, true, 690, 2);
INSERT INTO public.planet VALUES (11, 'Betelgeuse d', 4, 1.8, 7500, true, 850, 3);
INSERT INTO public.planet VALUES (12, 'Proxima c', 2, 0.6, 5000, false, 28, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type', 1.0, true, 4600, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'M-type', 0.12, true, 4500, 0);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type', 2.0, false, 300, 25);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M-type', 20.0, false, 8500, 120000);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 2, 'G-type', 1.1, true, 4500, 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri B', 2, 'K-type', 0.9, true, 4500, 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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

