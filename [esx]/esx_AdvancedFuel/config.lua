petrolCanPrice = 1

lang = "es"
-- lang = "fr"

settings = {}
settings["es"] = {
	openMenu = "Presiona ~g~E~w~ para abrir el m,enu.",
	electricError = "~r~Tienes un vehículo eléctrico.",
	fuelError = "~r~No estás en el sitio adecuado.",
	buyFuel = "comprar gasolina",
	liters = "litros",
	percent = "por ciento",
	confirm = "Aceptar",
	fuelStation = "Estación de gasolina",
	boatFuelStation = "Estación de gasolina | Barco",
	avionFuelStation = "Estación de gasolina | Avión ",
	heliFuelStation = "Estación de gasolina | Helicóptero",
	getJerryCan = "Presiona ~g~E~w~ para comprar un bidón de gasolina ("..petrolCanPrice.."$)",
	refeel = "Presiona ~g~E~w~ para rellenar el coche.",
	YouHaveBought = "Has comprado ",
	fuel = " litros de gasolina",
	price = "precio"
}

--settings["fr"] = {
--	openMenu = "Appuyez sur ~g~E~w~ pour ouvrir le menu.",
--	electricError = "~r~Vous avez une voiture électrique.",
--	fuelError = "~r~Vous n'êtes pas au bon endroit.",
--	buyFuel = "acheter de l'essence",
--	liters = "litres",
--	percent = "pourcent",
--	confirm = "Valider",
--	fuelStation = "Station essence",
--	boatFuelStation = "Station d'essence | Bateau",
--	avionFuelStation = "Station d'essence | Avions",
--	heliFuelStation = "Station d'essence | Hélicoptères",
--	getJerryCan = "Appuyez sur ~g~E~w~ pour acheter un bidon d'essence ("..petrolCanPrice.."$)",
--	refeel = "Appuyez sur ~g~E~w~ pour remplir votre voiture d'essence.",
--	YouHaveBought = "Vous avez acheté ",
--	fuel = " litres d'essence",
--	price = "prix"
--}


showBar = false
showText = false


hud_form = 2 -- 1 : Vertical | 2 = Horizontal
hud_x = 0.175 
hud_y = 0.985

text_x = 0.2575
text_y = 0.975


electricityPrice = 1 -- NOT RANOMED !!

randomPrice = true --Random the price of each stations
price = 1 --If random price is on False, set the price here for 1 liter