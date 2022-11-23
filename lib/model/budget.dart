class Budget{
  String judul = "";
  int? nominal = 0;
  String? jenis;
  DateTime dateTime = DateTime.now();

  Budget(String _judul, int? _nominal, String? _jenis, DateTime _dateTime){
    judul = _judul;
    nominal = _nominal;
    jenis = _jenis;
    dateTime = _dateTime;
  }
}

class ListBudget{
  static List<Budget> listdata = [];
}