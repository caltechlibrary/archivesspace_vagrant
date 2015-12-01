/*
// Accession Fields from API:
    accession.each{k,v ->
        println "DEBUG k: ${k}"
    }

    DEBUG k: access_restrictions
    DEBUG k: accession_date
    DEBUG k: classifications
    DEBUG k: condition_description
    DEBUG k: content_description
    DEBUG k: create_time
    DEBUG k: created_by
    DEBUG k: dates
    DEBUG k: deaccessions
    DEBUG k: display_string
    DEBUG k: extents
    DEBUG k: external_documents
    DEBUG k: external_ids
    DEBUG k: general_note
    DEBUG k: id_0
    DEBUG k: id_1
    DEBUG k: instances
    DEBUG k: jsonmodel_type
    DEBUG k: last_modified_by
    DEBUG k: linked_agents
    DEBUG k: linked_events
    DEBUG k: lock_version
    DEBUG k: provenance
    DEBUG k: publish
    DEBUG k: related_accessions
    DEBUG k: related_resources
    DEBUG k: repository
    DEBUG k: restrictions_apply
    DEBUG k: rights_statements
    DEBUG k: subjects
    DEBUG k: suppressed
    DEBUG k: system_mtime
    DEBUG k: title
    DEBUG k: uri
    DEBUG k: use_restrictions
    DEBUG k: user_defined
    DEBUG k: user_mtime
*/

/*
// Agent fields
DEBUG k: agent_contacts
DEBUG k: agent_type
DEBUG k: create_time
DEBUG k: dates_of_existence
DEBUG k: display_name
DEBUG k: external_documents
DEBUG k: is_linked_to_published_record
DEBUG k: jsonmodel_type
DEBUG k: linked_agent_roles
DEBUG k: lock_version
DEBUG k: names
DEBUG k: notes
DEBUG k: publish
DEBUG k: related_agents
DEBUG k: rights_statements
DEBUG k: system_mtime
DEBUG k: title
DEBUG k: uri
DEBUG k: user_mtime

Example records:

DEBUG agent record: {
    "agent_contacts": [
        {
            "create_time": "2015-07-28T19:48:49Z",
            "created_by": "admin",
            "jsonmodel_type": "agent_contact",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name": "Zirin",
            "system_mtime": "2015-07-28T19:48:49Z",
            "telephones": [

            ],
            "user_mtime": "2015-07-28T19:48:49Z"
        }
    ],
    "agent_type": "agent_person",
    "create_time": "2015-07-28T19:48:49Z",
    "created_by": "admin",
    "dates_of_existence": [

    ],
    "display_name": {
        "authorized": true,
        "create_time": "2015-07-28T19:48:49Z",
        "created_by": "admin",
        "is_display_name": true,
        "jsonmodel_type": "name_person",
        "last_modified_by": "admin",
        "lock_version": 0,
        "name_order": "inverted",
        "primary_name": "Zirin",
        "rest_of_name": "Harold",
        "rules": "dacs",
        "sort_name": "Zirin, Harold",
        "sort_name_auto_generate": true,
        "source": "local",
        "system_mtime": "2015-07-28T19:48:49Z",
        "use_dates": [

        ],
        "user_mtime": "2015-07-28T19:48:49Z"
    },
    "external_documents": [

    ],
    "is_linked_to_published_record": true,
    "jsonmodel_type": "agent_person",
    "last_modified_by": "admin",
    "linked_agent_roles": [
        "creator"
    ],
    "lock_version": 9,
    "names": [
        {
            "authorized": true,
            "create_time": "2015-07-28T19:48:49Z",
            "created_by": "admin",
            "is_display_name": true,
            "jsonmodel_type": "name_person",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name_order": "inverted",
            "primary_name": "Zirin",
            "rest_of_name": "Harold",
            "rules": "dacs",
            "sort_name": "Zirin, Harold",
            "sort_name_auto_generate": true,
            "source": "local",
            "system_mtime": "2015-07-28T19:48:49Z",
            "use_dates": [

            ],
            "user_mtime": "2015-07-28T19:48:49Z"
        }
    ],
    "notes": [

    ],
    "publish": true,
    "related_agents": [

    ],
    "rights_statements": [

    ],
    "system_mtime": "2015-07-28T19:48:50Z",
    "title": "Zirin, Harold",
    "uri": "/agents/people/2403",
    "user_mtime": "2015-07-28T19:48:49Z"
}
DEBUG agent record: {
    "agent_contacts": [
        {
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "jsonmodel_type": "agent_contact",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name": "Zukoski",
            "system_mtime": "2015-07-28T19:48:50Z",
            "telephones": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "agent_type": "agent_person",
    "create_time": "2015-07-28T19:48:50Z",
    "created_by": "admin",
    "dates_of_existence": [

    ],
    "display_name": {
        "authorized": true,
        "create_time": "2015-07-28T19:48:50Z",
        "created_by": "admin",
        "is_display_name": true,
        "jsonmodel_type": "name_person",
        "last_modified_by": "admin",
        "lock_version": 0,
        "name_order": "inverted",
        "primary_name": "Zukoski",
        "rest_of_name": "Edward",
        "rules": "dacs",
        "sort_name": "Zukoski, Edward",
        "sort_name_auto_generate": true,
        "source": "local",
        "system_mtime": "2015-07-28T19:48:50Z",
        "use_dates": [

        ],
        "user_mtime": "2015-07-28T19:48:50Z"
    },
    "external_documents": [

    ],
    "is_linked_to_published_record": true,
    "jsonmodel_type": "agent_person",
    "last_modified_by": "admin",
    "linked_agent_roles": [
        "creator"
    ],
    "lock_version": 1,
    "names": [
        {
            "authorized": true,
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "is_display_name": true,
            "jsonmodel_type": "name_person",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name_order": "inverted",
            "primary_name": "Zukoski",
            "rest_of_name": "Edward",
            "rules": "dacs",
            "sort_name": "Zukoski, Edward",
            "sort_name_auto_generate": true,
            "source": "local",
            "system_mtime": "2015-07-28T19:48:50Z",
            "use_dates": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "notes": [

    ],
    "publish": true,
    "related_agents": [

    ],
    "rights_statements": [

    ],
    "system_mtime": "2015-07-28T19:48:50Z",
    "title": "Zukoski, Edward",
    "uri": "/agents/people/2404",
    "user_mtime": "2015-07-28T19:48:50Z"
}
DEBUG agent record: {
    "agent_contacts": [
        {
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "jsonmodel_type": "agent_contact",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name": "Zurek",
            "system_mtime": "2015-07-28T19:48:50Z",
            "telephones": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "agent_type": "agent_person",
    "create_time": "2015-07-28T19:48:50Z",
    "created_by": "admin",
    "dates_of_existence": [

    ],
    "display_name": {
        "authorized": true,
        "create_time": "2015-07-28T19:48:50Z",
        "created_by": "admin",
        "is_display_name": true,
        "jsonmodel_type": "name_person",
        "last_modified_by": "admin",
        "lock_version": 0,
        "name_order": "inverted",
        "primary_name": "Zurek",
        "rest_of_name": "Richard",
        "rules": "dacs",
        "sort_name": "Zurek, Richard",
        "sort_name_auto_generate": true,
        "source": "local",
        "system_mtime": "2015-07-28T19:48:50Z",
        "use_dates": [

        ],
        "user_mtime": "2015-07-28T19:48:50Z"
    },
    "external_documents": [

    ],
    "is_linked_to_published_record": true,
    "jsonmodel_type": "agent_person",
    "last_modified_by": "admin",
    "linked_agent_roles": [
        "creator"
    ],
    "lock_version": 1,
    "names": [
        {
            "authorized": true,
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "is_display_name": true,
            "jsonmodel_type": "name_person",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name_order": "inverted",
            "primary_name": "Zurek",
            "rest_of_name": "Richard",
            "rules": "dacs",
            "sort_name": "Zurek, Richard",
            "sort_name_auto_generate": true,
            "source": "local",
            "system_mtime": "2015-07-28T19:48:50Z",
            "use_dates": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "notes": [

    ],
    "publish": true,
    "related_agents": [

    ],
    "rights_statements": [

    ],
    "system_mtime": "2015-07-28T19:48:50Z",
    "title": "Zurek, Richard",
    "uri": "/agents/people/2405",
    "user_mtime": "2015-07-28T19:48:50Z"
}
DEBUG agent record: {
    "agent_contacts": [
        {
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "jsonmodel_type": "agent_contact",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name": "Zweig",
            "system_mtime": "2015-07-28T19:48:50Z",
            "telephones": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "agent_type": "agent_person",
    "create_time": "2015-07-28T19:48:50Z",
    "created_by": "admin",
    "dates_of_existence": [

    ],
    "display_name": {
        "authorized": true,
        "create_time": "2015-07-28T19:48:50Z",
        "created_by": "admin",
        "is_display_name": true,
        "jsonmodel_type": "name_person",
        "last_modified_by": "admin",
        "lock_version": 0,
        "name_order": "inverted",
        "primary_name": "Zweig",
        "rest_of_name": "George",
        "rules": "dacs",
        "sort_name": "Zweig, George",
        "sort_name_auto_generate": true,
        "source": "local",
        "system_mtime": "2015-07-28T19:48:50Z",
        "use_dates": [

        ],
        "user_mtime": "2015-07-28T19:48:50Z"
    },
    "external_documents": [

    ],
    "is_linked_to_published_record": true,
    "jsonmodel_type": "agent_person",
    "last_modified_by": "admin",
    "linked_agent_roles": [
        "creator"
    ],
    "lock_version": 3,
    "names": [
        {
            "authorized": true,
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "is_display_name": true,
            "jsonmodel_type": "name_person",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name_order": "inverted",
            "primary_name": "Zweig",
            "rest_of_name": "George",
            "rules": "dacs",
            "sort_name": "Zweig, George",
            "sort_name_auto_generate": true,
            "source": "local",
            "system_mtime": "2015-07-28T19:48:50Z",
            "use_dates": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "notes": [

    ],
    "publish": true,
    "related_agents": [

    ],
    "rights_statements": [

    ],
    "system_mtime": "2015-07-28T19:48:50Z",
    "title": "Zweig, George",
    "uri": "/agents/people/2406",
    "user_mtime": "2015-07-28T19:48:50Z"
}
DEBUG agent record: {
    "agent_contacts": [
        {
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "jsonmodel_type": "agent_contact",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name": "Zwicky",
            "system_mtime": "2015-07-28T19:48:50Z",
            "telephones": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "agent_type": "agent_person",
    "create_time": "2015-07-28T19:48:50Z",
    "created_by": "admin",
    "dates_of_existence": [

    ],
    "display_name": {
        "authorized": true,
        "create_time": "2015-07-28T19:48:50Z",
        "created_by": "admin",
        "is_display_name": true,
        "jsonmodel_type": "name_person",
        "last_modified_by": "admin",
        "lock_version": 0,
        "name_order": "inverted",
        "primary_name": "Zwicky",
        "rest_of_name": "Fritz",
        "rules": "dacs",
        "sort_name": "Zwicky, Fritz",
        "sort_name_auto_generate": true,
        "source": "local",
        "system_mtime": "2015-07-28T19:48:50Z",
        "use_dates": [

        ],
        "user_mtime": "2015-07-28T19:48:50Z"
    },
    "external_documents": [

    ],
    "is_linked_to_published_record": true,
    "jsonmodel_type": "agent_person",
    "last_modified_by": "admin",
    "linked_agent_roles": [
        "creator"
    ],
    "lock_version": 4,
    "names": [
        {
            "authorized": true,
            "create_time": "2015-07-28T19:48:50Z",
            "created_by": "admin",
            "is_display_name": true,
            "jsonmodel_type": "name_person",
            "last_modified_by": "admin",
            "lock_version": 0,
            "name_order": "inverted",
            "primary_name": "Zwicky",
            "rest_of_name": "Fritz",
            "rules": "dacs",
            "sort_name": "Zwicky, Fritz",
            "sort_name_auto_generate": true,
            "source": "local",
            "system_mtime": "2015-07-28T19:48:50Z",
            "use_dates": [

            ],
            "user_mtime": "2015-07-28T19:48:50Z"
        }
    ],
    "notes": [

    ],
    "publish": true,
    "related_agents": [

    ],
    "rights_statements": [

    ],
    "system_mtime": "2015-07-28T19:48:50Z",
    "title": "Zwicky, Fritz",
    "uri": "/agents/people/2407",
    "user_mtime": "2015-07-28T19:48:50Z"
}
*/

