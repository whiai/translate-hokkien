README.md

# The ~/.dbt/profiles.yml is:

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