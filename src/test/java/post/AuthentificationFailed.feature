Feature: Авторизация в консоли

  Background:
    * configure driver = { type: 'chrome', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  #* configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  Scenario: Неуспешная авторизация

    Given driver 'https://prpo-test.intervale.ru/console/login'
    And input('#username', 'admin')
    And input('#password', 'admin')
    When click("{span}Войти")

    And waitFor('.ui-messages-summary.ng-tns-c3-2.ng-star-inserted')
    And waitFor('.ui-messages-detail.ng-tns-c3-2.ng-star-inserted')
    And def textMessages1 = scriptAll('.ui-messages-summary.ng-tns-c3-2.ng-star-inserted', '_.innerHTML')
    And def textMessages2 = scriptAll('.ui-messages-detail.ng-tns-c3-2.ng-star-inserted', '_.innerHTML')

    Then match textMessages1 contains 'Login failed'
    Then match textMessages2 contains 'Неправильные логин или пароль'
