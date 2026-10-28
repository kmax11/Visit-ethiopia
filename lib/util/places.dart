import 'package:get/get.dart';

List places = [
  {
    "name": 'lalib'.tr,
    "category": "Historical Place",
    "lat": 12.0309,
    "lng": 39.0476,
    "coordinate": [12.0309, 39.0476],
    "img": [
      "assets/lalibela/lalibela1.jpeg",
      "assets/lalibela/lalibela2.jpeg",
      "assets/lalibela/lalibela3.jpeg",
      "assets/lalibela/lalibela4.jpeg"
    ],
    "location": 'lalibelaLocation'.tr,
    "details": "Lalibela (Amharic: ላሊበላ) is a town in the Amhara Region of Ethiopia. "
        "Located in the Lasta district and North Wollo Zone, it is a tourist site for its famous rock-cut monolithic churches. "
        "The whole of Lalibela is a large and important site for the antiquity, medieval, and post-medieval civilization of Ethiopia."
        " To Christians, Lalibela is one of Ethiopia's holiest cities, and a center of pilgrimage.",
  },
  {
    "name": "Axum".tr,
    "category": "Historical Place",
    "lat": 14.1311,
    "lng": 38.7234,
    "coordinate": [14.1311, 38.7234],
    "img": [
      "assets/axum/axum1.jpg",
      "assets/axum/axum2.jpeg",
      "assets/axum/axum3.jpeg",
      "assets/axum/axum4.jpeg",
      "assets/axum/axum5.jpeg"
    ],
    "location": "Tigray ,Axum",
    "details": "It is the site of the historic capital of the Aksumite Empire,"
        " a naval and trading power that ruled the whole region in addition parts of West Asia as Saudi Arabia,"
        " and Yemen. It ruled the region from about 400 BCE into the 10th century. In 1980,"
        " UNESCO added Axum's archaeological sites to its list of World Heritage Sites due to their historic value.",
  },
  {
    "name": "Fasil Ghebbi",
    "category": "Historical Place",
    "lat": 12.6080,
    "lng": 37.4697,
    "coordinate": [12.6080, 37.4697],
    "img": [
      "assets/fasil/fasil1.jpeg",
      "assets/fasil/fasil2.jpeg",
      "assets/fasil/fasil3.jpeg",
      "assets/fasil/fasil4.jpeg",
      "assets/fasil/fasil5.jpeg"
    ],
    "location": "Amhara , Gonder",
    "details": "The Fasil Ghebbi (Amharic: ፋሲል ግቢ) is a fortress located in Gondar, Amhara Region, Ethiopia."
        " It was founded in the 17th century by Emperor Fasilides and was the home of Ethiopian emperors."
        " Its unique architecture shows diverse influences including Hindu, Arab, and Baroque characteristics."
        " Because of its historical importance and architecture, the fortress was inscribed as a UNESCO World Heritage Site in 1979."
        " Ghebbi is an Amharic word for a compound or enclosure.",
  },
  {
    "name": "Harar Jugol",
    "category": "Historical Place",
    "lat": 9.3126,
    "lng": 42.1382,
    "coordinate": [9.3126, 42.1382],
    "img": [
      "assets/harer/harer1.jpeg",
      "assets/harer/harer2.jpeg",
      "assets/harer/harer3.jpeg",
      "assets/harer/harer4.jpeg"
    ],
    "location": "Harar Town",
    "details": "The fortified historic town of Harar is located in the eastern part of the country on a plateau with deep"
        " gorges surrounded by deserts and savannah. The walls surrounding this sacred Muslim city were built between the 13th"
        " and 16th centuries. Harar Jugol, said to be the fourth holiest city of Islam, numbers 82 mosques,"
        " three of which date from the 10th century, and 102 shrines, but the townhouses with their exceptional interior design constitute the "
        "most spectacular part of Harar's cultural heritage. "
        "The impact of African and Islamic traditions on the development of the town's"
        " building types and urban layout make for its particular character and uniqueness.",
  },
  {
    "name": "Dallol",
    "category": "Landscape",
    "lat": 14.2419,
    "lng": 40.2994,
    "coordinate": [14.2419, 40.2994],
    "img": [
      "assets/dallol/dallol1.jpeg",
      "assets/dallol/dallol2.jpeg",
      "assets/dallol/dallol3.jpeg"
    ],
    "location": "Afar Region",
    "details": "Dallol (Amharic: ዳሎል) is a locality in the Dallol woreda of northern Ethiopia."
        " Located in Kilbet Rasu, Afar Region in the Afar Depression, it has a latitude and longitude of 14°14′19″N 40°17′38″E with an elevation "
        "of about 130 metres (430 ft) below sea level. The Central Statistical Agency has not published an estimate for the 2005 population"
        " of the village, which has been described as a ghost town.",
  },
  {
    "name": "Konso Cultural Landscape",
    "category": "Cultural",
    "lat": 5.3333,
    "lng": 37.4333,
    "coordinate": [5.3333, 37.4333],
    "img": [
      "assets/konso/konso1.jpeg",
      "assets/konso/konso2.jpeg",
      "assets/konso/konso3.jpeg",
      "assets/konso/konso4.jpeg"
    ],
    "location": "SNNP , Konso",
    "details": "Konso Cultural Landscape is an arid property of stone walled terraces and fortified settlements in the Konso highlands of Ethiopia."
        " It constitutes a spectacular example of a living cultural tradition stretching back 21 generations (more than 400 years) adapted to its dry "
        "hostile environment. The landscape demonstrates the shared values, social cohesion and engineering knowledge of its communities. The site also features "
        "anthropomorphic wooden statues - grouped to represent respected members of their communities and particularly heroic events - which are an exceptional living"
        " testimony to funerary traditions that are on the verge of disappearing. "
        "Stone steles in the towns express a complex system of marking the passing of generations of leaders.",
  },
  {
    "name": "Tiya",
    "category": "Landscape",
    "lat": 8.4347,
    "lng": 38.6117,
    "coordinate": [8.4347, 38.6117],
    "img": [
      "assets/tiya/tiya1.jpeg",
      "assets/tiya/tiya2.jpeg",
      "assets/tiya/tiya3.jpeg",
      "assets/tiya/tiya4.jpeg"
    ],
    "location": "SNNP , Gurage",
    "details": "Tiya is among the most important of the roughly 160 archaeological sites discovered so far in the Soddo region,"
        " south of Addis Ababa. The site contains 36 monuments, including 32 carved stelae covered with symbols,"
        " most of which are difficult to decipher."
        " They are the remains of an ancient Ethiopian culture whose age has not yet been precisely determined.",
  },
  {
    "name": "Semien Mountains",
    "category": "Mountains",
    "lat": 13.1833,
    "lng": 38.0667,
    "coordinate": [13.1833, 38.0667],
    "img": [
      "assets/simienMountain/simienMountain1.jpeg",
      "assets/simienMountain/simienMountain2.jpeg",
      "assets/simienMountain/simienMountain3.jpeg",
      "assets/simienMountain/simienMountain4.jpeg",
      "assets/simienMountain/simienMountain5.jpeg",
    ],
    "location": "Amhara , Gonder",
    "details": "The Simien Mountains National Park in Northern Ethiopia is an exotic setting with unique wildlife and"
        " breath-taking views on a landscape shaped by nature and traditional agriculture. The natural beauties of this region "
        "have always filled visitors from Ethiopia and abroad with awe. Gentle highland ridges at altitudes above 3600 meters"
        " above sea level (m asl), covered with grasses, isolated trees (Erica &bored) and the bizarre Giant Lobelia (Lobelia rhynchopetalum)"
        " are found on the high plateau that ends abruptly at 1000- to 2000-m deep escarpments.",
  },
  {
    "name": "Ras Dashen",
    "category": "Mountains",
    "lat": 13.2358,
    "lng": 38.3700,
    "coordinate": [13.2358, 38.3700],
    "img": [
      "assets/rasDashen/rasDashen1.jpeg",
      "assets/rasDashen/rasDashen2.jpeg",
      "assets/rasDashen/rasDashen3.jpeg",
      "assets/rasDashen/rasDashen4.jpeg",
    ],
    "location": "Amhara , Gonder",
    "details": "Ras Dashen (Amharic: ራስ ዳሸን rās dāshn), also known as Ras Dejen,"
        " is the highest mountain in Ethiopia and fourteenth highest peak in Africa. Located in the Simien "
        "Mountains National Park in the North Gondar Zone of the Amhara Region, it reaches an elevation of"
        " 4,550 metres (14,930 ft).The English form, Ras Dashen is a corruption of its Amharic name, Ras Dejen,"
        " the term used by the Ethiopian Mapping Authority (EMA) which alludes to the traditional head or general who fights in"
        " front of the Emperor.",
  },
  {
    "name": "Erta Ale",
    "category": "Landscape",
    "lat": 13.6000,
    "lng": 40.6667,
    "coordinate": [13.6000, 40.6667],
    "img": [
      "assets/ertaAle/ertaAle1.jpeg",
      "assets/ertaAle/ertaAle2.jpeg",
      "assets/ertaAle/ertaAle3.jpeg",
      "assets/ertaAle/ertaAle4.jpeg"
    ],
    "location": "Afar ,Semera",
    "details": "Erta Ale (or Ertale or Irta'ale; Amharic: ኤርታሌ) is a continuously active basaltic shield volcano "
        "in the Afar Region of northeastern Ethiopia, which is itself part of the wider Afar Triangle (a barren desert region straddling Djibouti"
        ", Ethiopia and Eritrea). Erta Ale is located in the Danakil Depression, an area below sea level between the last"
        " two countries, and is the most active volcano in Ethiopia.",
  },
  {
    "name": "Nechisar National Park",
    "category": "Parks",
    "lat": 5.9600,
    "lng": 37.5500,
    "coordinate": [5.9600, 37.5500],
    "img": [
      "assets/nechisar/nechisar1.jpeg",
      "assets/nechisar/nechisar2.jpeg",
      "assets/nechisar/nechisar3.jpeg",
      "assets/nechisar/nechisar4.jpeg",
      "assets/nechisar/nechisar5.jpeg"
    ],
    "location": "SNNP , Abra Minch",
    "details": "The 750-square-kilometre (190,000-acre) park includes the Bridge of God, an isthmus between Lake Abaya and Lake Chamo,"
        " and the Nechisar (English: white grass) plains east of the lakes. It is east of Arba Minch."
        "Park elevations range between 1,108 and 1,650 metres (3,635 and 5,413 ft) above sea level."
        " Nechisar National Park was established in 1974. Under the management of African Parks Network (APN since 2005, it was reportedly scheduled to hand over management to the Ethiopian government"
        " in June 2008.",
  },
  {
    "name": "Bale Mountains National Park",
    "category": "Parks",
    "lat": 6.8667,
    "lng": 39.7500,
    "coordinate": [6.8667, 39.7500],
    "img": [
      "assets/bale/bale1.jpeg",
      "assets/bale/bale2.jpeg",
      "assets/bale/bale3.jpeg",
      "assets/bale/bale4.jpeg"
    ],
    "location": "Oromiya , Bale",
    "details": "The Northern grasslands, spanning the Web and Danka Rivers, are situated to the south of the Bodeti Mountain and north of Adelay ridge,"
        " and northwest of Dinsho. The altitude of the area ranges from 3,000m to 3,500m, pushing the upper limit for tree growth. The land"
        " is flat, dominated by swamp grasses and sedges, especially of the Cyperus and Scirpus genera and becomes muddy during the rainy season. Higher areas are"
        " scrubby with African or wild wormwood (Artemesia afra) and Cape gold (Helichrysum splendidum), one of more than ten species of everlasting flower found in Bale. Both are"
        " important sources of food for the mountain nyala and sources of shelter for other animals. Hagenia abyssinica trees flower from November through February; female trees "
        "boast an impressive red bloom",
  },
  {
    "name": "Omo National Park",
    "category": "Parks",
    "lat": 5.9000,
    "lng": 35.9500,
    "coordinate": [5.9000, 35.9500],
    "img": [
      "assets/omo/omo1.jpeg",
      "assets/omo/omo2.jpeg",
      "assets/omo/omo3.jpeg",
      "assets/omo/omo4.jpeg",
      "assets/omo/omo5.jpeg"
    ],
    "location": "SNNP , Omo",
    "details": "Omo National Park is a national park in Ethiopia founded in 1980. Located in the Southern Nations, Nationalities,"
        " and Peoples' Region on the west bank of the Omo River, the park covers approximately 4,068 square kilometers, about 870 kilometers southwest "
        "of Addis Ababa; across the Omo is the Mago National Park and the Tama Wildlife Reserve. Although an airstrip was recently built near the park headquarters "
        "on the Mui River, this park is not easily reachable; the Lonely Planet guide Ethiopia and Eritrea describes Omo National Park as Ethiopia's most remote park.",
  },
  {
    "name": "Addis Ababa",
    "category": "City",
    "lat": 9.0320,
    "lng": 38.7469,
    "coordinate": [9.0320, 38.7469],
    "img": [
      "assets/aa/aa1.jpeg",
      "assets/aa/aa2.jpeg",
      "assets/aa/aa3.jpeg",
      "assets/aa/aa4.jpeg",
      "assets/aa/aa5.jpeg"
    ],
    "location": "Ethiopia , Addis Ababa",
    "details": "capital and largest city of Ethiopia. In the 2007 census, the city's population was estimated to be"
        " 2,739,551 inhabitants. Addis Ababa is a highly developed and important cultural, artistic, financial and administrative centre of Ethiopia.\n"
        "The founding history of Addis Ababa dates back in late 19th-century by Menelik II, Negus of Shewa, in 1886 after finding Mount Entoto unpleasant"
        " two years prior. At the time, the city was a resort town; its large mineral spring abundance attracted nobilities of the empire and led them to establish "
        "permanent settlement. It also attracted many members of the working classes — including artisans and merchants — and foreign visitors. Menelik II then formed his"
        " imperial palace in 1887. Addis Ababa became the empire's capital in 1889, and subsequently international embassies were opened. Addis Ababa urban development began at "
        "the beginning of the 20th century, and without any preplanning.",
  },
];
