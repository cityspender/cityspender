<html>
<head>
  <title><g:layoutTitle default="Grails" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'style.css')}" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'base.css')}" />

  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />

  <g:javascript library="application" />

</head>
<body>
<div id="container">
  <div id="header">
    <h1><a href="index.html">City Spender</a></h1>
    <div id="user-navigation">
      <ul class="wat-cf">
        <li><a href="#">Profile</a></li>
        <li><a href="#">Settings</a></li>
        <li><a class="logout" href="#">Logout</a></li>
      </ul>
    </div>
    <div id="main-navigation">
      <ul class="wat-cf">
        <li class="first"><a href="/cityspender-webapp/merchant">Merchants</a></li>

        <li class="first"><a href="/cityspender-webapp/transaction">Transactions</a></li>

      </ul>
    </div>
  </div>
  <div id="wrapper" class="wat-cf">
    <div id="main">

      <div id="block-text" class="block">

        <div class="content">
          <div class="inner">
            <g:layoutBody/>
          </div>
        </div>
      </div>

    </div>
    <div id="sidebar">
     

    </div>

  </div>
</div>

</body>

</html>