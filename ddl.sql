CREATE TABLE account_c 
(
account_id NUMBER(7) NOT NULL,
first_name VARCHAR2(60) NOT NULL,
last_name VARCHAR2(60) NOT NULL,
country VARCHAR2(60) NOT NULL
);

CREATE TABLE credit_card
(
credit_card_id NUMBER(16) NOT NULL,
account_id NUMBER(7) NOT NULL,
cash_amount NUMBER(16) NOT NULL
);

CREATE TABLE transsaction
(
transsaction_id NUMBER(16) NOT NULL,
from_credit_card NUMBER(16) NOT NULL,
to_credit_card NUMBER(16) NOT NULL,
amount NUMBER(16) NOT NULL,
date_tran DATE NOT NULL
);

ALTER TABLE account_c  ADD CONSTRAINT ac_1 PRIMARY KEY (account_id); 
ALTER TABLE credit_card ADD CONSTRAINT cc_2 PRIMARY KEY (credit_card_id);
ALTER TABLE transsaction ADD CONSTRAINT tr_3 PRIMARY KEY (transsaction_id); 

ALTER TABLE credit_card ADD CONSTRAINT credit_card_fk_1 FOREIGN KEY (account_id) REFERENCES account_c (account_id) ON DELETE CASCADE;
ALTER TABLE transsaction ADD CONSTRAINT transsaction_fk_2 FOREIGN KEY (from_credit_card) REFERENCES credit_card (credit_card_id) ON DELETE CASCADE;
ALTER TABLE transsaction ADD CONSTRAINT transsaction_fk_3 FOREIGN KEY (to_credit_card) REFERENCES credit_card (credit_card_id) ON DELETE CASCADE;

CREATE SEQUENCE credit_seq MINVALUE 1 MAXVALUE 9999999999999999 START WITH 1000000000000000 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE trans_seq MINVALUE 1 MAXVALUE 1000000000 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
CREATE SEQUENCE account_seq MINVALUE 1 MAXVALUE 1000000000 START WITH 1 INCREMENT BY 1 NOCACHE NOCYCLE;
  
CREATE INDEX credit_ix ON transsaction(from_credit_card);
CREATE INDEX credit_ix2 ON transsaction(to_credit_card);
CREATE INDEX credit_ix23 ON credit_card(account_id);
CREATE INDEX account_ix1 ON account_c (first_name,last_name);
  