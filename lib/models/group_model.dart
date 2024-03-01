class GroupModel {
  int id;
  String code;
  String description;
  bool active;
  String creationDate;
  String disabledDate;
  String parentGroup;
  String sonGroup;

  GroupModel(this.id, this.code, this.description, this.active,
      this.creationDate, this.disabledDate, this.parentGroup, this.sonGroup);
}
