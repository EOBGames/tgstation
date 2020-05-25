
GLOBAL_LIST_EMPTY(cached_guar_rarity)
GLOBAL_LIST_EMPTY(cached_rarity_table)
//Global list of all cards by series, with cards cached by rarity to make those lookups faster
GLOBAL_LIST_EMPTY(cached_cards)

/obj/item/tcgcard
	name = "Coder"
	desc = "Wow, a mint condition coder card! Better tell the Github all about this!"
	icon = 'icons/obj/tcg.dmi'
	icon_state = "runtime"
	w_class = WEIGHT_CLASS_TINY
	var/id = -1 //Unique ID, for use in lookups and storage, used to index the global datum list where the rest of the card's info is stored
	var/series = "coderbus" //Used along with the id for lookup
	var/flipped = 0

/obj/item/tcgcard/Initialize(mapload, series, id)
	. = ..()
	transform = matrix(0.3,0,0,0,0.3,0)
	RegisterSignal(src, COMSIG_STORAGE_REMOVED)
	var/datum/card/temp = GLOB.cached_cards[series]["ALL"][id]
	if(!temp)
		return
	name = temp.name
	desc = temp.desc
	icon = icon(temp.icon)
	icon_state = temp.icon_state
	id = temp.id
	series = temp.series

/datum/card
	var/id = -1 //Unique ID, for use in lookups and (eventually) for persistence. MAKE SURE THIS IS UNIQUE FOR EACH CARD, OR THE ENTIRE SYSTEM WILL BREAK, AND I WILL BE VERY DISAPPOINTED.
	var/name = "Coder"
	var/desc = "Wow, a mint condition coder card! Better tell the Github all about this!"
	var/rules = "There are no rules here. There is no escape. No Recall or Intervention can work in this place." //This handles any extra rules for the card, i.e. extra attributes, special effects, etc. If you've played any other card game, you know how this works.
	var/icon = "icons/obj/tcg.dmi"
	var/icon_state = "runtime"
	var/summoncost = -1 //What it costs to summon this card to the battlefield.
	var/power = 0 //How hard this card hits (by default)
	var/resolve = 0 //How hard this card can get hit (by default)
	var/faction = "socks" //Someone please come up with a ruleset so I can comment this
	var/cardtype ="C43a7u43?" //Used to define the behaviour the card uses during the game.
	var/cardsubtype = "Weeb" //An extra descriptor for the card. Combined with the cardtype for a larger card descriptor, i.e. Creature- Xenomorph, Spell- Instant, that sort of thing. For creatures, this has no effect, for spells, this is important.
	var/series = "coreset2020" //Defines the series that the card originates from, this is *very* important for spawning the cards via packs.
	var/rarity = "uber rare to the extreme" //The rarity of this card, determines how much (or little) it shows up in packs. Rarities are common, uncommon, rare, epic, legendary and misprint.

/datum/card/New(list/data = list(), list/templates = list())
	applyTemplates(data, templates)
	apply(data)

/datum/card/proc/apply(list/data)
	for(var/name in (vars & data))
		vars[name] = data[name]

/datum/card/proc/applyTemplates(list/data, list/templates = list())
	apply(templates["default"])
	apply(templates[data["template"]])

/obj/item/tcgcard/attack_self(mob/user)
	. = ..()
	to_chat(user, "<span_class='notice'>You turn the card over.</span>")
	if(flipped == 0)
		name = "Trading Card"
		desc = "It's the back of a trading card... no peeking!"
		icon_state = "cardback"
		flipped = 1
	else
		var/datum/card/template = GLOB.cached_cards[series]["[id]"]
		name = template.name
		desc = template.desc
		icon_state = template.icon_state
		flipped = 0

/obj/item/tcgcard/proc/normal()
	transform = matrix()

/obj/item/tcgcard/proc/zoom(mob/user, silent)
	transform = matrix(0.3,0,0,0,0.3,0)

/obj/item/cardpack
	name = "Trading Card Pack: Coder"
	desc = "Contains six complete fuckups by the coders. Report this on github please!"
	icon = 'icons/obj/tcg.dmi'
	icon_state = "cardback_nt"
	w_class = WEIGHT_CLASS_TINY
	var/series = "MEME" //Mirrors the card series.
	var/contains_coin = -1 //Chance of the pack having a coin in it.
	///The amount of cards each pack contains
	var/card_count = 6
	var/guaranteed_count = 1
	///The guaranteed rarity table, acts about the same as the rarity table. it can have as many or as few raritys as you'd like
	var/list/guar_rarity = list(
		"legendary" = 10,
		"epic" = 15,
		"rare" = 25,
		"uncommon" = 50)
	var/list/rarity_table = list(
		"common" = 900,
		"uncommon" = 300,
		"rare" = 100,
		"epic" = 25,
		"legendary" = 10,
		"misprint" = 1)//The rarity table, the set must contain at least one of each

/obj/item/cardpack/series_one
	name = "Trading Card Pack: Series 1"
	desc = "Contains six cards of varying rarity from the 2560 Core Set. Collect them all!"
	icon = 'icons/obj/tcg.dmi'
	icon_state = "cardpack_series1"
	series = "coreset2020"
	contains_coin = 10

/obj/item/cardpack/resin
	name = "Trading Card Pack: Resin Frontier Booster Pack"
	desc = "Contains six cards of varying rarity from the Resin Frontier set. Collect them all!"
	icon = 'icons/obj/tcg_xenos.dmi'
	icon_state = "cardpack_resin"
	series = "resinfront"
	contains_coin = 0
	rarity_table = list(
		"common" = 900,
		"uncommon" = 300,
		"rare" = 100,
		"epic" = 25,
		"legendary" = 10)

/obj/item/cardpack/Initialize()
	. = ..()
	transform = matrix(0.4,0,0,0,0.4,0)
	//Pass by refrance moment
	//This lets us only have one rarity table per pack, badmins beware
	if(GLOB.cached_rarity_table[type])
		rarity_table = GLOB.cached_rarity_table[type]
	else
		GLOB.cached_rarity_table[type] = rarity_table
	if(GLOB.cached_guar_rarity[type])
		guar_rarity = GLOB.cached_guar_rarity[type]
	else
		GLOB.cached_guar_rarity[type] = guar_rarity

/obj/item/cardpack/equipped(mob/user, slot, initial)
	. = ..()
	transform = matrix()

/obj/item/cardpack/dropped(mob/user, silent)
	. = ..()
	transform = matrix(0.4,0,0,0,0.4,0)

/obj/item/cardpack/attack_self(mob/user)
	. = ..()
	var/list/cards = buildCardListWithRarity(card_count, guaranteed_count)
	for(var/template in cards)
		//Makes a new card based of the series of the pack.
		new /obj/item/tcgcard(get_turf(user), series, template)
	to_chat(user, "<span_class='notice'>Wow! Check out these cards!</span>")
	new /obj/effect/decal/cleanable/wrapping(get_turf(user))
	playsound(src.loc, 'sound/items/poster_ripped.ogg', 20, TRUE)
	if(prob(contains_coin))
		to_chat(user, "<span_class='notice'>...and it came with a flipper, too!</span>")
		new /obj/item/coin/thunderdome(get_turf(user))
	qdel(src)

/obj/item/coin/thunderdome
	name = "Thunderdome Flipper"
	desc = "A Thunderdome TCG flipper, for deciding who gets to go first. Also conveniently acts as a counter, for various purposes."
	icon = 'icons/obj/tcg.dmi'
	icon_state = "coin_nanotrasen"
	custom_materials = list(/datum/material/plastic = 400)
	material_flags = NONE
	sideslist = list("nanotrasen", "syndicate")

/obj/item/coin/thunderdome/Initialize()
	. = ..()
	transform = matrix(0.4,0,0,0,0.4,0)

/obj/item/coin/thunderdome/equipped(mob/user, slot, initial)
	. = ..()
	transform = matrix()

/obj/item/coin/thunderdome/dropped(mob/user, silent)
	. = ..()
	transform = matrix(0.4,0,0,0,0.4,0)

///Returns a list of cards ids of card_cnt weighted by rarity from the pack's tables that have matching series, with gnt_cnt of the guarenteed table.
/obj/item/cardpack/proc/buildCardListWithRarity(card_cnt, rarity_cnt)
	var/list/toReturn = list()
	//You can always get at least one of some rarity
	toReturn += returnCardsByRarity(rarity_cnt, guar_rarity)
	toReturn += returnCardsByRarity(card_cnt, rarity_table)
	return toReturn

///Returns a list of card datums of the length cardCount that match a random rarity weighted by rarity_table[]
/obj/item/cardpack/proc/returnCardsByRarity(cardCount, list/rarity_table)
	var/list/toReturn = list()
	for(var/card in 1 to cardCount)
		var/rarity = 0
		//Some number between 1 and the sum of all values in the list
		var/weight = 0
		for(var/chance in rarity_table)
			weight += rarity_table[chance]
		var/random = rand(weight)
		for(var/bracket in rarity_table)
			//Steals blatently from pickweight(), sorry buddy I need the index
			random -= rarity_table[bracket]
			if(random <= 0)
				rarity = bracket
				break
		//What we're doing here is using the cached the results of the rarity we find.
		//This allows us to only have to run this once per rarity, ever.
		//Unless you reload the cards of course, in which case we have to do this again.
		var/list/cards = GLOB.cached_cards[series][rarity]
		if(cards.len)
			toReturn += pick(cards)
		else
			//If we still don't find anything yell into the void. Lazy coders.
			log_runtime("The index [rarity] of rarity_table does not exist in the global cache")
	return toReturn

///Loads all the card files
/proc/loadAllCardFiles(cardFiles, directory)
	var/list/templates = list()
	for(var/cardFile in cardFiles)
		loadCardFile(cardFile, directory, templates)

///Prints all the cards names
/proc/printAllCards()
	for(var/card_set in GLOB.cached_cards)
		message_admins("Printing the [card_set] set")
		for(var/card in GLOB.cached_cards[card_set]["ALL"])
			var/datum/card/toPrint = GLOB.cached_cards[card_set]["ALL"][card]
			message_admins(toPrint.name)

///Checks the passed type list for missing raritys, or raritys out of bounds
/proc/checkCardpacks(cardPackList)
	for(var/cardPack in cardPackList)
		var/obj/item/cardpack/pack = new cardPack()
		//Lets see if someone made a type yeah?
		if(!GLOB.cached_cards[pack.series])
			message_admins("[pack.series] does not have any related cards")
			continue
		for(var/card in GLOB.cached_cards[pack.series]["ALL"])
			var/datum/card/template = GLOB.cached_cards[pack.series]["ALL"][card]
			if(!(template.rarity in pack.rarity_table))
				message_admins("[pack.type] has a rarity [template.rarity] on the card [template.id] that does not exist")
				continue
		//Lets run a check to see if all the rarities exist that we want to exist exist
		for(var/I in pack.rarity_table)
			if(!GLOB.cached_cards[pack.series][I])
				message_admins("[pack.type] does not have the required rarity [I]")
		qdel(pack)

///Used to test open a large amount of cardpacks
/proc/checkCardDistribution(cardPack, batchSize, batchCount, guaranteed)
	var/totalCards = 0
	//Gotta make this look like an associated list so the implicit "does this exist" checks work proper later
	var/list/cardsByCount = list("" = 0)
	var/obj/item/cardpack/pack = new cardPack()
	for(var/index in 1 to batchCount)
		var/list/cards = pack.buildCardListWithRarity(batchSize, guaranteed)
		for(var/id in cards)
			totalCards++
			cardsByCount["[id]"] += 1
	var/toSend = "Out of [totalCards] cards"
	for(var/id in sortList(cardsByCount, /proc/cmp_num_string_asc))
		if(id)
			var/datum/card/template = GLOB.cached_cards[pack.series]["ALL"]["[id]"]
			toSend += "\nID:[id] [template.name] [(cardsByCount[id] * 100) / totalCards]% Total:[cardsByCount[id]]"
	message_admins(toSend)
	qdel(pack)

///Empty the rarity cache so we can safely add new cards
/proc/clearCards()
	GLOB.cached_cards = list()

///Reloads all card files
/proc/reloadAllCardFiles(cardFiles, directory)
	clearCards()
	loadAllCardFiles(cardFiles, directory)

///Loads the contents of a json file into our global card list
/proc/loadCardFile(filename, directory = "strings/tcg")
	var/list/json = json_decode(file2text("[directory]/[filename]"))
	var/list/cards = json["cards"]
	var/list/templates = list()
	for(var/list/data in json["templates"])
		templates[data["template"]] = data
	for(var/list/data in cards)
		var/datum/card/c = new(data, templates)
		//Lets cache the id by rarity, for top speed lookup later
		if(!GLOB.cached_cards[c.series])
			GLOB.cached_cards[c.series] = list()
			GLOB.cached_cards[c.series]["ALL"] = list()
		if(!GLOB.cached_cards[c.series][c.rarity])
			GLOB.cached_cards[c.series][c.rarity] = list()
		GLOB.cached_cards[c.series][c.rarity] += "[c.id]"
		//And series too, why not, it's semi cheap
		GLOB.cached_cards[c.series]["ALL"]["[c.id]"] = c
