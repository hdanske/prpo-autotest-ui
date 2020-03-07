Feature: Авторизация в консоли
  Background:
    * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  #* configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  Scenario: Авторизация

    Given driver 'https://prpo-test.intervale.ru/console/login'
    And input('#username', 'admin')
    And input('#password', 'admin0123')

    And def findButton =
  """function () {
  var x = document.getElementsByClassName("ui-button ui-widget ui-state-default ui-corner-all ui-button-text-icon-left");
  return x[0];
  }"""
    And submit().click('button[className=ui-button.ui-widget.ui-state-default.ui-corner-all.ui-button-text-icon-left].[0]')
    Then waitForUrl('https://prpo-test.intervale.ru/console/import-charges-trx')

    #Then match driver.url == 'https://prpo-test.intervale.ru/console/import-charges-trx'


    #Then match html('#js-flash-container') contains 'Incorrect username or password.'

    #Given driver 'https://google.com'
    #And input("input[name=q]", 'karate dsl')
    #When submit().click("input[name=btnI]")

    #Then waitForUrl('https://github.com/intuit/karate')