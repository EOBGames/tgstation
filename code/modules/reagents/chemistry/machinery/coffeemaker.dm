/obj/machinery/coffeemaker
	name = "coffeemaker"
	desc = "A Modello 3 Coffeemaker that brews coffee and holds it at the perfect temperature of 176 fahrenheit. Made by Piccionaia Home Appliances."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "coffeemaker"
	base_icon_state = "coffeemaker"
	resistance_flags = FIRE_PROOF | ACID_PROOF
	circuit = /obj/item/circuitboard/machine/coffeemaker
	var/obj/item/reagent_containers/glass/coffeepot = null
	var/brewing = FALSE
	var/brew_time = 20 SECONDS
	var/speed = 1
	/// The coffee cartridge to make coffee from. In the future, coffee grounds are like printer ink.
	var/obj/item/coffee_cartridge/cartridge = null
	/// The type path to instantiate for the coffee cartridge the device initially comes with, eg. /obj/item/coffee_cartridge
	var/initial_cartridge = /obj/item/coffee_cartridge
	/// The number of cups left
	var/coffee_cups = 20
	/// The amount of sugar packets left
	var/sugar_packs = 20
	/// The amount of sweetener packets left
	var/sweetener_packs = 20
	/// The amount of creamer packets left
	var/creamer_packs = 20

	var/static/radial_examine = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_examine")
	var/static/radial_brew = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_brew")
	var/static/radial_eject_pot = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_eject_pot")
	var/static/radial_eject_cartridge = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_eject_cartridge")
	var/static/radial_take_cup = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_take_cup")
	var/static/radial_take_sugar = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_take_sugar")
	var/static/radial_take_sweetener = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_take_sweetener")
	var/static/radial_take_creamer = image(icon = 'icons/hud/radial.dmi', icon_state = "radial_take_creamer")

/obj/machinery/coffeemaker/Initialize(mapload)
	. = ..()
	coffeepot = new /obj/item/reagent_containers/glass/coffeepot(src)
	cartridge = new /obj/item/coffee_cartridge

/obj/machinery/coffeemaker/constructed/Initialize(mapload)
	. = ..()
	QDEL_NULL(coffeepot)
	QDEL_NULL(cartridge)
	update_appearance()

/obj/machinery/coffeemaker/deconstruct()
	coffeepot?.forceMove(drop_location())
	coffeepot = null
	cartridge?.forceMove(drop_location())
	cartridge = null
	return ..()

/obj/machinery/coffeemaker/Destroy()
	QDEL_NULL(coffeepot)
	QDEL_NULL(cartridge)
	return ..()

/obj/machinery/coffeemaker/RefreshParts()
	. = ..()
	speed = 1
	for(var/obj/item/stock_parts/micro_laser/laser in component_parts)
		speed = laser.rating

/obj/machinery/coffeemaker/examine(mob/user)
	. = ..()
	if(!in_range(user, src) && !issilicon(user) && !isobserver(user))
		. += span_warning("You're too far away to examine [src]'s contents and display!")
		return

	if(brewing)
		. += span_warning("\The [src] is brewing.")
		return

	if(panel_open)
		. += span_notice("[src]'s maintenance hatch is open!")
		return

	if(coffeepot || cartridge)
		. += span_notice("\The [src] contains:")
		if(coffeepot)
			. += span_notice("- \A [coffeepot].")
		if(cartridge)
			. += span_notice("- \A [cartridge].")

	if(!(machine_stat & (NOPOWER|BROKEN)))
		. += "[span_notice("The status display reads:")]\n"+\
		span_notice("- Brewing coffee at <b>[speed*100]%</b>.")
		if(coffeepot)
			for(var/datum/reagent/consumable/cawfee in coffeepot.reagents.reagent_list)
				. += span_notice("- [cawfee.volume] units of coffee in pot.")
		if(cartridge)
			if(cartridge.charges < 1)
				. += span_notice("- grounds cartridge is empty.")
			else
				. += span_notice("- grounds cartridge has [cartridge.charges] charges remaining.")

	if (coffee_cups > 1)
		. += span_notice("There are [coffee_cups] cups left.")
	else if (paper_cups == 1)
		. += span_notice("There is one cup left.")
	else
		. += span_notice("There are no cups left.")

	if (sugar_packs > 1)
		. += span_notice("There are [sugar_packs] packets of sugar left.")
	else if (sugar_packs == 1)
		. += span_notice("There is one packet of sugar left.")
	else
		. += span_notice("There is no sugar left.")

	if (sweetener_packs > 1)
		. += span_notice("There are [sweetener_packs] packets of sweetener left.")
	else if (sweetener_packs == 1)
		. += span_notice("There is one packet of sweetener left.")
	else
		. += span_notice("There is no sweetener left.")

	if (creamer_packs > 1)
		. += span_notice("There are [creamer_packs] packets of creamer left.")
	else if (creamer_packs == 1)
		. += span_notice("There is one packet of creamer left.")
	else
		. += span_notice("There is no creamer left.")

/obj/machinery/coffeemaker/attack_hand_secondary(mob/user, list/modifiers)
	. = ..()
	if(. == SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN)
		return
	if(!can_interact(user) || !user.canUseTopic(src, !issilicon(user), FALSE, NO_TK))
		return
	if(brewing)
		return
	replace_pot(user)
	return SECONDARY_ATTACK_CANCEL_ATTACK_CHAIN

/obj/machinery/coffeemaker/attack_robot_secondary(mob/user, list/modifiers)
	return attack_hand_secondary(user, modifiers)

/obj/machinery/coffeemaker/attack_ai_secondary(mob/user, list/modifiers)
	return attack_hand_secondary(user, modifiers)

/obj/machinery/coffeemaker/handle_atom_del(atom/A)
	. = ..()
	if(A == coffeepot)
		coffeepot = null
		update_appearance()

/obj/machinery/coffeemaker/update_icon_state()
	icon_state = "[base_icon_state][coffeepot ? 1 : 0][cartridge ? 1 : 0]"
	return ..()

/obj/machinery/coffeemaker/proc/replace_pot(mob/living/user, obj/item/reagent_containers/glass/coffeepot/new_coffeepot)
	if(!user)
		return FALSE
	if(coffeepot)
		try_put_in_hand(coffeepot, user)
		coffeepot = null
	if(new_coffeepot)
		coffeepot = new_coffeepot
	update_appearance()
	return TRUE

/obj/machinery/coffeemaker/proc/replace_cartridge(mob/living/user, obj/item/coffee_cartridge/new_cartridge)
	if(!user)
		return FALSE
	if(cartridge)
		try_put_in_hand(cartridge, user)
		cartridge = null
	if(new_cartridge)
		cartridge = new_cartridge
	update_appearance()
	return TRUE

/obj/machinery/coffeemaker/wrench_act(mob/living/user, obj/item/tool)
	. = ..()
	default_unfasten_wrench(user, tool)
	return TOOL_ACT_TOOLTYPE_SUCCESS

/obj/machinery/coffeemaker/attackby(obj/item/I, mob/living/user, params)
	//You can only screw open empty grinder
	if(!coffeepot && default_deconstruction_screwdriver(user, icon_state, icon_state, I))
		return

	if(default_deconstruction_crowbar(I))
		return

	if(panel_open) //Can't insert objects when its screwed open
		return TRUE

	if (istype(I, /obj/item/reagent_containers/glass/coffeepot) && !(I.item_flags & ABSTRACT) && I.is_open_container())
		var/obj/item/reagent_containers/glass/coffeepot/new_pot = I
		. = TRUE //no afterattack
		if(!user.transferItemToLoc(new_pot, src))
			return
		replace_pot(user, new_pot)
		to_chat(user, span_notice("You add [new_pot] to [src]."))
		update_appearance()
		return TRUE //no afterattack

	if (istype(I, /obj/item/coffee_cartridge) && !(I.item_flags & ABSTRACT))
		var/obj/item/coffee_cartridge/new_cartridge = I
		. = TRUE //no afterattack
		if(!user.transferItemToLoc(new_cartridge, src))
			return
		replace_cartridge(user, new_cartridge)
		to_chat(user, span_notice("You add [new_cartridge] to [src]."))
		update_appearance()
		return TRUE //no afterattack

/obj/machinery/coffeemaker/ui_interact(mob/user) // The microwave Menu //I am reasonably certain that this is not a microwave //I am positively certain that this is not a microwave
	. = ..()

	if(brewing || !user.canUseTopic(src, !issilicon(user)))
		return

	var/list/options = list()

	if(coffeepot)
		options["eject_pot"] = radial_eject_pot

	if(cartridge)
		options["eject_cartridge"] = radial_eject_cartridge

	if(coffeepot && cartridge && cartridge.charges > 0)
		options["brew"] = radial_brew

	if(coffee_cups > 0)
		options["take_cup"] = radial_take_cup

	if(sugar_packs > 0)
		options["take_sugar"] = radial_take_sugar

	if(sweetener_packs > 0)
		options["take_sweetener"] = radial_take_sweetener

	if(creamer_packs > 0)
		options["take_creamer"] = radial_take_creamer

	if(isAI(user))
		if(machine_stat & NOPOWER)
			return
		options["examine"] = radial_examine

	var/choice

	if(length(options) < 1)
		return
	if(length(options) == 1)
		for(var/key in options)
			choice = key
	else
		choice = show_radial_menu(user, src, options, require_near = !issilicon(user))

	// post choice verification
	if(brewing || (isAI(user) && machine_stat & NOPOWER) || !user.canUseTopic(src, !issilicon(user)))
		return

	switch(choice)
		if("brew")
			brew(user)
		if("eject_pot")
			eject_pot(user)
		if("eject_cartridge")
			eject_cartridge(user)
		if("examine")
			examine(user)
		if("take_cup")
			take_cup(user)
		if("take_sugar")
			take_sugar(user)
		if("take_sweetener")
			take_sweetener(user)
		if("take_creamer")
			take_creamer(user)

/obj/machinery/coffeemaker/proc/eject_pot(mob/user)
	if(coffeepot)
		replace_pot(user)

/obj/machinery/coffeemaker/proc/eject_cartridge(mob/user)
	if(cartridge)
		replace_cartridge(user)

/obj/machinery/coffeemaker/proc/take_cup(mob/user)
	if(!coffee_cups) //shouldn't happen, but we all know how stuff manages to break
		to_chat(user, span_warning("There aren't any cups left!"))
		return
	user.visible_message(span_notice("[user] takes a cup from [src]."), span_notice("You take a cup from [src]."))
	var/obj/item/reagent_containers/food/drinks/coffee_cup/new_cup = new(get_turf(src))
	user.put_in_hands(new_cup)
	coffee_cups--

/obj/machinery/coffeemaker/proc/take_sugar(mob/user)
	if(!sugar_packs)
		to_chat(user, span_warning("There isn't any sugar left!"))
		return
	user.visible_message(span_notice("[user] takes a packet of sugar from [src]."), span_notice("You take a packet of sugar from [src]."))
	var/obj/item/reagent_containers/food/condiment/pack/sugar/new_pack = new(get_turf(src))
	user.put_in_hands(new_pack)
	sugar_packs--

/obj/machinery/coffeemaker/proc/take_sweetener(mob/user)
	if(!sweetener_packs)
		to_chat(user, span_warning("There isn't any sweetener left!"))
		return
	user.visible_message(span_notice("[user] takes a packet of sweetener from [src]."), span_notice("You take a packet of sweetener from [src]."))
	var/obj/item/reagent_containers/food/condiment/pack/astrotame/new_pack = new(get_turf(src))
	user.put_in_hands(new_pack)
	sweetener_packs--

/obj/machinery/coffeemaker/proc/take_creamer(mob/user)
	if(!creamer_packs)
		to_chat(user, span_warning("There isn't any creamer left!"))
		return
	user.visible_message(span_notice("[user] takes a packet of creamer from [src]."), span_notice("You take a packet of creamer from [src]."))
	var/obj/item/reagent_containers/food/condiment/pack/creamer/new_pack = new(get_turf(src))
	user.put_in_hands(new_pack)
	creamer_packs--

/obj/machinery/coffeemaker/proc/operate_for(time, silent = FALSE)
	brewing = TRUE
	if(!silent)
		playsound(src, 'sound/machines/coffeemaker_brew.ogg', 20, TRUE)
	use_power(active_power_usage * time * 0.1) // .1 needed here to convert time (in deciseconds) to seconds such that watts * seconds = joules
	addtimer(CALLBACK(src, .proc/stop_operating), time / speed)

/obj/machinery/coffeemaker/proc/stop_operating()
	brewing = FALSE

/obj/machinery/coffeemaker/proc/brew()
	power_change()
	if(!coffeepot || machine_stat & (NOPOWER|BROKEN) || coffeepot.reagents.total_volume >= coffeepot.reagents.maximum_volume)
		return
	operate_for(brew_time)
	coffeepot.reagents.add_reagent_list(cartridge.drink_type)
	cartridge.charges--

//Coffee Cartridges: like toner, but for your coffee!
/obj/item/coffee_cartridge
	name = "coffeemaker cartridge- Caffè Generico"
	desc = "A coffee cartridge manufactured by Piccionaia Coffee, for use with the Modello 3 system."
	icon = 'icons/obj/food/food.dmi'
	icon_state = "cartridge_basic"
	var/charges = 4
	var/list/drink_type = list(/datum/reagent/consumable/coffee = 120)

/obj/item/coffee_cartridge/examine(mob/user)
	. = ..()
	if(charges != 0)
		. += span_warning("The cartridge has [charges] portions of grounds remaining.")
		return
	else
		. += span_warning("The cartridge has no unspent grounds remaining.")

/obj/item/coffee_cartridge/fancy
	name = "coffeemaker cartridge- Caffè Fantasioso"
	desc = "A fancy coffee cartridge manufactured by Piccionaia Coffee, for use with the Modello 3 system."
	icon_state = "cartridge_blend"

//Here's the joke before I get 50 issue reports: they're all the same, and that's intentional
/obj/item/coffee_cartridge/fancy/Initialize(mapload)
	. = ..()
	var/coffee_type = pick("blend", "blue_mountain", "kilimanjaro", "mocha")
	switch(coffee_type)
		if("blend")
			name = "coffeemaker cartridge- Miscela di Piccione"
			icon_state = "cartridge_blend"
		if("blue_mountain")
			name = "coffeemaker cartridge- Montagna Blu"
			icon_state = "cartridge_blue_mtn"
		if("kilimanjaro")
			name = "coffeemaker cartridge- Kilimangiaro"
			icon_state = "cartridge_kilimanjaro"
		if("mocha")
			name = "coffeemaker cartridge- Moka Arabica"
			icon_state = "cartridge_mocha"

/obj/item/coffee_cartridge/decaf
	name = "coffeemaker cartridge- Caffè Decaffeinato"
	desc = "A decaf coffee cartridge manufactured by Piccionaia Coffee, for use with the Modello 3 system."
	icon_state = "cartridge_decaf"

// no you can't just squeeze the juice bag into a glass!
/obj/item/coffee_cartridge/bootleg
	name = "coffeemaker cartridge- Botany Blend"
	desc = "A jury-rigged coffee cartridge. Should work with a Modello 3 system, though it might void the warranty."
	icon_state = "cartridge_bootleg"

/obj/item/storage/fancy/coffee_cart_rack
	name = "coffeemaker cartridge rack"
	desc = "A small rack for storing coffeemaker cartridges."
	icon = 'icons/obj/food/containers.dmi'
	icon_state = "coffee_cartrack4"
	base_icon_state = "coffee_cartrack"
	contents_tag = "coffee cartridge"
	is_open = TRUE
	spawn_type = /obj/item/coffee_cartridge

/obj/item/storage/fancy/coffee_cart_rack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 4
	STR.set_holdable(list(/obj/item/coffee_cartridge))
