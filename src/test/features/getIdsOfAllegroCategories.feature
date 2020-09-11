Business Need: get ids of allegro categories

  @API @ALLEGRO
  Scenario: TC001 checking get ids of allegro categories, get code status 200 and check response JSON
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories" method
    Then The status code is 200
    And The response includes the following
      | categories[0].id   | 5           |
      | categories[0].name | Dom i Ogród |

  @API @ALLEGRO
  Scenario: TC002 checking get ids of allegro categories, get code status 200 and check response JSON
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories" method
    Then The status code is 200
    And The response includes the following
      | categories[2].id   | 42540aec-367a-4e5e-b411-17c09b08e41f |
      | categories[2].name | Elektronika                          |
      | categories[5].id   | 38d588fd-7e9c-4c42-a4ae-6831775eca45 |
      | categories[5].name | Kultura i rozrywka                   |

  @API @ALLEGRO
  Scenario: TC003 checking get ids of allegro categories, get code status 200 and check response JSON
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories" method
    Then The status code is 200
    And The response includes the following
      | categories[0].id                                          | 5           |
      | categories[0].name                                        | Dom i Ogród |
      | categories[0].leaf                                        | false       |
      | categories[0].options.variantsByColorPatternAllowed       | true        |
      | categories[0].options.advertisement                       | false       |
      | categories[0].options.advertisementPriceOptional          | false       |
      | categories[0].options.offersWithProductPublicationEnabled | false       |
      | categories[0].options.productCreationEnabled              | false       |
      | categories[0].options.productEANRequired                  | false       |
      | categories[0].options.customParametersEnabled             | true        |

  @API @ALLEGRO
  Scenario: TC004 checking get ids of allegro categories without accept
    Given The user fill headers with data
      | Authorization | Bearer |
    When The user GET "sale/categories" method
    Then The status code is 406
    And The response has the following
      | errors.code        | NotAcceptableException                                                        |
      | errors.message     | Not acceptable representation requested. Please check 'Accept' request header |
      | errors.userMessage | The request contains incorrect data. Contact the author of the application.   |


  @API @ALLEGRO
  Scenario: TC005 checking get ids of allegro categories without authorization
    Given The user fill headers with data
      | Accept | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories" method
    Then The status code is 401

  @API @ALLEGRO
  Scenario: TC006 checking get ids of allegro categories with wrong bearer token
    Given The user fill headers with data
      | Authorization | Bearer test                         |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories" method
    Then The status code is 401

  @API @ALLEGRO
  Scenario: TC007 checking get ids of allegro categories using POST method
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user POST "sale/categories" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |

  @API @ALLEGRO
  Scenario: TC008 checking get ids of allegro categories using PUT method
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user PUT "sale/categories" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |

  @API @ALLEGRO
  Scenario: TC009 checking get ids of allegro categories using DELETE method
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user DELETE "sale/categories" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |