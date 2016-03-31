Feature: Export families
  In order to be able to access and modify families outside PIM
  As a product manager
  I need to be able to export families

  @javascript
  Scenario: Successfully export families
    Given a "footwear" catalog configuration
    And the following job "footwear_family_export" configuration:
      | filePath | %tmp%/family_export/family.csv |
    And I am logged in as "Julia"
    And I am on the "footwear_family_export" export job page
    When I launch the export job
    And I wait for the "footwear_family_export" job to finish
    Then I should see "Read 4"
    And I should see "Written 4"
    And exported file of "footwear_family_export" should contain:
      """
      code;label-en_US;attributes;attribute_as_label;requirements-mobile;requirements-tablet
      boots;Boots;color,description,lace_color,manufacturer,name,price,rating,side_view,size,sku,top_view,weather_conditions;name;color,name,price,size,sku;color,description,name,price,rating,side_view,size,sku,weather_conditions
      heels;Heels;color,description,heel_color,manufacturer,name,price,side_view,size,sku,sole_color,sole_fabric,top_view;name;color,heel_color,name,price,size,sku,sole_color;color,description,heel_color,name,price,side_view,size,sku,sole_color
      sneakers;Sneakers;color,description,lace_color,manufacturer,name,price,rating,side_view,size,sku,top_view,weather_conditions;name;color,name,price,size,sku;color,description,name,price,rating,side_view,size,sku,weather_conditions
      sandals;Sandals;color,description,manufacturer,name,price,rating,side_view,size,sku;name;color,name,price,size,sku;color,description,name,price,rating,side_view,size,sku
      """

  @javascript
  Scenario: Successfully export families
    Given a "footwear" catalog configuration
    And the following family:
      | code      | label-en_US |requirements-tablet | requirements-mobile |
      | tractors  |             |sku                 | sku                 |
    And the following job "footwear_family_export" configuration:
      | filePath | %tmp%/family_export/family.csv |
    And I am logged in as "Julia"
    And I am on the "footwear_family_export" export job page
    When I launch the export job
    And I wait for the "footwear_family_export" job to finish
    Then I should see "Read 5"
    And I should see "Written 5"
    And exported file of "footwear_family_export" should contain:
      """
      code;label-en_US;attributes;attribute_as_label;requirements-mobile;requirements-tablet
      boots;Boots;color,description,lace_color,manufacturer,name,price,rating,side_view,size,sku,top_view,weather_conditions;name;color,name,price,size,sku;color,description,name,price,rating,side_view,size,sku,weather_conditions
      heels;Heels;color,description,heel_color,manufacturer,name,price,side_view,size,sku,sole_color,sole_fabric,top_view;name;color,heel_color,name,price,size,sku,sole_color;color,description,heel_color,name,price,side_view,size,sku,sole_color
      sneakers;Sneakers;color,description,lace_color,manufacturer,name,price,rating,side_view,size,sku,top_view,weather_conditions;name;color,name,price,size,sku;color,description,name,price,rating,side_view,size,sku,weather_conditions
      sandals;Sandals;color,description,manufacturer,name,price,rating,side_view,size,sku;name;color,name,price,size,sku;color,description,name,price,rating,side_view,size,sku
      tractors;;sku;sku;sku;sku
      """
