import "package:flutter/material.dart";
import "package:planify/components/colors.dart";
import "package:planify/components/image.dart";
import "package:planify/components/text.dart";
import "package:planify/widgets/search.dart";


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _HomeState();
}

class _HomeState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text("Welcome!", style: AppText.boldTextFeildStyle()),
            IconButton(onPressed: () => Navigator.pushNamed(context, '/notif-screen'), 
            icon: const Icon(Icons.notifications)),
          ],),
          // const Padding(padding: EdgeInsets.only(left: 20.0)),
        
          const SearchButton(),
          const AssetImageWidget(imagePath:'assets/images/home.jpg' ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text("Category", style: AppText.mediumTextFeildStyle(),),
            TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/category-screen'),
                  child: const Text(
                    'View all',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentColor,
                    )),
        ),
        ],
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/images/wedding.png", height: 70, width: 60, fit: BoxFit.cover),
            )
            ),
            Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/images/birthday.png", height: 70, width: 60, fit: BoxFit.cover),
            )
            ),
            Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/images/workshop.png", height: 70, width: 60, fit: BoxFit.cover),
            )
            ),
            Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Image.asset("assets/images/concert.png", height: 70, width: 60, fit: BoxFit.cover),
            )
            ),
            ],
            )
          ],),
          
      )
    );
  }
}