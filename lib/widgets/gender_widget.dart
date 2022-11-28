import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderProvider with ChangeNotifier {
  bool _isMale = true;

  bool get isMale => this._isMale;

  set isMale(bool value) {
    this._isMale = value;
    notifyListeners();
  }

  get color => _isMale ? Colors.blue : Colors.pink;
  get maleColor => _isMale ? Colors.blue : Colors.grey;
  get femaleColor => _isMale ? Colors.grey : Colors.pink;
}

class GenderButton extends StatelessWidget {
  const GenderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GenderProvider>(
        create: (context) => GenderProvider(),
        child: Row(
          children: [
            const SizedBox(
              width: 50,
            ),
            
            // MALE
            Expanded(
              child: Consumer<GenderProvider>(
                builder: (context, genderProvider, _) => GestureDetector(
                  onTap: () {
                    genderProvider.isMale = true;
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: genderProvider.maleColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*Image.asset(
                          'assets/icon_male.png',
                          height: 80,
                          color: genderProvider.maleColor,
                        ),*/
                        Text(
                          'Hombre',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: genderProvider.maleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 100,
            ),
            // FEMALE
            Expanded(
              child: Consumer<GenderProvider>(
                builder: (context, genderProvider, _) => GestureDetector(
                  onTap: () {
                    genderProvider.isMale = false;
                  },
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: genderProvider.femaleColor,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /*Image.asset(
                          'assets/icon_female.png',
                          height: 80,
                          color: genderProvider.femaleColor,
                        ),*/
                        Text(
                          'Mujer',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: genderProvider.femaleColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 50,
            ),
          ],
        ));
  }
}
