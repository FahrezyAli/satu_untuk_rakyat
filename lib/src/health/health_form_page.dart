import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:satu_untuk_rakyat/components/dropdown_field.dart';
import 'package:satu_untuk_rakyat/components/scaffold.dart';
import 'package:satu_untuk_rakyat/components/text_field.dart';
import 'package:satu_untuk_rakyat/components/upload_button.dart';
import 'package:satu_untuk_rakyat/utils/colors.dart';

class HealthFormPage extends StatefulWidget {
  const HealthFormPage({super.key});

  @override
  State<HealthFormPage> createState() => _HealthFormPageState();
}

class _HealthFormPageState extends State<HealthFormPage> {
  bool useKTP = true;
  bool useReminder = false;

  TextEditingController nikController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  DateTime? birthDate;
  TextEditingController birthDateController = TextEditingController();
  String? gender;
  TextEditingController addressController = TextEditingController();

  void setKTPData(bool state) {
    if (state) {
      nikController.text = "1234567890123456";
      nameController.text = "Ali Ahmad Fahrezy";
      birthPlaceController.text = "Medan";
      birthDate = DateTime(1999, 12, 31);
      birthDateController.text = DateFormat.yMd().format(birthDate!);
      gender = "L";
      addressController.text = "Jl. Jend. Sudirman No. 1";
    } else {
      nikController.text = "";
      nameController.text = "";
      birthPlaceController.text = "";
      birthDate = null;
      birthDateController.text = "";
      gender = null;
      addressController.text = "";
    }
  }

  @override
  void initState() {
    super.initState();
    setKTPData(useKTP);
  }

  @override
  void dispose() {
    nikController.dispose();
    nameController.dispose();
    birthPlaceController.dispose();
    birthDateController.dispose();
    addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SuratScaffold(
      useDrawer: false,
      useNavigationBar: false,
      title: "Surat Sehat",
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: suratBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Biodata Diri",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                      child: Checkbox(
                        side: BorderSide(color: Colors.white),
                        value: useKTP,
                        onChanged: (value) {
                          setState(() {
                            useKTP = value!;
                            setKTPData(value);
                          });
                        },
                      ),
                    ),
                    Text(
                      "Ambil dari KTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Rubik",
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Form(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      SuratTextField(
                        controller: nikController,
                        hintText: "NIK",
                        enabled: !useKTP,
                      ),
                      SizedBox(height: 5),
                      SuratTextField(
                        controller: nameController,
                        hintText: "Nama",
                        enabled: !useKTP,
                      ),
                      SizedBox(height: 5),
                      SuratTextField(
                        controller: birthPlaceController,
                        hintText: "Tempat Lahir",
                        enabled: !useKTP,
                      ),
                      SizedBox(height: 5),
                      SuratTextField(
                        controller: birthDateController,
                        hintText: "Tanggal Lahir",
                        enabled: !useKTP,
                        readOnly: true,
                        suffixIconConstraints: BoxConstraints(
                          minHeight: 10,
                          minWidth: 10,
                        ),
                        suffixIcon: InkWell(
                          child: Ink(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(
                              Icons.calendar_month,
                              color: !useKTP ? suratBlue : Colors.grey,
                            ),
                          ),
                          onTap: () async {
                            birthDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now().subtract(
                                Duration(days: 365 * 100),
                              ),
                              lastDate: DateTime.now().subtract(
                                Duration(days: 365 * 18),
                              ),
                            );

                            if (birthDate != null) {
                              birthDateController.text =
                                  DateFormat.yMd().format(birthDate!);
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      SuratDropdownField(
                        value: gender,
                        hintText: "Jenis Kelamin",
                        enabled: !useKTP,
                        items: [
                          DropdownMenuItem(
                            value: "L",
                            child: Text("Laki-laki"),
                          ),
                          DropdownMenuItem(
                            value: "P",
                            child: Text("Perempuan"),
                          ),
                        ],
                        onChanged: (value) {},
                      ),
                      SizedBox(height: 5),
                      SuratTextField(
                        controller: addressController,
                        hintText: "Alamat",
                        enabled: !useKTP,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Lokasi Tes",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                SuratDropdownField(
                  value: null,
                  hintText: "Pilih Lokasi",
                  enabled: true,
                  items: [
                    DropdownMenuItem(
                      value: "1",
                      child: Text("RSU Surabaya"),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text("RSU Airlangga"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              "Tanggal & Waktu Tes",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.topLeft,
            child: Text(
              "Unggah KTP",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: UploadButton(
              text: useKTP ? "KTP Uploaded!" : "Upload KTP",
              enabled: !useKTP,
              onPressed: () {
                Navigator.pushNamed(context, '/camera');
              },
            ),
          ),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/status');
                  },
                  child: Text("Ajukan"),
                ),
              ),
              Container(
                width: 24,
                height: 24,
                margin: EdgeInsets.fromLTRB(0, 5, 5, 5),
                child: Checkbox(
                  value: useReminder,
                  onChanged: (value) {
                    setState(() {
                      useReminder = value!;
                    });
                  },
                ),
              ),
              Text(
                "Tambahkan ke Reminder",
                style: TextStyle(
                  fontFamily: "Rubik",
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
