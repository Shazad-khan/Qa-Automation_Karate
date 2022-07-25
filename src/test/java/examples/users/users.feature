Feature: karate test script

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: get all users and first user by id
    Given path 'users'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'users', first.id
    When method get
    Then status 200

  Scenario: create a user and get it by id
    * def user =
      """
      {
        "name": "Shazad",
        "username": "Shazad-Khan",
        "email": "shazad.khan@zemosolabs.com",
        "address": {
          "street": "Mango Old Purulia road",
          "suite": "H.NO-123",
          "city": "Jamshedput",
          "zipcode": "832110"
        }
      }
      """

    Given url 'https://jsonplaceholder.typicode.com/users'
    And request user
    When method post
    Then status 201

    * def id = response.id
    * print 'created id is: ', id
