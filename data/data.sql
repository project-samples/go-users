--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;a
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.userreaction DROP CONSTRAINT userreaction_pkey;
ALTER TABLE ONLY public.userratereaction DROP CONSTRAINT userratereaction_pkey;
ALTER TABLE ONLY public.userrateinfo DROP CONSTRAINT userrateinfo_pkey;
ALTER TABLE ONLY public.userratecomment DROP CONSTRAINT userratecomment_pkey;
ALTER TABLE ONLY public.userrate DROP CONSTRAINT userrate_pkey;
ALTER TABLE ONLY public.userskills DROP CONSTRAINT skills_pkey;
ALTER TABLE ONLY public.usersearchs DROP CONSTRAINT searchs_pkey;
DROP TABLE public.userskills;
DROP TABLE public.usersearchs;
DROP TABLE public.users;
DROP TABLE public.userreaction;
DROP TABLE public.userratereaction;
DROP TABLE public.userrateinfo;
DROP TABLE public.userratecomment;
DROP TABLE public.userrate;
DROP TABLE public.userinterests;
DROP TABLE public.userinfomation;
DROP TABLE public.userinfo;
DROP TABLE public.userfollowing;
DROP TABLE public.userfollower;
DROP TABLE public.usereducations;
DROP TABLE public.usercompanies;
DROP TABLE public.signupcodes;
DROP TABLE public.savedlocation;
DROP TABLE public.saveditem;
DROP TABLE public.room;
DROP TABLE public.reservation;
DROP TABLE public.playlist;
DROP TABLE public.passwords;
DROP TABLE public.passwordcodes;
DROP TABLE public.music;
DROP TABLE public.locationreplycommentreaction;
DROP TABLE public.locationreplycommentinfo;
DROP TABLE public.locationreplycomment;
DROP TABLE public.locationratereaction;
DROP TABLE public.locationrate;
DROP TABLE public.locationinfomation;
DROP TABLE public.locationinfo;
DROP TABLE public.locationfollowing;
DROP TABLE public.locationfollower;
DROP TABLE public.locationcommentthreadreaction;
DROP TABLE public.locationcommentthreadinfo;
DROP TABLE public.locationcommentthread;
DROP TABLE public.locationcomment;
DROP TABLE public.location;
DROP TABLE public.job;
DROP TABLE public.itemresponsereaction;
DROP TABLE public.itemresponse;
DROP TABLE public.iteminfo;
DROP TABLE public.itemcomment;
DROP TABLE public.itemcategory;
DROP TABLE public.item;
DROP TABLE public.integrationconfiguration;
DROP TABLE public.history;
DROP TABLE public.filmreplycommentreaction;
DROP TABLE public.filmreplycommentinfo;
DROP TABLE public.filmreplycomment;
DROP TABLE public.filmratereaction;
DROP TABLE public.filmrateinfo;
DROP TABLE public.filmratecomment;
DROP TABLE public.filmrate;
DROP TABLE public.filmproductions;
DROP TABLE public.filmdirectors;
DROP TABLE public.filmcommentthreadreaction;
DROP TABLE public.filmcommentthreadinfo;
DROP TABLE public.filmcommentthread;
DROP TABLE public.filmcategory;
DROP TABLE public.filmcasts;
DROP TABLE public.film;
DROP TABLE public.countries;
DROP TABLE public.companyratereaction;
DROP TABLE public.companyrateinfo05;
DROP TABLE public.companyrateinfo04;
DROP TABLE public.companyrateinfo03;
DROP TABLE public.companyrateinfo02;
DROP TABLE public.companyrateinfo01;
DROP TABLE public.companyratefullinfo;
DROP TABLE public.companyrate;
DROP TABLE public.companycomment;
DROP TABLE public.companycategory;
DROP TABLE public.company_users;
DROP TABLE public.company;
DROP TABLE public.cinema;
DROP TABLE public.category;
DROP TABLE public.brand;
DROP TABLE public.authentication;
DROP TABLE public.authencodes;
DROP TABLE public.articleratereaction;
DROP TABLE public.articleratecomment;
DROP TABLE public.articlerate;
DROP TABLE public.articleinfo;
DROP TABLE public.articlecommentthreadreaction;
DROP TABLE public.articlecommentthreadinfo;
DROP TABLE public.articlecommentthread;
DROP TABLE public.articlecommentreaction;
DROP TABLE public.articlecommentinfo;
DROP TABLE public.articlecomment;
DROP TABLE public.article;
DROP TABLE public.appreciationreaction;
DROP TABLE public.appreciationcomment;
DROP TABLE public.appreciation;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: appreciation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appreciation (
                                     id character varying(40) NOT NULL,
                                     author character varying(40),
                                     title character varying(120),
                                     description character varying(120),
                                     usefulcount integer,
                                     replycount integer,
                                     createdat date,
                                     userid character varying(40),
                                     "time" date
);


--appreciation OWNER TO postgres;

--
-- Name: appreciationcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appreciationcomment (
                                            commentid character varying(255) NOT NULL,
                                            id character varying(255),
                                            author character varying(255),
                                            userid character varying(255),
                                            comment text,
                                            "time" timestamp(6) without time zone,
                                            updatedat timestamp(6) without time zone,
                                            histories jsonb[]
);


--appreciationcomment OWNER TO postgres;

--
-- Name: appreciationreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.appreciationreaction (
                                             id character varying(255) NOT NULL,
                                             author character varying(255) NOT NULL,
                                             userid character varying(255) NOT NULL,
                                             "time" timestamp(6) without time zone,
                                             reaction smallint
);


--appreciationreaction OWNER TO postgres;

--
-- Name: article; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.article (
                                id character varying(40) NOT NULL,
                                title character varying(300),
                                name character varying(300),
                                description character varying(1000),
                                type character varying(40),
                                content character varying(100000),
                                authorid character varying(40),
                                tags character varying[],
                                status character varying(1)
);


--article OWNER TO postgres;

--
-- Name: articlecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articlecomment (
                                       commentid character varying(40) NOT NULL,
                                       commentthreadid character varying(40),
                                       id character varying(40),
                                       author character varying(255),
                                       comment text,
                                       "time" timestamp(6) with time zone,
                                       updatedat timestamp(6) with time zone,
                                       histories jsonb[]
);


--articlecomment OWNER TO postgres;

--
-- Name: articlecommentinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articlecommentinfo (
                                           commentid character varying(40) NOT NULL,
                                           replycount integer DEFAULT 0,
                                           usefulcount integer DEFAULT 0
);


--articlecommentinfo OWNER TO postgres;

--
-- Name: articlecommentreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articlecommentreaction (
                                               commentid character varying(40) NOT NULL,
                                               author character varying(40) NOT NULL,
                                               userid character varying(40) NOT NULL,
                                               "time" timestamp(6) with time zone,
                                               reaction smallint
);


--articlecommentreaction OWNER TO postgres;

--
-- Name: articlecommentthread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articlecommentthread (
                                             commentid character varying(40) NOT NULL,
                                             id character varying(40),
                                             author character varying(255),
                                             comment text,
                                             "time" timestamp(6) with time zone,
                                             updatedat timestamp(6) with time zone,
                                             histories jsonb[]
);


--articlecommentthread OWNER TO postgres;

--
-- Name: articlecommentthreadinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articlecommentthreadinfo (
                                                 commentid character varying(40) NOT NULL,
                                                 replycount integer DEFAULT 0,
                                                 usefulcount integer DEFAULT 0
);


--articlecommentthreadinfo OWNER TO postgres;

--
-- Name: articlecommentthreadreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articlecommentthreadreaction (
                                                     commentid character varying(40) NOT NULL,
                                                     author character varying(40) NOT NULL,
                                                     userid character varying(40) NOT NULL,
                                                     "time" timestamp(6) with time zone,
                                                     reaction smallint
);


--articlecommentthreadreaction OWNER TO postgres;

--
-- Name: articleinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articleinfo (
                                    id character varying(40) NOT NULL,
                                    rate numeric DEFAULT 0,
                                    rate1 integer DEFAULT 0,
                                    rate2 integer DEFAULT 0,
                                    rate3 integer DEFAULT 0,
                                    rate4 integer DEFAULT 0,
                                    rate5 integer DEFAULT 0,
                                    count integer DEFAULT 0,
                                    score numeric DEFAULT 0
);


--articleinfo OWNER TO postgres;

--
-- Name: articlerate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articlerate (
                                    id character varying(40) NOT NULL,
                                    author character varying(40) NOT NULL,
                                    rate integer NOT NULL,
                                    "time" timestamp(6) without time zone,
                                    review text,
                                    usefulcount integer DEFAULT 0,
                                    replycount integer DEFAULT 0,
                                    histories jsonb[],
                                    anonymous boolean
);


--articlerate OWNER TO postgres;

--
-- Name: articleratecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articleratecomment (
                                           commentid character varying(40) NOT NULL,
                                           id character varying(40) NOT NULL,
                                           author character varying(40) NOT NULL,
                                           userid character varying(40) NOT NULL,
                                           comment text,
                                           "time" timestamp(6) without time zone,
                                           updatedat timestamp(6) without time zone,
                                           histories jsonb[],
                                           anonymous boolean
);


--articleratecomment OWNER TO postgres;

--
-- Name: articleratereaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.articleratereaction (
                                            id character varying(40) NOT NULL,
                                            author character varying(40) NOT NULL,
                                            userid character varying(40) NOT NULL,
                                            "time" timestamp(6) without time zone,
                                            reaction smallint
);


--articleratereaction OWNER TO postgres;

--
-- Name: authencodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authencodes (
                                    id character varying(40) NOT NULL,
                                    code character varying(500) NOT NULL,
                                    expiredat timestamp(6) with time zone NOT NULL
);


--authencodes OWNER TO postgres;

--
-- Name: authentication; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication (
                                       id character varying,
                                       password character varying,
                                       failcount character varying,
                                       lockeduntiltime character varying,
                                       successtime character varying,
                                       failtime character varying
);


--authentication OWNER TO postgres;

--
-- Name: brand; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brand (
    brand character varying(255) NOT NULL
);


--brand OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
                                 categoryid character varying(40) NOT NULL,
                                 categoryname character varying(300) NOT NULL,
                                 status character(1) NOT NULL,
                                 createdby character varying(40),
                                 createdat timestamp(6) without time zone,
                                 updatedby character varying(40),
                                 updatedat timestamp(6) without time zone
);


--category OWNER TO postgres;

--
-- Name: cinema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cinema (
                               id character varying(40) NOT NULL,
                               name character varying(255) NOT NULL,
                               address character varying(255) NOT NULL,
                               parent character varying(40),
                               status character(1) NOT NULL,
                               latitude numeric,
                               longitude numeric,
                               imageurl text,
                               createdby character varying(40),
                               createdat timestamp(6) without time zone,
                               updatedby character varying(40),
                               updatedat timestamp(6) without time zone,
                               gallery jsonb[],
                               coverurl text
);


--cinema OWNER TO postgres;

--
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
                                id character varying(40) NOT NULL,
                                name character varying(120),
                                description character varying(1000),
                                address character varying(255) NOT NULL,
                                size integer,
                                status character(1) NOT NULL,
                                establishedat timestamp(6) with time zone,
                                categories character varying[],
                                imageurl character varying(300),
                                coverurl character varying(300),
                                gallery character varying[]
);


--company OWNER TO postgres;

--
-- Name: company_users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_users (
                                      company_id character varying(40) NOT NULL,
                                      user_id character varying(40) NOT NULL
);


--company_users OWNER TO postgres;

--
-- Name: companycategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companycategory (
                                        categoryid character varying(40) NOT NULL,
                                        categoryname character varying(300) NOT NULL,
                                        status character(1) NOT NULL,
                                        createdby character varying(40),
                                        createdat timestamp(6) without time zone,
                                        updatedby character varying(40),
                                        updatedat timestamp(6) without time zone
);


--companycategory OWNER TO postgres;

--
-- Name: companycomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companycomment (
                                       commentid character varying(40) NOT NULL,
                                       id character varying(40) NOT NULL,
                                       author character varying(40) NOT NULL,
                                       userid character varying(40) NOT NULL,
                                       comment text,
                                       "time" timestamp(6) without time zone,
                                       updatedat timestamp(6) without time zone,
                                       histories jsonb[],
                                       anonymous boolean
);


--companycomment OWNER TO postgres;

--
-- Name: companyrate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyrate (
                                    id character varying(255) NOT NULL,
                                    author character varying(255) NOT NULL,
                                    rate double precision,
                                    "time" timestamp(6) without time zone,
                                    review text,
                                    usefulcount integer DEFAULT 0,
                                    replycount integer DEFAULT 0,
                                    histories jsonb[],
                                    rates double precision[],
                                    anonymous boolean
);


--companyrate OWNER TO postgres;

--
-- Name: companyratefullinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyratefullinfo (
                                            id character varying(40) NOT NULL,
                                            rate numeric DEFAULT 0,
                                            rate1 double precision DEFAULT 0,
                                            rate2 double precision DEFAULT 0,
                                            rate3 double precision DEFAULT 0,
                                            rate4 double precision DEFAULT 0,
                                            rate5 double precision DEFAULT 0,
                                            count numeric,
                                            score numeric
);


--companyratefullinfo OWNER TO postgres;

--
-- Name: companyrateinfo01; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyrateinfo01 (
                                          id character varying(40) NOT NULL,
                                          rate numeric DEFAULT 0,
                                          rate1 integer DEFAULT 0,
                                          rate2 integer DEFAULT 0,
                                          rate3 integer DEFAULT 0,
                                          rate4 integer DEFAULT 0,
                                          rate5 integer DEFAULT 0,
                                          count integer,
                                          score numeric
);


--companyrateinfo01 OWNER TO postgres;

--
-- Name: companyrateinfo02; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyrateinfo02 (
                                          id character varying(40) NOT NULL,
                                          rate numeric DEFAULT 0,
                                          rate1 integer DEFAULT 0,
                                          rate2 integer DEFAULT 0,
                                          rate3 integer DEFAULT 0,
                                          rate4 integer DEFAULT 0,
                                          rate5 integer DEFAULT 0,
                                          count integer,
                                          score numeric
);


--companyrateinfo02 OWNER TO postgres;

--
-- Name: companyrateinfo03; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyrateinfo03 (
                                          id character varying(40) NOT NULL,
                                          rate numeric DEFAULT 0,
                                          rate1 integer DEFAULT 0,
                                          rate2 integer DEFAULT 0,
                                          rate3 integer DEFAULT 0,
                                          rate4 integer DEFAULT 0,
                                          rate5 integer DEFAULT 0,
                                          count integer,
                                          score numeric
);


--companyrateinfo03 OWNER TO postgres;

--
-- Name: companyrateinfo04; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyrateinfo04 (
                                          id character varying(40) NOT NULL,
                                          rate numeric DEFAULT 0,
                                          rate1 integer DEFAULT 0,
                                          rate2 integer DEFAULT 0,
                                          rate3 integer DEFAULT 0,
                                          rate4 integer DEFAULT 0,
                                          rate5 integer DEFAULT 0,
                                          count integer,
                                          score numeric
);


--companyrateinfo04 OWNER TO postgres;

--
-- Name: companyrateinfo05; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyrateinfo05 (
                                          id character varying(40) NOT NULL,
                                          rate numeric DEFAULT 0,
                                          rate1 integer DEFAULT 0,
                                          rate2 integer DEFAULT 0,
                                          rate3 integer DEFAULT 0,
                                          rate4 integer DEFAULT 0,
                                          rate5 integer DEFAULT 0,
                                          count integer,
                                          score numeric
);


--companyrateinfo05 OWNER TO postgres;

--
-- Name: companyratereaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.companyratereaction (
                                            id character varying(255) NOT NULL,
                                            author character varying(255) NOT NULL,
                                            userid character varying(255) NOT NULL,
                                            "time" timestamp(6) without time zone,
                                            reaction smallint
);


--companyratereaction OWNER TO postgres;

--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country character varying(120) NOT NULL
);


--countries OWNER TO postgres;

--
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
                             id character varying(40) NOT NULL,
                             title character varying(300) NOT NULL,
                             description character varying(300),
                             imageurl character varying(300),
                             trailerurl character varying(300),
                             categories character varying[],
                             directors character varying[],
                             casts character varying[],
                             productions character varying[],
                             countries character varying[],
                             language character varying(300),
                             writer character varying[],
                             gallery jsonb[],
                             coverurl character varying(300),
                             status character(1) NOT NULL,
                             createdby character varying(40),
                             createdat timestamp(6) without time zone,
                             updatedby character varying(40),
                             updatedat timestamp(6) without time zone
);


--film OWNER TO postgres;

--
-- Name: filmcasts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmcasts (
    actor character varying(120) NOT NULL
);


--filmcasts OWNER TO postgres;

--
-- Name: filmcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmcategory (
                                     categoryid character varying(40) NOT NULL,
                                     categoryname character varying(300) NOT NULL,
                                     status character(1) NOT NULL,
                                     createdby character varying(40),
                                     createdat timestamp(6) without time zone,
                                     updatedby character varying(40),
                                     updatedat timestamp(6) without time zone
);


--filmcategory OWNER TO postgres;

--
-- Name: filmcommentthread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmcommentthread (
                                          commentid character varying(40) NOT NULL,
                                          id character varying(40),
                                          author character varying(255),
                                          comment text,
                                          "time" timestamp(6) with time zone,
                                          updatedat timestamp(6) with time zone,
                                          histories jsonb[]
);


--filmcommentthread OWNER TO postgres;

--
-- Name: filmcommentthreadinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmcommentthreadinfo (
                                              commentid character varying(40) NOT NULL,
                                              replycount integer DEFAULT 0,
                                              usefulcount integer DEFAULT 0
);


--filmcommentthreadinfo OWNER TO postgres;

--
-- Name: filmcommentthreadreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmcommentthreadreaction (
                                                  commentid character varying(40) NOT NULL,
                                                  author character varying(40) NOT NULL,
                                                  userid character varying(40) NOT NULL,
                                                  "time" timestamp(6) with time zone,
                                                  reaction smallint
);


--filmcommentthreadreaction OWNER TO postgres;

--
-- Name: filmdirectors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmdirectors (
    director character varying(120) NOT NULL
);


--filmdirectors OWNER TO postgres;

--
-- Name: filmproductions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmproductions (
    production character varying(120) NOT NULL
);


--filmproductions OWNER TO postgres;

--
-- Name: filmrate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmrate (
                                 id character varying(255) NOT NULL,
                                 author character varying(255) NOT NULL,
                                 rate integer,
                                 "time" timestamp(6) without time zone,
                                 review text,
                                 usefulcount integer DEFAULT 0,
                                 replycount integer DEFAULT 0,
                                 histories jsonb[],
                                 anonymous boolean
);


--filmrate OWNER TO postgres;

--
-- Name: filmratecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmratecomment (
                                        commentid character varying(255) NOT NULL,
                                        id character varying(255),
                                        author character varying(255),
                                        userid character varying(255),
                                        comment text,
                                        "time" timestamp(6) without time zone,
                                        updatedat timestamp(6) without time zone,
                                        histories jsonb[],
                                        anonymous boolean
);


--filmratecomment OWNER TO postgres;

--
-- Name: filmrateinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmrateinfo (
                                     id character varying(255) NOT NULL,
                                     rate numeric DEFAULT 0,
                                     rate1 integer DEFAULT 0,
                                     rate2 integer DEFAULT 0,
                                     rate3 integer DEFAULT 0,
                                     rate4 integer DEFAULT 0,
                                     rate5 integer DEFAULT 0,
                                     rate6 integer DEFAULT 0,
                                     rate7 integer DEFAULT 0,
                                     rate8 integer DEFAULT 0,
                                     rate9 integer DEFAULT 0,
                                     rate10 integer DEFAULT 0,
                                     count integer,
                                     score numeric
);


--filmrateinfo OWNER TO postgres;

--
-- Name: filmratereaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmratereaction (
                                         id character varying(255) NOT NULL,
                                         author character varying(255) NOT NULL,
                                         userid character varying(255) NOT NULL,
                                         "time" timestamp(6) without time zone,
                                         reaction smallint
);


--filmratereaction OWNER TO postgres;

--
-- Name: filmreplycomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmreplycomment (
                                         commentid character varying(40) NOT NULL,
                                         commentthreadid character varying(40),
                                         id character varying(40),
                                         author character varying(255),
                                         comment text,
                                         "time" timestamp(6) with time zone,
                                         updatedat timestamp(6) with time zone,
                                         histories jsonb[]
);


--filmreplycomment OWNER TO postgres;

--
-- Name: filmreplycommentinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmreplycommentinfo (
                                             commentid character varying(40) NOT NULL,
                                             replycount integer DEFAULT 0,
                                             usefulcount integer DEFAULT 0
);


--filmreplycommentinfo OWNER TO postgres;

--
-- Name: filmreplycommentreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.filmreplycommentreaction (
                                                 commentid character varying(40) NOT NULL,
                                                 author character varying(40) NOT NULL,
                                                 userid character varying(40) NOT NULL,
                                                 "time" timestamp(6) with time zone,
                                                 reaction smallint
);


--filmreplycommentreaction OWNER TO postgres;

--
-- Name: history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.history (
                                id character varying(40) NOT NULL,
                                history character varying[]
);


--history OWNER TO postgres;

--
-- Name: integrationconfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.integrationconfiguration (
                                                 id character varying,
                                                 link character varying,
                                                 cliendid character varying,
                                                 scope character varying,
                                                 redirecturi character varying,
                                                 accesstokenlink character varying,
                                                 clientsecret character varying,
                                                 status character varying
);


--integrationconfiguration OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
                             id character varying(40) NOT NULL,
                             title character varying(120),
                             author character varying(140),
                             status character varying(1),
                             description character varying(1500),
                             price numeric,
                             imageurl character varying(300),
                             brand character varying(120),
                             publishedat timestamp(6) without time zone,
                             expiredat timestamp(6) without time zone,
                             category character varying[],
                             gallery jsonb[],
                             condition character varying(50)
);


--item OWNER TO postgres;

--
-- Name: itemcategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemcategory (
                                     categoryid character varying(40) NOT NULL,
                                     categoryname character varying(300) NOT NULL,
                                     status character(1) NOT NULL,
                                     createdby character varying(40),
                                     createdat timestamp(6) without time zone,
                                     updatedby character varying(40),
                                     updatedat timestamp(6) without time zone
);


--itemcategory OWNER TO postgres;

--
-- Name: itemcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemcomment (
                                    id character varying(40) NOT NULL,
                                    author character varying(40) NOT NULL,
                                    userid character varying(40) NOT NULL,
                                    comment text,
                                    "time" timestamp(6) without time zone,
                                    updatedat timestamp(6) without time zone,
                                    histories jsonb[]
);


--itemcomment OWNER TO postgres;

--
-- Name: iteminfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.iteminfo (
                                 id character varying(255) NOT NULL,
                                 viewcount integer DEFAULT 0
);


--iteminfo OWNER TO postgres;

--
-- Name: itemresponse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemresponse (
                                     id character varying(40) NOT NULL,
                                     author character varying(40) NOT NULL,
                                     description text,
                                     "time" timestamp(6) without time zone,
                                     usefulcount integer DEFAULT 0,
                                     replycount integer DEFAULT 0,
                                     histories jsonb[],
                                     price bigint
);


--itemresponse OWNER TO postgres;

--
-- Name: itemresponsereaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemresponsereaction (
                                             id character varying(255) NOT NULL,
                                             author character varying(255) NOT NULL,
                                             userid character varying(255) NOT NULL,
                                             "time" timestamp(6) without time zone,
                                             reaction smallint
);


--itemresponsereaction OWNER TO postgres;

--
-- Name: job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job (
                            id character varying(40) NOT NULL,
                            title character varying(300),
                            description character varying(2000),
                            publishedat timestamp(6) with time zone,
                            expiredat timestamp(6) with time zone,
                            quantity bigint DEFAULT 0,
                            applicantcount bigint DEFAULT 0,
                            requirements character varying(2000),
                            benefit character varying(1000),
                            company_id character varying(40) NOT NULL,
                            skill character varying
);


--job OWNER TO postgres;

--
-- Name: location; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.location (
                                 id character varying(40) NOT NULL,
                                 name character varying(300) NOT NULL,
                                 type character varying(40),
                                 description character varying(1000),
                                 status character(1) NOT NULL,
                                 geo jsonb,
                                 latitude numeric(20,16),
                                 longitude numeric(20,16),
                                 imageurl character varying(1500),
                                 customurl character varying(1500),
                                 createdby character varying(1500),
                                 createdat timestamp(6) without time zone,
                                 updatedby character varying(1500),
                                 version integer,
                                 info jsonb
);


--location OWNER TO postgres;

--
-- Name: locationcomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationcomment (
                                        commentid character varying(40) NOT NULL,
                                        id character varying(40) NOT NULL,
                                        author character varying(40) NOT NULL,
                                        userid character varying(40) NOT NULL,
                                        comment text,
                                        "time" timestamp(6) without time zone,
                                        updatedat timestamp(6) without time zone,
                                        histories jsonb[],
                                        anonymous boolean
);


--locationcomment OWNER TO postgres;

--
-- Name: locationcommentthread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationcommentthread (
                                              commentid character varying(40) NOT NULL,
                                              id character varying(40),
                                              author character varying(255),
                                              comment text,
                                              "time" timestamp(6) with time zone,
                                              updatedat timestamp(6) with time zone,
                                              histories jsonb[]
);


--locationcommentthread OWNER TO postgres;

--
-- Name: locationcommentthreadinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationcommentthreadinfo (
                                                  commentid character varying(40) NOT NULL,
                                                  replycount integer DEFAULT 0,
                                                  usefulcount integer DEFAULT 0
);


--locationcommentthreadinfo OWNER TO postgres;

--
-- Name: locationcommentthreadreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationcommentthreadreaction (
                                                      commentid character varying(40) NOT NULL,
                                                      author character varying(40) NOT NULL,
                                                      userid character varying(40) NOT NULL,
                                                      "time" timestamp(6) with time zone,
                                                      reaction smallint
);


--locationcommentthreadreaction OWNER TO postgres;

--
-- Name: locationfollower; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationfollower (
                                         id character varying(40) NOT NULL,
                                         follower character varying(40) NOT NULL
);


--locationfollower OWNER TO postgres;

--
-- Name: locationfollowing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationfollowing (
                                          id character varying(40) NOT NULL,
                                          following character varying(40) NOT NULL
);


--locationfollowing OWNER TO postgres;

--
-- Name: locationinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationinfo (
                                     id character varying(40) NOT NULL,
                                     rate double precision DEFAULT 0,
                                     rate1 integer DEFAULT 0,
                                     rate2 integer DEFAULT 0,
                                     rate3 integer DEFAULT 0,
                                     rate4 integer DEFAULT 0,
                                     rate5 integer DEFAULT 0,
                                     count integer DEFAULT 0,
                                     score numeric DEFAULT 0
);


--locationinfo OWNER TO postgres;

--
-- Name: locationinfomation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationinfomation (
                                           id character varying(40) NOT NULL,
                                           followercount bigint,
                                           followingcount bigint
);


--locationinfomation OWNER TO postgres;

--
-- Name: locationrate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationrate (
                                     id character varying(40) NOT NULL,
                                     author character varying(40) NOT NULL,
                                     rate real NOT NULL,
                                     "time" timestamp(6) without time zone,
                                     review text,
                                     usefulcount integer DEFAULT 0,
                                     replycount integer DEFAULT 0,
                                     anonymous boolean,
                                     histories jsonb[]
);


--locationrate OWNER TO postgres;

--
-- Name: locationratereaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationratereaction (
                                             id character varying(40) NOT NULL,
                                             author character varying(40) NOT NULL,
                                             userid character varying(40) NOT NULL,
                                             "time" timestamp(6) without time zone,
                                             reaction smallint
);


--locationratereaction OWNER TO postgres;

--
-- Name: locationreplycomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationreplycomment (
                                             commentid character varying(40) NOT NULL,
                                             commentthreadid character varying(40),
                                             id character varying(40),
                                             author character varying(255),
                                             comment text,
                                             "time" timestamp(6) with time zone,
                                             updatedat timestamp(6) with time zone,
                                             histories jsonb[]
);


--locationreplycomment OWNER TO postgres;

--
-- Name: locationreplycommentinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationreplycommentinfo (
                                                 commentid character varying(40) NOT NULL,
                                                 replycount integer DEFAULT 0,
                                                 usefulcount integer DEFAULT 0
);


--locationreplycommentinfo OWNER TO postgres;

--
-- Name: locationreplycommentreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locationreplycommentreaction (
                                                     commentid character varying(40) NOT NULL,
                                                     author character varying(40) NOT NULL,
                                                     userid character varying(40) NOT NULL,
                                                     "time" timestamp(6) with time zone,
                                                     reaction smallint
);


--locationreplycommentreaction OWNER TO postgres;

--
-- Name: music; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.music (
                              id character varying(40) NOT NULL,
                              name character varying(300) NOT NULL,
                              author character varying[],
                              releasedate date,
                              duration date,
                              lyric text,
                              imageurl character varying(300),
                              mp3url character varying(300)
);


--music OWNER TO postgres;

--
-- Name: passwordcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passwordcodes (
                                      id character varying(40) NOT NULL,
                                      code character varying(500) NOT NULL,
                                      expiredat timestamp(6) with time zone NOT NULL
);


--passwordcodes OWNER TO postgres;

--
-- Name: passwords; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.passwords (
                                  id character varying(40) NOT NULL,
                                  password character varying(255),
                                  successtime timestamp(6) with time zone,
                                  failtime timestamp(6) with time zone,
                                  failcount integer,
                                  lockeduntiltime timestamp(6) with time zone,
                                  history character varying[]
);


--passwords OWNER TO postgres;

--
-- Name: playlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.playlist (
                                 id character varying(40) NOT NULL,
                                 title character varying(255),
                                 userid character varying(255),
                                 imageurl character varying(255)
);


--playlist OWNER TO postgres;

--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
                                    id character varying(40) NOT NULL,
                                    startdate date,
                                    enddate date,
                                    guestid character varying(255),
                                    totalprice integer,
                                    roomid character varying(255)
);


--reservation OWNER TO postgres;

--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
                             id character varying(255) NOT NULL,
                             title character varying(255),
                             description character varying(1000),
                             price integer,
                             offer character varying[],
                             location character varying(255),
                             host character varying(255),
                             guest integer,
                             bedrooms integer,
                             bed integer,
                             bathrooms integer,
                             highlight character varying[],
                             status character(1),
                             region character varying(255),
                             category character varying[],
                             typeof character varying[],
                             property character varying(255),
                             language character varying[],
                             imageurl jsonb[]
);


--room OWNER TO postgres;

--
-- Name: saveditem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.saveditem (
                                  id character varying(40) NOT NULL,
                                  items character varying[],
                                  createdby character varying(40),
                                  createdat timestamp(6) without time zone,
                                  updatedby character varying(40),
                                  updatedat timestamp(6) without time zone
);


--saveditem OWNER TO postgres;

--
-- Name: savedlocation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.savedlocation (
                                      id character varying(40) NOT NULL,
                                      items character varying[]
);


--savedlocation OWNER TO postgres;

--
-- Name: signupcodes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.signupcodes (
                                    id character varying(40) NOT NULL,
                                    code character varying(500) NOT NULL,
                                    expiredat timestamp(6) with time zone NOT NULL
);


--signupcodes OWNER TO postgres;

--
-- Name: usercompanies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usercompanies (
    company character varying(120) NOT NULL
);


--usercompanies OWNER TO postgres;

--
-- Name: usereducations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usereducations (
    school character varying(120) NOT NULL
);


--usereducations OWNER TO postgres;

--
-- Name: userfollower; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userfollower (
                                     id character varying(40) NOT NULL,
                                     follower character varying(40) NOT NULL
);


--userfollower OWNER TO postgres;

--
-- Name: userfollowing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userfollowing (
                                      id character varying(40) NOT NULL,
                                      following character varying(40) NOT NULL
);


--userfollowing OWNER TO postgres;

--
-- Name: userinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userinfo (
                                 id character varying(40) NOT NULL,
                                 followercount bigint DEFAULT 0,
                                 followingcount bigint DEFAULT 0,
                                 rate1 integer DEFAULT 0
);


--userinfo OWNER TO postgres;

--
-- Name: userinfomation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userinfomation (
                                       id character varying(255) NOT NULL,
                                       appreciate bigint DEFAULT 0,
                                       respect bigint DEFAULT 0,
                                       admire bigint DEFAULT 0,
                                       reactioncount bigint DEFAULT 0
);


--userinfomation OWNER TO postgres;

--
-- Name: userinterests; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userinterests (
    interest character varying(120) NOT NULL
);


--userinterests OWNER TO postgres;

--
-- Name: userrate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userrate (
                                 id character varying(255) NOT NULL,
                                 author character varying(255) NOT NULL,
                                 rate integer,
                                 "time" timestamp without time zone,
                                 review text,
                                 usefulcount integer DEFAULT 0,
                                 replycount integer DEFAULT 0,
                                 histories jsonb[]
);


--userrate OWNER TO postgres;

--
-- Name: userratecomment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userratecomment (
                                        commentid character varying(255) NOT NULL,
                                        id character varying(255),
                                        author character varying(255),
                                        userid character varying(255),
                                        comment text,
                                        "time" timestamp without time zone,
                                        updatedat timestamp without time zone,
                                        histories jsonb[]
);


--userratecomment OWNER TO postgres;

--
-- Name: userrateinfo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userrateinfo (
                                     id character varying(255) NOT NULL,
                                     rate numeric DEFAULT 0,
                                     rate1 integer DEFAULT 0,
                                     rate2 integer DEFAULT 0,
                                     rate3 integer DEFAULT 0,
                                     rate4 integer DEFAULT 0,
                                     rate5 integer DEFAULT 0,
                                     rate6 integer DEFAULT 0,
                                     rate7 integer DEFAULT 0,
                                     rate8 integer DEFAULT 0,
                                     rate9 integer DEFAULT 0,
                                     rate10 integer DEFAULT 0,
                                     count integer,
                                     score numeric
);


--userrateinfo OWNER TO postgres;

--
-- Name: userratereaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userratereaction (
                                         id character varying(255) NOT NULL,
                                         author character varying(255) NOT NULL,
                                         userid character varying(255) NOT NULL,
                                         "time" timestamp without time zone,
                                         reaction smallint
);


--userratereaction OWNER TO postgres;

--
-- Name: userreaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userreaction (
                                     id character varying(255) NOT NULL,
                                     author character varying(255) NOT NULL,
                                     userid character varying(255) NOT NULL,
                                     reaction smallint,
                                     "time" timestamp without time zone
);


--userreaction OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
                              id character varying(40) NOT NULL,
                              username character varying(120),
                              email character varying(120),
                              phone character varying(45),
                              gender character(1),
                              displayname character varying(500),
                              givenname character varying(100),
                              familyname character varying(100),
                              middlename character varying(100),
                              alternativeemail character varying(255),
                              alternativephone character varying(45),
                              imageurl character varying(255),
                              coverurl character varying(255),
                              title character varying(255),
                              nationality character varying(255),
                              address character varying(255),
                              bio character varying(255),
                              website character varying(255),
                              occupation character varying(255),
                              company character varying(255),
                              location character varying(255),
                              maxpasswordage integer,
                              dateofbirth timestamp with time zone,
                              settings jsonb,
                              links jsonb,
                              gallery jsonb[],
                              skills jsonb[],
                              achievements jsonb[],
                              works jsonb[],
                              companies jsonb[],
                              educations jsonb[],
                              interests character varying[],
                              lookingfor character varying[],
                              status character(1),
                              createdby character varying(40) NOT NULL,
                              createdat timestamp with time zone,
                              updatedby character varying(40) NOT NULL,
                              updatedat timestamp with time zone,
                              social jsonb,
                              version integer
);


--users OWNER TO postgres;

--
-- Name: usersearchs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usersearchs (
    item character varying(120) NOT NULL
);


--usersearchs OWNER TO postgres;

--
-- Name: userskills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.userskills (
    skill character varying(120) NOT NULL
);


--userskills OWNER TO postgres;

--
-- Data for Name: appreciation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: appreciationcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: appreciationreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: article; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.article VALUES ('01', 'This is title 01', 'This is name 01', 'This is description 01', 'type 01', '<div class="key-event__content">
    <p>Trong phần thủ tục, các luật sư bảo vệ người bị hại đề nghị HĐXX xác định tỷ lệ thương tích của bị hại vào các ngày 7, 10, và 12.12.2021, nhằm xem xét xử lý các bị cáo hành vi “cố ý gây thương tích. </p>
    <p>Bên cạnh đó, các luật sư đề nghị HĐXX xem xét và xác định Thái đồng phạm tội danh "giết người" với bị cáo Trang.</p>
    <table class="picture" align="center">
     <tbody>
      <tr>
       <td class="pic"> <img data-image-id="3910826" src="https://image.thanhnien.vn/w2048/Uploaded/2022/bahgtm/2022_07_21/thai-2-3830.jpg" data-width="2560" data-height="1697" class="cms-photo" alt="Xét xử vụ bé gái 8 tuổi bị bạo hành tử vong: Tòa cân nhắc khi trình chiếu video hành vi phạm tội  - ảnh 1" caption="Xét xử vụ bé gái 8 tuổi bị bạo hành tử vong: Tòa cân nhắc khi trình chiếu video hành vi phạm tội  - ảnh 1"> </td>
      </tr>
      <tr>
       <td class="caption"><p>Bị cáo Trung Thái và Quỳnh Trang tại phiên tòa sáng 21.7</p>
        <div class="source">
         <p>ngọc dương</p>
        </div></td>
      </tr>
     </tbody>
    </table>
   </div>', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO public.article VALUES ('02', 'This is title 02', 'This is name 02', 'This is description 02', 'type 02', 'This is content 02', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO public.article VALUES ('03', 'This is title 03', 'This is name 03', 'This is description 03', 'type 03', 'This is content 03', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO public.article VALUES ('04', 'This is title 04', 'This is name 04', 'This is description 04', 'type 04', 'This is content 04', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO public.article VALUES ('05', 'This is title 05', 'This is name 05', 'This is description 05', 'type 05', 'This is content 05', '77c35c38c3554ea6906730dbcfeca0f2', '{tag01,tag02}', 'A');
INSERT INTO public.article VALUES ('abw6F9-ap', 'Điều gì đang xảy ra với thị trường xăng dầu?', '', 'Việt Nam tự chủ được 70% nguồn cung, có 36 doanh nghiệp đầu mối lo nhập hàng, 17.000 cửa hàng bán lẻ nhưng người dân vẫn không mua được xăng dầu.', 'Kinh doanh', '<p class="Normal" xss=removed>Ở TP HCM có 550 cửa hàng bán lẻ nhưng theo thống kê của quản lý thị trường, đến chiều qua, 137 cây xăng (chiếm 20% hệ thống) tại 19 quận, huyện thiếu hàng, đóng cửa. Nhiều người dân thậm chí phải dắt bộ xe máy nhiều cây số để tìm nơi đổ xăng.</p><figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject" class="tplCaption action_thumb_added" xss=removed><div class="fig-picture" xss=removed><picture xss=removed><source data-srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=P5fMzE4p1lqAKYUOuSRUQg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=RjFIqvg2F1YgLt0Db4xEHQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=b4UQ-3_8skwK-EJQfClODA 2x" srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=P5fMzE4p1lqAKYUOuSRUQg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=RjFIqvg2F1YgLt0Db4xEHQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=b4UQ-3_8skwK-EJQfClODA 2x" xss=removed><img itemprop="contentUrl" loading="lazy" intrinsicsize="680x0" alt="Hàng trăm xe máy, ôtô vây quanh cây xăng trên đường Tô Ký, quận 12 để chờ đổ xăng sáng nay.  Hầu hết người dân phải chờ hơn 30 phút mới đến lượt đổ xăng. Ảnh: Quỳnh Trần" class="lazy lazied" src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=P5fMzE4p1lqAKYUOuSRUQg" data-src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-4371-1665550330.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=P5fMzE4p1lqAKYUOuSRUQg" data-ll-status="loaded" xss=removed></picture></div><figcaption itemprop="description" xss=removed><p class="Image" xss=removed>Hàng trăm xe máy, ôtô vây quanh cây xăng trên đường Tô Ký, quận 12 để chờ đổ xăng sáng nay. Hầu hết người dân phải chờ hơn 30 phút mới đến lượt đổ xăng. Ảnh: <em xss=removed>Đình Văn</em></p></figcaption></figure><p class="Normal" xss=removed>Không chỉ TP HCM, tình trạng này lan ra một số tỉnh, thành khác phía Nam như Bình Dương, Đồng Nai, Bình Phước hay khu vực Tây Nguyên, như Đăk Lăk...</p><p class="Normal" xss=removed>Riêng trong năm nay, đây không phải lần đầu có tình trạng thiếu xăng, các cửa hàng ngưng bán. Hồi tháng 2, khi nguồn cung từ Lọc dầu Nghi Sơn bị ảnh hưởng, cảnh tượng này đã diễn ra.</p><p class="Normal" xss=removed>Việt Nam hiện sản xuất được 70% nguồn cung xăng dầu trong nước thông qua hai nhà máy lọc dầu, phần còn lại nhập khẩu. Trong chuỗi cung ứng đưa xăng tới người dân, 36 doanh nghiệp đầu mối có chức năng nhập hàng đầu nguồn (từ nhà máy lọc dầu trong nước hoặc nhập từ nước ngoài). Tiếp đến là 500 thương nhân phân phối, những người mua lại từ các đầu mối và bán buôn cho các đại lý và sau cùng là 17.000 cửa hàng xăng dầu trên khắp cả nước. Tuy nhiên, những ngày qua, hệ thống phân phối với hàng chục nghìn điểm chạm này bộc lộ nhiều vấn đề.</p><p class="Normal" xss=removed>Chủ một doanh nghiệp kinh doanh xăng dầu cho rằng, quan trọng nhất trong kinh doanh bán lẻ xăng dầu là nguồn cung, chiết khấu, giá nhưng cả ba yếu tố này đều bất ổn thời gian qua.</p><p class="Normal" xss=removed><span xss=removed><strong xss=removed>Đầu tiên là nguồn cung đầu nguồn đã không còn dồi dào như trước. </strong></span>Vụ Thị trường trong nước (Bộ Công Thương) thừa nhận, nguyên nhân chính khiến loạt cửa hàng bán lẻ xăng dầu đóng cửa, ngừng bán xuất phát từ việc các doanh nghiệp đầu mối không có đủ nguồn tài chính để nhập hàng. Họ chỉ duy trì lượng hàng đủ để cung cấp cho hệ thống phân phối của mình và duy trì lượng dự trữ tồn kho theo quy định.</p><p class="Normal" xss=removed>Lãnh đạo một doanh nghiệp tại phía Nam chia sẻ, trước đây 3 tỷ đồng nhập được 2 tàu, nhưng giá hiện đã tăng vọt. "Cùng số tiền đó, giờ chỉ nhập được 1-1,5 tàu, mà vay ngân hàng thì khó do room tín dụng cạn", ông bộc bạch.</p><p class="Normal" xss=removed>Còn theo Bộ Tài chính, nguồn hàng ít hơn một phần vì chính các doanh nghiệp đầu mối hiện cũng e dè hơn khi nhập khẩu do giá thế giới biến động khó lường, nguy cơ thua lỗ cao. Bộ này dẫn số liệu từ hải quan cho thấy, trong quý III, sản lượng nhập khẩu giảm 40% với xăng, 35% với dầu diesel so với quý II. Ngoài 3 đầu mối nhập nhiên liệu cho máy bay, chỉ 19 trong số 33 doanh nghiệp đầu mối xăng dầu còn lại nhập khẩu.</p><p class="Normal" xss=removed>Cũng trong thời gian này, hàng loạt doanh nghiệp đầu mối bị rút giấy phép trong 1-1,5 tháng, đồng nghĩa họ cũng không thể tham gia nhập khẩu hoặc mua từ nguồn trong nước. Sau khi được trả giấy phép, các doanh nghiệp này cũng chưa thể nối lại việc nhập khẩu ngay do thời gian đàm phán mua, hàng về cảng nhanh nhất cũng 2-3 tuần.</p><p class="Normal" xss=removed>Có 5 doanh nghiệp đầu mối xăng dầu được hoãn lại việc rút giấy phép, nhưng sau khi có thông tin xử phạt, nguồn tin của <em xss=removed>VnExpress</em> cho biết, họ cũng bị ngân hàng siết tín dụng, không có nguồn tài chính nên ảnh hưởng tới nhập khẩu hàng.</p><p class="Normal" xss=removed>Tình hình bão lũ xảy ra tại miền Trung vừa qua cũng ảnh hưởng tới tiến độ nhập hàng. Như tại Saigon Petro, kế hoạch nhập 12.000 m3 xăng dầu từ nhà máy lọc dầu trong nước phải dời lại.</p><p class="Normal" xss=removed><span xss=removed><strong xss=removed>Tiếp đến là vấn đề về chiết khấu </strong></span>- nguyên nhân chính khiến các doanh nghiệp bán xăng dầu không muốn tiếp tục kinh doanh. Chiết khấu là khoản thoả thuận, giảm giá của đơn vị bán buôn xăng dầu (đầu mối, tổng đại lý, thương nhân phân phối) cho doanh nghiệp bán lẻ, chủ các cây xăng về 0 đồng, thậm chí âm.</p><p class="Normal" xss=removed>Khi nguồn cung dồi dào, giá thế giới giảm, doanh nghiệp đầu mối, thương nhân phân phối tăng chiết khấu cho cửa hàng, đại lý bán lẻ để đẩy lượng bán ra. Ngược lại, giá thế giới tăng, họ giảm mức chiết khấu này.</p><p class="Normal" xss=removed>Thậm chí gần đây xảy ra tình trạng chiết khấu âm. Theo phản ánh của một số chủ doanh nghiệp bán lẻ, các doanh nghiệp phân phối bán ra cho các cây xăng với giá cao hơn giá bán lẻ quy định, bằng cách thu thêm phí vận chuyển vào một hóa đơn khác. Vì thế, khi cộng phí vận chuyển, doanh nghiệp bán hàng ra với mức giá thấp hơn khi họ nhập về, khiến họ bị âm vốn.</p><p class="Normal" xss=removed>Ông Giang Chấn Tây, sở hữu 6 cửa hàng xăng dầu ở Trà Vinh, cho rằng doanh nghiệp bán lẻ là khâu cuối trong chuỗi cung ứng, cung cấp xăng dầu trực tiếp cho người tiêu dùng nhưng không được quan tâm đúng mức. "Càng bán ra càng lỗ. Một mặt do đứt nguồn cung mặt khác chủ cây xăng sợ lỗ nên không dám nhập hàng về", ông giải thích.</p><figure data-size="true" itemprop="associatedMedia image" itemscope="" itemtype="http://schema.org/ImageObject" class="tplCaption action_thumb_added" xss=removed><div class="fig-picture" xss=removed><picture xss=removed><source data-srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=ibQmeD9IzrOfguDOvoSJag 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=hFKGoYR-EK0dS1pITNHYGQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=sB2GKcgXS4mLZqTaBA5i1Q 2x" srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=ibQmeD9IzrOfguDOvoSJag 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=hFKGoYR-EK0dS1pITNHYGQ 1.5x, https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&h=0&q=100&dpr=2&fit=crop&s=sB2GKcgXS4mLZqTaBA5i1Q 2x" xss=removed><img itemprop="contentUrl" loading="lazy" intrinsicsize="680x0" alt="Cửa hàng trên đường Cộng Hoà, quận Tân Bình thông báo hết xăng kèm lý do đứt gãy nguồn hàng, ngày 12/10. Ảnh: Quỳnh Trần" class="lazy lazied" src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=ibQmeD9IzrOfguDOvoSJag" data-src="https://i1-kinhdoanh.vnecdn.net/2022/10/12/-6261-1665558593.jpg?w=680&h=0&q=100&dpr=1&fit=crop&s=ibQmeD9IzrOfguDOvoSJag" data-ll-status="loaded" xss=removed></picture></div><figcaption itemprop="description" xss=removed><p class="Image" xss=removed>Cửa hàng trên đường Cộng Hoà, quận Tân Bình thông báo hết xăng kèm lý do "đứt gãy nguồn hàng", ngày 12/10. <em xss=removed>Ảnh: Quỳnh Trần</em></p></figcaption></figure><p class="Normal" xss=removed><span xss=removed><strong xss=removed>Giá xăng chưa thỏa đáng </strong></span>cũng là nguyên nhân khiến các doanh nghiệp nói "không muốn tiếp tục kinh doanh". Giá cơ sở xăng dầu mỗi kỳ điều hành do liên Bộ Công Thương - Tài chính quyết định, là căn cứ để xác định mức giá bán lẻ mỗi lít nhiên liệu cho người tiêu dùng. Nhưng theo 36 doanh nghiệp đã gửi đơn kiến nghị lên Thủ tướng, chi phí thực tế chưa được phản ánh đầy đủ và nhà điều hành chậm điều chỉnh các <a href="https://vnexpress.net/se-xem-xet-dieu-chinh-chi-phi-kinh-doanh-xang-dau-4518026.html" rel="dofollow" xss=removed>chi phí kinh doanh</a><span xss=removed>, </span>kìm giá khiến bất ổn gia tăng.</p><p class="Normal" xss=removed>Trong chi phí kinh doanh có khoản đưa xăng dầu về đến cảng, chi phí vận tải tạo nguồn trong nước... Các phụ phí, chi phí kinh doanh này vừa qua tăng 7-8 lần so với trước đây và chưa được phán ánh đủ trong giá cơ sở. Hiện chi phí vận chuyển từ nước ngoài về Việt Nam đã được Bộ Tài chính điều chỉnh từ kỳ điều hành 21/9; còn chi phí vận chuyển xăng dầu từ nhà máy về cảng và premium trong nước tới hôm qua, ở kỳ điều hành ngày 11/10, mới điều chỉnh</p><p class="Normal" xss=removed>Do đó, khi chưa được điều chỉnh chi phí hợp lý khiến kinh doanh bị lỗ, nhà cung cấp (đầu mối, thương nhân phân phối) hạn chế bán ra. Điển hình là hơn một tuần nay, từ sau kỳ điều hành 3/10, nguồn cung từ các thương nhân đầu mối bán ra rất ít, chỉ cung cấp một lượng rất nhỏ với những doanh nghiệp có hợp đồng, để "cầm cự qua ngày".</p><p class="Normal" xss=removed>Ông Lê Văn Mỵ, Tổng giám đốc Công ty cổ phần thương mại Hóc Môn - đơn vị đang sở hữu 11 cửa hàng và 21 đại lý bán lẻ ở TP HCM cho biết, từ đầu năm đến nay công ty ông đã lỗ 8 tỷ đồng. Ông lo ngại nếu vẫn cứ thiếu cung, chiết khấu về 0 đồng, doanh nghiệp có nguy cơ giải thể.</p><p class="Normal" xss=removed>Mỗi ngày tổng sản lượng tiêu thụ xăng dầu bình quân của TP HCM khoảng 6.880 m3, nhưng một tuần qua luôn ghi nhận thiếu hụt. Lãnh đạo một doanh nghiệp tại phía Nam - nơi xảy ra chủ yếu việc khan hiếm xăng - chia sẻ, điều quan trọng trong kinh doanh là lợi nhuận phải đảm bảo, nhưng triền miên khó khăn, thua lỗ từ đầu mối, thương nhân phân phối tới đại lý thì rất khó.</p><p class="Normal" xss=removed>"Cái gốc là giá, tức là các yếu tố cấu thành trong giá cơ sở phải đảm bảo tính đúng, đủ để ít nhất doanh nghiệp hoà vốn", ông nêu.</p><figure class="item_slide_show clearfix" xss=removed><div id="video_parent_364576" class="box_embed_video_parent embed_video_new" data-vcate="1003834" data-vscate="1003004" data-vscaten="Thời sự" data-vid="364576" data-ratio="1" data-articleoriginal="4521984" data-ads="1" data-license="1" data-duration="122" data-brandsafe="0" data-type="0" data-play="1" data-frame="" data-aot="Mua bán căng thẳng ở cây xăng" data-videoclassify="Ban Video" data-initdom="1" data-view="inview" data-auto="1" data-status="play" xss=removed><div id="embed_video_364576" class="box_embed_video" xss=removed><div class="bg_overlay_small_unpin" xss=removed></div><div class="bg_overlay_small" xss=removed></div><div class="embed-container" xss=removed><div id="video-364576" xss=removed><div id="parser_player_364576" class="media_content" xss=removed><div id="videoContainter_364576" class="videoContainter" xss=removed><div class="video-js vjs-default-skin vjs-controls-enabled vjs-workinghover vjs-v7 media-video-364576-dimensions vjs-has-started vjs-paused vjs-ended vjs-user-inactive" data-ex="st=1&bs=0&pt=1" adsconfig="{" ads?iu=\\/27973503\\/Vnexpress\\/Desktop\\/Instream.preroll\\/Kinhdoanh\\/Kinhdoanh.detail&description_url vnexpress.net&tfcd=0&npa sz=640x360&gdfp_req output=vast&unviewed_position_start env=vp&impl s&correlator="," id="div-gpt-ad-overlay"><div xss=removed></div></div>[removed]var gR=!0,sR="div-overlay-0"+Math.round(1E6*Math.random()),eL=document.getElementById("div-gpt-ad-overlay");if(eL){eL.firstChild.id=sR;if(!window.googletag||!googletag.apiReady){gR=!1;var googletag=window.googletag||{cmd:[]},sb=document.getElementsByTagName("script")[0],sa=document.createElement("script");sa.setAttribute("type","text/javascript");sa.setAttribute("src","https://www.googletagservices.com/tag/js/gpt.js");sa.setAttribute("async","true");sb[removed].appendChild(sa)}try{googletag.cmd.push(function(){var a=googletag.defineSlot("/27973503/Vnexpress/Desktop/Overlay/Kinhdoanh/Kinhdoanh.detail",["fluid", [480, 70]],sR);a&&(a.addService(googletag.pubads()),gR?googletag.pubads().refresh([a]):(googletag.pubads().enableSingleRequest(),googletag.enableServices(),googletag.pubads().refresh([a])))})}catch(a){}};[removed]","size":"480x70","offset":"30%","skipOffset":"00:00:01","duration":"00:00:15"}]}" ads="" active-mode="720" data-subtitle="0" max-mode="720" data-mode="240|360|480|720" type="application/x-mpegURL" src="https://d1.vnecdn.net/vnexpress/video/video/web/mp4/,240p,360p,480p,,/2022/10/11/tranh-cai-khi-mua-xang-1665474761/vne/master.m3u8" webkit-playsinline="" playsinline="true" preload="auto" id="media-video-364576" lang="vi" role="region" aria-label="Video Player" style="margin: 0px; padding: 0px; text-rendering: optimizelegibility; width: 670px; height: 376.875px; vertical-align: top; color: rgb(255, 255, 255); position: relative; font-size: 10px; line-height: 1; font-family: Arial, Helvetica, sans-serif; user-select: none;"><div class="vjs-text-track-display" aria-live="off" aria-atomic="true" xss=removed></div><div class="vjs-loading-spinner" dir="ltr" xss=removed><span class="vjs-control-text" xss=removed>Video Player is loading.</span></div>&lt;button class="vjs-big-play-button" type="button" title="" aria-disabled="false" style="padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background: url([removed]PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4NCjwhLS0gR2VuZXJhdG9yOiBBZG9iZSBJbGx1c3RyYXRvciAxNi4wLjMsIFNWRyBFeHBvcnQgUGx1Zy1JbiAuIFNWRyBWZXJzaW9uOiA2LjAwIEJ1aWxkIDApICAtLT4NCjwhRE9DVFlQRSBzdmcgUFVCTElDICItLy9XM0MvL0RURCBTVkcgMS4xLy9FTiIgImh0dHA6Ly93d3cudzMub3JnL0dyYXBoaWNzL1NWRy8xLjEvRFREL3N2ZzExLmR0ZCI+DQo8c3ZnIHZlcnNpb249IjEuMSIgaWQ9IkxheWVyXzEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgeG1sbnM6eGxpbms9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkveGxpbmsiIHg9IjBweCIgeT0iMHB4Ig0KCSB3aWR0aD0iNTBweCIgaGVpZ2h0PSI1MHB4IiB2aWV3Qm94PSItMSAtMSA1MCA1MCIgZW5hYmxlLWJhY2tncm91bmQ9Im5ldyAtMSAtMSA1MCA1MCIgeG1sOnNwYWNlPSJwcmVzZXJ2ZSI+DQo8cmVjdCB4PSItMSIgeT0iLTEiIGZpbGw9Im5vbmUiIHdpZHRoPSI1MCIgaGVpZ2h0PSI1MCIvPg0KPGNpcmNsZSBmaWxsPSJub25lIiBzdHJva2U9IiNGRkZGRkYiIHN0cm9rZS13aWR0aD0iNCIgc3Ryb2tlLWxpbmVjYXA9InJvdW5kIiBjeD0iMjQiIGN5PSIyNCIgcj0iMjIuNSIvPg0KPHBvbHlnb24gZmlsbD0iI0ZGRkZGRiIgcG9pbnRzPSIxOC41MzEsMTEuNTg3IDE4LjUzMSwzNi40MTMgMzcuMjgsMjQgIi8+DQo8L3N2Zz4NCg==") center center / auto 20% no-repeat rgba(0, 0, 0, 0.1); transition: all 0.5s ease 0s; appearance: none; position: absolute; top: 0px; left: 0px; opacity: 0.85; width: 670px; height: 376.875px;"&gt;<span aria-hidden="true" class="vjs-icon-placeholder" xss=removed></span><span class="vjs-control-text" aria-live="polite" xss=removed></span>&lt;/button&gt;<div class="vjs-control-bar" dir="ltr" xss=removed>&lt;button class="vjs-play-control vjs-control vjs-button vjs-paused vjs-ended" type="button" title="Replay" aria-disabled="false" style="padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: none 0s ease 0s; appearance: none; position: relative; height: 50px; width: 5em; flex: 0 0 auto;"&gt;<span aria-hidden="true" class="vjs-icon-placeholder" xss=removed></span><span class="vjs-control-text" aria-live="polite" xss=removed>Replay</span>&lt;/button&gt;<div class="vjs-current-time vjs-time-control vjs-control" xss=removed><span class="vjs-control-text" xss=removed>Hiện tại </span><span class="vjs-current-time-display" aria-live="off" xss=removed>2:02</span></div><div class="vjs-time-control vjs-time-divider" xss=removed><div xss=removed><span xss=removed>/</span></div></div><div class="vjs-duration vjs-time-control vjs-control" xss=removed><span class="vjs-control-text" xss=removed>Thời lượng </span><span class="vjs-duration-display" aria-live="off" xss=removed>2:02</span></div><div class="vjs-progress-control vjs-control" xss=removed><div tabindex="0" class="vjs-progress-holder vjs-slider vjs-slider-horizontal" role="slider" aria-valuenow="100.00" aria-valuemin="0" aria-valuemax="100" aria-label="Progress Bar" aria-valuetext="2:02 of 2:02" xss=removed><div class="vjs-load-progress" xss=removed><span class="vjs-control-text" xss=removed><span xss=removed>Đã tải</span>: 0%</span><div xss=removed></div></div><div class="vjs-play-progress vjs-slider-bar" xss=removed><div class="vjs-time-tooltip" xss=removed></div><span class="vjs-control-text" xss=removed><span xss=removed>Tiến trình</span>: 0%</span></div></div></div><div class="vjs-volume-panel vjs-control vjs-volume-panel-vertical" xss=removed>&lt;button class="vjs-mute-control vjs-control vjs-button vjs-vol-0" type="button" title="Bỏ tắt tiếng" aria-disabled="false" style="padding: 0px 2em 3em; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: none 0s ease 0s; appearance: none; width: 5em; height: 50px; position: relative; flex: 0 0 auto;"&gt;<span aria-hidden="true" class="vjs-icon-placeholder" xss=removed></span><span class="vjs-control-text" aria-live="polite" xss=removed>Bỏ tắt tiếng</span>&lt;/button&gt;<div class="vjs-volume-control vjs-control vjs-volume-vertical" xss=removed><div tabindex="0" class="vjs-volume-bar vjs-slider-bar vjs-slider vjs-slider-vertical" role="slider" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" aria-label="Volume Level" aria-live="polite" aria-valuetext="0%" xss=removed><div class="vjs-volume-level" xss=removed><span class="vjs-control-text" xss=removed></span></div></div></div></div>&lt;button class="vjs-fullscreen-control vjs-control vjs-button" type="button" title="Toàn màn hình" aria-disabled="false" style="padding: 0px; box-sizing: inherit; text-rendering: optimizelegibility; border-width: initial; border-style: none; border-color: initial; outline: 0px; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; transition: none 0s ease 0s; appearance: none; position: relative; height: 50px; width: 5em; flex: 0 0 auto;"&gt;<span aria-hidden="true" class="vjs-icon-placeholder" xss=removed></span><span class="vjs-control-text" aria-live="polite" xss=removed>Toàn màn hình</span>&lt;/button&gt;</div><div class="fp-sound-status-container" id="364576_soundTopRight" xss=removed></div><div class="share-hover" xss=removed><a class="share-item" xss=removed>&lt;svg class="ic ic-face"&gt;<use xss=removed></use>&lt;/svg&gt;</a><a class="share-item" xss=removed>&lt;svg class="ic ic-twit"&gt;<use xss=removed></use>&lt;/svg&gt;</a><a class="share-item" xss=removed>&lt;svg class="ic ic-link"&gt;<use xss=removed></use>&lt;/svg&gt;</a></div></div></div></div></div></div></div></div><figcaption class="desc_cation" xss=removed><div class="inner_caption" xss=removed><p class="Image" xss=removed>Không khí căng thẳng khi mua xăng tại TP HCM. Video: <em xss=removed>Thịnh Việt - Điệp Khang</em></p></div></figcaption></figure><p class="Normal" xss=removed><span xss=removed><strong xss=removed>"Điều hành của hai bộ Công Thương, Tài chính <a href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" rel="dofollow" xss=removed>có vấn đề</a>",</strong></span> theo 36 doanh nghiệp kinh doanh tại TP HCM. Hai cơ quan được giao nhiệm vụ điều hành thị trường và <a href="https://vnexpress.net/chu-de/gia-xang-hom-nay-3026" rel="dofollow" xss=removed>giá xăng dầu </a>thời gian qua bị doanh nghiệp cho rằng "phản ứng chậm, và đùn đẩy trách nhiệm".</p><p class="Normal" xss=removed>Trước khi quyết định điều chỉnh chi phí kinh doanh xăng dầu được Bộ Tài chính đưa ra ngày 7/10, Bộ Công Thương cho hay đã ít nhất 4 lần đề xuất cơ quan này điều chỉnh, nhưng chưa được đồng thuận. Bộ này đánh giá việc điều chỉnh chậm là nguyên nhân khiến chiết khấu giảm về 0, cửa hàng bán lẻ bị lỗ...</p><p class="Normal" xss=removed>Trong khi đó, Bộ Tài chính cho rằng việc đảm bảo nguồn cung xăng dầu, các chi phí trung gian, tiết giảm chi phí quản trị doanh nghiệp xăng dầu thuộc trách nhiệm của Bộ Công Thương và các doanh nghiệp.</p><p class="Normal" xss=removed>Bộ trưởng Tài chính Hồ Đức Phớc ngày 10/10 thừa nhận có trách nhiệm trong đưa ra chi phí định mức kinh doanh xăng dầu và tham mưu Chính phủ trình Quốc hội các khoản thuế phí với xăng dầu. Tuy nhiên, quản lý doanh nghiệp đầu mối, doanh nghiệp phân phối và bán lẻ thuộc về trách nhiệm của Bộ Công Thương.</p><div class="width_common box-tinlienquanv2 " xss=removed><article class="item-news" xss=removed><div class="thumb-art" xss=removed><a href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" data-itm-source="#vn_source=Detail-KinhDoanh_ViMo-4521590&vn_campaign=Box-TinXemThem&vn_medium=Item-1&vn_term=Desktop&vn_thumb=1" class="thumb thumb-5x3" title="Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" data-itm-added="1" xss=removed><picture xss=removed><source data-srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=fB3_KEuch8SjEI_kAWsgSg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&h=108&q=100&dpr=2&fit=crop&s=aEt0kGO9WFmxC0uymfC6mA 2x" srcset="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=fB3_KEuch8SjEI_kAWsgSg 1x, https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&h=108&q=100&dpr=2&fit=crop&s=aEt0kGO9WFmxC0uymfC6mA 2x" xss=removed><img loading="lazy" intrinsicsize="180x108" alt="Doanh nghiệp xăng dầu\\: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" class="lazy lazied" src="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=fB3_KEuch8SjEI_kAWsgSg" data-src="https://i1-kinhdoanh.vnecdn.net/2022/10/07/-1507-1665148345.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=fB3_KEuch8SjEI_kAWsgSg" data-ll-status="loaded" xss=removed></picture></a></div><h4 class="title-news" xss=removed><a href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" data-itm-source="#vn_source=Detail-KinhDoanh_ViMo-4521590&vn_campaign=Box-TinXemThem&vn_medium=Item-1&vn_term=Desktop&vn_thumb=1" title="Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" data-itm-added="1" xss=removed>Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''</a></h4><p class="description" xss=removed><a data-itm-source="#vn_source=Detail-KinhDoanh_ViMo-4521590&vn_campaign=Box-TinXemThem&vn_medium=Item-1&vn_term=Desktop&vn_thumb=1" href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html" title="Doanh nghiệp xăng dầu: Bộ Công Thương, Tài chính ''điều hành có vấn đề''" data-itm-added="1" xss=removed>Các doanh nghiệp cho rằng cơ quan quản lý điều hành xăng dầu trái với quy luật cung cầu, để giá mua cao hơn bán khiến nhiều cây xăng thua lỗ, đóng cửa.</a> <span class="meta-news" xss=removed><a class="count_cmt" href="https://vnexpress.net/doanh-nghiep-to-bo-cong-thuong-tai-chinh-dieu-hanh-xang-dau-co-van-de-4520554.html#box_comment_vne" xss=removed>&lt;svg class="ic ic-comment"&gt;<use xss=removed></use>&lt;/svg&gt; <span class="font_icon widget-comment-4520554-1" xss=removed>230</span></a></span></p></article></div><p class="Normal" xss=removed>Các phụ phí, chi phí kinh doanh xăng dầu thực tế đã được điều chỉnh từ kỳ điều hành 11/10, song theo các doanh nghiệp, vẫn có độ trễ. Theo họ, nếu nhà chức trách rà soát, điều chỉnh các chi phí này từ kỳ điều hành trong tháng 9, thuận lợi hơn nhiều do thời điểm này giá xuống thấp. Còn với kỳ điều hành 11/10, <a href="https://vnexpress.net/gia-xang-dau-ngay-mai-co-the-tang-tro-lai-4521151.html" rel="dofollow" xss=removed>giá xăng đã tăng trở lại</a> sau 3 kỳ giảm liên tiếp.</p><p class="Normal" xss=removed>PGS.TS Đinh Trọng Thịnh cũng cho rằng "đang có vấn đề" trong điều hành thị trường xăng dầu của liên Bộ. Theo ông, cơ chế giữa doanh nghiệp đầu mối - phân phối và bán lẻ chưa rõ ràng; nên chuyện "ép giá" xảy ra. Bộ Công Thương cũng chưa tính đúng, tính đủ nhu cầu và sản lượng tiêu thụ của từng địa phương.</p><p class="Normal" xss=removed>"Cần phải cụ thể từng tháng, từng quý để đảm bảo nhu cầu, không để thiếu đột xuất", ông nhìn nhận. Ngoài ra, quy định về kiểm tra, phân phối hạn mức nhập khẩu đã có, nhưng việc giám sát các đầu mối có nhập đúng, đủ theo đúng thời hạn quy định hay không, lại chưa chặt chẽ, khiến thực tế quý III vừa qua có tới 2/3 đầu mối không nhập khẩu, gây thiếu hụt nguồn hàng.</p><p class="Normal" xss=removed>Ở góc độ cơ quan quản lý giá xăng dầu, Bộ Tài chính chưa kịp thời cập nhật những thay đổi về chi phí trong cơ cấu giá bán, khiến doanh nghiệp thua lỗ.</p><p class="Normal" xss=removed>Tại phiên họp thứ 16 của Uỷ ban Thường vụ Quốc hội ngày 11/10, Ủy ban Kinh tế khi thẩm tra báo cáo kinh tế xã hội 2022, kế hoạch 2023 của Chính phủ cũng đề nghị phân tích rõ nguyên nhân trong điều hành giá xăng dầu. Việc này để rút ra bài học kinh nghiệm và có giải pháp ứng phó phù hợp, kịp thời khi giá xăng dầu thế giới có những diễn biến bất lợi trong tương lai.</p>', 'AWvaYDttM', NULL, '');


--
-- Data for Name: articlecomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articlecomment VALUES ('35vJP2Lnb', 'j3xlD3DIt', 'abw6F9-ap', 'uEyz9MqaM', 'test 3', '2022-11-08 06:03:04.285+00', NULL, NULL);
INSERT INTO public.articlecomment VALUES ('rkKu76p-r', 'j3xlD3DIt', 'abw6F9-ap', 'uEyz9MqaM', 'test 4', '2022-11-08 06:03:19.611+00', NULL, NULL);
INSERT INTO public.articlecomment VALUES ('luSQpIQlO', 'XstrMmbor', 'abw6F9-ap', 'uEyz9MqaM', 'game cho * choi a', '2022-11-09 10:01:30.371+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('fV3_2Jcnv', 'XstrMmbor', 'abw6F9-ap', 'uEyz9MqaM', 'best ending', '2022-11-09 10:13:10.788+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('patkthInN', '0v79DeRaC', 'abw6F9-ap', 'uEyz9MqaM', 'aaaa', '2022-11-10 04:04:48.333+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('r3Jyws4it', '0v79DeRaC', 'abw6F9-ap', 'uEyz9MqaM', 'soloko', '2022-11-10 06:45:20.124+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('5ao19HoT1', 'BwscWRPYB', 'abw6F9-ap', 'uEyz9MqaM', 'fine', '2023-03-27 06:57:22.833+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('D_j7MhdTU', 'Peo0sio7x', 'abw6F9-ap', 'uEyz9MqaM', '!@#', '2023-03-27 07:48:50.738+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('HKYriMyKE', 'BwscWRPYB', 'abw6F9-ap', 'uEyz9MqaM', 'water', '2023-03-28 07:43:17.364+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('4le5TenHE', 'BwscWRPYB', 'abw6F9-ap', 'uEyz9MqaM', 'loo', '2023-03-28 07:50:06.049+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('ArJsh0Y0t', 'CaP4JWfMW', 'abw6F9-ap', 'pu65Tr6FE', 'yo', '2023-04-03 03:17:13.629+00', NULL, '{}');
INSERT INTO public.articlecomment VALUES ('CVxNU5xOe', '7qUfAFE_z', 'abw6F9-ap', 'pu65Tr6FE', 'hi', '2023-04-03 07:22:53.619+00', NULL, '{}');


--
-- Data for Name: articlecommentinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articlecommentinfo VALUES ('CVxNU5xOe', 0, 1);


--
-- Data for Name: articlecommentreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articlecommentreaction VALUES ('CVxNU5xOe', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-03 07:22:55.016+00', 1);


--
-- Data for Name: articlecommentthread; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articlecommentthread VALUES ('7qUfAFE_z', 'abw6F9-ap', 'pu65Tr6FE', 'yup', '2023-04-03 07:22:28.309+00', NULL, '{}');


--
-- Data for Name: articlecommentthreadinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articlecommentthreadinfo VALUES ('0v79DeRaC', 2, 0);
INSERT INTO public.articlecommentthreadinfo VALUES ('UhZ1uBuNi', 0, 1);
INSERT INTO public.articlecommentthreadinfo VALUES ('xHeq3KlUq', 0, 0);
INSERT INTO public.articlecommentthreadinfo VALUES ('XstrMmbor', 2, 0);
INSERT INTO public.articlecommentthreadinfo VALUES ('Peo0sio7x', 1, 0);
INSERT INTO public.articlecommentthreadinfo VALUES ('BwscWRPYB', 3, 0);
INSERT INTO public.articlecommentthreadinfo VALUES ('CaP4JWfMW', 1, 0);
INSERT INTO public.articlecommentthreadinfo VALUES ('7qUfAFE_z', 1, 1);


--
-- Data for Name: articlecommentthreadreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articlecommentthreadreaction VALUES ('7qUfAFE_z', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-03 07:22:45.504+00', 1);


--
-- Data for Name: articleinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articleinfo VALUES ('abw6F9-ap', 3.2000000000000000, 0, 0, 4, 1, 0, 5, 16);



--
-- Data for Name: articleratecomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articleratecomment VALUES ('LPRa64I3p', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'yooo', '2023-03-27 09:58:46.409', NULL, NULL, true);
INSERT INTO public.articleratecomment VALUES ('jf1hIVDHf', 'abw6F9-ap', 'uEyz9MqaM', 'uEyz9MqaM', 'yolo', '2023-03-27 11:01:08.198', NULL, NULL, false);


--
-- Data for Name: articleratereaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.articleratereaction VALUES ('abw6F9-ap', 'uEyz9MqaM', 'pu65Tr6FE', '2023-04-03 09:21:09.311', 1);


--
-- Data for Name: authencodes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: authentication; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: brand; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brand VALUES ('Sony');
INSERT INTO public.brand VALUES ('Samsung');
INSERT INTO public.brand VALUES ('Canon');
INSERT INTO public.brand VALUES ('Nikon');
INSERT INTO public.brand VALUES ('Olypus');
INSERT INTO public.brand VALUES ('Xiaomi');
INSERT INTO public.brand VALUES ('Apple');
INSERT INTO public.brand VALUES ('Disney');


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category VALUES ('action', 'action', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.category VALUES ('comedy', 'comedy', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.category VALUES ('camera', 'camera', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.category VALUES ('mobiphone', 'mobiphone', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.category VALUES ('technological', 'technological', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.category VALUES ('apple', 'apple', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.category VALUES ('laptop', 'laptop', 'A', NULL, NULL, NULL, NULL);


--
-- Data for Name: cinema; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cinema VALUES ('CGV1', 'CGV Thu Duc', '216 Đ. Võ Văn Ngân, Bình Thọ, Thủ Đức, T', 'CGV', 'A', NULL, NULL, 'https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/PvYGRnrtp_pup.jpg', NULL, NULL, NULL, NULL, '{"{\"url\": \"https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/O6EC3CztM_dog3.jfif\", \"type\": \"image\"}","{\"url\": \"https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/trvCFk-tp_pup.jpg\", \"type\": \"image\"}"}', 'https:/storage.googleapis.com/go-firestore-rest-api.appspot.com/sub/hiF_Fk-tM_cover.jpg');


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company VALUES ('id4', 'Softwave company', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'I', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', 'https://www.josephfiler.com/images/xl/Canada-Peggys-Cove-0406-Pano-Edit-Edit.jpg', NULL);
INSERT INTO public.company VALUES ('id5', 'Softwave company', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'I', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', 'https://www.josephfiler.com/images/xl/Canada-Peggys-Cove-0406-Pano-Edit-Edit.jpg', NULL);
INSERT INTO public.company VALUES ('mb-bank', 'MBX Bank', 'This is description', 'Cau Giay, Ha Noi', 500, 'A', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', 'https://www.josephfiler.com/images/xl/Canada-Peggys-Cove-0406-Pano-Edit-Edit.jpg', NULL);
INSERT INTO public.company VALUES ('onsky-vietnam', 'ONKY VIETNAM', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'A', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', 'https://www.josephfiler.com/images/xl/Canada-Peggys-Cove-0406-Pano-Edit-Edit.jpg', NULL);
INSERT INTO public.company VALUES ('nab', 'NAB X Centre Vietnam', 'This is description', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 500, 'A', '2022-07-20 17:00:00+00', '{Categories1,Categories2}', 'https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg', 'https://www.josephfiler.com/images/xl/Canada-Peggys-Cove-0406-Pano-Edit-Edit.jpg', NULL);


--
-- Data for Name: company_users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company_users VALUES ('mb-bank', 'uEyz9MqaM');


--
-- Data for Name: companycategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companycategory VALUES ('Entertainment', 'Entertainment', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.companycategory VALUES ('Financial business', 'Financial business', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.companycategory VALUES ('Industrial production', 'Industrial production', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.companycategory VALUES ('Real estate business', 'Real estate business', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.companycategory VALUES ('Business services', 'Business services', 'A', NULL, NULL, NULL, NULL);


--
-- Data for Name: companycomment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: companyrate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companyrate VALUES ('mb-bank', 'pu65Tr6FE', 4, '2023-05-12 13:40:29.215469', '', 0, 0, NULL, '{3,4,4,4,5}', false);


--
-- Data for Name: companyratefullinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companyratefullinfo VALUES ('mb-bank', 4, 3, 4, 4, 4, 5, 1, 4);


--
-- Data for Name: companyrateinfo01; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companyrateinfo01 VALUES ('mb-bank', 3, 0, 0, 1, 0, 0, 1, 3);


--
-- Data for Name: companyrateinfo02; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companyrateinfo02 VALUES ('mb-bank', 4, 0, 0, 0, 1, 0, 1, 4);


--
-- Data for Name: companyrateinfo03; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companyrateinfo03 VALUES ('mb-bank', 4, 0, 0, 0, 1, 0, 1, 4);


--
-- Data for Name: companyrateinfo04; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companyrateinfo04 VALUES ('mb-bank', 4, 0, 0, 0, 1, 0, 1, 4);


--
-- Data for Name: companyrateinfo05; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.companyrateinfo05 VALUES ('mb-bank', 5, 0, 0, 0, 0, 1, 1, 5);


--
-- Data for Name: companyratereaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.countries VALUES ('Vietnam');
INSERT INTO public.countries VALUES ('United State');
INSERT INTO public.countries VALUES ('England');
INSERT INTO public.countries VALUES ('Chinese');
INSERT INTO public.countries VALUES ('Australia');


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.film VALUES ('00001', 'The Shawshank Redemption', NULL, 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg', 'https://www.imdb.com/video/vi3877612057?playlistId=tt0111161&ref_=tt_pr_ov_vi', '{drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00002', 'Thor: Love and Thunder', NULL, 'https://genk.mediacdn.vn/139269124445442048/2022/4/19/2-16503255592162067496114.jpg', 'https://www.youtube.com/watch?v=tgB1wUcmbbw', '{drama,crime}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00003', 'Top Gun: Maverick', NULL, 'https://www.cgv.vn/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/t/o/top_gun_maverick_-_poster_28.03_1_.jpg', 'https://www.youtube.com/watch?v=yM389FbhlRQ', '{action,drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00004', 'The Batman', NULL, 'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_batman-1.jpg', 'https://youtu.be/761uRaAoW00', '{action,crime,drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00005', 'The Sadness', NULL, 'https://phimnhua.com/wp-content/uploads/2022/04/phimnhua_1650248826.jpg', 'https://www.youtube.com/watch?v=axjme4v-xRo', '{horror}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00006', 'Doctor Strange in the Multiverse of Madness', NULL, 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg', 'https://www.imdb.com/video/vi3877612057?playlistId=tt0111161&ref_=tt_pr_ov_vi', '{action,adventure,fantasy}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00007', 'Fantastic Beasts: The Secrets of Dumbledore', NULL, 'https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/04/review-phim-sinh-vat-huyen-bi-3-fantastic-beasts-3-2-696x1031.jpg?fit=700,20000&quality=95&ssl=1', 'https://youtu.be/Y9dr2zw-TXQ', '{family,adventure,fantasy}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00008', 'The Adam Project', NULL, 'http://photos.q00gle.com/storage/files/images-2021/images-movies/09/622b6789e7084.jpg', 'https://youtu.be/IE8HIsIrq4o', '{action,comedy,adventure}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00009', 'Spider-Man: No Way Home', NULL, 'https://gamek.mediacdn.vn/133514250583805952/2021/11/17/photo-1-1637118381839432740223.jpg', 'https://www.youtube.com/watch?v=OB3g37GTALc', '{action,adventure,fantasy}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.film VALUES ('00010', 'Dune', NULL, 'https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/d/u/dune-poster-1.jpg', 'https://youtu.be/8g18jFHCLXk', '{action,adventure,drama}', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', NULL, NULL, NULL, NULL);


--
-- Data for Name: filmcasts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmcasts VALUES ('Will Smith');
INSERT INTO public.filmcasts VALUES ('Leonardo DiCaprio');
INSERT INTO public.filmcasts VALUES ('Tom Hanks');
INSERT INTO public.filmcasts VALUES ('Samuel L. Jackson');
INSERT INTO public.filmcasts VALUES ('Robert Downey Jr.');
INSERT INTO public.filmcasts VALUES ('Johnny Deep');
INSERT INTO public.filmcasts VALUES ('Benedict Cumberbatch');


--
-- Data for Name: filmcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmcategory VALUES ('adventure', 'adventure', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.filmcategory VALUES ('animated', 'animated', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.filmcategory VALUES ('comedy', 'comedy', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.filmcategory VALUES ('drama', 'drama', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.filmcategory VALUES ('horror', 'horror', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.filmcategory VALUES ('crime', 'crime', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.filmcategory VALUES ('fantasy', 'fantasy', 'A', NULL, NULL, NULL, NULL);
INSERT INTO public.filmcategory VALUES ('family', 'family', 'A', NULL, NULL, NULL, NULL);


--
-- Data for Name: filmcommentthread; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmcommentthread VALUES ('7_Pblhrzn', '00002', 'uEyz9MqaM', 'hi', '2023-03-29 07:07:55.007+00', NULL, '{}');
INSERT INTO public.filmcommentthread VALUES ('zfVUyEgHR', '00002', 'pu65Tr6FE', 'hi', '2023-04-03 02:19:55.2+00', NULL, '{}');
INSERT INTO public.filmcommentthread VALUES ('c0cWhmwdG', '00001', 'pu65Tr6FE', 'yo', '2023-04-03 06:50:22.819+00', NULL, '{}');
INSERT INTO public.filmcommentthread VALUES ('F5jCAtR9_', '00001', 'pu65Tr6FE', 'a', '2023-04-07 02:41:51.653+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('r3agdZQcJ', '00001', 'pu65Tr6FE', 'b', '2023-04-07 02:41:54.213+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('6QPDwt6b5', '00001', 'pu65Tr6FE', 'c', '2023-04-07 02:41:56.864+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('YL93OqP_L', '00001', 'pu65Tr6FE', 'd', '2023-04-07 02:41:59.205+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('hSU_DwgzF', '00001', 'pu65Tr6FE', 'e', '2023-04-07 02:42:01.597+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('GLNCpyjmd', '00001', 'pu65Tr6FE', 'f', '2023-04-07 02:42:03.832+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('QUuNhgAv1', '00001', 'pu65Tr6FE', 'g', '2023-04-07 02:42:06.346+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('JredRTfaH', '00001', 'pu65Tr6FE', 'k', '2023-04-07 02:42:14.781+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('G9VuEdWyn', '00001', 'pu65Tr6FE', 'l', '2023-04-07 02:42:18.26+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('Ujfc98cda', '00001', 'pu65Tr6FE', 'm', '2023-04-07 02:42:21.33+00', NULL, NULL);
INSERT INTO public.filmcommentthread VALUES ('dcj3Vb_Hs', '00001', 'pu65Tr6FE', 'hhhbaba', '2023-04-07 02:42:08.933+00', '2023-04-07 03:54:25.086+00', '{"{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"h\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhh\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhh b\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhh\"}","{\"time\": \"2023-04-07T02:42:08.933Z\", \"comment\": \"hhhba\"}"}');
INSERT INTO public.filmcommentthread VALUES ('Y7EcAhUMf', '00001', 'pu65Tr6FE', 'klka', '2023-04-07 02:42:11.496+00', '2023-04-07 04:19:56.03+00', '{"{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"j\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klk\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klka\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klkb\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klka\"}","{\"time\": \"2023-04-07T02:42:11.496Z\", \"comment\": \"klkb\"}"}');
INSERT INTO public.filmcommentthread VALUES ('Z2ENHmsM-', '00001', 'pu65Tr6FE', 'alo aboseyo', '2023-04-03 03:25:23.401+00', '2023-04-07 06:49:25.525+00', '{"{\"time\": \"2023-04-03T03:25:23.401Z\", \"comment\": \"alo\"}"}');
INSERT INTO public.filmcommentthread VALUES ('4kL4o6eeO', '00001', 'pu65Tr6FE', 'Filling the Resignation letter form. Signature of your Project manager and yours are requested.
Please return all of TMA’s equipment and get signature of IT/Security Department at Item I
And get signature of your Project Manager at item III and at the end of this document (Checklist of Resignation)', '2023-04-07 08:45:47.118+00', NULL, NULL);


--
-- Data for Name: filmcommentthreadinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmcommentthreadinfo VALUES ('r3agdZQcJ', 0, 0);
INSERT INTO public.filmcommentthreadinfo VALUES ('F5jCAtR9_', 0, 1);
INSERT INTO public.filmcommentthreadinfo VALUES ('4kL4o6eeO', 0, 0);
INSERT INTO public.filmcommentthreadinfo VALUES ('c0cWhmwdG', 1, 1);


--
-- Data for Name: filmcommentthreadreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmcommentthreadreaction VALUES ('F5jCAtR9_', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-07 07:22:43.099+00', 1);
INSERT INTO public.filmcommentthreadreaction VALUES ('c0cWhmwdG', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-07 07:45:13.396+00', 1);


--
-- Data for Name: filmdirectors; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmdirectors VALUES ('Steven Spielberg');
INSERT INTO public.filmdirectors VALUES ('Quentin Tarantino');
INSERT INTO public.filmdirectors VALUES ('christopher Nolan');
INSERT INTO public.filmdirectors VALUES ('Peter Jackson');
INSERT INTO public.filmdirectors VALUES ('Martin Scorsese');


--
-- Data for Name: filmproductions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmproductions VALUES ('Walt Disney Studios');
INSERT INTO public.filmproductions VALUES ('Warner Bros.');
INSERT INTO public.filmproductions VALUES ('Universal Pictures');
INSERT INTO public.filmproductions VALUES ('Paramount Pictures');
INSERT INTO public.filmproductions VALUES ('Lionsgate Films');


--
-- Data for Name: filmrate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmrate VALUES ('00010', 'uEyz9MqaM', 6, NULL, '', 0, 0, NULL, false);
INSERT INTO public.filmrate VALUES ('00001', 'uEyz9MqaM', 9, '2023-04-07 13:56:57.118', 'he', 1, 3, '{"{\"rate\": 4, \"time\": \"2023-03-20T03:19:11.113Z\", \"review\": \"Abc\"}","{\"rate\": 5, \"time\": \"2023-03-22T04:52:23.538Z\", \"review\": \"a\"}","{\"rate\": 4, \"time\": \"2023-04-04T04:37:46.812Z\", \"review\": \"a\"}","{\"rate\": 7, \"time\": \"2023-04-05T02:22:16.703Z\", \"review\": \"a\"}","{\"rate\": 5, \"time\": \"2023-04-05T07:16:50.336Z\", \"review\": \"a\"}"}', false);
INSERT INTO public.filmrate VALUES ('00001', 'pu65Tr6FE', 10, NULL, '', 1, 1, '{"{\"rate\": 7, \"time\": \"2023-04-07T04:21:30.048Z\", \"review\": \"hellu\"}","{\"rate\": 2, \"time\": \"2023-04-07T04:33:32.394Z\", \"review\": \"bello\"}","{\"rate\": 9, \"time\": \"2023-04-07T04:37:51.359Z\", \"review\": \"oh no\"}","{\"rate\": 2, \"time\": \"2023-04-07T06:24:55.001Z\", \"review\": \"abc\"}","{\"rate\": 9, \"time\": \"2023-04-07T06:25:20.593Z\", \"review\": \"abc\"}","{\"rate\": 2, \"time\": \"2023-04-07T06:54:15.12Z\", \"review\": \"haha\"}","{\"rate\": 7, \"time\": \"2023-04-07T06:54:39.294Z\", \"review\": \"huhu\"}","{\"rate\": 4, \"time\": \"2023-04-07T15:47:37.515Z\", \"review\": \"Filling the Resignation letter form. Signature of your Project manager and yours are requested. Please return all of TMA’s equipment and get signature of IT/Security Department at Item I And get signature of your Project Manager at item III and at the end of this document (Checklist of Resignation)\"}","{\"rate\": 5}"}', false);
INSERT INTO public.filmrate VALUES ('00002', 'uEyz9MqaM', 7, NULL, '', 1, 6, '{"{\"rate\": 8, \"time\": \"2023-03-29T14:05:15.874Z\", \"review\": \"poor\"}","{\"rate\": 7}","{\"rate\": 10}","{\"rate\": 6}"}', false);


--
-- Data for Name: filmratecomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmratecomment VALUES ('schiZMrme', '00002', 'uEyz9MqaM', 'pu65Tr6FE', 'g', '2023-04-03 10:05:33.564', NULL, NULL, false);
INSERT INTO public.filmratecomment VALUES ('cuJA0_nJo', '00001', 'pu65Tr6FE', 'pu65Tr6FE', 'Filling the Resignation letter form. Signature of your Project manager and yours are requested. Please return all of TMA’s equipment and get signature of IT/Security Department at Item I And get signature of your Project Manager at item III and at the end of this document (Checklist of Resignation)', '2023-04-07 11:47:53.237', '2023-04-07 15:47:46.036', '{"{\"time\": \"2023-04-07T04:47:53.237Z\", \"comment\": \"yolo\"}"}', false);
INSERT INTO public.filmratecomment VALUES ('NAzIzzLna', '00001', 'uEyz9MqaM', 'pu65Tr6FE', 'asd', '2023-04-10 15:07:32.926', NULL, NULL, false);
INSERT INTO public.filmratecomment VALUES ('0SlhMKCp0', '00001', 'uEyz9MqaM', 'uEyz9MqaM', 'hihu', '2023-04-17 14:35:19.251', '2023-04-17 14:38:06.85', '{"{\"time\": \"2023-04-17T07:35:19.251Z\", \"comment\": \"hi\"}"}', false);
INSERT INTO public.filmratecomment VALUES ('c69e2cec-3e0d-4411-be07-181c6889c140', '00001', 'uEyz9MqaM', 'pu65Tr6FE', 'dddd', '2023-05-12 16:31:45.770599', NULL, NULL, false);
INSERT INTO public.filmratecomment VALUES ('348218c5-2c78-4b74-9e75-859016366d64', '00002', 'uEyz9MqaM', 'uEyz9MqaM', '3333333', '2023-05-12 17:38:49.862271', NULL, NULL, true);
INSERT INTO public.filmratecomment VALUES ('8fe2f615-d818-4ea6-b7da-aea892583018', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'hihviehive', '2023-05-12 17:39:51.466364', NULL, NULL, false);
INSERT INTO public.filmratecomment VALUES ('c333aee9-f2e4-405f-9b83-8b84a275f2d8', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'hihihi', '2023-05-12 17:39:57.044337', NULL, NULL, false);
INSERT INTO public.filmratecomment VALUES ('e32bac47-e985-4c2c-88de-a3a32371e5f2', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'quan', '2023-05-12 17:40:20.190369', NULL, NULL, true);
INSERT INTO public.filmratecomment VALUES ('4cd628f9-2dcf-46fc-a172-66fdff2837dc', '00002', 'uEyz9MqaM', 'uEyz9MqaM', 'ddd', '2023-05-12 17:40:25.432491', NULL, NULL, false);


--
-- Data for Name: filmrateinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmrateinfo VALUES ('00001', 9.5000000000000000, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 2, 19);
INSERT INTO public.filmrateinfo VALUES ('00002', 7.0000000000000000, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 7);
INSERT INTO public.filmrateinfo VALUES ('00010', 6, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 6);


--
-- Data for Name: filmratereaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmratereaction VALUES ('00001', 'uEyz9MqaM', 'uEyz9MqaM', '2023-05-09 10:57:04.766763', 1);
INSERT INTO public.filmratereaction VALUES ('00001', 'pu65Tr6FE', 'uEyz9MqaM', '2023-05-09 10:57:07.771421', 1);
INSERT INTO public.filmratereaction VALUES ('00002', 'uEyz9MqaM', 'uEyz9MqaM', '2023-05-12 18:07:30.524149', 1);


--
-- Data for Name: filmreplycomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmreplycomment VALUES ('XFFVX-ZjP', 'c0cWhmwdG', '00001', 'pu65Tr6FE', 'oh hell', '2023-04-07 07:03:24.287+00', NULL, '{"{\"time\": \"2023-04-07T07:03:24.287Z\", \"comment\": \"oh hello\"}"}');
INSERT INTO public.filmreplycomment VALUES ('YUHwsZIap', 'c0cWhmwdG', '00001', 'pu65Tr6FE', 'test', '2023-05-12 10:37:23.097525+00', NULL, '{}');


--
-- Data for Name: filmreplycommentinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmreplycommentinfo VALUES ('wv5cx_a-e', 0, 2);
INSERT INTO public.filmreplycommentinfo VALUES ('XFFVX-ZjP', 0, 1);


--
-- Data for Name: filmreplycommentreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.filmreplycommentreaction VALUES ('wv5cx_a-e', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-07 07:02:51.738+00', 1);
INSERT INTO public.filmreplycommentreaction VALUES ('wv5cx_a-e', 'uEyz9MqaM', 'pu65Tr6FE', '2023-04-07 07:09:51.168+00', 1);
INSERT INTO public.filmreplycommentreaction VALUES ('XFFVX-ZjP', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-07 07:45:07.274+00', 1);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.history VALUES ('mPOdF3rap', '{$2a$10$RYOJbtG1crorHlvkRpjcO.Cf21BWnEQXisdGtqKt2NDj0bRovv0/C,$2a$10$44Gh5T5QctnkK/XaGrKLeenuaLgUS40vxyPWahdbBWjsINEyisFFi,$2a$10$pW/zKZCs0qkNOmTiFDj8x.KOUrZkO8DsI0.eTRbhNd.qF3PtqLMtm,$2a$10$eHNlUsZMFMpHxefurOOLmuoChl65N0AkhrjKJh7yxEU0jCElhbxwi,$2a$10$x60m11QjQHYheZn3raWLg.2EPlaJsmljnT4GVlfNN8Wj0lTEPCHBa}');


--
-- Data for Name: integrationconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item VALUES ('04', 'Movie tickets', 'pu65Tr6FE', 'A', 'Minion mooive ticket', 100000, 'https://i.pinimg.com/originals/2d/ac/e7/2dace73219e9f26ffb39b3bfbb98c41b.jpg', 'Disney', '2022-07-19 00:00:00', '2023-04-12 00:00:00', '{comedy,action}', '{"{\"url\": \"https://i.pinimg.com/originals/2d/ac/e7/2dace73219e9f26ffb39b3bfbb98c41b.jpg\", \"type\": \"image\", \"source\": \"\"}"}', NULL);
INSERT INTO public.item VALUES ('01', 'Movie tickets', 'pu65Tr6FE', 'A', 'Thor movie ticket', 100000, 'https://i.etsystatic.com/31051854/r/il/951542/3882447990/il_570xN.3882447990_8so4.jpg', 'Disney', '2022-07-19 00:00:00', '2023-04-25 00:00:00', '{comedy,action}', '{"{\"url\": \"https://i.etsystatic.com/31051854/r/il/951542/3882447990/il_570xN.3882447990_8so4.jpg\", \"type\": \"image\", \"source\": \"\"}"}', NULL);
INSERT INTO public.item VALUES ('02', 'Iphone 13', 'pu65Tr6FE', 'A', 'Iphone 13 from Apple', 20000000, 'https://lebaostore.com/wp-content/uploads/2022/02/iphone-13-pro-family-hero.png', 'Apple', '2022-07-19 00:00:00', '2023-04-17 00:00:00', '{mobiphone,technological,apple}', '{"{\"url\": \"https://lebaostore.com/wp-content/uploads/2022/02/iphone-13-pro-family-hero.png\", \"type\": \"image\", \"source\": \"\"}"}', NULL);
INSERT INTO public.item VALUES ('05', 'Macbook', 'pu65Tr6FE', 'A', 'Macbook from Apple', 25000000, 'https://www.maccenter.vn/App_images/MacBookPro-14-SpaceGray.jpg', 'Apple', '2022-07-19 00:00:00', '2023-04-20 00:00:00', '{laptop,technological,apple}', '{"{\"url\": \"https://www.maccenter.vn/App_images/MacBookPro-14-SpaceGray.jpg\", \"type\": \"image\", \"source\": \"\"}"}', NULL);
INSERT INTO public.item VALUES ('03', 'Camera', 'pu65Tr6FE', 'A', 'Camera from Samsung', 100000000, 'https://acmartbd.com/wp-content/uploads/2015/03/Samsung-wb1100f.jpg', 'Samsung', '2022-07-19 00:00:00', '2023-04-12 00:00:00', '{camera,technological}', '{"{\"url\": \"https://acmartbd.com/wp-content/uploads/2015/03/Samsung-wb1100f.jpg\", \"type\": \"image\", \"source\": \"\"}"}', NULL);


--
-- Data for Name: itemcategory; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: itemcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.itemcomment VALUES ('01', '02', '77c35c38c3554ea6906730dbcfeca0f2', 'Good', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO public.itemcomment VALUES ('02', '06', '77c35c38c3554ea6906730dbcfeca0f2', 'Not Bad', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO public.itemcomment VALUES ('03', '05', '77c35c38c3554ea6906730dbcfeca0f2', 'abc', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO public.itemcomment VALUES ('04', '07', '77c35c38c3554ea6906730dbcfeca0f2', 'Bad', '2022-07-22 00:00:00', NULL, NULL);
INSERT INTO public.itemcomment VALUES ('05', '11', '77c35c38c3554ea6906730dbcfeca0f2', '123', '2022-07-22 00:00:00', NULL, NULL);


--
-- Data for Name: iteminfo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: itemresponse; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.itemresponse VALUES ('01', '77c35c38c3554ea6906730dbcfeca0f2', 'Good', '2022-07-22 00:00:00', 0, 0, NULL, 0);
INSERT INTO public.itemresponse VALUES ('02', '77c35c38c3554ea6906730dbcfeca0f2', 'Not Bad', '2022-07-22 00:00:00', 0, 0, NULL, 0);
INSERT INTO public.itemresponse VALUES ('03', '77c35c38c3554ea6906730dbcfeca0f2', 'Wow', '2022-07-22 00:00:00', 0, 0, NULL, 0);
INSERT INTO public.itemresponse VALUES ('04', '77c35c38c3554ea6906730dbcfeca0f2', 'Bad', '2022-07-22 00:00:00', 0, 0, NULL, 0);
INSERT INTO public.itemresponse VALUES ('05', '77c35c38c3554ea6906730dbcfeca0f2', 'I hate this', '2022-07-22 00:00:00', 0, 0, NULL, 0);
INSERT INTO public.itemresponse VALUES ('01', 'pu65Tr6FE', 'as', '2023-04-10 17:03:47.866', 0, 0, NULL, 0);
INSERT INTO public.itemresponse VALUES ('03', 'pu65Tr6FE', 'abc', '2023-04-11 17:33:09.319', 0, 0, NULL, 0);


--
-- Data for Name: itemresponsereaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job VALUES ('senior-backend', 'Senior Backend Developer (Java, Kotlin, MySQL)', NULL, '2023-05-24 17:00:00+00', '2023-05-29 17:00:00+00', 1, 1, NULL, '3 Lý Do Để Gia Nhập Công Ty
Chance to work with a biggest global publisher
Development and design focused production process
Talents with international experience/background', 'mb-bank', '["java"]');
INSERT INTO public.job VALUES ('tetst', 'Senior DevOps Engineer - Salary Up to $2800', 'Collaborate with Front-End Developers to integrate user-facing elements with server-side logic and other applications APIs;
Maintain and improve running-functionality as well as design and develop new system, new feature;
Develop and maintain Back-End Code that improves analytical and statistical modeling and forecasting methods to support business tribes in their decision-making process;
Create data structures from scratch;
Actively test and debug code defect;
Research to learn technology and knowledge needed to develop products for the global market.', '2023-05-24 17:00:00+00', '2023-05-30 17:00:00+00', 1, 1, 'Bachelor’s degree in computer science, software development, engineering, or a related technical field;
From 3 to 5 years of experience of “server-side” programming languages in Java/ Kotlin to serve large-scale and high-traffic projects;
Proficient in SQL, PL/SQL, knowledgeable about Oracle/MySQL, NoSQL database management systems, capable of database optimization;
Experience in Control Systems such as SVN, CVS or Git/ Operating System such as Linux;
Solid experience in developing API Server;
Experience in Project Management;
Deep knowledge and experience in Object-Oriented and Functional Programming;
Deep knowledge and experience in Data Structure, Algorithm;
Detail-oriented and efficient time manager who thrives in a dynamic and fast- paced working environment;
Fluent in English is a plus point', 'Analyze and organize raw data
Build data systems and pipelines
Prepare data for prescriptive and predictive modeling
Combine raw information from different sources
Explore ways to enhance data quality and reliability
Identify opportunities for data acquisition
Data pipeline maintenance/testing.
', 'mb-bank', '["java","nodejs"]');
INSERT INTO public.job VALUES ('business-analyst-jp', 'Business Analyst (Japanese)', '• Meeting with customer to get request and analyze/clarify it.
• Analyze customer material (UI definition, initial specs).
• Create Detail Design (DD) and Basic Design (BD) document:
• Define business flow, business logic
• Prioritize tasks and communicate to senior management effort estimates and project status periodically.
• Do the rough estimation when getting requirement, or participate on the estimation (with development team)
• Participate into team collaborative design and document review (for DD & Test) activities.
• Will collaborate proactively with functional analysts to translate business and integration requirements into function scope & test scenarios, then solutions.
• Have application maintenance ownership, and the ability to work effectively with other various technologies and account teams.', '2023-05-24 17:00:00+00', '2023-05-30 17:00:00+00', 1, 1, 'Basic Qualification:
• Have at least 03 years’ experience on BA position.
• Good at speaking / reading / writing skill in Japanese (~N2+)
• Have experience in working in agile environment and doing multi project scope at the same time.
• Familiar with GIT, JIRA to manage task & CR.
• Have knowledge in GIT

Nice to have:
• 1+ year experience for developer position
• Product thinking.
• Have experience and good knowledge in mobile application validation development
• Proactive, hard-working, high responsibility and commitment are mandatory character for candidate who wants to join our team.', NULL, 'mb-bank', '["BA"]');


--
-- Data for Name: location; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.location VALUES ('5d1d7a66c5e4f320a86ca6b2', 'Highland Coffee', 'coffee', 'Highland Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/image/5d1d7a66c5e4f320a86ca6b2_IFc9Db9DT_c.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.location VALUES ('5d1d7a85c5e4f320a86ca6b3', 'Starbucks Coffee', 'coffee', 'Starbucks Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://ichef.bbci.co.uk/news/976/cpsprodpb/17185/production/_118879549_gettyimages-1308703596.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.location VALUES ('5d1d7b79c5e4f320a86ca6b4', 'King Coffee', 'coffee', 'King Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://www.asia-bars.com/wp-content/uploads/2015/11/cong-caphe-1.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.location VALUES ('5d1efb3796988a127077547c', 'Sumo BBQ Restaurant', 'restaurant', 'farthest', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://aeonmall-binhduongcanary.com.vn/wp-content/uploads/2018/12/IMG-2041-min-e1558279440850.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.location VALUES ('5d562ad357568217d0d9a2d5', 'CGV', 'cinema', 'CGV cinema', 'A', NULL, 10.7826048776525080, 10.8548611610901300, 'https://rapchieuphim.com/photos/9/rap-cgv-su-van-hanh/rap-CGV-Su-van-hanh-8__2_.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.location VALUES ('5d146cbffbdf2b1d30742262', 'Highland Coffee', 'coffee', 'Highland Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://i.ndh.vn/2022/07/29/1600834272dautuvietnamsuchunglaicuahighlandscoffeelabandapchotheluckhac-1659080446.jpg', 'https://i.ndh.vn/2022/07/29/1600834272dautuvietnamsuchunglaicuahighlandscoffeelabandapchotheluckhac-1659080446.jpg', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.location VALUES ('5d1d7a18c5e4f320a86ca6b1', 'Trung Nguyen Coffee', 'coffee', 'Trung Nguyen Coffee', 'A', NULL, 10.7826048776525080, 106.7009147396518000, 'https://cdn2.shopify.com/s/files/1/0065/6759/1999/files/dia-chi-trung-nguyen-legend-cafe-tai-vincom-ha-nam_grande.jpg', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: locationcomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationcomment VALUES ('CPh9yOO8H', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-23 15:44:25.356', NULL, NULL, true);
INSERT INTO public.locationcomment VALUES ('cQ6hNws3v', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yolo', '2023-03-23 15:45:32.621', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('MAk1BOOPB', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-23 16:51:46.922', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('EzRxHlOBC', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'oh yeah', '2023-03-23 16:57:01.95', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('EDepjfUZz', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yolo', '2023-03-23 16:58:28.567', NULL, NULL, true);
INSERT INTO public.locationcomment VALUES ('29feI2KC9', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yup', '2023-03-27 10:46:09.769', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('XhtnFuz_0', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yolo', '2023-03-27 10:47:04.826', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('9ukzkr43b', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-27 10:47:29.937', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('nmlfmxPl0', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'hi', '2023-03-27 10:47:29.937', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('VwP1pBM40', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'uEyz9MqaM', 'yo', '2023-03-27 10:52:48.336', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('e-nmtaraD', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'hi', '2023-03-30 13:40:15.87', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('JxoG2Ct8n', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'a', '2023-04-04 13:18:16.839', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('n_C2clD6g', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'uEyz9MqaM', 'yeah', '2023-04-04 13:20:19.586', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('piwKVqajD', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'b', '2023-04-04 14:03:22.18', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('d1mLikn2k', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'a', '2023-04-04 16:13:02.472', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('Q6bBIl8Zc', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', 'b', '2023-04-04 16:13:06.534', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('hI_v0wrjo', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged', '2023-04-06 10:28:46.38', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('g1Of56Z9C', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'pu65Tr6FE', 'hi', '2023-04-06 10:45:18.101', NULL, NULL, true);
INSERT INTO public.locationcomment VALUES ('3BCGcCgC8', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'b', '2023-04-06 13:40:42.394', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('Hiq0RQPEt', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'abc', '2023-04-14 10:34:41.991', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('4vvjkCiTv', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'helu', '2023-04-14 10:35:16.755', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('QyY3vL_AT', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'pu65Tr6FE', 'bloavla', '2023-04-14 11:01:07.313', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('B2AnGZ2Co', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'uEyz9MqaM', 'yoo', '2023-04-14 11:02:19.625', NULL, NULL, false);
INSERT INTO public.locationcomment VALUES ('ELH_IQyqf', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'pu65Tr6FE', 'eeeee', '2023-04-06 11:00:48.4', '2023-04-17 11:08:58.801', '{"{\"time\": \"2023-04-06T04:00:48.400Z\", \"comment\": \"e\"}"}', false);
INSERT INTO public.locationcomment VALUES ('B3ctw27P5', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'uEyz9MqaM', 'huhu', '2023-04-18 17:16:26.522', NULL, NULL, true);


--
-- Data for Name: locationcommentthread; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationcommentthread VALUES ('4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'hi', '2023-04-03 07:57:04.638+00', NULL, '{}');
INSERT INTO public.locationcommentthread VALUES ('SMmXVksrQ', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'a', '2023-04-04 02:28:36.938+00', NULL, '{}');
INSERT INTO public.locationcommentthread VALUES ('xGsBHvAhI', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'b', '2023-04-04 02:28:40.291+00', NULL, '{}');
INSERT INTO public.locationcommentthread VALUES ('ks-txtHW5', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'c', '2023-04-04 02:28:41.934+00', NULL, '{}');
INSERT INTO public.locationcommentthread VALUES ('gQsRtAsY8', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'd', '2023-04-04 02:28:43.621+00', NULL, '{}');
INSERT INTO public.locationcommentthread VALUES ('u7rf0YUD4', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'b', '2023-04-06 06:46:03.804+00', NULL, '{}');
INSERT INTO public.locationcommentthread VALUES ('M369VOqsD', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'test', '2023-04-06 06:47:50.358+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('jQ-d1LjB2', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'a', '2023-04-06 08:15:46.102+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('fQ8ZGjZV0', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'a', '2023-04-06 08:16:00.971+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('FBFtrF7a3', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'b', '2023-04-06 08:16:03.984+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('2wA097XQl', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'aa', '2023-04-06 08:16:06.02+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('8R2era603', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'dd', '2023-04-06 08:16:10.003+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('lCM2iMFwk', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'qw', '2023-04-06 08:16:12.484+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('wzBnAmMZ5', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'qwe', '2023-04-10 04:15:20.215+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('NM8JHf5w6', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'rty', '2023-04-10 04:15:22.159+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('UoPwSaRJU', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uio', '2023-04-10 04:15:23.957+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('VtZUjfyPh', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'm,.', '2023-04-10 04:15:26.991+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('xVJy8Uj9g', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'zxc', '2023-04-10 04:15:28.807+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('YOBTuks1e', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'asd', '2023-04-10 04:15:30.44+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('JihXTDUrN', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'kyu', '2023-04-10 04:15:32.723+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('u0mYlY4LG', '5d562ad357568217d0d9a2d5', 'pu65Tr6FE', 'hi', '2023-04-11 09:25:07.016+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('ig_UEXS5b', '5d562ad357568217d0d9a2d5', 'pu65Tr6FE', 'no', '2023-04-11 09:29:45.674+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'yehoo', '2023-04-04 06:24:41.486+00', '2023-04-13 04:49:59.501+00', '{"{\"time\": \"2023-04-04T06:24:41.486Z\", \"comment\": \"abc\"}","{\"time\": \"2023-04-04T06:24:41.486Z\", \"comment\": \"abcxyz\"}","{\"time\": \"2023-04-04T06:24:41.486Z\", \"comment\": \"yoo\"}"}');
INSERT INTO public.locationcommentthread VALUES ('HHjGtC1_G', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'hulu', '2023-04-18 06:08:06.191+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('I3og5ZaHC', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'hule', '2023-04-18 07:41:17.17+00', NULL, NULL);
INSERT INTO public.locationcommentthread VALUES ('WvbZM_GYu', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'abc', '2023-04-06 06:45:37.87+00', '2023-04-19 03:26:16.644+00', '{"{\"time\": \"2023-04-06T06:45:37.870Z\", \"comment\": \"a\"}"}');


--
-- Data for Name: locationcommentthreadinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationcommentthreadinfo VALUES ('5d1d7a66c5e4f320a86ca6b2', 0, 1);
INSERT INTO public.locationcommentthreadinfo VALUES ('4QkTPXfLt', 4, 1);
INSERT INTO public.locationcommentthreadinfo VALUES ('WvbZM_GYu', 2, 0);
INSERT INTO public.locationcommentthreadinfo VALUES ('ywurd_OaC', 3, 2);
INSERT INTO public.locationcommentthreadinfo VALUES ('HHjGtC1_G', 0, 1);
INSERT INTO public.locationcommentthreadinfo VALUES ('u7rf0YUD4', 1, 0);
INSERT INTO public.locationcommentthreadinfo VALUES ('wzBnAmMZ5', 1, 0);
INSERT INTO public.locationcommentthreadinfo VALUES ('8R2era603', 3, 1);
INSERT INTO public.locationcommentthreadinfo VALUES ('2wA097XQl', 3, 1);
INSERT INTO public.locationcommentthreadinfo VALUES ('lCM2iMFwk', 3, 1);
INSERT INTO public.locationcommentthreadinfo VALUES ('M369VOqsD', 0, 0);


--
-- Data for Name: locationcommentthreadreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationcommentthreadreaction VALUES ('4QkTPXfLt', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-03 07:57:05.913+00', 1);
INSERT INTO public.locationcommentthreadreaction VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-04 07:35:43.616+00', 1);
INSERT INTO public.locationcommentthreadreaction VALUES ('8R2era603', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-10 08:18:43.034+00', 1);
INSERT INTO public.locationcommentthreadreaction VALUES ('2wA097XQl', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-10 08:18:46.097+00', 1);
INSERT INTO public.locationcommentthreadreaction VALUES ('ywurd_OaC', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-14 03:30:07.499+00', 1);
INSERT INTO public.locationcommentthreadreaction VALUES ('lCM2iMFwk', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-14 04:05:36.41+00', 1);
INSERT INTO public.locationcommentthreadreaction VALUES ('ywurd_OaC', 'pu65Tr6FE', 'uEyz9MqaM', '2023-04-19 08:57:30.763+00', 1);
INSERT INTO public.locationcommentthreadreaction VALUES ('HHjGtC1_G', 'uEyz9MqaM', 'uEyz9MqaM', '2023-04-19 08:57:42.348+00', 1);


--
-- Data for Name: locationfollower; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationfollower VALUES ('5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE');


--
-- Data for Name: locationfollowing; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationfollowing VALUES ('pu65Tr6FE', '5d1d7a66c5e4f320a86ca6b2');


--
-- Data for Name: locationinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationinfo VALUES ('5d1d7a66c5e4f320a86ca6b2', 4, 0, 0, 0, 1, 0, 1, 4);
INSERT INTO public.locationinfo VALUES ('5d562ad357568217d0d9a2d5', 4, 0, 0, 0, 1, 0, 1, 4);
INSERT INTO public.locationinfo VALUES ('00001', 4, 0, 0, 0, 1, 0, 1, 4);
INSERT INTO public.locationinfo VALUES ('00002', 5, 0, 0, 0, 0, 1, 1, 5);
INSERT INTO public.locationinfo VALUES ('5d1efb3796988a127077547c', 3, 0, 0, 1, 0, 0, 1, 3);


--
-- Data for Name: locationinfomation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: locationrate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationrate VALUES ('5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 4, NULL, '', 0, 0, true, NULL);
INSERT INTO public.locationrate VALUES ('5d562ad357568217d0d9a2d5', 'uEyz9MqaM', 4, NULL, '', 0, 0, true, NULL);
INSERT INTO public.locationrate VALUES ('00002', 'uEyz9MqaM', 5, NULL, '', 0, 0, true, NULL);
INSERT INTO public.locationrate VALUES ('5d1efb3796988a127077547c', 'uEyz9MqaM', 3, NULL, '', 0, 0, true, NULL);
INSERT INTO public.locationrate VALUES ('00001', 'uEyz9MqaM', 4, NULL, '', 1, 0, true, '{"{\"rate\": 3}"}');


--
-- Data for Name: locationratereaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationratereaction VALUES ('00001', 'uEyz9MqaM', 'uEyz9MqaM', '2023-05-12 17:21:58.192462', 1);


--
-- Data for Name: locationreplycomment; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationreplycomment VALUES ('3speDSv5z', 'OYBh0OCY3', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'say oh yeah', '2023-04-03 07:48:47.09+00', NULL, '{}');
INSERT INTO public.locationreplycomment VALUES ('1-zYOlk9l', 'ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'hi', '2023-04-04 06:45:39.418+00', NULL, '{}');
INSERT INTO public.locationreplycomment VALUES ('2dt1uofzQ', 'ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'hi', '2023-04-05 03:10:43.794+00', NULL, '{}');
INSERT INTO public.locationreplycomment VALUES ('Md5KdWC4U', '4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'hi', '2023-04-05 06:26:33.703+00', NULL, '{}');
INSERT INTO public.locationreplycomment VALUES ('TYJOHlrmG', 'ywurd_OaC', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'huhuha', '2023-04-04 06:24:49.131+00', NULL, '{"{\"time\": \"2023-04-04T06:24:49.131Z\", \"comment\": \"hi\"}","{\"time\": \"2023-04-04T06:24:49.131Z\", \"comment\": \"huhu\"}"}');
INSERT INTO public.locationreplycomment VALUES ('lHyMLJdCd', '8R2era603', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'asd', '2023-04-10 08:18:54.175+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('HkFjDqFqA', 'lCM2iMFwk', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'alo', '2023-04-13 07:58:30.403+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('N8mXZwfOK', '4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'hu', '2023-04-13 10:33:23.292+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('Ldz_JTZ7r', '4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'pu65Tr6FE', 'hihi', '2023-04-13 10:36:43.61+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('AAfigbGjv', '2wA097XQl', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'abc', '2023-04-14 01:25:16.495+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('SX-Xf3LAm', '2wA097XQl', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'yoo', '2023-04-14 02:36:39.823+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('wZ3ORsY89', '2wA097XQl', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'hellu', '2023-04-14 02:43:56.953+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('-zmT5A56L', '8R2era603', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'yeee', '2023-04-14 03:00:02.591+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('jl8CDl6b3', 'lCM2iMFwk', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'hnuu', '2023-04-14 04:05:45.184+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('da_aKQ1ay', 'lCM2iMFwk', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'yeee', '2023-04-14 04:19:05.272+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('wDQJjOwL9', '4QkTPXfLt', '5d146cbffbdf2b1d30742262', 'uEyz9MqaM', 'ola', '2023-04-17 09:02:49.003+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('Us-7Itqr2', 'WvbZM_GYu', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'quangta test', '2023-04-17 10:44:47.368+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('OicUalfhk', 'WvbZM_GYu', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'yooye', '2023-04-19 03:25:24.249+00', NULL, '{"{\"time\": \"2023-04-19T03:25:24.249Z\", \"comment\": \"yoo\"}"}');
INSERT INTO public.locationreplycomment VALUES ('mlYHPKGMF', 'u7rf0YUD4', '5d1d7a66c5e4f320a86ca6b2', 'pu65Tr6FE', 'hihu', '2023-04-19 03:44:20.643+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('Q_Z7Z17Iz', 'wzBnAmMZ5', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'alo', '2023-04-20 04:25:48.598+00', NULL, NULL);
INSERT INTO public.locationreplycomment VALUES ('JalL_XYfm', '8R2era603', '5d1d7a66c5e4f320a86ca6b2', 'uEyz9MqaM', 'yolola', '2023-04-20 04:55:59.23+00', NULL, '{"{\"time\": \"2023-04-20T04:55:59.230Z\", \"comment\": \"yolo\"}"}');


--
-- Data for Name: locationreplycommentinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationreplycommentinfo VALUES ('Md5KdWC4U', 0, 0);
INSERT INTO public.locationreplycommentinfo VALUES ('lHyMLJdCd', 0, 0);
INSERT INTO public.locationreplycommentinfo VALUES ('HkFjDqFqA', 0, 0);
INSERT INTO public.locationreplycommentinfo VALUES ('jl8CDl6b3', 0, 0);
INSERT INTO public.locationreplycommentinfo VALUES ('da_aKQ1ay', 0, 1);
INSERT INTO public.locationreplycommentinfo VALUES ('wDQJjOwL9', 0, 0);
INSERT INTO public.locationreplycommentinfo VALUES ('Ldz_JTZ7r', 0, 0);


--
-- Data for Name: locationreplycommentreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locationreplycommentreaction VALUES ('da_aKQ1ay', 'pu65Tr6FE', 'pu65Tr6FE', '2023-04-14 04:19:09.024+00', 1);


--
-- Data for Name: music; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.music VALUES ('1', 'Gió', '{Jank}', NULL, NULL, '', 'https://photo-resize-zmp3.zmdcdn.me/w240_r1x1_webp/cover/5/3/6/d/536dc591405fc70b6f4932eeb18337e8.jpg', 'https://mp3-s1-zmp3.zmdcdn.me/f93972208a60633e3a71/418807123490058032?authen=exp=1681271241~acl=/f93972208a60633e3a71/*~hmac=ecf8aab8f221a3d6df3a073bf7c4634a&fs=MTY4MTA5ODQ0MTk4N3x3ZWJWNnwwfDExNy42LjQyLjE1NA');


--
-- Data for Name: passwordcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: passwords; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.passwords VALUES ('W4-SSYOad', '$2b$10$RpVp81sI5zI/nDjKf5VmyeSg./i0fCNZZRZjXSXM/PrIhggKiSl6m', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.passwords VALUES ('EAt0afrot', '$2b$10$HFPVKWD7YUC7MWbICbESQep8X/q1GPi858lHc0oXZmDkEmDVl0Bbe', '2022-10-13 04:51:57.443+00', NULL, 0, NULL, NULL);
INSERT INTO public.passwords VALUES ('hv5IMcgcQ', '$2b$10$misYaotOkglNej8V9vk4GuCbBokIdG6eQT8ag1X0GbeiSNX.BNO.a', '2022-10-13 06:57:51.42+00', NULL, 0, NULL, NULL);
INSERT INTO public.passwords VALUES ('w7GE8z1oF', '$2b$10$u7wDMhETf5PDyLPL4VsJAeb4EKCsd30Pa0dXLu3Bf6pCdG7C48M16', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.passwords VALUES ('gxLTXmdvq', '$2b$10$A0fFOOzSzZzA5vJ8hwUPfOEBK0uU0VvhAmK8ss4mcO6/TeVmxohpS', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.passwords VALUES ('fmA8L1ic6', '$2b$10$koIL.Iysk.uW7Krig2ayvOUFoR0Fn1eNhJz6/FpqvZ4mCFVEqjfFG', '2022-10-20 07:28:40.132+00', NULL, 0, NULL, NULL);
INSERT INTO public.passwords VALUES ('errAItrtM', '$2a$10$gbzoZNf5UGIBXu4P8DKaoekqw3ajduyccM14qQGJYW2hN2W7O.4Ya', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.passwords VALUES ('h3-bIa9tp', '$2a$10$Gy06IjZ463EEGKclZ8t41.wmtLPpsm5BikJxq8D0GFzHtDhOqORtS', '2022-11-11 11:28:59.242767+00', NULL, 0, NULL, NULL);
INSERT INTO public.passwords VALUES ('mPOdF3rap', '$2a$10$RYOJbtG1crorHlvkRpjcO.Cf21BWnEQXisdGtqKt2NDj0bRovv0/C', NULL, NULL, 0, NULL, '{$2a$10$tTDVSw3T3PRwy.heR6nKQ.KDHE1Del.U9IZqW25yOB4hcPpVp9x.6,$2a$10$y3AU6LXkjXD1ciFDHk/zqueejCi6Uhqnx7kzQBYrvwLZvXtoHOvB.,""}');
INSERT INTO public.passwords VALUES ('1c7TAkSsA', '$2b$10$OLrEW8KE4OS8xbccTS72uuqNh7GMhcrHyuZJx7q6tm0rAJk54I3oi', '2022-11-10 03:08:12.467+00', NULL, 0, NULL, NULL);
INSERT INTO public.passwords VALUES ('pu65Tr6FE', '$2b$10$cuUU9pZcxnrvYbZLw8echezSHZ.l44or37RuG9O9K53prUf3cvjLO', '2023-05-12 06:40:13.736247+00', NULL, 0, NULL, NULL);
INSERT INTO public.passwords VALUES ('uEyz9MqaM', '$2a$10$NS/TlMoJsvb/fHJsThDCHOSQq0XC5uDMgrf769paxRGh8DL1/5Gb2', '2023-05-25 06:20:22.292983+00', NULL, 0, NULL, NULL);


--
-- Data for Name: playlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.playlist VALUES ('7f6kqpqi7', 'Listen', 'pu65Tr6FE', NULL);


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.room VALUES ('01', 'KHU NGHỈ DƯỠNG PIUGUS', 'Piugus resort tọa lạc tại một hòn đảo nhỏ tư nhân tại Anambas. Toàn bộ biệt thự được xây dựng từ gỗ tự nhiên.', 500, '{"Máy giặt","Sân hoặc ban công","Điều hòa nhiệt độ","Bữa sáng","Cho phép ở dài hạn","Cho phép hút thuốc"}', 'Anambas, Kepulauan Riau, Indonesia', 'Herry', 5, 1, 2, 1, '{"Self check-in","Great location","Dive right in"}', 'A', 'Viet Nam', '{Beach,"Tiny Home",Islands}', '{"Toàn bộ nhà","Phòng riêng","Phòng chung"}', 'Nhà', '{"Tiếng Anh","Tiếng Việt"}', '{"{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_3VZT2SW8b\", \"type\": \"image\"}","{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_oSipzWeYi\", \"type\": \"image\"}","{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_EF7bCPZry\", \"type\": \"image\"}"}');


--
-- Data for Name: saveditem; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.saveditem VALUES ('pu65Tr6FE', '{01,02,03,05}', 'pu65Tr6FE', '2022-07-19 00:00:00', 'pu65Tr6FE', '2022-07-20 00:00:00');


--
-- Data for Name: savedlocation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: signupcodes; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.signupcodes VALUES ('uEyz9MqaM', '$2a$10$Tj.gVmypc66rvAeFHybtr.VJOANZIBeQBh5NvuzEiCuGHrlHkSqEG', '2023-03-20 04:11:10.310384+00');
INSERT INTO public.signupcodes VALUES ('W4-SSYOad', '$2b$10$GLndZAVCJzEE.2CJiLCxFu3YrvFQieQm46ZGp6XXTcWcbiM1crSZ.', '2022-10-12 11:07:36.779+00');
INSERT INTO public.signupcodes VALUES ('fmA8L1ic6', '$2b$10$IInKP2z703eg1LrQMYpCZOKblTtOtp4gIOZKLnPQFVkmYLkEF7uaC', '2022-10-13 02:32:34.381+00');
INSERT INTO public.signupcodes VALUES ('EAt0afrot', '$2b$10$yiPAyPZjcgN7si4w0W0SgeCah7uFYd2bq3cIARLfnNz6KKzcsMny.', '2022-10-13 04:29:22.179+00');
INSERT INTO public.signupcodes VALUES ('hv5IMcgcQ', '$2b$10$NbB36eZmmoLJQv3rncgcEO6AL58TDtOszYfpTm94Xuynj72Ju7XCa', '2022-10-13 06:34:40.651+00');
INSERT INTO public.signupcodes VALUES ('w7GE8z1oF', '$2b$10$fUm312/OmEA.MjoS5Dk11.kNwHcxS/tnCpjNGgflg3sTA8DoO/rgS', '2022-10-14 03:28:40.987+00');
INSERT INTO public.signupcodes VALUES ('gxLTXmdvq', '$2b$10$W3KnDnzEKslAEsmQ3yBRtOSmb0WLy/ulpwYozu7VybePiqBRb9mdu', '2022-10-17 03:02:04.383+00');
INSERT INTO public.signupcodes VALUES ('mJjun1i5y', '$2b$10$jyc20RCzqLyjVMsD2IvoAOBEqwZDomU8xBDLdu6.85HeHEdXjEE8e', '2022-10-20 07:41:05.714+00');
INSERT INTO public.signupcodes VALUES ('h3-bIa9tp', '$2a$10$mVm.a/owEHCsrFoo/lz.fu8N/HlUB.SvV8DMFmpAvbwKPeFu64m5W', '2022-10-24 04:23:10.731694+00');
INSERT INTO public.signupcodes VALUES ('errAItrtM', '$2a$10$M7XWanpmMvsiVtQWCZEVjetA4bnkwouWaFbCFduVK.IQY5T3B0MBy', '2022-10-24 04:27:00.943492+00');
INSERT INTO public.signupcodes VALUES ('mPOdF3rap', '$2a$10$CGx5zLhznCJiCb5DomIZAe9vvFU0xy64JPtTUYbQ1F5bYqbtYgP9S', '2022-10-27 04:05:45.07198+00');
INSERT INTO public.signupcodes VALUES ('pu65Tr6FE', '$2b$10$HhkKVEx9YMC1ZkHBUfjsQeW67HMPh1Cx8SqAQ6fTSTDqfTPwZqdmi', '2023-03-30 06:45:18.322+00');


--
-- Data for Name: usercompanies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usercompanies VALUES ('tma');
INSERT INTO public.usercompanies VALUES ('VN');
INSERT INTO public.usercompanies VALUES ('kbtg');


--
-- Data for Name: usereducations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usereducations VALUES ('uit');


--
-- Data for Name: userfollower; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: userfollowing; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: userinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.userinfo VALUES ('pu65Tr6FE', 1, 1, 0);


--
-- Data for Name: userinfomation; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: userinterests; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.userinterests VALUES ('game');
INSERT INTO public.userinterests VALUES ('movie');
INSERT INTO public.userinterests VALUES ('coding');
INSERT INTO public.userinterests VALUES ('football');
INSERT INTO public.userinterests VALUES ('basketball');
INSERT INTO public.userinterests VALUES ('books');


--
-- Data for Name: userrate; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: userratecomment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: userrateinfo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: userratereaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: userreaction; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users VALUES ('AWvaYDttM', 'vinhtq2020', 'vinhtq2020@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://www.worldhistory.org/img/r/p/500x600/13337.jpeg?v=1654040539', 'https://gratisography.com/wp-content/uploads/2022/05/gratisography-heavenly-free-stock-photo-1170x775.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'AWvaYDttM', NULL, 'AWvaYDttM', NULL, NULL, NULL);
INSERT INTO public.users VALUES ('uEyz9MqaM', 'quangta', 'quang.tx305@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'https://i1-vnexpress.vnecdn.net/2022/06/13/VNE-Khan-1457-1655098232.jpg?w=0&h=0&q=100&dpr=2&fit=crop&s=sjrVp41LWtp3zF9g39TqZA', 'https://gratisography.com/wp-content/uploads/2022/05/gratisography-heavenly-free-stock-photo-1170x775.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A', 'uEyz9MqaM', '2023-03-20 03:11:10.228538+00', 'uEyz9MqaM', '2023-03-20 03:12:10.228538+00', NULL, 2);
INSERT INTO public.users VALUES ('pu65Tr6FE', 'taquang', 'quang.tx306@gmail.com', NULL, NULL, 'quang2', 'Dev', 'Dev', NULL, NULL, NULL, 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/image/pu65Tr6FE_iyExI6wo2_326691424_1371589173612664_2476295418492007821_n.png', 'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/pu65Tr6FE_98yWLi3vZ_327187306_503724738543794_1432704642271550047_n.jpg', NULL, NULL, NULL, 'hi', 'dev.com', 'Dev', 'VN', NULL, 90, NULL, NULL, '{"facebook": "facebook.com"}', '{"{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/pu65Tr6FE_CPhDv76RF\", \"type\": \"image\"}","{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/pu65Tr6FE_gVckNJn5J\", \"type\": \"image\"}"}', '{"{\"skill\": \"reactjs\", \"hirable\": false}"}', '{"{\"subject\": \"champion\", \"highlight\": false, \"description\": \"LoL\"}"}', '{"{\"to\": \"2023-12\", \"from\": \"2023-04\", \"name\": \"dev\", \"position\": \"dev\", \"description\": \"dev\"}"}', '{"{\"to\": \"2023-12\", \"from\": \"2023-01\", \"name\": \"kbtg\", \"position\": \"dev\", \"description\": \"dev\"}"}', '{"{\"to\": \"2023-12\", \"from\": \"2023-01\", \"major\": \"uit\", \"title\": \"uit\", \"degree\": \"uit\", \"school\": \"uit\"}"}', '{coding}', '{friend,"basketball team"}', 'A', 'pu65Tr6FE', '2023-03-30 06:36:58.26+00', 'pu65Tr6FE', '2023-03-30 06:36:58.26+00', NULL, 2);


--
-- Data for Name: usersearchs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.usersearchs VALUES ('friend');
INSERT INTO public.usersearchs VALUES ('room mate');
INSERT INTO public.usersearchs VALUES ('basketball team');


--
-- Data for Name: userskills; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.userskills VALUES ('java');
INSERT INTO public.userskills VALUES ('javascripts');
INSERT INTO public.userskills VALUES ('c++');
INSERT INTO public.userskills VALUES ('c#');
INSERT INTO public.userskills VALUES ('c');
INSERT INTO public.userskills VALUES ('python');
INSERT INTO public.userskills VALUES ('ruby');
INSERT INTO public.userskills VALUES ('rust');
INSERT INTO public.userskills VALUES ('reactjs');
INSERT INTO public.userskills VALUES ('angular');
INSERT INTO public.userskills VALUES ('vue');
INSERT INTO public.userskills VALUES ('express');
INSERT INTO public.userskills VALUES ('codeigniter');
INSERT INTO public.userskills VALUES ('react native');
INSERT INTO public.userskills VALUES ('flutter');


--
-- Name: usersearchs searchs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usersearchs
    ADD CONSTRAINT searchs_pkey PRIMARY KEY (item);


--
-- Name: userskills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userskills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill);


--
-- Name: userrate userrate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userrate
    ADD CONSTRAINT userrate_pkey PRIMARY KEY (id, author);


--
-- Name: userratecomment userratecomment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userratecomment
    ADD CONSTRAINT userratecomment_pkey PRIMARY KEY (commentid);


--
-- Name: userrateinfo userrateinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userrateinfo
    ADD CONSTRAINT userrateinfo_pkey PRIMARY KEY (id);


--
-- Name: userratereaction userratereaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userratereaction
    ADD CONSTRAINT userratereaction_pkey PRIMARY KEY (id, author, userid);


--
-- Name: userreaction userreaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.userreaction
    ADD CONSTRAINT userreaction_pkey PRIMARY KEY (id, author, userid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
