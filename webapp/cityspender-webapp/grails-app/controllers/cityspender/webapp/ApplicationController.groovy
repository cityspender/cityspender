package cityspender.webapp
import java.text.SimpleDateFormat

class ApplicationController {

    def sdf  = new SimpleDateFormat('MM/dd/yyyy')

    def index = { }
    def uploadPCT = {
        sdf.set2DigitYearStart(new GregorianCalendar(2001,1,1).getTime())
        new File( 'c:\\pctnewest.csv' ).text.eachLine{r,rNumber->

            if(rNumber >= 1)  {
                r.splitEachLine(","){ line ->
                    print "\n" +  sdf.parse(line[2])

                    def pct = new PurchaseCardTransaction(mchMerchantName:line[0], finTransactionAmount:line[1] as Float, finTransactionDate:sdf.parse(line[2]))
                    pct.save()
                    def merchant = Merchant.findWhere(mchMerchantName:line[0])

                    if(!merchant)
                    {
                        merchant = new Merchant(mchMerchantName:line[0])
                        merchant.save()
                    }
                    def transaction = Transaction.findWhere(merchant:merchant, finTransactionAmount:line[1] as Float, finTransactionDate:sdf.parse(line[2]))

                    if(!transaction)
                    {
                        transaction = new Transaction(merchant:merchant, finTransactionAmount:line[1] as Float, finTransactionDate:sdf.parse(line[2]))
                        transaction.save()
                    }
                    else

                    print "\n pct error "+pct?.errors+"\n transaction error "+transaction?.errors+"\n merchant error "+merchant?.errors



                }
            }
        }


    }

}
