package cityspender.webapp

class TransactionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [transactionInstanceList: Transaction.list(params), transactionInstanceTotal: Transaction.count()]
    }

    def create = {
        def transactionInstance = new Transaction()
        transactionInstance.properties = params
        return [transactionInstance: transactionInstance]
    }

    def save = {
        def transactionInstance = new Transaction(params)
        if (transactionInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])}"
            redirect(action: "show", id: transactionInstance.id)
        }
        else {
            render(view: "create", model: [transactionInstance: transactionInstance])
        }
    }

    def show = {
        def transactionInstance = Transaction.get(params.id)
        if (!transactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            [transactionInstance: transactionInstance]
        }
    }

    def edit = {
        def transactionInstance = Transaction.get(params.id)
        if (!transactionInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [transactionInstance: transactionInstance]
        }
    }

    def update = {
        def transactionInstance = Transaction.get(params.id)
        if (transactionInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (transactionInstance.version > version) {
                    
                    transactionInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'transaction.label', default: 'Transaction')] as Object[], "Another user has updated this Transaction while you were editing")
                    render(view: "edit", model: [transactionInstance: transactionInstance])
                    return
                }
            }
            transactionInstance.properties = params
            if (!transactionInstance.hasErrors() && transactionInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'transaction.label', default: 'Transaction'), transactionInstance.id])}"
                redirect(action: "show", id: transactionInstance.id)
            }
            else {
                render(view: "edit", model: [transactionInstance: transactionInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def transactionInstance = Transaction.get(params.id)
        if (transactionInstance) {
            try {
                transactionInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'transaction.label', default: 'Transaction'), params.id])}"
            redirect(action: "list")
        }
    }
}
