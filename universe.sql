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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    age_in_days integer,
    gravity numeric,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    age_in_days integer,
    gravity numeric,
    description text,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    age_in_days integer,
    gravity numeric,
    description text,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL,
    age_in_days integer,
    gravity numeric,
    description text,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: station; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.station (
    station_id integer NOT NULL,
    name character varying(50) NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.station OWNER TO freecodecamp;

--
-- Name: station_station_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.station_station_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.station_station_id_seq OWNER TO freecodecamp;

--
-- Name: station_station_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.station_station_id_seq OWNED BY public.station.station_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: station station_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station ALTER COLUMN station_id SET DEFAULT nextval('public.station_station_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', true, 10000, 1.2, 'The nearest spiral galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', true, 13000, 1.0, 'The galaxy that contains our solar system.');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', false, 8000, 0.9, 'A spiral galaxy in the constellation Virgo.');
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', true, 9000, 1.1, 'A classic spiral galaxy located in the constellation Canes Venatici.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', true, 8500, 1.3, 'A spiral galaxy located near the Andromeda Galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', false, 7000, 1.0, 'A face-on spiral galaxy in the constellation Ursa Major.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', true, 4500, 0.165, 'Earths only natural satellite.', 3);
INSERT INTO public.moon VALUES (2, 'Phobos', false, 700, 0.003, 'A moon of Mars known for its irregular shape.', 4);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 700, 0.003, 'The second moon of Mars smaller than Phobos.', 4);
INSERT INTO public.moon VALUES (4, 'Io', false, 4000, 0.183, 'The most volcanically active body in the solar system.', 5);
INSERT INTO public.moon VALUES (5, 'Europa', false, 4000, 0.134, 'An ocean world that may harbor life beneath its icy surface.', 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', false, 4000, 0.146, 'The largest moon in the solar system.', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', false, 4000, 0.126, 'A heavily cratered moon of Jupiter.', 5);
INSERT INTO public.moon VALUES (8, 'Titan', false, 10000, 0.138, 'Saturns largest moon known for its thick atmosphere.', 6);
INSERT INTO public.moon VALUES (9, 'Rhea', false, 3000, 0.119, 'The second-largest moon of Saturn.', 6);
INSERT INTO public.moon VALUES (10, 'Iapetus', false, 4000, 0.088, 'Known for its two-tone coloration.', 6);
INSERT INTO public.moon VALUES (11, 'Triton', false, 5000, 0.078, 'Neptunes largest moon geologically active.', 8);
INSERT INTO public.moon VALUES (12, 'Nereid', false, 2500, 0.008, 'A moon of Neptune with a highly eccentric orbit.', 8);
INSERT INTO public.moon VALUES (13, 'Charon', false, 7000, 0.067, 'The largest moon of Pluto almost half its size.', 9);
INSERT INTO public.moon VALUES (14, 'Kerberos', false, 1000, 0.005, 'A small moon of Pluto.', 9);
INSERT INTO public.moon VALUES (15, 'Styx', false, 1000, 0.005, 'Another small moon of Pluto.', 9);
INSERT INTO public.moon VALUES (16, 'Ganymede II', false, 3000, 0.146, 'A fictional moon of Jupiter.', 5);
INSERT INTO public.moon VALUES (17, 'Naiad', false, 2000, 0.048, 'A small moon of Neptune.', 8);
INSERT INTO public.moon VALUES (18, 'Hydra', false, 1500, 0.003, 'A small moon of Pluto.', 9);
INSERT INTO public.moon VALUES (19, 'Phoebe', false, 3000, 0.026, 'An irregular moon of Saturn.', 6);
INSERT INTO public.moon VALUES (20, 'Oberon', false, 4000, 0.089, 'The second-largest moon of Uranus.', 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 5000, 0.38, 'The closest planet to the Sun.', 1);
INSERT INTO public.planet VALUES (2, 'Venus', false, 8000, 0.91, 'The hottest planet in the solar system.', 1);
INSERT INTO public.planet VALUES (3, 'Earth', true, 7000, 1.00, 'The only planet known to support life.', 1);
INSERT INTO public.planet VALUES (4, 'Mars', false, 4000, 0.38, 'The Red Planet, known for its surface conditions.', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 15000, 2.34, 'The largest planet in the solar system.', 3);
INSERT INTO public.planet VALUES (6, 'Saturn', false, 14000, 1.06, 'Known for its extensive ring system.', 3);
INSERT INTO public.planet VALUES (7, 'Uranus', false, 13000, 0.92, 'The ice giant with a unique tilt.', 4);
INSERT INTO public.planet VALUES (8, 'Neptune', false, 12000, 1.19, 'The farthest planet from the Sun.', 4);
INSERT INTO public.planet VALUES (9, 'Proxima b', true, 3000, 1.0, 'An exoplanet orbiting Proxima Centauri.', 2);
INSERT INTO public.planet VALUES (10, 'Alpha Centauri Bb', false, 2500, 0.9, 'An exoplanet orbiting Alpha Centauri.', 2);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', true, 3500, 1.0, 'The first Earth-size planet discovered in the habitable zone.', 5);
INSERT INTO public.planet VALUES (12, 'HD 40307g', true, 4000, 1.3, 'An exoplanet that could potentially support life.', 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', true, 5000, 1.1, 'The brightest star in the night sky.', 2);
INSERT INTO public.star VALUES (2, 'Betelgeuse', false, 12000, 0.9, 'A red supergiant star in the constellation Orion.', 1);
INSERT INTO public.star VALUES (3, 'Vega', true, 8000, 1.3, 'A bright star in the Lyra constellation.', 5);
INSERT INTO public.star VALUES (4, 'Rigel', false, 9000, 1.2, 'A blue supergiant star in the constellation Orion.', 4);
INSERT INTO public.star VALUES (5, 'Procyon', true, 7000, 1.0, 'A binary star system in the constellation Canis Minor.', 3);
INSERT INTO public.star VALUES (6, 'Aldebaran', false, 11000, 0.8, 'The eye of the bull in the Taurus constellation.', 6);


--
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.station VALUES (1, 'Alpha Station', true);
INSERT INTO public.station VALUES (2, 'Beta Station', false);
INSERT INTO public.station VALUES (3, 'Gamma Station', true);
INSERT INTO public.station VALUES (4, 'Delta Station', false);
INSERT INTO public.station VALUES (5, 'Epsilon Station', true);
INSERT INTO public.station VALUES (6, 'Zeta Station', false);
INSERT INTO public.station VALUES (7, 'Eta Station', true);
INSERT INTO public.station VALUES (8, 'Theta Station', false);
INSERT INTO public.station VALUES (9, 'Iota Station', true);
INSERT INTO public.station VALUES (10, 'Kappa Station', false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: station_station_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.station_station_id_seq', 10, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (station_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: station unique_station_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT unique_station_name UNIQUE (name);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

