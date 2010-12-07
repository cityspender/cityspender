package cityspender.webapp

class Transaction {


    Float finTransactionAmount
    Date finTransactionDate

    static belongsTo = [merchant:Merchant]

    String toString(){
        finTransactionAmount+" - "+finTransactionDate
    }


}
