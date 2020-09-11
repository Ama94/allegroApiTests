Business Need: get category by id

  @API @ALLEGRO
  Scenario: TC001 checking get category for id "5" and get code status 200
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5" method
    Then The status code is 200
    And The response includes the following
      | id                                          | 5           |
      | name                                        | Dom i Ogród |
      | leaf                                        | false       |
      | options.variantsByColorPatternAllowed       | true        |
      | options.advertisement                       | false       |
      | options.advertisementPriceOptional          | false       |
      | options.offersWithProductPublicationEnabled | false       |
      | options.productCreationEnabled              | false       |
      | options.productEANRequired                  | false       |
      | options.customParametersEnabled             | true        |

  @API @ALLEGRO
  Scenario: TC002 checking get category for id "ea5b98dd-4b6f-4bd0-8c80-22c2629132d0" and get code status 200
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/ea5b98dd-4b6f-4bd0-8c80-22c2629132d0" method
    Then The status code is 200
    And The response includes the following
      | id                                          | ea5b98dd-4b6f-4bd0-8c80-22c2629132d0 |
      | name                                        | Moda                                 |
      | leaf                                        | false                                |
      | options.variantsByColorPatternAllowed       | true                                 |
      | options.advertisement                       | false                                |
      | options.advertisementPriceOptional          | false                                |
      | options.offersWithProductPublicationEnabled | false                                |
      | options.productCreationEnabled              | true                                 |
      | options.productEANRequired                  | false                                |
      | options.customParametersEnabled             | true                                 |

  @API @ALLEGRO
  Scenario: TC003 checking get category for id "42540aec-367a-4e5e-b411-17c09b08e41f" and get code status 200
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/42540aec-367a-4e5e-b411-17c09b08e41f" method
    Then The status code is 200
    And The response includes the following
      | id                                          | 42540aec-367a-4e5e-b411-17c09b08e41f |
      | name                                        | Elektronika                          |
      | leaf                                        | false                                |
      | options.variantsByColorPatternAllowed       | true                                 |
      | options.advertisement                       | false                                |
      | options.advertisementPriceOptional          | false                                |
      | options.offersWithProductPublicationEnabled | true                                 |
      | options.productCreationEnabled              | true                                 |
      | options.productEANRequired                  | false                                |
      | options.customParametersEnabled             | true                                 |

  @API @ALLEGRO
  Scenario: TC004 checking get category for id 5 without accept
    Given The user fill headers with data
      | Authorization | Bearer |
    When The user GET "sale/categories/5" method
    Then The status code is 406
    And The response has the following
      | errors.code        | NotAcceptableException                                                        |
      | errors.message     | Not acceptable representation requested. Please check 'Accept' request header |
      | errors.userMessage | The request contains incorrect data. Contact the author of the application.   |

  @API @ALLEGRO
  Scenario: TC005 checking get category for id 5 without token
    Given The user fill headers with data
      | Accept | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5" method
    Then The status code is 401
    And The response includes the following
      | error             | unauthorized                                            |
      | error_description | Full authentication is required to access this resource |

  @API @ALLEGRO
  Scenario: TC006 checking get category for id 5 with wrong token
    Given The user fill headers with data
      | Authorization | Bearer fail                            |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/5" method
    Then The status code is 401
    And The response includes the following
      | error             | invalid_token                       |
      | error_description | Cannot convert access token to JSON |

  @API @ALLEGRO
  Scenario: TC007 checking get category with not existing id
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user GET "sale/categories/141" method
    Then The status code is 404
    And The response has the following
      | errors.code    | ERROR                     |
      | errors.message | Category '141' not found  |
      | errors.details | ResourceNotFoundException |

  @API @ALLEGRO
  Scenario: TC008 checking get category by id using POST method
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user POST "sale/categories/5" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |

  @API @ALLEGRO
  Scenario: TC009 checking get category by id using PUT method
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user PUT "sale/categories/5" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |

  @API @ALLEGRO
  Scenario: TC010 checking get category by id using DELETE method
    Given The user fill headers with data
      | Authorization | Bearer                                 |
      | Accept        | application/vnd.allegro.public.v1+json |
    When The user DELETE "sale/categories/5" method
    Then The status code is 405
    And The response has the following
      | errors.code        | NotAllowedException            |
      | errors.message     | The HTTP method is not allowed |
      | errors.userMessage | An error occurred              |