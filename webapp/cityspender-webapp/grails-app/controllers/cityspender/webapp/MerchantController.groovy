package cityspender.webapp

class MerchantController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [merchantInstanceList: Merchant.list(params), merchantInstanceTotal: Merchant.count()]
    }

    def create = {
        def merchantInstance = new Merchant()
        merchantInstance.properties = params
        return [merchantInstance: merchantInstance]
    }

    def save = {
        def merchantInstance = new Merchant(params)
        if (merchantInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'merchant.label', default: 'Merchant'), merchantInstance.id])}"
            redirect(action: "show", id: merchantInstance.id)
        }
        else {
            render(view: "create", model: [merchantInstance: merchantInstance])
        }
    }

    def show = {
        def merchantInstance = Merchant.get(params.id)
        if (!merchantInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'merchant.label', default: 'Merchant'), params.id])}"
            redirect(action: "list")
        }
        else {
            [merchantInstance: merchantInstance]
        }
    }

    def edit = {
        def merchantInstance = Merchant.get(params.id)
        if (!merchantInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'merchant.label', default: 'Merchant'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [merchantInstance: merchantInstance]
        }
    }

    def update = {
        def merchantInstance = Merchant.get(params.id)
        if (merchantInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (merchantInstance.version > version) {
                    
                    merchantInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'merchant.label', default: 'Merchant')] as Object[], "Another user has updated this Merchant while you were editing")
                    render(view: "edit", model: [merchantInstance: merchantInstance])
                    return
                }
            }
            merchantInstance.properties = params
            if (!merchantInstance.hasErrors() && merchantInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'merchant.label', default: 'Merchant'), merchantInstance.id])}"
                redirect(action: "show", id: merchantInstance.id)
            }
            else {
                render(view: "edit", model: [merchantInstance: merchantInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'merchant.label', default: 'Merchant'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def merchantInstance = Merchant.get(params.id)
        if (merchantInstance) {
            try {
                merchantInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'merchant.label', default: 'Merchant'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'merchant.label', default: 'Merchant'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'merchant.label', default: 'Merchant'), params.id])}"
            redirect(action: "list")
        }
    }
}
