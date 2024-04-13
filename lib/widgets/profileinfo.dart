import "package:flutter/material.dart";

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        height: 8,
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
                        height: 8,
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
                        height: 8,
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
            ],
          ),
        ),
        const SizedBox(
          height: 15,
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