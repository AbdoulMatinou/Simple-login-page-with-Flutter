import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ultimate/views/constains.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  TextEditingController cardNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: 55,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 20, 30, 40),
                      child: FlutterLogo(
                        size: 80,
                      ),
                    ),
                    Text(
                      "Page de Paiement",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(19),
                        CardNumberInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: 'Numero de la carte',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SvgPicture.asset("assets/card.svg"),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          labelText: 'Nom au complet',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: SvgPicture.asset("assets/users.svg"),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              labelText: 'CVV',
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SvgPicture.asset("assets/cvv.svg"),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: defaultPadding),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                            ],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              labelText: 'MM/YY',
                              prefixIcon: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: SvgPicture.asset("assets/calendar.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              OutlinedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Color.fromARGB(255, 14, 27, 212),
                ),
                icon: SvgPicture.asset("assets/scan.svg"),
                label: Text(
                  "scan",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(top: defaultPadding),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Color.fromARGB(255, 14, 27, 212),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Valider",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String inputData = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (var i = 0; i < inputData.length; i++) {
      buffer.write(inputData[i]);
      int index = i + 1;

      if (index % 4 == 0 && inputData.length != index) {
        buffer.write(" ");
      }
    }
    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(
        offset: buffer.toString().length,
      ),
    );
  }
}
