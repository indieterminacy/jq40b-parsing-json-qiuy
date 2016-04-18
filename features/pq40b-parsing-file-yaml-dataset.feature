Feature: Parse YAML dataset
    And prepare the material to be interpreted through a jinja2 template into tex

    TODO:
        Research generators
        Identify distinction between yield and return

@parsing @qiuy @yaml @datasets
Scenario Outline: Import Yaml content:
    Examples:
        cv_experience:
            - organisation: HSBXL
            - role: Member and Volunteer
            - city: Brussels
            - country: Belgium
            - start: 2013
            - end:
            - description: | This is a description on two
                lines
                Given YAML dataset loaded
                When data to parse contains cv_experience
                Then Ready data for parsing into jinja2 template
