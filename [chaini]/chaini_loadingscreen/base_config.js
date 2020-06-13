/*
    This script was developed by Piter Van Rujpen/TheGamerRespow for Vulkanoa (https://discord.gg/bzMnYPS).
    Do not re-upload this script without my authorization.
*/

VK.config.loadingSessionText = "Chargement de la session..."; // Loading session text
VK.config.firstColor = [255, 150, 0];
VK.config.secondColor = [0, 191, 255];
VK.config.thirdColor = [52, 152, 219];

VK.backgrounds.list = [ // Backgrounds list, can be on local or distant (http://....)
    "img/1.jpg",
    "img/2.jpg",
    "img/3.jpg"
];
VK.backgrounds.duration = 3000; // Background duration (in ms) before transition (the transition lasts 2000 ms)

VK.tips.enable = true; //Enable tips (true : enable, false : prevent)
VK.tips.list = [ // Tips list
    "Para abrir tu telefono utiliza la tecla F1, asi pordras usar los servicios", // If you use double-quotes, make sure to put a \ before each double quotes
    "Para hablar via texto utiliza la tecla T",
    "Para señalar utiliza la tecla B",
    "Para ver la lista de personas utiliza la tecla SUPR",
    "Para ver la lista de animaciones usa la tecla F3",
];

VK.music.url = "music.ogg"; // Music url, can be on local or distant (http://....) ("NONE" to desactive music)
VK.music.volume = 0.2; // Music volume (0-1)
VK.music.title = "Una cancion bien chida"; // Music title ("NONE" to desactive)
VK.music.submitedBy = "Por: Kairophe"; // Music submited by... ("NONE" to desactive)

VK.info.logo = "icon/vulkanoa.png"; // Logo ("NONE" to desactive)
VK.info.text = "fondé et développé par Piter Van Rujpen"; // Bottom right corner text ("NONE" to desactive) 
VK.info.website = "vulkanoa.com"; // Website url ("NONE" to desactive) 
VK.info.ip = "145.239.74.177:2302"; // Your server ip and port ("ip:port")

VK.social.discord = ".me/KIK Life"; // Discord url ("NONE" to desactive)
VK.social.twitter = "/KIK Life"; // Twitter url ("NONE" to desactive)
VK.social.facebook = "/KIK Life"; // Facebook url ("NONE" to desactive)
VK.social.youtube = "/KIK Life"; // Youtube url ("NONE" to desactive)
VK.social.twitch = "/KIK Life"; // Twitch url ("NONE" to desactive)

VK.players.enable = true; // Enable the players count of the server (true : enable, false : prevent)
VK.players.multiplePlayersOnline = "@players Jugando en linea"; // @players equals the players count
VK.players.onePlayerOnline = "1 Jugador en linea"; // Text when only one player is on the server
VK.players.noPlayerOnline = "Aca no hay ni Dios"; // Text when the server is empty