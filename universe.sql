--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    discovery_year integer NOT NULL,
    orbital_period_years numeric(8,1),
    size_km integer,
    composition character varying(50),
    notable_features text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    age_in_million_of_years numeric(4,1),
    description text,
    size_light_years_in_diameter integer,
    distance_million_light_years numeric(10,5)
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
    size_km integer,
    distance_from_planet_km integer,
    orbital_period_days numeric(5,1),
    composition character varying(50) NOT NULL,
    surface_features character varying(255),
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
    name character varying(50) NOT NULL,
    gravity numeric(5,2),
    atmosphere character varying(100) NOT NULL,
    temp_c integer NOT NULL,
    orbit_earth_years character varying(50),
    moons integer NOT NULL,
    rings boolean,
    habitability boolean,
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
    name character varying(50) NOT NULL,
    mass_in_solar_mass numeric(4,1),
    temp_c_m integer NOT NULL,
    composition character varying(100),
    age_billion_years numeric(4,1),
    evolutionary_state character varying(50) NOT NULL,
    distance_light_years numeric(12,5),
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley s', 1709, 76.0, 15, 'Ice, dust', 'Visible from Earth, frequent apparition.');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1995, 2533.0, 60, 'Ice, dust', 'Groatly observed, long lasting visibility');
INSERT INTO public.comet VALUES (3, 'Comet 67P', 1969, 6.5, 4, 'Ice, dust', 'Explored by Rosseta mission');
INSERT INTO public.comet VALUES (4, 'Comet McNaught', 2009, 92000.0, 15, 'Ice, dust', 'Brightest comet of the 21st centurt');
INSERT INTO public.comet VALUES (5, 'Comet ISON', 2012, 4055.0, 5, 'Ice, dust', 'Potential for dramatic outburst');
INSERT INTO public.comet VALUES (6, 'Comet Lovejoy', 2011, 11.4, 5, 'Ice, dust', 'Survived close approach to the Sun');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 13.6, 'Our home galaxy. Contains hundreds of billions of stars.', 100000, 0.00013);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 10.0, 'The nearest major galaxy to the Milky Way. Contains hundreds of billions of stars.', 220000, 2.50000);
INSERT INTO public.galaxy VALUES (3, 'NGC 4258', 'Spiral', 10.0, 'A barred spiarl galaxy with a supermassive black hole at its center.', 70000, 17.00000);
INSERT INTO public.galaxy VALUES (4, 'M 87', 'Elliptical', 13.0, 'A giant elliptical galaxy with a supermassive black hole at its center.', 15000, 53.50000);
INSERT INTO public.galaxy VALUES (5, 'IC 1101', 'Elliptical', 50.0, 'The largest galaxy in the observable universe. Contains trillions of stars.', 50000, 220.00000);
INSERT INTO public.galaxy VALUES (6, 'GN-z11', 'Irregular', 400.0, 'The most distant galaxy ever observed. Formed just 400 million years after the Big Bang', 3000, 13.40000);
INSERT INTO public.galaxy VALUES (7, 'NGC 1300', 'Spiral', 100.0, 'A barred spiral galaxy with a prominent dust lane. Contains hundreds of billions of stars.', 100000, 61.00000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474, 384400, 27.3, 'Rocky', 'Impact craters, maria', 1);
INSERT INTO public.moon VALUES (2, 'Titan', 5150, 1221870, 15.9, 'Rock and icy', 'Methane lakes, nitrogen atmosphere', 2);
INSERT INTO public.moon VALUES (3, 'Europa', 3122, 670900, 3.5, 'Icy', 'Smooth surface, subsurface ocean', 3);
INSERT INTO public.moon VALUES (4, 'Enceladus', 504, 238020, 1.4, 'Icy', 'Geysers, water vapor plumes', 2);
INSERT INTO public.moon VALUES (5, 'Zephyr', 1850, 145600, 8.2, 'Rocky', 'Mountainous terain', 4);
INSERT INTO public.moon VALUES (6, 'Helios', 2590, 480200, 11.1, 'Icy', 'Cryovolcanos', 5);
INSERT INTO public.moon VALUES (7, 'Arctica', 1350, 221800, 6.6, 'Icy', 'Polar ice caps', 37);
INSERT INTO public.moon VALUES (8, 'Elythra', 2100, 314500, 9.8, 'Rocky', 'Valleys ancient riverbeds', 42);
INSERT INTO public.moon VALUES (9, 'Aurora', 1900, 195400, 8.4, 'Icy', 'Gothermal activity, geysers', 43);
INSERT INTO public.moon VALUES (10, 'Calisto', 4820, 1882700, 16.7, 'Rocky and icy', 'Heavily created surface', 3);
INSERT INTO public.moon VALUES (11, 'Io', 3642, 421700, 1.8, 'Rocky', 'Volcanic activity, sulfur plains', 3);
INSERT INTO public.moon VALUES (12, 'Ganymade', 5268, 1070400, 7.2, 'Rocky and icy', 'Cratered terrains, grooves', 3);
INSERT INTO public.moon VALUES (13, 'Mimas', 396, 185520, 0.9, 'Rocky', 'Prominent impact crater', 2);
INSERT INTO public.moon VALUES (14, 'Rhea', 1527, 527040, 4.5, 'Rocky and icy', 'Surface fractures rings', 2);
INSERT INTO public.moon VALUES (15, 'Aetheria', 1950, 175200, 10.5, 'Icy and rocky', 'Cratered landscape', 4);
INSERT INTO public.moon VALUES (16, 'Astraea', 2250, 590400, 14.3, 'Rocky', 'Deep canyons, jagged cliffs', 5);
INSERT INTO public.moon VALUES (17, 'Cryos', 2350, 421900, 7.9, 'Icy', 'Vast frozen plains', 37);
INSERT INTO public.moon VALUES (18, 'Erythreea', 2350, 421900, 11.8, 'Rocky', 'Volcanic caderas, lava flows', 42);
INSERT INTO public.moon VALUES (19, 'Luminara', 2100, 238700, 9.6, 'Icy and rocky', 'Glowing bioluminescent caves', 43);
INSERT INTO public.moon VALUES (20, 'Dione', 1123, 377400, 2.7, 'Icy', 'Tectonic fractures, ridge systems', 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1.00, 'Nitrogen(78%), Oxygen(21%), other(1%)', 15, '365 days', 1, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Saturn', 1.07, 'Hydrogen, Helium', -178, '29.5 years', 82, true, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 2.64, 'Hydrogen, Helium', -145, '11.9 years', 79, true, false, 1);
INSERT INTO public.planet VALUES (4, 'Zephiria', 0.95, 'Methane, Hydrogen', -150, '620 days', 1, false, false, 1);
INSERT INTO public.planet VALUES (5, 'Astron', 1.55, 'Oxygen, Argon', 10, '410 days', 3, true, false, 2);
INSERT INTO public.planet VALUES (36, 'Novara', 1.10, 'Nitrogen, Oxygen', -5, '580 days', 0, false, false, 3);
INSERT INTO public.planet VALUES (37, 'Aridon', 1.25, 'Carbon Dioxide, Nitrogen', -90, '700 days', 2, false, false, 4);
INSERT INTO public.planet VALUES (38, 'Vantara', 0.75, 'Oxygen, Argon', 18, '320 days', 0, false, false, 5);
INSERT INTO public.planet VALUES (39, 'Solara', 0.90, 'Nitrogen, Oxygen', 10, '380 days', 0, false, false, 6);
INSERT INTO public.planet VALUES (40, 'Aetheris', 0.80, 'Methane, Hydrogen', -120, '500 days', 0, false, false, 7);
INSERT INTO public.planet VALUES (41, 'Lyra', 1.05, 'Oxygen, Argon', 5, '430 days', 0, false, false, 5);
INSERT INTO public.planet VALUES (42, 'Elysium', 1.40, 'Carbon dioxide, Nitrogen', -80, '660 days', 1, false, false, 4);
INSERT INTO public.planet VALUES (43, 'Aurora', 0.95, 'Nitrogen, Oxygen', 15, '540 days', 2, false, false, 6);
INSERT INTO public.planet VALUES (44, 'Stellara', 1.20, 'Methane, Hydrogen', -110, '670 days', 0, false, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.0, 5500, 'Hydrogen, helium', 4.6, 'Main sequence', 0.00013, 1);
INSERT INTO public.star VALUES (2, 'S Doradus', 200.0, 30000, 'Hydrogen, helium', 6.0, 'Hypergiant', 170000.00000, 1);
INSERT INTO public.star VALUES (3, 'NGC 2070-30', 100.0, 25000, 'Hydrogen, helium', 10.0, 'Blue Supergiant', 200000.00000, 1);
INSERT INTO public.star VALUES (4, 'Sagittarius A*', 4.1, 55000000, 'Mostly hydrogen and helium', 4.6, 'Supermassive black hole', 26000.00000, 1);
INSERT INTO public.star VALUES (5, 'NGC 4258-1', 300.0, 20, 'Hydrogen, helium, metals', 10.0, 'Spiral', 17.00000, 4);
INSERT INTO public.star VALUES (6, 'NGC 7293-1', 1.5, 50000, 'Hydrogen, helium', 10.0, 'Planetary nebula', 1500.00000, 1);
INSERT INTO public.star VALUES (7, 'NGC 1300-1', 100.0, 10, 'Hydrogen, helim, metals', 100.0, 'Spiral', 61.00000, 7);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 44, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

