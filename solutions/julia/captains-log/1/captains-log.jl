using Random

random_planet() = rand("DHJKLMNRTY")

random_ship_registry_number() = "NCC-$(1000 + rand(0:8999))"

random_stardate() = 41000.0 + 1000.0 * rand()

random_stardate_v2() = rand(41000:41999) + rand(0.0:0.1:0.9)

pick_starships(starships, number_needed) = Random.shuffle(starships)[1:number_needed]
