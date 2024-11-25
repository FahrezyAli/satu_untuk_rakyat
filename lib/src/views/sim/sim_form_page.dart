import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:satu_untuk_rakyat/src/components/dropdown_field.dart';
import 'package:satu_untuk_rakyat/src/components/scaffold.dart';
import 'package:satu_untuk_rakyat/src/components/text_field.dart';
import 'package:satu_untuk_rakyat/src/utils/colors.dart';

class SimFormPage extends StatefulWidget {
  const SimFormPage({super.key});

  @override
  State<SimFormPage> createState() => _SimFormPageState();
}

class _SimFormPageState extends State<SimFormPage> {
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
      title: "SIM",
      body: Column(
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
                  "Lokasi Pengambilan",
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
                      child: Text("Kantor Polisi"),
                    ),
                    DropdownMenuItem(
                      value: "2",
                      child: Text("Kantor Samsat"),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
          SizedBox(height: 75),
          Row(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  onPressed: () {},
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
