# CompanyFinder
This is a simple iOS app that helps you to search for any company that is registered in UK. This is a single screen app with very limited functionality.

# How it works?
Once the app is launched you will have a searchbar. Just enter something and it returns the limited companies that are registered in UK.

Attach Image Here

## Search Results
By default the app displays 100 results. The max number of results single API can fetch is 100. The default value can be changed in `line 16 of Endpoint.swift file`


## Info Display
This app also displays number of results in current page and total results.

# What does this app demonstrates
This app have very limited functionality, but it demonstrates lot of things.

## Architecture
The project CompanyFinder is using MVVM architecture. 

## Test Coverage
As there is very limited UI, I've only concentrated in writing Unit Tests. This app have code coverage of 41.9%. I know this is very low, but most of the core classes are covered 100%

Attach Image Here

With this well architectured app it achieves maintainability, testability, scalability, and readability.


# Companies House API
The app uses Companies House API to display the list of companies based on the user search. The Companies House API lets you retrieve information about limited companies (and other companies that fall within the Companies Act 2006). The data returned is live and real-time, and is simple to use and understand.

### Search API
When user enters the search term and click search, the following API is called to fetch the data.

#### Request
GET https://api.company-information.service.gov.uk/search/companies

#### Query Paramenter

| Parameter name        | Value           | Description  |
| --------------------- |----------------:| ------------:|
|q                      |string           |The term being searched for|
|items_per_page         |integer          |The number of search results to return per page|
|start_index                    |integer           |The index of the first result item to return.|
|restrictions	|string	|Enumerable options to restrict search results. Space separate multiple restriction options to combine functionality. For a "company name availability" search use "active-companies legally-equivalent-company-name" together.

#### Authorisation
This request requires an API key in the authorization header.

## Extended Functionalities

1. Configuration File: When the app grows in size it will be hard to manage the detault values. So it's better to add a configuration file whihc holds the list of defaults. 
2. Custom Tableview Cell: We can add custome tableview cell to display more information.
3. 
