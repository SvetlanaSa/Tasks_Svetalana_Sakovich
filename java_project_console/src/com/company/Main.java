package com.company;

import java.util.List;
import java.util.Random;
import java.util.ArrayList;



public class Main {
    private static IAccountDAO accountDAO = null;
    private static ICreditCardDAO creditDAO = null;
    private static ITransactionDAO transactionDAO = null;

    static {

        accountDAO = new AccountDAOImp((ConnectionFactory.getInstance()));
        creditDAO= new CreditClassDAO((ConnectionFactory.getInstance()));
        transactionDAO= new TransactionDAO((ConnectionFactory.getInstance()));

    }

    public static void main(String[] args) throws Exception {

        String st[] = {"gfh", "ngfn", "ncnhgn", "ncn", "ngffcn", "ngfm", "fhfht", "Kdkjjd", "JHfhjgjh", "fgfgfg", "Sdpsofo", "fgfxxx", "fgfffh"};

        for (int i = 1; i <=5; i++) {
            Account account1 = new Account(st[new Random().nextInt(st.length)], st[new Random().nextInt(st.length)], st[new Random().nextInt(st.length)]);
            accountDAO.insertAccount(account1);
        }


        Account last = null;
        System.out.println("1 -------------------------");
        for (Account account : accountDAO.getAllAccount()) {
            System.out.println(account);
            last = account;
        }

        List<Account> accounts = accountDAO.getAllAccount();
        Random r = new Random();
        int Account_ID1 = accounts.get(r.nextInt(accounts.size())).getAccount_ID();
        System.out.println(Account_ID1);
        //Credit_Card creditCard1 = new Credit_Card(4202,r.nextDouble()*15);
         Credit_Card creditCard1 = new Credit_Card(Account_ID1,r.nextDouble()*15);
            creditDAO.insertCredit_Card(creditCard1);


        System.out.println("2 -------------------------");
        System.out.println(last);
        accountDAO.updateAccount(last);
        accountDAO.getAllAccount().forEach(System.out::println);


        System.out.println("3 -------------------------");
        System.out.println(last.getAccount_ID());
        accountDAO.deleteAccount(last.getAccount_ID());
        accountDAO.getAllAccount().forEach(System.out::println);


             /* for (int k=0;k<1500;k++) {
            Random r = new Random();
            Credit_Card creditCard1 = new Credit_Card(j,rnd(0,1000),  r.nextDouble()*15);
            creditDAO.insertCredit_Card(creditCard1);
        }*/

      /*  Credit_Card last1 = null;
        System.out.println("4 -------------------------");
        for (Credit_Card credit_Card : creditDAO.getAllCredit()) {
            System.out.println(credit_Card);
            last1 = credit_Card;
        }*/

    }
    public static int rnd(int min, int max)
    {
        max -= min;
        return (int) (Math.random() * ++max) + min;
    }

}


