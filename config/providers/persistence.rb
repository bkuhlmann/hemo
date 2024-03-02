# frozen_string_literal: true

# :nocov:
# rubocop:todo Metrics/BlockLength
Hanami.app.register_provider :persistence, namespace: true do
  prepare do
    require "rom-changeset"
    require "rom/core"
    require "rom/sql"

    Sequel::Database.extension :constant_sql_override, :pg_enum
    Sequel.database_timezone = :utc
    Sequel.application_timezone = :local

    configuration = ROM::Configuration.new :sql, target["settings"].database_url

    configuration.plugin :sql, relations: :instrumentation do |plugin_config|
      plugin_config.notifications = target["notifications"]
    end

    configuration.plugin :sql, relations: :auto_restrictions

    database = configuration.gateways[:default].connection
    database.set_constant_sql Sequel::CURRENT_TIMESTAMP, "(CURRENT_TIMESTAMP AT TIME ZONE 'UTC')"

    register "config", configuration
    register "db", database

    Sequel::Migrator.is_current? database, Hanami.app.root.join("db/migrate")
  rescue NoMethodError, Sequel::Migrator::Error => error
    message = error.message
    Hanami.logger.error message unless error.is_a?(NoMethodError) && message.include?("migration")
  end

  start do
    configuration = target["persistence.config"]

    configuration.auto_registration(
      target.root.join("lib/hemo/persistence"),
      namespace: "Hemo::Persistence"
    )

    register "rom", ROM.container(configuration)
  end
end
# rubocop:enable Metrics/BlockLength
