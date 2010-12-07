package cityspender.webapp

class PurchaseCardTransactionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [purchaseCardTransactionInstanceList: PurchaseCardTransaction.list(params), purchaseCardTransactionInstanceTotal: PurchaseCardTransaction.count()]
    }

    def create = {
        def purchaseCardTransactionInstance = new PurchaseCardTransaction()
        purchaseCardTransactionInstance.properties = params
        return [purchaseCardTransactionInstance: purchaseCardTransactionInstance]
    }

    def save = {
        def purchaseCardTransactionInstance = new PurchaseCardTransaction(params)
        if (purchaseCardTransactionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), purchaseCardTransactionInstance.id])}"
            redirect(action: "show", id: purchaseCardTransactionInstance.id)
        }
        else {
            render(view: "create", model: [purchaseCardTransactionInstance: purchaseCardTransactionInstance])
        }
    }

    def show = {
        def purchaseCardTransactionInstance = PurchaseCardTransaction.get(params.id)
        if (!purchaseCardTransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            [purchaseCardTransactionInstance: purchaseCardTransactionInstance]
        }
    }

    def edit = {
        def purchaseCardTransactionInstance = PurchaseCardTransaction.get(params.id)
        if (!purchaseCardTransactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [purchaseCardTransactionInstance: purchaseCardTransactionInstance]
        }
    }

    def update = {
        def purchaseCardTransactionInstance = PurchaseCardTransaction.get(params.id)
        if (purchaseCardTransactionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (purchaseCardTransactionInstance.version > version) {
                    
                    purchaseCardTransactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction')] as Object[], "Another user has updated this PurchaseCardTransaction while you were editing")
                    render(view: "edit", model: [purchaseCardTransactionInstance: purchaseCardTransactionInstance])
                    return
                }
            }
            purchaseCardTransactionInstance.properties = params
            if (!purchaseCardTransactionInstance.hasErrors() && purchaseCardTransactionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), purchaseCardTransactionInstance.id])}"
                redirect(action: "show", id: purchaseCardTransactionInstance.id)
            }
            else {
                render(view: "edit", model: [purchaseCardTransactionInstance: purchaseCardTransactionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def purchaseCardTransactionInstance = PurchaseCardTransaction.get(params.id)
        if (purchaseCardTransactionInstance) {
            try {
                purchaseCardTransactionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction'), params.id])}"
            redirect(action: "list")
        }
    }
}
