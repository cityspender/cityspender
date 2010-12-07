
<%@ page import="cityspender.webapp.Merchant" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'merchant.label', default: 'Merchant')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'merchant.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="mchMerchantName" title="${message(code: 'merchant.mchMerchantName.label', default: 'Mch Merchant Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${merchantInstanceList}" status="i" var="merchantInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${merchantInstance.id}">${fieldValue(bean: merchantInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: merchantInstance, field: "mchMerchantName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${merchantInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
