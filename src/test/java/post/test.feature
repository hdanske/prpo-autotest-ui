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
    * driver 'https://www.seleniumeasy.com/test/drag-and-drop-demo.html'
    * waitFor('{div/span}Draggable 1')
    * def el = locate('{div/span}Draggable 1')
    * def pos1 = position('{div/span}Draggable 1')
    * print 'test1', pos1
    * def q = html('{div/span}Draggable 1')
    * print 'test3', q

    * def el = locate('#mydropzone')
    * def pos2 = position('#mydropzone')
    * print 'test2', pos2

    * waitUntil("document.readyState == 'complete'")

    * scroll('#todrag')
#    * mouse('#mydropzone').go()
    * mouse().move('{div/span}Draggable 1').click()
    * mouse().down().move('#mydropzone').up()

    * mouse().move('{div/span}Draggable 2').click()
    * mouse().down().move('#mydropzone').up()
#    * csvButtonUp.click()
    #    * waitFor('button[type=button]')
#    * def buttonsUpAndDown = locateAll('button[type=button]')
#    * def csvButtonUp = buttonsUpAndDown.get(9)
#    * csvButtonUp.click()
    * karate.stop()
