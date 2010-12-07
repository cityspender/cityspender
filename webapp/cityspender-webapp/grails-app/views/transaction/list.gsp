
<%@ page import="cityspender.webapp.Transaction" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'transaction.label', default: 'Transaction')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'transaction.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="finTransactionAmount" title="${message(code: 'transaction.finTransactionAmount.label', default: 'Fin Transaction Amount')}" />
                        
                            <g:sortableColumn property="finTransactionDate" title="${message(code: 'transaction.finTransactionDate.label', default: 'Fin Transaction Date')}" />
                        
                            <th><g:message code="transaction.merchant.label" default="Merchant" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${transactionInstanceList}" status="i" var="transactionInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${transactionInstance.id}">${fieldValue(bean: transactionInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: transactionInstance, field: "finTransactionAmount")}</td>
                        
                            <td><g:formatDate date="${transactionInstance.finTransactionDate}" /></td>
                        
                            <td>${fieldValue(bean: transactionInstance, field: "merchant")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${transactionInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
