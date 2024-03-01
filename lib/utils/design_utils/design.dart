abstract class DesignUtils {
  static String getUserImage(String username) {
    // if (username == "jpanza") {
    //   return 'https://scontent.fasu6-2.fna.fbcdn.net/v/t39.30808-6/279638021_2222568507899941_4288082380769697443_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=efb6e6&_nc_ohc=uvp7Sq2qB_4AX8k8bkp&_nc_ht=scontent.fasu6-2.fna&oh=00_AfCFRFkwv1_bLgO5CBxnjcUSIO76V1tXyAXOoF3kqn_VNw&oe=65C8EF3F';
    // }
    return _getImageUrl(username);
  }

  static String getChannelImage() => _getImageUrl('');

  static String _getImageUrl(String value) =>
      'https://ui-avatars.com/api/?background=random&color=random&name=$value&rounded=true';
}
