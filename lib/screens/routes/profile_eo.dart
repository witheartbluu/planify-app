import "package:flutter/material.dart";

class EOScreen extends StatelessWidget {
  const EOScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: IconButton(onPressed: () => Navigator.pushNamed(context, '/share-screen'), 
            icon: const Icon(Icons.share)),
          ),
        ],
          leading: IconButton(onPressed: () => Navigator.pushNamed(context, '/setting-screen'), 
            icon: const Icon(Icons.settings)),
      ),
      body: Column(children: [
        Container(
          color: Colors.white,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/NJ.jpg'),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'NewJeanseu',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        '4.6/5',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Rates',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 10),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '2164',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Followers',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 10),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '28',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Following',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 10),
                      ),
                    ],
                  )
                ],
              ),
              // CustomButton(onTap: () {}, text: "Edit Profile"),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // child: const ProfileButton(),
        )
      ]),
    );
  }
}