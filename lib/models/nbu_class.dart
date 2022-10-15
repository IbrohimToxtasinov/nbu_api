class NbuModel {
  String title;
  String code;
  String cbprice;
  String nbubuyprice;
  String nbucellprice;
  String date;

  NbuModel({
    required this.title,
    required this.code,
    required this.cbprice,
    required this.nbubuyprice,
    required this.nbucellprice,
    required this.date,
  });

  factory NbuModel.fromJson(Map<String, dynamic> jsonData) {
    String title = jsonData['title'] as String;
    String code = jsonData['code'] as String;
    String cbprice = jsonData['cb_price'] as String;
    String nbubuyprice = jsonData['nbu_buy_price'] as String;
    String nbucellprice = jsonData['nbu_cell_price'] as String;
    String date = jsonData['date'] as String;
    
    return NbuModel(
      title: title,
      code: code,
      cbprice: cbprice,
      nbubuyprice: nbubuyprice,
      nbucellprice: nbucellprice,
      date: date,
    );
  }
}