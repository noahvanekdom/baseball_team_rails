# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


@rays = Team.create!(city: "Tampa Bay", team_name: "Rays", win_percent: 0.718, division_leader:true)
@cardinals = Team.create!(city: "St. Louis", team_name: "Cardinals", win_percent: 0.619, division_leader:true)

@nolan = @cardinals.players.create!(name: "Nolan Arenado", slg: 0.547, obp: 0.419, rule_5_elig: true, handed: "L")
@paul = @cardinals.players.create!(name: "Paul Goldschmidt", slg: 0.594, obp: 0.400, rule_5_elig: false, handed: "L")
@shane = @rays.players.create!(name: "Shane Bas", slg: 0.198, obp: 0.209, rule_5_elig: true, handed: "R")
