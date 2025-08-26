import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phonenumber = TextEditingController();
  final bio = TextEditingController();

  @override
  void initState() {
    super.initState();
    name.text = 'John Doe';
    email.text = 'hello@gmail.com';
    phonenumber.text = '123-432-0987';
    bio.text = 'I love fast food';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          children: [
            SizedBox(height: 42),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/personalinfo');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.grey.shade200,
                    ),
                    child: Icon(Icons.arrow_back_ios_new, size: 18),
                  ),
                ),
                SizedBox(width: 18),
                Text('Edit Profile', style: TextStyle(fontSize: 18)),
              ],
            ),
            SizedBox(height: 12),
            Stack(
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/menuscreen/profile.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 12,
                  child: Container(
                    height: 42,
                    width: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.deepOrangeAccent,
                    ),
                    child: Icon(Icons.create_outlined, color: Colors.white),
                  ),
                ),
              ],
            ),

            SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'FULL NAME',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: name,
              keyboardType: TextInputType.name,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'John Doe',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                filled: true,
                fillColor: Color.fromARGB(250, 240, 245, 250),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 22,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 22),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Email',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'john@gmail.com',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                filled: true,
                fillColor: Color.fromARGB(250, 240, 245, 250),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 22,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(height: 22),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Phone',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: phonenumber,
              keyboardType: TextInputType.phone,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: '123-123-0987',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                filled: true,
                fillColor: Color.fromARGB(250, 240, 245, 250),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 22,
                  horizontal: 22,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 22),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'BIO',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(height: 12),
            TextFormField(
              controller: bio,
              keyboardType: TextInputType.multiline,
              enableSuggestions: false,
              minLines: 3,
              maxLines: null,
              autocorrect: false,
              decoration: InputDecoration(
                hintText: 'Add your bio here.',
                hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
                filled: true,
                fillColor: Color.fromARGB(250, 240, 245, 250),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 62,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrangeAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'SAVE',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
