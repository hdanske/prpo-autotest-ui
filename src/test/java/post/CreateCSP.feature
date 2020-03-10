Feature: Администрирование ПКУ

  Background:
    * configure driver = { type: 'firefox', showDriverLog: true }
  # * configure driverTarget = { docker: 'justinribeiro/chrome-headless', showDriverLog: true }
  # * configure driverTarget = { docker: 'ptrthomas/karate-chrome', showDriverLog: true }
  # * configure driver = { type: 'chromedriver', showDriverLog: true }
  # * configure driver = { type: 'geckodriver', showDriverLog: true }
  # * configure driver = { type: 'safaridriver', showDriverLog: true }
  #* configure driver = { type: 'iedriver', showDriverLog: true, httpConfig: { readTimeout: 120000 } }

  Scenario: Создание ПКУ

    * callonce read('classpath:post/Authentification.feature');

#    Given driver 'https://prpo-test.intervale.ru/console/login'
#    And input('#username', 'admin')
#    And input('#password', 'admin0123')
#    When click("{span}Войти")

    * waitForUrl('https://prpo-test.intervale.ru/console/import-charges-trx')
    * waitFor('a.tabmenuitem-link')
    * def elements = locateAll('a.tabmenuitem-link')
    * elements.get(4).click()
    * waitFor('{span}Поставщики коммерческих услуг')
    * click('{span}Поставщики коммерческих услуг')

    * waitForUrl('https://http://prpo-test.intervale.ru/console/csp')
    * match driver.url == 'https://prpo-test.intervale.ru/console/csp'

    * waitFor('.ui-button-text.ui-clickable')
    #* def buttonAdd = locate('button[type]')
    * click('{span}Добавить')

    * waitFor('.ui-dropdown-label-container')
    * def dropDownBoxes = locateAll('.ui-dropdown-label-container')
    * def cspType = dropDownBoxes.get(3)
    * def serviceType = dropDownBoxes.get(4)
    * cspType.click()
    * click('{li/span}Индивидуальный предприниматель')
    * serviceType.click()
    * click('{li/span}Газ')

    * def buttons = locateAll('.ui-button-text.ui-clickable')
    * def regionButton = buttons.get(8)
    * regionButton.click()
    * click('{li/span}Санкт - Петербург')

    * input('#fullName', 'ОАО Тест')
    * input('#workPhone', '+375297302438')
    * input('#email', 'test@test.com')
    * input('#inn', '123456789012')
    * input('#kpp', '1')

    * click('#ui-tabpanel-1-label')

    * waitFor('.ui-spinner-button.ui-spinner-up.ui-corner-tr.ui-button.ui-widget.ui-state-default')
    * def buttonsUpAndDown = locateAll('.ui-spinner-button.ui-spinner-up.ui-corner-tr.ui-button.ui-widget.ui-state-default')
    * def csvButtonUp = buttonsUpAndDown.get(0)
    * csvButtonUp.focus().mouse().click()
#    * csvButtonUp.click()


    #    * waitFor('button[type=button]')
#    * def buttonsUpAndDown = locateAll('button[type=button]')
#    * def csvButtonUp = buttonsUpAndDown.get(9)
#    * csvButtonUp.click()




    * karate.stop()
