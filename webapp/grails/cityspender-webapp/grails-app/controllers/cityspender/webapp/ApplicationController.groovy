package cityspender.webapp
import java.text.SimpleDateFormat

class ApplicationController {

    def sdf  = new SimpleDateFormat('MM/dd/yyyy')

    def index = { }
    def uploadPCT = {
        //sdf.set2DigitYearStart(new GregorianCalendar(2001,1,1).getTime())
        new File( servletContext.getRealPath("/")+'/data/pctnewest.csv' ).text.eachLine{r,rNumber->

            if(rNumber >= 1)  {
                r.splitEachLine(","){ line ->
                 if(line[0] && line[1] && line[2])
                   {
                       print "rNumber \n"+line[0]+"\n"+line[1]+"\n"+line[2]+"\n"

                    def pct = new PurchaseCardTransaction(mchMerchantName:line[0], finTransactionAmount:line[1] as Float, finTransactionDate:sdf.parse(line[2]) as Date)
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
                     if(pct?.errors || transaction?.errors || merchant?.errors)

                    print "\n pct error "+pct?.errors+"\n transaction error "+transaction?.errors+"\n merchant error "+merchant?.errors

                   }

                }
            }
        }
        redirect(controller:"transaction", action:index)

    }

}
