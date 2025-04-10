class Company{
  int? id;
  String? companyLogo;
  String? companyAddress;
  String? companyName;
  String? companyNumber;

  Company(
      {this.id,
      this.companyLogo,
      this.companyAddress,
      this.companyName,
      this.companyNumber});


  Company.fromJson(Map<String,dynamic> json){
    id=json["id"];
    companyLogo=json["logo"];
    companyName=json["name"];
    companyNumber=json["phone"];
    companyAddress=json["address"];
  }

  Map<String,dynamic> toJson(){
    Map<String,dynamic> data={};
    //data["id"]=id;
    data["logo"]=companyLogo;
    data["name"]=companyName;
    data["phone"]=companyNumber;
    data["address"]=companyAddress;

    return data;

  }
}