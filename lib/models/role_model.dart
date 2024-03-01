class RoleModel {
  int id;
  String code;
  String description;
  String creationDate;
  bool enabled;
  bool hidden;

  RoleModel(this.id, this.code, this.description, this.creationDate,
      this.enabled, this.hidden);
}
