import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task1/controller/addcardcontroller.dart';
import '../constants/color/addcardscreen.dart';
import '../constants/text/addcardscreen.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key});

  @override
  _AddCardScreenState createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final addCard = AddCardcontroller();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AddCardColor.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.035),
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.07),

                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: screenWidth * 0.1,
                        height: screenWidth * 0.1,
                        decoration: BoxDecoration(
                          color: AddCardColor.grey300,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.close,
                            size: screenWidth * 0.05,
                            color: AddCardColor.black,
                          ),
                          onPressed:
                              () => Navigator.of(
                                context,
                              ).pushReplacementNamed('/payementscreen'),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.03),
                    Text(
                      AddCardText.addCard,
                      style: TextStyle(
                        fontSize: screenWidth * 0.044,
                        fontWeight: FontWeight.w400,
                        color: AddCardColor.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.03),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AddCardColor.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AddCardText.cardHolderName,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AddCardColor.grey500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: addCard.nameController,
                    keyboardType: TextInputType.name,
                    enableSuggestions: true,
                    autocorrect: true,
                    decoration: InputDecoration(
                      hintText: AddCardText.hintName,
                      hintStyle: TextStyle(
                        color: AddCardColor.hint,
                        fontSize: screenWidth * 0.037,
                      ),
                      filled: true,
                      fillColor: AddCardColor.fill,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.025,
                        horizontal: screenWidth * 0.04,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Text(
                    AddCardText.cardNumber,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: AddCardColor.grey500,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFormField(
                    controller: addCard.cardNumberController,
                    keyboardType: TextInputType.number,
                    enableSuggestions: false,
                    autocorrect: false,
                    inputFormatters: [LengthLimitingTextInputFormatter(19)],
                    onChanged: (value) {
                      final digitsOnly = value.replaceAll(RegExp(r'\D'), '');

                      final newValue =
                          digitsOnly
                              .replaceAllMapped(
                                RegExp(r'.{1,4}'),
                                (match) => '${match.group(0)} ',
                              )
                              .trim();

                      if (newValue != value) {
                        addCard.cardNumberController
                          ..text = newValue
                          ..selection = TextSelection.collapsed(
                            offset: newValue.length,
                          );
                      }
                    },
                    decoration: InputDecoration(
                      hintText: AddCardText.hintCardNumber,
                      hintStyle: TextStyle(
                        color: AddCardColor.hint,
                        fontSize: screenWidth * 0.037,
                      ),
                      filled: true,
                      fillColor: AddCardColor.fill,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.025),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AddCardText.expireDate,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AddCardColor.grey500,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            TextFormField(
                              controller: addCard.dateController,
                              keyboardType: TextInputType.number,
                              enableSuggestions: false,
                              autocorrect: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(7),
                              ],
                              onChanged: (value) {
                                final formatted = addCard.formatExpireDate(
                                  value,
                                );
                                if (formatted != value) {
                                  addCard.dateController
                                    ..text = formatted
                                    ..selection = TextSelection.collapsed(
                                      offset: formatted.length,
                                    );
                                }
                              },
                              decoration: InputDecoration(
                                hintText: AddCardText.hintExpireDate,
                                hintStyle: TextStyle(
                                  color: AddCardColor.hint,
                                  fontSize: screenWidth * 0.037,
                                ),
                                filled: true,
                                fillColor: AddCardColor.fill,
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
                              AddCardText.cvc,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: AddCardColor.grey500,
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.015),
                            TextFormField(
                              controller: addCard.cvcController,
                              keyboardType: TextInputType.number,
                              enableSuggestions: false,
                              autocorrect: false,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(3),
                              ],
                              onChanged: (value) {
                                final formatted = addCard.formatCVC(value);
                                if (formatted != value) {
                                  addCard.cvcController
                                    ..text = formatted
                                    ..selection = TextSelection.collapsed(
                                      offset: formatted.length,
                                    );
                                }
                              },
                              decoration: InputDecoration(
                                hintText: AddCardText.hintCVC,
                                hintStyle: TextStyle(
                                  color: AddCardColor.hint,
                                  fontSize: screenWidth * 0.037,
                                ),
                                filled: true,
                                fillColor: AddCardColor.fill,
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
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 26, horizontal: 22),
            child: SizedBox(
              width: double.infinity,
              height: screenHeight * 0.07,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/payementscreen');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AddCardColor.deeporange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  AddCardText.button,
                  style: TextStyle(
                    color: AddCardColor.white,
                    fontWeight: FontWeight.w400,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
