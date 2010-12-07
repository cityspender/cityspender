
<%@ page import="cityspender.webapp.PurchaseCardTransaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'purchaseCardTransaction.label', default: 'PurchaseCardTransaction')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'purchaseCardTransaction.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="finTransactionAmount" title="${message(code: 'purchaseCardTransaction.finTransactionAmount.label', default: 'Fin Transaction Amount')}" />
                        
                            <g:sortableColumn property="finTransactionDate" title="${message(code: 'purchaseCardTransaction.finTransactionDate.label', default: 'Fin Transaction Date')}" />
                        
                            <g:sortableColumn property="mchMerchantName" title="${message(code: 'purchaseCardTransaction.mchMerchantName.label', default: 'Mch Merchant Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${purchaseCardTransactionInstanceList}" status="i" var="purchaseCardTransactionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${purchaseCardTransactionInstance.id}">${fieldValue(bean: purchaseCardTransactionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: purchaseCardTransactionInstance, field: "finTransactionAmount")}</td>
                        
                            <td><g:formatDate date="${purchaseCardTransactionInstance.finTransactionDate}" /></td>
                        
                            <td>${fieldValue(bean: purchaseCardTransactionInstance, field: "mchMerchantName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${purchaseCardTransactionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
