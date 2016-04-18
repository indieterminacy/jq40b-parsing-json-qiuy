Feature: Parse JSON dataset
    And manage the parsing of keys and values
    Using the toolset jmespath

    TODO:
        Research generators
        Identify distinction between yield and return
        Investigate distinction in pytest context

@parsing @quiy @json @datasets @jmespath
Background:
    Given Test cv data includes:
    And Tool Jmespath used
        # |required_object|quorum|required class|dataset|required dictionary
        # result|required volume|required repository
    And Content type requirements are:
        Examples:
            |organisation|role|city|country|start|end|description|
            |HSBXL|Member and Volunteer|Brussels|2013||TODO|
        Examples:
            # q20_10r_experience_employer = {
            #     "organisation": "HSBXL",
            #     "role": "Member and Volunteer",
            #     "website": "https://hackerspace.be/welcome/index.html",
            #     "start" = 2013,
            #     "end" = "->",
            #     "city" = "Brussels",
            #     "country" = "Belgium",
            #     "description" = "TODO"
            # }
    When Content type, <content_type> is the same as CV
    Then System parsing requirements includes:
        Examples:
            |content_type|context|required_object|quorum|required class|dataset|
            |history employment|organisations|0|experiences|metoodata|

@requirements_creator @quorum @required_object @required_class @context @required_class
Scenario Outline: Build parsing requirements creator
    Given Context object relates to content
    And Content type, <content_type> is cv
    When Volume of context, <context> is positive
    Then Build into unique list: <context>, <required_class>,<required_object>,<quorum>
    # Examples:
        # |organisation|role|city|country|start|end|description|
    Examples:
        '''
        '''
        '''
        {
            {
                "organisation": "Samu Communications",
                "organisationcode": "samu",
                "role": "Communications Officer & Web Developer",
                "website": "http://www.samucommunications.co.uk/",
                "start": 2013,
                "end": 2015,
                "intensity": "part time",
                "duration": "various",
                "city": "Various",
                "country": "various",
                "description": {
                    "item1": "This is description 1",
                    "item2": "This is description 4"
                }
            },
            {
                "organisation": "New Ventures",
                "organisationcode": "newventures",
                "role": "Associate",
                "website": "http://www.newventures.be",
                "start": 2010,
                "end": 2013,
                "city": "Brussels",
                "country": "Belgium",
                "description": {
                    "item2": "This is description 2",
                    "item1": "This is description 4"
                }
            },
            {
                "organisation": "Various",
                "organisationcode": "various",
                "role": "Copywriter",
                "start": 2010,
                "end": "->",
                "city": "Brussels",
                "country": "Belgium",
                "description": {
                    "item1": "This is description 3",
                    "item2": "This is description 4"
                }
            }
        }
        '''
        '''
        '''

@requirements @quorum @required_object @required_class @context @required_class
Scenario Outline: Build parsing requirements
        Given The function call, jq40y_parse_requirements is called
        When Arguments include: <context>, <required_class>, <required_object>, <quorum>
        # When Organisation selected is <organisation>
        Then JSON parsing requirement, <content_type>.required_object.<required_object> created from <required_class>, <quorum> and <required_object>
        And Context parse requirement added to <context> object

@sources
Scenario Outline: Provide source material

@executing
Scenario Outline: Execute in order to generate parsed object data
    Given Parsing requirements collected at object <content_type>.required_object.<required_object>
    And Dataset to be parsed, <dataset> is available
    When Arguments include <content_type>, <required_object>
