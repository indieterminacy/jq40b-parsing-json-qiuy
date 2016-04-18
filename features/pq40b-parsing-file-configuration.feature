Feature: Parse JSON configuration
    And manage the parsing of keys and values
    Using the toolset jmespath

    TODO:
        Research generators
        Identify distinction between yield and return
        Investigate distinction in pytest context

@initiation @application @configs @configuration @content @data
Background:
    Given: Application initiated
    When Function call qp50_configuration_master generated
    Then Relevant data collected
    Examples: Information for creating arguments for the function call, jq10_load_files
        |application_root|folder_name|file_name|file_type|theme|object type evaluated|object_type_required|
        |"~/20_Content/20k_Content_Types/60_json-qiuy/"|"JQ_20_Content/"|"jq10r_content_activity_extra_curricular"|"json"|"extra curricular"|"jsontype"|"dictionary"|
        |"~/20_Content/20k_Content_Types/60_json-qiuy/"|"JQ_20_Content/"|"jq10r_content_history_employment"|"json"|"employment"|"jsontype"|"dictionary"|
        |"~/20_Content/20k_Content_Types/60_json-qiuy/"|"JQ_20_Content/"|"jq10r_content_history_academia"|"json"|"academia"|"jsontype"|"dictionary"|
        |"~/20_Content/20k_Content_Types/60_json-qiuy/"|"JQ_20_Content/"|"jq10r_content_skills_programming"|"json"|"skills"|"jsontype|"dictionary"|
        |"~/20_Content/20k_Content_Types/60_json-qiuy/"|"JQ_20_Content/"|"jq20t_content_contact_details"|"json"|"contact"|"jsontype"|"dictionary"|

@parsing @content_types @directory_folder @files
Scenario: Initiate the parsing of directory sourced configuration file for each content type
    Given Directory folder, <application_root> is a folder directory
        But Not a url
    And Directory folder, <application_root><folder_name> exists
    And <file_name>, with file_type <file_type> exists in folder <application_root><folder_name>
    When QP50i_Configuration is called
    Then Function call jq10_load_files(<folder_name>,<file_name>,<file_type>,<theme>,<object_type_required>) called

@parsing @content_types @url
Scenario: Initiate the parsing of url sourced configuration file for each content type
    Given Directory folder, <application_root> is a url
        But Not a directory folder
    And Url, <application_root><folder_name><file_name> exists
    And Url content contains file type, <file_type>
    When Function call, qp50i_configuration is called
    Then Function call, jq40y_load_url(<folder_name>,<file_name>,<file_type>,<theme>,<object_type_required>) called



