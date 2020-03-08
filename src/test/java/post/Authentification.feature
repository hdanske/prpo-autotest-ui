Feature: Авторизация в консоли

  Background:
    * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  #* configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  Scenario: Успешная авторизация

    Given driver 'https://prpo-test.intervale.ru/console/login'
    And input('#username', 'admin')
    And input('#password', 'admin0123')
    When click("{span}Войти")

    Then waitForUrl('https://prpo-test.intervale.ru/console/import-charges-trx')
    Then match driver.url == 'https://prpo-test.intervale.ru/console/import-charges-trx'