import 'package:animal_app/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global {
  static String categores = "";

  static List<SecondScreenInsert> secondScreenData = [
    SecondScreenInsert(time: "Week", price: "\$1.99"),
    SecondScreenInsert(time: "1 Month", price: "\$4.39"),
    SecondScreenInsert(time: "3 Month", price: "\$9.99"),
    SecondScreenInsert(time: "6 Month", price: "\$13"),
  ];

  static List<LastScreenInsert> lastScreenData = [
    LastScreenInsert(
      name: "Panda",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Bear",
      image: "assets/image/b1.jpg",
    ),
    LastScreenInsert(
      name: "Asian Block Bear",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Bear",
      image: "assets/image/b2.jpg",
    ),
    LastScreenInsert(
      name: "Brown Bear",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Bear",
      image: "assets/image/b3.jpg",
    ),
    LastScreenInsert(
      name: "Lion",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Lion",
      image: "assets/image/l1.jpg",
    ),
    LastScreenInsert(
      name: "Afrikaans Lion",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Lion",
      image: "assets/image/l2.jpg",
    ),
    LastScreenInsert(
      name: "German Lion",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Lion",
      image: "assets/image/l3.jpg",
    ),
    LastScreenInsert(
      name: "Rabbit",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Rabbit",
      image: "assets/image/r1.jpg",
    ),
    LastScreenInsert(
      name: "Afrikaans Rabbit ",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Rabbit",
      image: "assets/image/r2.jpg",
    ),
    LastScreenInsert(
      name: "German Rabbit ",
      description:
          "Since 1976, the mission of Farm Animal Rights Movement (FARM) is to end the use of animals for food through traditional media, social media, live events, and video outreach.",
      category: "Rabbit",
      image: "assets/image/r2.jpg",
    ),
  ];
}
