@javascript
Feature: Filter export profiles
  In order to filter export profiles in the catalog
  As a user
  I need to be able to filter export profiles in the catalog

  Scenario: Successfully filter export profiles
    Given a "footwear" catalog configuration
    And I am logged in as "admin"
    And I am on the exports page
    Then the grid should contain 6 elements
    And I should see export profiles footwear_product_export, footwear_category_export, footwear_association_export, footwear_group_export, footwear_attribute_export and footwear_option_export
    And I should be able to use the following filters:
      | filter    | value                | result                                                                                                                                                      |
      | Code      | at                   | footwear_association_export, footwear_attribute_export and footwear_category_export                                                                         |
      | Label     | Product              | footwear_product_export                                                                                                                                     |
      | Job       | group_export         | footwear_group_export                                                                                                                                       |
      | Connector | Akeneo CSV Connector | footwear_product_export, footwear_category_export, footwear_association_export, footwear_group_export, footwear_attribute_export and footwear_option_export |
      | Status    | Ready                | footwear_product_export, footwear_category_export, footwear_association_export, footwear_group_export, footwear_attribute_export and footwear_option_export |
