use examdb;

INSERT INTO as_company (id, name)
    VALUES (666, 'kreisys');

INSERT INTO as_account (id, name, company_id)
    VALUES (666, 'Special Operations', 666);

INSERT INTO as_project (id, name, account_id, status)
    VALUES (6666, 'World Domination', 666, 1);
