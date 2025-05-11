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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    name_rus text NOT NULL,
    comet_year_of_description integer,
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    name_rus text NOT NULL,
    galaxy_year_of_description integer,
    diameter integer,
    galaxy_type text,
    visible_to_the_naked_eye boolean
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
    name character varying(30) NOT NULL,
    name_rus text NOT NULL,
    moon_year_of_description integer,
    mean_diameter numeric(5,1),
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    name_rus text NOT NULL,
    planet_year_of_description integer,
    planet_is_there_water boolean,
    planet_is_there_oxygen boolean,
    planet_habitable character varying(7),
    star_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    name_rus text NOT NULL,
    star_year_of_description integer,
    star_type text,
    galaxy_id integer NOT NULL
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

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 'Комета Галлея', 1758, 1);
INSERT INTO public.comet VALUES (2, 'Comet Encke', 'Комета Энке', 1786, 1);
INSERT INTO public.comet VALUES (3, 'Biela''s Comet', 'Комета Биэлы', 1772, 1);
INSERT INTO public.comet VALUES (4, 'Comet Bennett', 'Комета Беннетта', 1969, 1);
INSERT INTO public.comet VALUES (5, 'Comet Hale–Bopp', 'Комета Хейла — Боппа', 1995, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Млечный путь', 1755, 30, 'Спиральная галактика с перемычкой', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Туманность Андромеды', 1716, 47, 'Спиральная галактика', true);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'Большое Магелланово Облако', 1867, 10, 'Магелланова спиральная галактика', true);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'Малое Магелланово Облако', 1867, 6, 'Карликовая неправильная галактика', true);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Галактика Треугольника', 1764, 19, 'Спиральная галактика типа Sc', true);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool Galaxy', 'Водоворот', 1773, 24, 'Спиральная галактика', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Луна', 1609, 1737.1, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Фобос', 1877, 22.5, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Деймос', 1877, 12.4, 4);
INSERT INTO public.moon VALUES (4, 'Ganymede', 'Ганимед', 1610, 5268.2, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Каллисто', 1610, 4820.6, 5);
INSERT INTO public.moon VALUES (6, 'Io', 'Ио', 1610, 3642.6, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 'Европа', 1610, 3121.6, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Титан', 1655, 5152.0, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Энцелад', 1789, 504.2, 6);
INSERT INTO public.moon VALUES (10, 'Titania', 'Титания', 1787, 1576.8, 7);
INSERT INTO public.moon VALUES (11, 'Oberon', 'Оберон', 1787, 1522.8, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 'Умбриэль', 1851, 1169.4, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 'Ариэль', 1851, 1157.8, 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 'Миранда', 1948, 471.6, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 'Тритон', 1846, 2706.8, 8);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Нереида', 1949, 340.0, 8);
INSERT INTO public.moon VALUES (17, 'Proteus', 'Протей', 1989, 440.0, 8);
INSERT INTO public.moon VALUES (18, 'Larissa', 'Ларисса', 1981, 216.0, 8);
INSERT INTO public.moon VALUES (19, 'Charon', 'Харон', 1978, 1212.0, 9);
INSERT INTO public.moon VALUES (20, 'Nix', 'Никта', 2005, 54.0, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Меркурий', 1631, true, true, 'Unknown', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Венера', 1610, false, true, 'Unknown', 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Земля', 1543, true, true, 'Yes', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Марс', 1659, true, true, 'Yes', 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Юпитер', 1610, true, true, 'Unknown', 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Сатурн', 1609, false, false, 'No', 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Уран', 1783, true, false, 'No', 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Нептун', 1846, false, false, 'No', 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Плутон', 1930, false, false, 'No', 1);
INSERT INTO public.planet VALUES (10, 'Planet Nine', 'Девятая планета', 2016, false, false, 'No', 1);
INSERT INTO public.planet VALUES (11, 'Medusae', 'Планета Медуз', 2970, true, true, 'Yes', 3);
INSERT INTO public.planet VALUES (12, 'Electra', 'Электра', 2125, true, true, 'Yes', 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Солнце', 1610, 'G (желтый карлик)', 1);
INSERT INTO public.star VALUES (2, 'SN 1885A (also S Andromedae)', 'S Андромеды', 1885, 'Сверхновая', 2);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', 'Звезда Барнарда', 1916, 'Красный карлик спектрального класса M4,0V C', 1);
INSERT INTO public.star VALUES (4, 'Ross 154', 'Росс 154', 1925, 'Красный карлик спектрального класса M3,5 V', 1);
INSERT INTO public.star VALUES (5, 'Sirius', 'Сириус', 1844, 'Звезда главной последовательности, спектрального класса A1', 1);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Проксима Центавра', 1915, 'Красный карлик', 1);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 5, true);


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
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_name_rus_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_rus_key UNIQUE (name_rus);


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
-- Name: planet planet_name_rus_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_rus_key UNIQUE (name_rus);


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
-- Name: star star_name_rus_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_rus_key UNIQUE (name_rus);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon unique_moon_name_rus; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name_rus UNIQUE (name_rus, planet_id);


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
-- Name: comet fk_star_comet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT fk_star_comet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

