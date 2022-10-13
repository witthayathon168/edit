import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:real_project/create_exel.dart';

import 'Editform.dart';

class DetailPage extends StatefulWidget {
  final String noteId;

  const DetailPage({
    Key? key,
    required this.noteId,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState(noteId: this.noteId);
}

class _DetailPageState extends State<DetailPage> {
  String noteId;
  late final _URL = TextEditingController();
  final _mybox = Hive.box('mybox');
  late final kk;
  late int colorValue;
  late final displaytext;
  void getmoredata(noteId) {
    kk = _mybox.get(noteId);

    colorValue = kk['color'];
    if (colorValue == Colors.black.value) {
      displaytext =
          'ระยะวิกฤต \n 1.เมื่อมีสัญญาณเตือน เช่น เจ็บหน้าอก หายใจหอบ เหนื่อย ปากเบี้ยว พูดไม่ชัด แขนขาอ่อนแรง ให้นำส่ง รพ.เร็วที่สุดหรือเรียก 1669 ระบบการแพทย์ฉุกเฉิน \n 2.ปฏิบัติตามคำสั่งของแพทย์อย่างเคร่งครัด\n ระยะวิกฤต \n 1.ได้รับการติดตามเยี่ยมบ้าน \n 2.มีผู้ดูแล / จิตอาสา';
    } else if (colorValue == Colors.white.value) {
      displaytext =
          '1. 3อ. 2ส\nอ.อาหารลดหวาน มัน เค็ม เพิ่ม ผัก ผลไม้ \nอ.ออกกำลังกาย อาทิตย์ละ 3 ครั้ง ครั้งละ 30 นาที \nอ.อารมณ์ ลดความเครียด\nส.ลด/งดสูบบุหรี่\nส.ลด/งดดื่มสุรา/เครื่องดื่มแอลกอฮอล์\n2.ตรวจวัดความดันโลหิตและระดับน้ำตาลในเลือดซ้ำทุก 1 ปี';
    } else if (colorValue == Colors.lightGreen.value) {
      displaytext =
          '1. 3อ. 2ส\n2.วัดความดันโลหิต ตรวจวัดเบาหวานทุก 1-3 เดือน\n3.พบแพทย์ทุก 2-3 เดือน\n4.ลดการบริโภคน้ำตาลสำหรับผู้ป่วยเบาหวาน\n5.ลดการบริโภคอาหารมัน เค็ม สำหรับผู้ป่วยความดันโลหิตสูง';
    } else if (colorValue == Color.fromARGB(255, 14, 99, 17).value) {
      displaytext =
          '1. 3อ. 2ส\n2.รับประทานยาต่อเนื่อง \n3.พบแพทย์ทุก 2-3 เดือน\n4.ลดการบริโภคน้ำตาลสำหรับผู้ป่วยเบาหวาน\n5.ลดการบริโภคอาหารมัน เค็ม สำหรับผู้ป่วย ความดันโลหิตสูง';
    } else if (colorValue == Colors.yellow.value) {
      displaytext =
          '1. 3อ. 2ส\n2.รับประทานยาต่อเนื่อง\n3.พบแพทย์ทุก 2-3 เดือน\n4.ลดการบริโภคหวาน มัน เค็ม\n5.ตรวจภาวะแทรกซ้อนทางตา,ไต,หัวใจ,เท้า อย่างน้อยปีละ 1 ครั้ง';
    } else if (colorValue == Colors.orange.value) {
      displaytext =
          '1. 3อ. 2ส\n2.รับประทานยาต่อเนื่อง\n3.ลดการบริโภคหวาน มัน เค็ม\n4.ตรวจภาวะแทรกซ้อนทางตา,ไต,หัวใจ,เท้า อย่างน้อยปีละ 1 ครั้ง\n5.พบแพทย์ตามนัดทุก 4 สัปดาห์เมื่อมีอาการผิดปกติ\n6.ได้รับการติดตามเยี่ยมบ้าน';
    } else if (colorValue == Colors.red.value) {
      displaytext =
          '1. 3อ. 2ส\n2.รับประทานยาต่อเนื่อง\n3.ลดการบริโภคหวาน มัน เค็ม\n4.ตรวจภาวะแทรกซ้อนทางตา,ไต,หัวใจ,เท้า อย่างน้อยปีละ 1 ครั้ง\n5.พบแพทย์ตามนัดทุก 4 สัปดาห์หรือเมื่อมีอาการผิด\n6.ได้รับการติดตามเยี่ยมบ้าน';
    } else {
      displaytext = '';
    }
  }

  @override
  void initState() {
    super.initState();

    getmoredata(noteId);
  }

  _DetailPageState({required this.noteId});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(245, 243, 230, 215),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xffFFFAF0),
                Color(0xffF8D1CD),
              ],
            )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("ข้อมูลส่วนตัว",
                          style: TextStyle(
                            fontSize: 35,
                            letterSpacing: 1.5,
                            color: Colors.black,
                          ))),
                ),
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Color(kk['color']),
                      radius: 75.0,
                    ),
                  ),
                ),
                Text("ชื่อ :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(noteId,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("อายุ :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["age"] + " ปี",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("เบอร์โทรศัทพ์ :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["phonenumber"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("ส่วนสูง :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["height"] + " cm",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("น้ำหนัก :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["weight"] + " kg",
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("ดัชนีมวลกาย :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["bodymass"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("ความดันเลือด :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["pressure"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("กรุ๊ปเลือด :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["blood"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("กลุ่มผู้ป่วย :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["disease"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text("ยาที่ทานประจำ :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                Text(kk["medicine"],
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 72, 70, 70),
                    )),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    width: double.infinity,
                    color: Color.fromARGB(178, 253, 253, 150),
                    child: Center(
                        child: Column(children: [
                      Text("คำแนะนำ ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Color.fromARGB(255, 72, 70, 70),
                          )),
                      Text(displaytext,
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 72, 70, 70),
                          )),
                    ])),
                  ),
                ),
                SizedBox(height: 8),
                Center(
                    child: Column(children: <Widget>[
                  Row(children: [
                    Container(
                        //   width: 120.0,
                        //  height: 40.0,
                        child: RaisedButton(
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoteEditPage(
                                    title: _mybox.get(noteId),
                                    name: noteId,
                                  )),
                        );
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Text(
                            'แก้ไข',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      color: Color.fromARGB(255, 255, 250, 154),
                    )),
                    Container(
                        //  width: 120.0,
                        //  height: 40.0,
                        child: RaisedButton(
                      onPressed: () async {
                        createExcel();
                      },
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.add_chart,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                          Text(
                            'สร้าง excel',
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                      color: Color.fromARGB(255, 32, 235, 14),
                    )),
                  ])
                ])),
              ],
            )),
      ),
    ));
  }
}

createPost(url, name, age, phonenumber, height, weight, bodymass, pressure,
    blood, disease, medicine) async {
  String URL = url;

  try {
    final response = await http.post(
      Uri.parse(URL),
      body: {
        'name': name,
        'age': age,
        'phonenumber': phonenumber,
        'height': height,
        'weight': weight,
        'bodymass': bodymass,
        'pressure': pressure,
        'blood': blood,
        'disease': disease,
        'medicine': medicine,
      },
    );
  } catch (e) {
    print(e);
  }
}

Widget ERROR_POPUP() {
  return Center(child: Text("data"));
}
