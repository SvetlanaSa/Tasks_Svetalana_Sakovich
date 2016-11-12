package com.company;


import java.sql.Timestamp;

/**
 * Created by Света on 02.11.2016.
 */
public class Transaction {
     private int Transaction_ID;
     private long From_Credit_Card;
     private long To_Credit_Card;
     private double Amount;
     private java.sql.Timestamp Date_tran;

     public Transaction(int transaction_id, long from_credit_card_id, long to_credit_card_id, double amount, java.sql.Timestamp date_trans) {
     }

     public int getTransaction_ID() {
          return  Transaction_ID;
     }

     public void setTransaction_ID(int  Transaction_ID) {
          this. Transaction_ID =  Transaction_ID;
     }

     public long getFrom_Credit_Card() {
          return From_Credit_Card;
     }

     public void setFrom_Credit_Card(long From_Credit_Card) {
          this.From_Credit_Card = From_Credit_Card;
     }

     public long getTo_Credit_Card() {
          return To_Credit_Card;
     }

     public void setTo_Credit_Card(long To_Credit_Card) {
          this.To_Credit_Card = To_Credit_Card;
     }

     public double getAmount() {
          return Amount;
     }

     public void setAmount(double Amount) {
          this.Amount = Amount;
     }

     public java.sql.Timestamp getDate_tran() {
          return Date_tran;
     }

     public void setDate_tran(java.sql.Timestamp Date_tran) {
          this.Date_tran = Date_tran;
     }

}
