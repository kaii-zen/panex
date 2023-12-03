USE examdb;

INSERT INTO as_company (id, name)
VALUES (123, 'Panaya');

INSERT INTO as_account (id, name, company_id)
VALUES (111, 'Production system', 123),
       (222, 'Dev System', 123);

INSERT INTO as_project (id, name, account_id, status)
VALUES (1111, 'Upgrade', 111, 1),
       (2222, 'Testing', 111, 0),
       (3333, 'Cleansing', 111, 2),
       (4444, 'Restore', 222, 1);
