    INSERT INTO account_c (account_id,first_name,last_name,country) VALUES (1,'IVAN','IVANOV','GOMEL');
    INSERT INTO  account_c (account_id,first_name,last_name,country) VALUES (2,'ALESYA','DREMACH','BREST');
    INSERT INTO account_c (account_id,first_name,last_name,country) VALUES (3,'IVAN','MARTINOVICH','MINSK');
    INSERT INTO  account_c (account_id,first_name,last_name,country) VALUES (4,'PAVEL','PRTROVKIN','GOMEL');
    INSERT INTO  account_c (account_id,first_name,last_name,country) VALUES (5,'SVETLANA','PETROVA','BREST');
    INSERT INTO  account_c (account_id,first_name,last_name,country) VALUES (6,'MARINA','IVANOV','MINSK');
    INSERT INTO  account_c (account_id,first_name,last_name,country) VALUES (7,'MARINA','FEDOROVICH','SVETLOGORSK');

    INSERT INTO credit_card(credit_card_id,account_id,cash_amount)
    SELECT credit_seq.nextval,account_id,cash_amount 
    FROM (
      SELECT account_id,round(dbms_random.VALUE(0,10000)) AS cash_amount  FROM account_c 
      CONNECT BY LEVEL <= 2
      ORDER BY dbms_random.VALUE)
    WHERE ROWNUM<=12;
   
    INSERT INTO transsaction(transsaction_id,from_credit_card,to_credit_card,amount,date_tran)
    SELECT trans_seq.nextval,from_credit_card,to_credit_card,amount,SYSDATE 
    FROM (
      SELECT from_credit_card,to_credit_card,round(dbms_random.VALUE(0,100)) AS amount  
        FROM (
        SELECT s1.credit_card_id AS from_credit_card,s2.credit_card_id AS to_credit_card
        FROM credit_card s1 INNER JOIN credit_card s2 
        ON  s1.credit_card_id!=s2.credit_card_id
        ORDER BY dbms_random.VALUE)
    WHERE ROWNUM<=23);
   
  