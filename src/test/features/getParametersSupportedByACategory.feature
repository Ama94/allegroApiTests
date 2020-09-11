Business Need: get parameters supported by a category

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC001 checking get parameters supported by a category for id "5", get code status 200 and check response JSON
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5/parameters" method
    Then The status code is 200
    And The response includes the following
      | parameters[0].id | 11323  |
      | parameters[1].id | 225693 |

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC002 checking get parameters supported by a category for id "5", get code status 200 and check response JSON
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5/parameters" method
    Then The status code is 200
    And The response includes the following
      | parameters[0].id                           | 11323      |
      | parameters[0].name                         | Stan       |
      | parameters[0].type                         | dictionary |
      | parameters[0].required                     | false      |
      | parameters[0].requiredForProduct           | false      |
      | parameters[0].dictionary[0].id             | 11323_1    |
      | parameters[0].dictionary[0].value          | Nowy       |
      | parameters[0].dictionary[1].id             | 11323_2    |
      | parameters[0].dictionary[1].value          | Używany    |
      | parameters[0].restrictions.multipleChoices | false      |

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC003 checking get parameters supported by a category for id "5", get code status 200 and check response JSON
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5/parameters" method
    Then The status code is 200
    And The response includes the following
      | parameters[1].id                       | 225693 |
      | parameters[1].name                     | EAN    |
      | parameters[1].type                     | string |
      | parameters[1].required                 | false  |
      | parameters[1].requiredForProduct       | false  |
      | parameters[1].options.variantsAllowed  | false  |
      | parameters[1].options.variantsEqual    | false  |
      | parameters[1].options.describesProduct | true   |

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC004 checking get parameters supported by a category for id "ea5b98dd-4b6f-4bd0-8c80-22c2629132d0/parameters" and get code status 200
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/ea5b98dd-4b6f-4bd0-8c80-22c2629132d0/parameters" method
    Then The status code is 200

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC005 checking get parameters supported by a category for id "42540aec-367a-4e5e-b411-17c09b08e41f/parameters" and get code status 200
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/42540aec-367a-4e5e-b411-17c09b08e41f/parameters" method
    Then The status code is 200

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC006 checking get parameters supported by a category without accept
    Given test
      | Authorization | Bearer |
    When The user GET "sale/categories/5/parameters" method
    Then The status code is 406
    And The response has the following
      | errors.code        | NotAcceptableException                                                        |
      | errors.message     | Not acceptable representation requested. Please check 'Accept' request header |
      | errors.userMessage | The request contains incorrect data. Contact the author of the application.   |

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC007 checking get parameters supported by a category without token
    Given test
      | Accept | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5/parameters" method
    Then The status code is 401
    And The response includes the following
      | error             | unauthorized                                            |
      | error_description | Full authentication is required to access this resource |

  @API @ALLEGRO @CATEGORY @PARAMETERS
  Scenario: TC008 checking get parameters supported by a category with wrong token
    Given test
      | Authorization | Bearer fail                            |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5/parameters" method
    Then The status code is 401
    And The response includes the following
      | error             | invalid_token                       |
      | error_description | Cannot convert access token to JSON |

  @API @ALLEGRO
  Scenario: TC009  checking get parameters supported by a category using POST method
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user POST "sale/categories/5/parameters" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |

  @API @ALLEGRO
  Scenario: TC010 checking get parameters supported by a category using PUT method
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user PUT "sale/categories/5/parameters" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |

  @API @ALLEGRO
  Scenario: TC011 checking get parameters supported by a category using DELETE method
    Given test
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user DELETE "sale/categories/5/parameters" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |
