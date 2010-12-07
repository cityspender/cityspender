

<%@ page import="cityspender.webapp.PurchaseCardTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${purchaseCardTransactionInstance}">
            <div class="errors">
                <g:renderErrors bean="${purchaseCardTransactionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${purchaseCardTransactionInstance?.id}" />
                <g:hiddenField name="version" value="${purchaseCardTransactionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="finTransactionAmount"><g:message code="purchaseCardTransaction.finTransactionAmount.label" default="Fin Transaction Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseCardTransactionInstance, field: 'finTransactionAmount', 'errors')}">
                                    <g:textField name="finTransactionAmount" value="${fieldValue(bean: purchaseCardTransactionInstance, field: 'finTransactionAmount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="finTransactionDate"><g:message code="purchaseCardTransaction.finTransactionDate.label" default="Fin Transaction Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseCardTransactionInstance, field: 'finTransactionDate', 'errors')}">
                                    <g:datePicker name="finTransactionDate" precision="day" value="${purchaseCardTransactionInstance?.finTransactionDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="mchMerchantName"><g:message code="purchaseCardTransaction.mchMerchantName.label" default="Mch Merchant Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: purchaseCardTransactionInstance, field: 'mchMerchantName', 'errors')}">
                                    <g:textField name="mchMerchantName" value="${purchaseCardTransactionInstance?.mchMerchantName}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
