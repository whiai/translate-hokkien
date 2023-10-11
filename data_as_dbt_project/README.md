README.md

# Setup Instructions
## The ~/.dbt/profiles.yml is:

    translate_hokkien:
      outputs:
    
        dev:
          type: sqlite
          threads: 1
          database: TRANSLATE_HOKKIEN
          schema: 'main'
          schemas_and_paths:
            main: 'data/TRANSLATE_HOKKIEN.db'
          schema_directory: 'data'
          # extensions:
          #   - '/path/to/sqlite-digest/digest.so'
    
      target: dev

# Commands that can be run

- dbt parse
- dbt build <- Might be more appropriate for the SQLite3 dbt Adapter
- dbt run
- dbt docs generate
- dbt docs serve