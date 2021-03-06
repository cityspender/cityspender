

<%@ page import="cityspender.webapp.Transaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
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
            <g:hasErrors bean="${transactionInstance}">
            <div class="errors">
                <g:renderErrors bean="${transactionInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${transactionInstance?.id}" />
                <g:hiddenField name="version" value="${transactionInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="finTransactionAmount"><g:message code="transaction.finTransactionAmount.label" default="Fin Transaction Amount" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'finTransactionAmount', 'errors')}">
                                    <g:textField name="finTransactionAmount" value="${fieldValue(bean: transactionInstance, field: 'finTransactionAmount')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="finTransactionDate"><g:message code="transaction.finTransactionDate.label" default="Fin Transaction Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'finTransactionDate', 'errors')}">
                                    <g:datePicker name="finTransactionDate" precision="day" value="${transactionInstance?.finTransactionDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="merchant"><g:message code="transaction.merchant.label" default="Merchant" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: transactionInstance, field: 'merchant', 'errors')}">
                                    <g:select name="merchant.id" from="${cityspender.webapp.Merchant.list()}" optionKey="id" value="${transactionInstance?.merchant?.id}"  />
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
