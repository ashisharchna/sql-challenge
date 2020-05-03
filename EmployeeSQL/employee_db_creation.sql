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

DROP DATABASE employee_db;
--
-- Name: employee_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE employee_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';


ALTER DATABASE employee_db OWNER TO postgres;

\connect employee_db

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
-- Name: DATABASE employee_db; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE employee_db IS 'Employee database created by Archna';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dept_no character varying(4) NOT NULL,
    dept_name character varying
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_employee (
    emp_no integer,
    dept_no character varying(4)
);


ALTER TABLE public.department_employee OWNER TO postgres;

--
-- Name: department_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department_manager (
    dept_no character varying(4),
    emp_no integer
);


ALTER TABLE public.department_manager OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_no integer NOT NULL,
    emp_title_id character varying(5),
    birth_date date,
    first_name character varying,
    last_name character varying,
    sex character varying(1),
    hire_date date
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: salary; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salary (
    emp_no integer,
    salary integer
);


ALTER TABLE public.salary OWNER TO postgres;

--
-- Name: title; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.title (
    title_id character varying(5) NOT NULL,
    title character varying
);


ALTER TABLE public.title OWNER TO postgres;

--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dept_no);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_no);


--
-- Name: title title_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.title
    ADD CONSTRAINT title_pkey PRIMARY KEY (title_id);


--
-- Name: department_employee department_employee_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_employee
    ADD CONSTRAINT department_employee_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.department(dept_no);


--
-- Name: department_employee department_employee_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_employee
    ADD CONSTRAINT department_employee_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);


--
-- Name: department_manager department_manager_dept_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department_manager
    ADD CONSTRAINT department_manager_dept_no_fkey FOREIGN KEY (dept_no) REFERENCES public.department(dept_no);


--
-- Name: employee employee_emp_title_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_emp_title_id_fkey FOREIGN KEY (emp_title_id) REFERENCES public.title(title_id);


--
-- Name: salary salary_emp_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salary
    ADD CONSTRAINT salary_emp_no_fkey FOREIGN KEY (emp_no) REFERENCES public.employee(emp_no);


