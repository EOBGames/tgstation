//Ingredients and Simple Dishes
/obj/item/food/kimchi
	name = "kimchi"
	desc = "A classic Korean dish in the Martian style- shredded cabbage with chilli peppers, konbu, bonito, and a mix of spices."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "kimchi"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 3,
	)
	tastes = list("spicy cabbage" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/uncured_kamaboko
	name = "uncured surimi"
	desc = "A portion of uncured fish surimi."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "uncured_kamaboko"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("fish" = 1)
	foodtypes = SEAFOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/uncured_kamaboko/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/dryable, /obj/item/food/kamaboko)

/obj/item/food/kamaboko
	name = "kamaboko"
	desc = "A Japanese-style cured fishcake frequently used in snacks and ramen."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "kamaboko"
	food_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/protein = 2)
	tastes = list("fish" = 1)
	foodtypes = SEAFOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/sambal
	name = "sambal"
	desc = "A spice paste from Indonesia, used widely in cooking throughout South East Asia."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "sambal"
	food_reagents = list(
		/datum/reagent/consumable/nutriment/vitamin = 3,
		/datum/reagent/consumable/capsaicin = 2
	)
	tastes = list("chilli heat" = 1, "umami" = 1)
	foodtypes = SEAFOOD | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/katsu_fillet
	name = "katsu fillet"
	desc = "Breaded and deep fried meat, used for a variety of dishes."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "katsu_fillet"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("meat" = 1, "breadcrumbs" = 1)
	foodtypes = MEAT | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/rice_dough
	name = "rice dough"
	desc = "A piece of dough made with equal parts rice flour and wheat flour, for a unique flavour."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "rice_dough"
	food_reagents = list(/datum/reagent/consumable/nutriment = 6)
	tastes = list("dough" = 1)
	foodtypes = GRAIN

/obj/item/food/rice_dough/MakeBakeable()
	AddComponent(/datum/component/bakeable, /obj/item/food/bread/reispan, rand(30 SECONDS, 45 SECONDS), TRUE, TRUE)

/obj/item/food/rice_dough/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/noodles, 3, 3 SECONDS, table_required = TRUE)

/obj/item/food/noodles
	name = "fresh noodles"
	desc = "Rice noodles, made fresh. Remember, there is no secret ingredient."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "noodles"
	tastes = list("dough" = 1)
	foodtypes = GRAIN

/obj/item/food/bread/reispan
	name = "reispan"
	desc = "Though the concept of rice bread has been common in Asia for centuries, the reispan as we know it today is most commonly associated with Mars- where limited arable land has forced ingenuity."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "reispan"
	food_reagents = list(/datum/reagent/consumable/nutriment = 15)
	tastes = list("bread" = 10)
	foodtypes = GRAIN | VEGETABLES
	venue_value = FOOD_PRICE_TRASH

/obj/item/food/bread/reispan/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/breadslice/reispan, 5, 3 SECONDS, table_required = TRUE)

/obj/item/food/breadslice/reispan
	name = "reispan slice"
	desc = "A slice of reispan, for use in Martian-style sandwiches."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "reispan_slice"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 2)
	foodtypes = GRAIN | VEGETABLES

// Fried Rice

/obj/item/food/salad/hurricane_rice
	name = "hurricane fried rice"
	desc = "Inspired by nasi goreng, this piquant rice dish comes straight from Prospect, on Mars, and its night markets. It's named for its distinctive cooking style, where the frying rice is given lots of airtime while being flipped, mostly because it looks really cool for the customers."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "hurricane_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("rice" = 1, "meat" = 1, "pineapple" = 1, "veggies" = 1)
	foodtypes = MEAT | GRAIN | PINEAPPLE | FRUIT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/ikareis
	name = "ikareis"
	desc = "A spicy rice dish made with squid-ink, peppers, onions, sausage, and flavourful chillis."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "ikareis"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("rice" = 1, "squid ink" = 1, "veggies" = 1, "sausage" = 1, "chilli heat" = 1)
	foodtypes = MEAT | GRAIN | SEAFOOD | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/hawaiian_fried_rice
	name = "\improper Hawaiian fried rice"
	desc = "Not a traditional Hawaiian dish, Hawaiian fried rice instead utilises a pastiche of Hawaiian ingredients- including diced Chap and, controversially, pineapple. Purists are split on whether pineapple belongs in rice."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "hawaiian_fried_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("rice" = 1, "pork" = 1, "pineapple" = 1, "soy sauce" = 1, "veggies" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/ketchup_fried_rice
	name = "ketchup fried rice"
	desc = "A classic Japanese comfort food, made with sausage, veggies, worchestershire sauce, rice- oh, and of course, ketchup."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "ketchup_fried_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("rice" = 1, "sausage" = 1, "ketchup" = 1, "veggies" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/mediterranean_fried_rice
	name = "mediterranean fried rice"
	desc = "A strange take on the fried rice formula: herbs, cheese, olives, and of course, meatballs. Sorta like a hybrid of risotto and fried rice."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "mediterranean_fried_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("rice" = 1, "sausage" = 1, "ketchup" = 1, "veggies" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/egg_fried_rice
	name = "egg fried rice"
	desc = "As simple as fried rice gets: rice, egg, soy sauce. Simple, elegant, and infinitely customisable."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "egg_fried_rice"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("rice" = 1, "egg" = 1, "soy sauce" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/egg_fried_rice/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_STACK)

/obj/item/food/salad/bibimbap
	name = "bibimbap"
	desc = "A Korean dish consisting of rice and various toppings, served in a hot stone bowl."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "bibimbap"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 6)
	tastes = list("rice" = 1, "spicy cabbage" = 1, "chilli heat" = 1, "egg" = 1, "meat" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/bibimbap/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_STACK)

// Noodles
/obj/item/food/salad/bulgogi_noodles
	name = "bulgogi noodles"
	desc = "Korean barbecue meat served with noodles! Made with gochujang, for extra spicy flavour."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "bulgogi_noodles"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/blood = 3)
	tastes = list("barbecue meat" = 1, "noodles" = 1, "chilli heat" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/yakisoba_katsu
	name = "yakisoba katsu"
	desc = "Breaded and deep fried meat on a bed of fried noodles. Delicious, if unconventional."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "yakisoba_katsu"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/nutriment = 5)
	tastes = list("fried noodles" = 1, "meat" = 1, "breadcrumbs" = 1, "veggies" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/martian_fried_noodles
	name = "\improper Martian fried noodles"
	desc = "Fried noodles from the red planet. Martian cooking draws from many cultures, and these noodles are no exception- there's elements of Malay, Thai, Chinese, Korean and Japanese cuisine in here."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "martian_fried_noodles"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/protein = 4)
	tastes = list("noodles" = 1, "meat" = 1, "nuts" = 1, "onion" = 1, "egg" = 1)
	foodtypes = GRAIN | NUTS | MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/simple_fried_noodles
	name = "simple fried noodles"
	desc = "A simple yet delicious fried noodle dish, perfect for the creative chef to make whatever fried noodles they want."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "martian_fried_noodles"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/protein = 4)
	tastes = list("noodles" = 1, "soy sauce" = 1)
	foodtypes = GRAIN
	w_class = WEIGHT_CLASS_SMALL

// Curry
/obj/item/food/salad/setagaya_curry //apple, honey, yoghurt, ketchup, chocolate bar, coffee, red wine, curry powder, meat, onion, carrot, potato
	name = "\improper Setagaya curry"
	desc = "Made famous by a cafe in Setagaya, this curry's extensive recipe has gone on to be a closely-guarded secret amongst cafe owners across human space. The taste is said to replenish the diner's soul, whatever that means."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "setagaya_curry"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/nutriment/protein = 4)
	tastes = list("the best curry you've ever tasted" = 1, "meat" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

// Burgers and Sandwiches
/obj/item/food/burger/big_blue
	name = "\improper Big Blue burger"
	desc = "The original and best Big Blue, straight outta Mars' favourite burger joint. Catch the wave, brother!"
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "big_blue_burger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("bun" = 1, "burger" = 2, "teriyaki onions" = 1, "cheese" = 1, "bacon" = 1, "pineapple" = 1)
	foodtypes = MEAT | GRAIN | DAIRY | VEGETABLES | FRUIT | PINEAPPLE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/burger/chappy
	name = "\improper Chappy patty"
	desc = "Originally born of a night of (illegal) drinking in a Big Blue Burger, the Chappy patty has since become a staple of both Big Blue's menu and Hawaiian (or at least, faux-Hawaiian) cuisine galaxy-wide. Given Big Kahuna operates most of its stores on Mars, it's perhaps no wonder this dish is popular there."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "big_blue_burger"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("bun" = 1, "fried pork" = 2, "egg" = 1, "cheese" = 1, "ketchup" = 1)
	foodtypes = MEAT | GRAIN | DAIRY | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/king_katsu_sandwich
	name = "\improper King Katsu sandwich"
	desc = "A big sandwich with crispy fried katsu, bacon, kimchi slaw and salad, all on reispan bread. Truly the king of meat between bread."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "king_katsu_sandwich"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("meat" = 1, "bacon" = 1, "kimchi" = 1, "salad" = 1, "rice bread" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/marte_cubano_sandwich
	name = "\improper Marte Cubano sandwich"
	desc = "A fusion food from Mars, the Marte-Cubano is based on the classic Cubano, but updated for ingredient availability and changes in tastes."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "marte_cubano_sandwich"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("bacon" = 1, "pickles" = 1, "cheese" = 1, "rice bread" = 1)
	foodtypes = MEAT | DAIRY | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/little_shiro_sandwich
	name = "\improper Little Shiro sandwich"
	desc = "A classic Martian sandwich, named for the first president of TerraGov to come from Mars. It features fried eggs, bulgogi beef, a kimchi salad, and a healthy topping of mozzarella cheese."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "marte_cubano_sandwich"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("egg" = 1, "meat" = 1, "kimchi" = 1, "mozzarella" = 1)
	foodtypes = MEAT | DAIRY | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

// Snacks
/obj/item/food/takoyaki
	name = "takoyaki"
	desc = "A classic Japanese street food, takoyaki (or octopus balls) are made from octopus and onion inside a fried batter, topped with a savoury sauce."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "takoyaki"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("octopus" = 1, "batter" = 1, "onion" = 1, "worcestershire sauce" = 1)
	foodtypes = MEAT | GRAIN | FRIED | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/takoyaki/russian
	name = "russian takoyaki"
	desc = "A dangerous twist on a classic dish, perfect for evading the police."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "russian_takoyaki"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("octopus" = 1, "batter" = 1, "onion" = 1, "worcestershire sauce" = 1)
	foodtypes = MEAT | GRAIN | FRIED | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/takoyaki/taco
	name = "tacoyaki"
	desc = "Straight outta Mars' most innovative street food stands, it's tacoyaki- trading octopus for taco meat and corn, and worcestershire sauce for queso. ¡Tan sabroso!"
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "taco_takoyaki"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("octopus" = 1, "batter" = 1, "onion" = 1, "worcestershire sauce" = 1)
	foodtypes = MEAT | GRAIN | FRIED | VEGETABLES | DAIRY
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/okonomiyaki
	name = "okonomiyaki"
	desc = "A Kansai classic, okonomiyaki consists of a savoury pancake filled with... well, whatever you want- although cabbage, nagaimo and dashi are pretty much required, as is the eponymous okonomiyaki sauce."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "okonomiyaki"
	food_reagents = list(
		/datum/reagent/consumable/nutriment = 1,
		/datum/reagent/consumable/nutriment/protein = 3,
	)
	tastes = list("batter" = 1, "cabbage" = 1, "onion" = 1, "worcestershire sauce" = 1)
	foodtypes = MEAT | GRAIN | FRIED | VEGETABLES | DAIRY
	w_class = WEIGHT_CLASS_SMALL

//hey, the name literally means "grilled how you like it", it'd be crazy to not make it customisable
/obj/item/food/okonomiyaki/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_STACK)

/obj/item/food/brat_kimchi
	name = "brat-kimchi"
	desc = "Fried kimchi, mixed with sugar and topped with bratwurst. A popular dish at izakayas on Mars."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "brat_kimchi"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/sugar = 2, /datum/reagent/consumable/capsaicin = 2)
	tastes = list("spicy cabbage" = 1, "sausage" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/tonkatsuwurst
	name = "tonkatsuwurst"
	desc = "A cultural fusion between German and Japanese cooking, tonkatsuwurst blends the currywurst and tonkatsu sauce into something familiar, yet new."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "tonkatsuwurst"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 3, /datum/reagent/consumable/ketchup = 3)
	tastes = list("sausage" = 1, "spicy sauce" = 1, "fries" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/kebab/ti_hoeh_koe
	name = "ti hoeh koe skewer"
	desc = "Pig blood, mixed with rice, fried, and topped with peanut and coriander. It's an... acquired taste for sure, but it's popular at Prospect's night markets, brought by Taiwanese settlers."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "ti_hoeh_koe"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 5, /datum/reagent/blood = 3)
	tastes = list("blood" = 1, "nuts" = 1, "herbs" = 1)
	foodtypes = MEAT | NUTS | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/kitzushi
	name = "kitzushi"
	desc = "A variant on inarizushi popular on Mars amongst vulpinids (and the wider animalid community), kitzushi integrates a spicy cheese and chilli mix inside the pocket for extra flavour."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "kitzushi"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/capsaicin = 2)
	tastes = list("rice" = 1, "tofu" = 1, "chilli cheese" = 1)
	foodtypes = GRAIN | FRIED | VEGETABLES | DAIRY
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/epok_epok
	name = "epok-epok"
	desc = "A fried pastry snack from Malaysia, which migrated via Singapore into the Martian diet. Stuffed with curried chicken and potatoes, alongside a slice of hard boiled egg, it's a popular street food on the Red Planet."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "epok_epok"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("curry" = 1, "egg" = 1, "pastry" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/roti_john
	name = "roti john"
	desc = "A classic Malaysian snack, the roti john consists of bread fried in a mixture of meat, egg and onion, yielding a result that's somewhere between French toast and an omelette."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "roti_john"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("bread" = 1, "egg" = 1, "meat" = 1, "onion" = 1)
	foodtypes = GRAIN | MEAT | VEGETABLES | FRIED | BREAKFAST
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/izakaya_fries
	name = "izakaya fries"
	desc = "New Osaka's favourite fries, 2 centuries running- and it's all thanks to the marriage of Red Bay, furikake and mayonnaise."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "izakaya_fries"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("fries" = 1, "mars" = 1)
	foodtypes = VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/kurry_ok_subsando
	name = "kurry-ok subsando"
	desc = "The bunny chow meets Martian ingenuity in the form of the kurry-ok subsando, with fries and katsu curry in perfect harmony."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "kurry_ok_subsando"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("bread" = 1, "spicy fries" = 1, "mayonnaise" = 1, "curry" = 1, "meat" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES | FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/loco_moco
	name = "loco moco"
	desc = "A simple classic from Hawaii. Makes for a filling, tasty, and cheap meal."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "loco_moco"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("rice" = 1, "burger" = 1, "gravy" = 1, "egg" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

// Soups
/obj/item/food/soup/shoyu_ramen
	name = "shōyu ramen"
	desc = "A soy-sauce based ramen, with noodles, fishcake, barbecued meat and a boiled egg."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "shoyu_ramen"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 6)
	tastes = list("egg" = 1, "fish" = 1, "noodles" = 1, "meat" = 1, "broth" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES | SEAFOOD
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/soup/gyuramen
	name = "gyuramen miy käzu"
	desc = "A rich beef and onion ramen with cheese- blending several cultural influences seemlessly into one tasty dish."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "gyuramen"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment/vitamin = 2, /datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/capsaicin = 2)
	tastes = list("beef broth" = 1, "onion" = 1, "cheese" = 1)
	foodtypes = MEAT | GRAIN | DAIRY | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/soup/new_osaka_sunrise
	name = "\improper New Osaka Sunrise miso soup"
	desc = "A bright, flavourful miso soup with tofu that commonly forms part of a traditional Martian breakfast, at least in the capital."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "new_osaka_sunrise"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("miso" = 1, "tofu" = 1, "onion" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES | BREAKFAST
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/soup/satsuma_black
	name = "\improper Satsuma Black soup"
	desc = "A rich, heavy seafood and noodle soup from Mars, employing squid ink to give a strong taste of the sea."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "satsuma_black"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("seafood" = 1, "tofu" = 1, "noodles" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES | BREAKFAST
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/soup/hong_kong_borscht
	name = "\improper Hong Kong borscht"
	desc = "Also known as luo song tang or Russian soup, this dish bears little to no resemblance to Eastern European borscht- indeed, it's a tomato-based soup with no beets in sight."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "hong_kong_borscht"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("tomato" = 1, "meat" = 1, "cabbage" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/soup/huotui_tong_fen
	name = "huǒtuǐ tōng fěn"
	desc = "A favourite from Hong Kong's Cha Chaan Tengs, this macaroni soup came to Mars with Cantonese settlers under Cybersun Industries, and has become as much of a breakfast staple there as it is in its homeland."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "huotui_tong_fen"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("cream" = 1, "chicken" = 1, "pasta" = 1, "ham" = 1)
	foodtypes = MEAT | GRAIN | DAIRY | BREAKFAST
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/soup/foxs_prize_soup
	name = "fox's prize soup"
	desc = "Originally based on the Chinese classic of egg-drop soup, fox's prize soup iterated on the concept via the addition of aburaage and soy, making a dish that would truly appeal to any hungry fox."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "foxs_prize_soup"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("egg" = 1, "chicken" = 1, "fried tofu" = 1, "soy sauce" = 1)
	foodtypes = MEAT | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/soup/secret_noodle_soup
	name = "secret noodle soup"
	desc = "Made to a secret family recipe (that's in several cookbooks). What is the secret ingredient, you ask? Well, let's just say it could be anything..." //what does the future hold for duff? let's just say we've got a few ideas up our sleeves...
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "secret_noodle_soup"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("noodles" = 1, "chicken" = 1, "aromatic broth" = 1)
	foodtypes = MEAT | GRAIN | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/agedashi_tofu
	name = "agedashi tofu"
	desc = "Crispy fried tofu, served in a tasty umami broth. Frequently served at izakayas."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "agedashi_tofu"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/protein = 3)
	tastes = list("broth" = 1, "tofu" = 1)
	foodtypes = VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

// Curries and Stews
/obj/item/food/salad/po_kok_gai
	name = "po kok gai"
	desc = "Also known as galinha à portuguesa, or Portuguese chicken, this dish is a Macanese classic born of Portuguese colonialism, though the dish itself is not a Portuguese dish. It consists of chicken in \"Portuguese Sauce\", a mild coconut-based curry."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "po_kok_gai"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("chicken" = 1, "coconut" = 1, "curry" = 1)
	foodtypes = MEAT | VEGETABLES | DAIRY
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/huoxing_tofu
	name = "\improper Huoxing tofu"
	desc = "An adaptation of mapo tofu made famous in Prospect, the foodie Mecca of Mars. It even kinda looks like Mars, if you really squint."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "huoxing_tofu"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/capsaicin = 2)
	tastes = list("meat" = 1, "chilli heat" = 1, "tofu" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/feizhou_ji
	name = "fēizhōu jī"
	desc = "Considered a Macanese variant on piri-piri, fēizhōu jī, or galinha à africana, or African chicken (if you're feeling like speaking Common), is a popular dish in the TID, and subsequently also on Mars due to its influx of Macanese settlers."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "feizhou_ji"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("chicken" = 1, "chilli heat" = 1, "vinegar" = 1)
	foodtypes = MEAT | VEGETABLES
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/galinha_de_cabidela
	name = "galinha de cabidela"
	desc = "Originally a Portuguese dish, cabidela rice is traditionally made with chicken in Portugal, and duck in Macau- ultimately, the chicken version won out on Mars due to European influence."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "galinha_de_cabidela"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("chicken" = 1, "iron" = 1, "vinegar" = 1, "rice" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/salad/katsu_curry
	name = "katsu curry"
	desc = "Breaded and deep fried meat, topped with curry sauce and served on a bed of rice."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "katsu_curry"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/consumable/nutriment = 5)
	tastes = list("curry" = 1, "meat" = 1, "breadcrumbs" = 1, "rice" = 1)
	foodtypes = MEAT | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

// Entrees
/obj/item/food/cilbir
	name = "çilbir"
	desc = "Eggs, served on a savoury yoghurt base with a spicy oil topping. Originally a Turkish dish, it came to Mars with German-Turkish settlers and has become a breakfast mainstay since."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "cilbir"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 4, /datum/reagent/consumable/nutriment/vitamin = 6, /datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/capsaicin = 2)
	tastes = list("yoghurt" = 1, "garlic" = 1, "lemon" = 1, "egg" = 1, "chilli heat" = 1)
	foodtypes = DAIRY | VEGETABLES | FRUIT | BREAKFAST
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/peking_duck_crepes
	name = "\improper Peking duck crepes a l'orange"
	desc = "This dish takes the best of Beijing's and Paris' cuisines to make a deliciously tangy and savoury meal."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "peking_duck_crepes"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 10, /datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/orangejuice = 4)
	tastes = list("meat" = 1, "crepes" = 1, "orange" = 1)
	foodtypes = MEAT | DAIRY | VEGETABLES | FRUIT
	w_class = WEIGHT_CLASS_SMALL

// Desserts
/obj/item/food/cake/spekkoek
	name = "vulgaris spekkoek"
	desc = "Brought to Mars by both Dutch and Indonesian settlers, spekkoek is a common holiday cake on the Red Planet, often being served as part of a traditional rijsttafel. Use of ambrosia vulgaris as a flavouring is one of necessity in deep space, as pandan leaf is rare this far from Earth."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "spekkoek"
	food_reagents = list(/datum/reagent/consumable/nutriment = 30, /datum/reagent/consumable/nutriment/vitamin = 15)
	tastes = list("winter spices" = 2, "ambrosia vulgaris" = 2, "cake" = 5)
	foodtypes = GRAIN | SUGAR | DAIRY
	burns_in_oven = TRUE

/obj/item/food/cake/spekkoek/MakeProcessable()
	AddElement(/datum/element/processable, TOOL_KNIFE, /obj/item/food/cakeslice/spekkoek, 5, 3 SECONDS, table_required = TRUE)

/obj/item/food/cakeslice/spekkoek
	name = "vulgaris spekkoek slice"
	desc = "A slice of vulgaris spekkoek. If you're Martian, this might remind you of home."
	icon_state = "spekkoek_slice"
	tastes = list("winter spices" = 2, "ambrosia vulgaris" = 2, "cake" = 5)
	foodtypes = GRAIN | SUGAR | DAIRY

/obj/item/food/salad/pineapple_foster
	name = "pineapple foster"
	desc = "A classic Martian adaptation of another classic dessert, Pineapple Foster is a toasty sweet treat which presents only a mild-to-moderate fire risk."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "pineapple_foster"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 6, /datum/reagent/consumable/caramel = 4, /datum/reagent/consumable/pineapplejuice = 2, /datum/reagent/consumable/milk = 4)
	tastes = list("pineapple" = 1, "vanilla" = 1, "caramel" = 1, "ice cream" = 1)
	foodtypes = FRUIT | DAIRY | PINEAPPLE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/pastel_de_nata
	name = "pastel de nata"
	desc = "Originally created by Portuguese monks, pastéis de nata went worldwide under the Portuguese colonial empire- including Macau, from which it came to Mars with settlers from the TID of Hong Kong and Macau."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "pastel_de_nata"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("custard" = 1, "vanilla" = 1, "sweet pastry" = 1)
	foodtypes = DAIRY | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/boh_loh_yah
	name = "boh loh yah"
	desc = "Confusingly referred to as a \"pineapple bun\", this Hong Konger treat contains no actual pineapple- instead, it's a sugar-cookie like bun with a butter filling."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "boh_loh_yah"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("cookie" = 1, "butter" = 1)
	foodtypes = DAIRY | GRAIN | PINEAPPLE //it's funny
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/banana_fritter
	name = "banana fritter"
	desc = "A ubiquitous sweet snack from much of Maritime South-East Asia, the banana fritter has many names, but all share a similar style- banana, coated in batter, and fried."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "banana_fritter"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("banana" = 1, "batter" = 1)
	foodtypes = GRAIN | FRUIT | FRIED
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/pineapple_fritter
	name = "pineapple fritter"
	desc = "Like its cousin, the banana fritter, the pineapple fritter is a popular snack, though somewhat let down by pineapple's infamous \"love it or hate it\" flavour."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "pineapple_fritter"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 2, /datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment = 4)
	tastes = list("pineapple" = 1, "batter" = 1)
	foodtypes = GRAIN | FRUIT | FRIED | PINEAPPLE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/kebab/kasei_dango
	name = "kasei dango"
	desc = "Japanese-style dango balls, flavoured with grenadine and orange, giving a final result that looks like Mars and tastes like dessert, served three to a stick."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "kasei_dango"
	food_reagents = list(/datum/reagent/consumable/sugar = 4, /datum/reagent/consumable/orangejuice = 3, /datum/reagent/consumable/grenadine = 3)
	tastes = list("pomegranate" = 1, "orange" = 1)
	foodtypes = FRUIT | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/pb_ice_cream_mochi
	name = "peanut butter ice cream mochi"
	desc = "A classic dessert at the Arabia Street Night Market in Prospect, peanut butter ice cream mochi is made with a peanut-butter flavoured ice cream as the main filling, and coated in crushed peanuts in the Taiwanese tradition."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "peanut_butter_mochi"
	food_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 6, /datum/reagent/consumable/peanut_butter = 4)
	tastes = list("peanut butter" = 1, "mochi" = 1)
	foodtypes = NUTS | GRAIN
	w_class = WEIGHT_CLASS_SMALL

// Ballpark Food
/obj/item/food/plasma_dog_supreme
	name = "\improper Plasma Dog Supreme"
	desc = "The signature snack of Cybersun Park, home of the New Osaka Woodpeckers: a ballpark hot-dog with sambal, dashi-grilled onions and pineapple-lime salsa. You know, the sort of bold flavours they enjoy on Mars."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "plasma_dog_supreme"
	food_reagents = list(/datum/reagent/consumable/nutriment/vitamin = 8, /datum/reagent/consumable/nutriment/protein = 8, /datum/reagent/consumable/nutriment = 6)
	tastes = list("sausage" = 1, "relish" = 1, "onion" = 1, "fruity salsa" = 1)
	foodtypes = FRUIT | MEAT | PINEAPPLE | VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/frickles
	name = "frickles"
	desc = "Spicy fried pickle spears? Such a bold combination can surely come only from one place- Martian ballparks? Well, not really, but they are a popular snack there."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "frickles"
	food_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/cooking_oil = 2)
	tastes = list("frickles" = 1)
	foodtypes = VEGETABLES | GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/raw_ballpark_pretzel
	name = "raw pretzel"
	desc = "A twisted knot of dough, ready to be baked, or possibly griddled?"
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "raw_ballpark_pretzel"
	food_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/salt = 1)
	tastes = list("bread" = 1, "salt" = 1)
	foodtypes = GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/ballpark_pretzel
	name = "ballpark pretzel"
	desc = "A classic German bread, transformed by the hand of American imperialism into a game-day snack, and then carried to the Red Planet on the backs of Japanese settlers. How multicultural."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "ballpark_pretzel"
	food_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/salt = 1)
	tastes = list("bread" = 1, "salt" = 1)
	foodtypes = GRAIN
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/kebab/raw_ballpark_tsukune
	name = "raw tsukune"
	desc = "Raw chicken meatballs on a skewer, ready to be griddled into something delicious."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "ballpark_pretzel"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 3, /datum/reagent/consumable/nutriment = 2)
	tastes = list("raw chicken" = 7, "salmonella" = 1)
	foodtypes = MEAT
	w_class = WEIGHT_CLASS_SMALL

/obj/item/food/kebab/ballpark_tsukune
	name = "ballpark tsukune"
	desc = "Skewered chicken meatballs in a sweet-and-savoury yakitori sauce. A common sight at Martian ballparks."
	icon = 'icons/obj/food/martian.dmi'
	icon_state = "ballpark_pretzel"
	food_reagents = list(/datum/reagent/consumable/nutriment/protein = 6, /datum/reagent/consumable/nutriment = 4)
	tastes = list("chicken" = 1, "umami sauce" = 1)
	foodtypes = MEAT
	w_class = WEIGHT_CLASS_SMALL
