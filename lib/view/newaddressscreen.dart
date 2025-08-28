import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task1/providers/newaddressprovider.dart';

class NewAddressScreen extends ConsumerWidget {
  const NewAddressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newAdd = ref.watch(newAddressControllerProvider);
    final selectedAddress = ref.watch(selectedAddressProvider);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: screenHeight * 0.38,
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  image: DecorationImage(
                    image: AssetImage('assets/address/map.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: screenHeight * 0.06,
                left: screenWidth * 0.055,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed('/address');
                  },
                  child: Container(
                    width: screenWidth * 0.1,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsetsDirectional.symmetric(
              horizontal: 26,
              vertical: 16,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ADDRESS',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: newAdd.addressd,
                  keyboardType: TextInputType.multiline,
                  enableSuggestions: false,
                  minLines: 1,
                  maxLines: null,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: '332, Street 2, New York.',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(250, 240, 245, 250),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STREET',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          TextFormField(
                            controller: newAdd.street,
                            keyboardType: TextInputType.number,
                            enableSuggestions: false,
                            autocorrect: false,
                            decoration: InputDecoration(
                              hintText: 'Winston Street',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: screenWidth * 0.037,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(250, 240, 245, 250),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.06),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'POST CODE',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          TextFormField(
                            controller: newAdd.postcode,
                            keyboardType: TextInputType.number,
                            enableSuggestions: false,
                            autocorrect: false,

                            decoration: InputDecoration(
                              hintText: '12345',
                              hintStyle: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: screenWidth * 0.037,
                              ),
                              filled: true,
                              fillColor: Color.fromARGB(250, 240, 245, 250),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'APARTMENT',
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: newAdd.apartment,
                  keyboardType: TextInputType.text,
                  enableSuggestions: false,
                  minLines: 1,
                  maxLines: null,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: '001',
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                    ),
                    filled: true,
                    fillColor: Color.fromARGB(250, 240, 245, 250),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Text(
                  "LABEL AS",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 55,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                        newAdd.places.map((word) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: ChoiceChip(
                              label: Text(
                                word,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color:
                                      selectedAddress == word
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                              selected: selectedAddress == word,
                              selectedColor: Colors.deepOrangeAccent,
                              showCheckmark: false,
                              onSelected: (bool selected) {
                                ref
                                    .read(selectedAddressProvider.notifier)
                                    .state = selected ? word : null;
                              },
                              labelStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              backgroundColor: const Color.fromARGB(
                                250,
                                240,
                                245,
                                250,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(22),
                              ),
                              labelPadding: const EdgeInsets.symmetric(
                                horizontal: 26,
                                vertical: 4,
                              ),
                              side: BorderSide.none,
                            ),
                          );
                        }).toList(),
                  ),
                ),

                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 66,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('/address');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrangeAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'SAVE LOCATION',
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
        ],
      ),
    );
  }
}
