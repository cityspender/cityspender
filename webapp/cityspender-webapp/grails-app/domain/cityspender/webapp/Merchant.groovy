package cityspender.webapp

class Merchant {

    static constraints = {
    }
    String mchMerchantName
    static hasMany = [transactions: Transaction]
    String toString(){
        mchMerchantName
    }
}
