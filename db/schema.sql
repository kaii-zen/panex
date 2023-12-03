CREATE DATABASE examdb;
USE examdb;

CREATE TABLE as_company
(
    id   INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

CREATE TABLE as_account
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(255),
    company_id INT,
    FOREIGN KEY (company_id) REFERENCES as_company (id)
);

CREATE TABLE as_project
(
    id         INT AUTO_INCREMENT PRIMARY KEY,
    name       VARCHAR(255),
    account_id INT,
    status     INT,
    FOREIGN KEY (account_id) REFERENCES as_account (id)
);

CREATE VIEW view_all_projects AS
SELECT
    c.id AS company_id,
    c.name AS company_name,
    a.id AS account_id,
    a.name AS account_name,
    p.id AS project_id,
    p.name AS project_name,
    CASE p.status
        WHEN 0 THEN 'Inactive'
        WHEN 1 THEN 'Active'
        WHEN 2 THEN 'Frozen'
        ELSE 'Unknown'
    END AS project_status
FROM
    as_project p
    INNER JOIN as_account a ON p.account_id = a.id
    INNER JOIN as_company c ON a.company_id = c.id;