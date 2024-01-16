class Username{
  final String userName;
  Username({
    required this.userName
  });

  toJson(){
    return{
      'userName': userName,
    };
  }
}