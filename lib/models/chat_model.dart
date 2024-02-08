class ChatModel {
  final String name;
  String message;
  final String timeReceived;
  final String timeSending;
  final String timeReading;
  final String imageUrl;

  ChatModel(this.name, this.message, this.timeReceived, this.timeSending,
      this.timeReading, this.imageUrl);
}

List<ChatModel> messageData = [
  ChatModel(
      "Por María",
      "Jonathan ...: ¡Hola! ¿Ensayamos?",
      "10:30",
      "10:30",
      "10:31",
      "https://scontent.fasu6-2.fna.fbcdn.net/v/t39.30808-6/279638021_2222568507899941_4288082380769697443_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=uvp7Sq2qB_4AX8k8bkp&_nc_ht=scontent.fasu6-2.fna&oh=00_AfCFRFkwv1_bLgO5CBxnjcUSIO76V1tXyAXOoF3kqn_VNw&oe=65C8EF3F"),
  ChatModel(
      "Richard Paquier",
      "Che, no llego a hora ",
      "10:31",
      "10:30",
      "10:31",
      "https://media.licdn.com/dms/image/D4D03AQE9svfzu6sclw/profile-displayphoto-shrink_800_800/0/1699446386930?e=2147483647&v=beta&t=VrKEjJVg_8lf8cFmVZ7RkaG6zUKYqAWuezsyjbGhcqw"),
  ChatModel(
      "Ceci Benitez",
      "Holii, sin problemas estoy",
      "10:35",
      "10:35",
      "10:35",
      "https://scontent.fasu6-1.fna.fbcdn.net/v/t39.30808-6/343654422_1064763724483322_4462599103008506125_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=jGalLUmcUskAX_Thq0C&_nc_ht=scontent.fasu6-1.fna&oh=00_AfBE1bfc-z02Vv-ZxdpXKm-UdzHmR-T_BodloVTFtc5n5w&oe=65C978B7"),
  ChatModel(
      "David Gonzalez",
      "Solo si arman mi bateria",
      "10:36",
      "10:36",
      "10:36",
      "https://scontent.fasu6-2.fna.fbcdn.net/v/t39.30808-6/258596075_3098614083707621_8687581112871765988_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=A1arS3PTLkgAX_2-S67&_nc_ht=scontent.fasu6-2.fna&oh=00_AfDZsRXki-EplyYKI2osGBpj3DEN9jjEtbYkSYy-9G6ZhA&oe=65C8F779"),
  ChatModel("Jonathan Bernal", "Lleguen a hora.", "10:36", "10:36", "10:36",
      "https://scontent.fasu6-2.fna.fbcdn.net/v/t39.30808-6/300578847_3207394469533670_420833834600853777_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=Jrp6vuVdLrcAX98a5Qj&_nc_oc=AQnfuwefzYRherYHmLkEfDLEy5s9PeemnK3PAhCVcghh6DbZDm-YLitgGsL5rhXVpfc&_nc_ht=scontent.fasu6-2.fna&oh=00_AfC-uE4kTzNFOzw9Pc0gN3mYGbl3W-rk5dsBTXctS5rYOQ&oe=65C967F0"),
  ChatModel("Samir Gonzalez", "Nos vemos", "10:36", "10:36", "10:36",
      "https://scontent.fasu6-1.fna.fbcdn.net/v/t39.30808-6/239477206_3909982805768308_7117895460398828093_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=ow__YdNRHXEAX-0am0E&_nc_ht=scontent.fasu6-1.fna&oh=00_AfAH1WZxIQ1W53aG17MwHL9z15XUdh9lbw_2uDiZCTlnsQ&oe=65C8B390"),
  ChatModel(
      "Junior Gonzalez",
      "No entendi, ¿pueden ser mas claros?",
      "10:37",
      "10:37",
      "10:37",
      "https://scontent.fasu6-2.fna.fbcdn.net/v/t1.6435-9/48388320_1873996976031000_6705784163535945728_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=be3454&_nc_ohc=peJFhY4yfs8AX97eVbN&_nc_ht=scontent.fasu6-2.fna&oh=00_AfBgnqCrQR1bopVHVKqX0fC8TZaOccTppJ_hcuW45q7mIg&oe=65EB3A63"),
  ChatModel(
      "Vane de Gonzalez",
      "Le doy permiso a David :D",
      "10:38",
      "10:38",
      "10:38",
      "https://scontent.fasu6-1.fna.fbcdn.net/v/t39.30808-6/293659062_3270660859884980_4298316613432013339_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=nn3xfEVC6awAX9krPDe&_nc_ht=scontent.fasu6-1.fna&oh=00_AfCYoNnus18lbtD8vADTFCzFLRqsZpE7KcJ75cy_wVasow&oe=65C8A4FB"),
  ChatModel("Jose Panza", "¿Que comemos?", "10:38", "10:38", "10:38",
      "https://scontent.fasu6-2.fna.fbcdn.net/v/t39.30808-6/351305138_793004512134178_2805991725980125189_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=AzxoXKGZfqwAX_yQvvm&_nc_ht=scontent.fasu6-2.fna&oh=00_AfCVwPcz0AFywH7-E7U1EY3TC0QBLdELiHAZJBnp6x9chg&oe=65C87659"),
];
