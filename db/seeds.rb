# frozen_string_literal: true

rom = Hanami.app["persistence.rom"]
users = rom.relations["users"]

users.insert name: "Jane Smith", email: "jsmith@example.com"
users.insert name: "Jack Doe", email: "jdoe@example.com"
