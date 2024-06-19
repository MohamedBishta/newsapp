import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 64, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Language : ",style: TextStyle(fontWeight: FontWeight.w700),),
            // Text(AppLocalizations.of(context)!.language),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8)),
                child: Text("English",style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                // child: Text(settingProvider.selectedLocal == 'ar'
                //     ? "العربيه"
                //     : "English"),
              ),
            ),
          ],
        ));
  }
}
