import 'package:flutter/material.dart';
import 'package:task1/controller/addressscreen.dart';
import 'package:task1/model/addressscreen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final addresscontrol = AddressController();
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
                  "My Address",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ],
            ),

            SizedBox(height: 12),
            Expanded(
              child: ListView.separated(
                itemCount: addresscontrol.addresspage.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = addresscontrol.addresspage[index];
                  return _groupContainer([_menuitem(item)]);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              child: SizedBox(
                width: double.infinity,
                height: 66,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/newaddress');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'ADD NEW ADDRESS',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1.2,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuitem(AddressModel item) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 8),
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

        title: Row(
          children: [
            Expanded(
              child: Text(
                item.title,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(Icons.edit_note, color: Colors.deepOrangeAccent),
            SizedBox(width: 6),
            Icon(Icons.delete_outline, color: Colors.deepOrangeAccent),
          ],
        ),

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
