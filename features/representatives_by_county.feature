Feature: display a list of representatives when clicking on a county

  As a user of the app
  So that I can easily get in touch with representatives of my county
  I want to click on a county and get the list of all the representatives

Background: Already on a county page

  Given the following states exist:
    | name       | symbol | fips_code | is_territory | lat_min     | lat_max     | long_min  | long_max    |
    | California | CA     | 06        | 0            | -124.409591 | -114.131211 | 32.534156 | -114.131211 |
    | Oregon     | OR     | 41        | 0            | -124.566244 | -116.463501 | 41.991794 | -116.463504 |
    | Nevada     | NV     | 32        | 0            | -120.005746 | -114.039648 | 35.001857 | -114.039648 |

  And the following counties in CA exist:
    | name                 | fips_code | fips_class |
    | Alameda County       | 001       | H1         |
    | Alpine County        | 003       | H1         |
    | San Francisco County | 075       | H6         |

  And I am on the California state page

  Scenario: Search representatives by county
    And I follow "View"
    Then I should see "Gavin Newsom"
    And I should see "Governor of California"
