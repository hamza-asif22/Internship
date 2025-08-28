import 'package:flutter/material.dart';
import 'package:task1/model/personalinfoscreen.dart';
import '../controller/personalinfoscreen.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final personalinfocontrol = PerInfoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 34),
        child: Column(
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/menuscreen');
                    },
                  ),
                ),
                const SizedBox(width: 18),
                const Text(
                  "Personal Info",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/editprofile');
                  },
                  child: Text(
                    'EDIT',
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.deepOrangeAccent,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    personalinfocontrol.personalInfodata.image,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(width: 34),
                Column(
                  children: [
                    Text(
                      personalinfocontrol.personalInfodata.name,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      personalinfocontrol.personalInfodata.des,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                        color: Colors.grey.shade500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            Container(
              child: _groupContainer(
                List.generate(personalinfocontrol.personalinfopage.length, (
                  index,
                ) {
                  final item = personalinfocontrol.personalinfopage[index];
                  return _menuitem(item);
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuitem(PersonalInformation item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Icon(item.icons, color: item.colors),
        ),

        title: Text(item.title, style: TextStyle(fontSize: 16)),
        subtitle: Text(
          item.data,
          style: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }

  Widget _groupContainer(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(250, 246, 248, 250),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }
}
