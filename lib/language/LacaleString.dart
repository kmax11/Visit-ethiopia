import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // ═════════════════════════════════════════════════════════════════════
        // ── ENGLISH (en_US) ──────────────────────────────────────────────────
        // ═════════════════════════════════════════════════════════════════════
        'en_US': {
          // App / Navigation
          'tit': 'Ethiopia',
          'hometitle': "Where are you \n going?",
          'popular': "Popular Places",
          'seeAll': "See all",
          'exploreByCategory': "Explore by category",
          'heroSubtitle':
              "Discover breathtaking landscapes, ancient history & vibrant culture.",
          'login': "Login",
          'calendar': "Calendar",
          'today': "Today",
          'calendarconverter': "Calendar Converter",
          'language': "Language",
          'about': "About",
          'currency': "Currency Converter",
          'favorites': "Favorites",
          'home': "Home",
          'profile': "Profile",

          // Bottom navigation
          'navHome': "Home",
          'navCalendar': "Calendar",
          'navFavorites': "Favorites",
          'navProfile': "Profile",

          // Categories
          'All': "All",
          'Historical Place': "Historical Place",
          'Landscape': "Landscape",
          'Cultural': "Cultural",
          'Mountains': "Mountains",
          'Parks': "Parks",
          'Lakes': "Lakes",
          'City': "City",

          // Place Names
          'Lalibela': "Lalibela",
          'Axum': "Axum",
          'Fasil Ghebbi': "Fasil Ghebbi",
          'Harar Jugol': "Harar Jugol",
          'Dallol': "Dallol",
          'Konso Cultural Landscape': "Konso Cultural Landscape",
          'Tiya': "Tiya",
          'Semien Mountains': "Semien Mountains",
          'Ras Dashen': "Ras Dashen",
          'Erta Ale': "Erta Ale",
          'Nechisar National Park': "Nechisar National Park",
          'Bale Mountains National Park': "Bale Mountains National Park",
          'Omo National Park': "Omo National Park",
          'Addis Ababa': "Addis Ababa",

          // Place Locations
          'Amhara, Lalibela': "Amhara, Lalibela",
          'Tigray ,Axum': "Tigray, Axum",
          'Tigray, Axum': "Tigray, Axum",
          'Amhara , Gonder': "Amhara, Gondar",
          'Amhara, Gonder': "Amhara, Gondar",
          'Harar Town': "Harar Town",
          'Afar Region': "Afar Region",
          'SNNP , Konso': "SNNP, Konso",
          'SNNP, Konso': "SNNP, Konso",
          'SNNP , Gurage': "SNNP, Gurage",
          'SNNP, Gurage': "SNNP, Gurage",
          'Afar ,Semera': "Afar, Semera",
          'Afar, Semera': "Afar, Semera",
          'SNNP , Abra Minch': "SNNP, Arba Minch",
          'SNNP, Abra Minch': "SNNP, Arba Minch",
          'Oromiya , Bale': "Oromia, Bale",
          'Oromiya, Bale': "Oromia, Bale",
          'SNNP , Omo': "SNNP, Omo",
          'SNNP, Omo': "SNNP, Omo",
          'Ethiopia , Addis Ababa': "Ethiopia, Addis Ababa",
          'Ethiopia, Addis Ababa': "Ethiopia, Addis Ababa",

          // Place Details (Historical & Natural Heritage)
          'details_lalibela':
              "Lalibela is a town in the Amhara Region of Ethiopia, famous for its rock-cut monolithic churches. "
              "Known as one of Ethiopia's holiest cities and a UNESCO World Heritage Site, it remains an active center of pilgrimage and medieval Christian civilization.",
          'details_axum':
              "Axum was the historic capital of the ancient Aksumite Empire, a naval and trading power that ruled the Horn of Africa and South Arabia. "
              "Its archaeological treasures, towering monolithic stelae, and ancient tombs earned it UNESCO World Heritage status in 1980.",
          'details_fasil':
              "The Fasil Ghebbi is a fortress city founded in the 17th century by Emperor Fasilides in Gondar. "
              "Featuring palaces, churches, and monasteries, its unique architecture blends Hindu, Arab, and Baroque influences, inscribed as a UNESCO World Heritage Site in 1979.",
          'details_harar':
              "Harar Jugol is a fortified historic town surrounded by deep gorges and savannah. "
              "Considered the fourth holiest city of Islam with 82 mosques and over 100 shrines, its preserved 16th-century walls and townhouse heritage make it uniquely captivating.",
          'details_dallol':
              "Dallol is an otherworldly hydrothermal field in the Danakil Depression of the Afar Region. "
              "Situated 130 meters below sea level, it features neon sulfur springs, acidic brine pools, salt formations, and is one of the hottest inhabited places on Earth.",
          'details_konso':
              "Konso Cultural Landscape is an arid area of stone-walled terraces and fortified settlements in the southern highlands. "
              "Demonstrating over 400 years of living traditions, social engineering, and famous wooden anthropomorphic statues (waga), it is a UNESCO World Heritage Site.",
          'details_tiya':
              "Tiya is an archaeological site in central Ethiopia containing 36 ancient monuments, including 32 carved megalithic stelae adorned with enigmatic symbols. "
              "The site is designated a UNESCO World Heritage Site representing ancient Ethiopian funerary traditions.",
          'details_semien':
              "The Simien Mountains National Park is a breathtaking wonderland of jagged peaks, deep valleys, and sheer escarpments. "
              "It is home to rare endemic wildlife including the Walia ibex, Gelada baboon, and Ethiopian wolf, set against vistas rising above 4,000 meters.",
          'details_ras_dashen':
              "Ras Dashen is the highest mountain peak in Ethiopia and fourteenth highest in Africa, standing at an elevation of 4,550 metres (14,930 ft). "
              "Located in the Simien Mountains, its name alludes to the traditional military general who guards the realm.",
          'details_erta_ale':
              "Erta Ale is a continuously active basaltic shield volcano located in the Danakil Depression. "
              "Renowned for housing one of the world's few persistent lava lakes, it is the most active and mesmerizing volcano in Ethiopia.",
          'details_nechisar':
              "Nechisar National Park covers 750 square kilometers between Lake Abaya and Lake Chamo near Arba Minch. "
              "It features the scenic 'Bridge of God', vast grassy plains, giant Nile crocodiles, and abundant bird species.",
          'details_bale':
              "Bale Mountains National Park protects an alpine moorland habitat and pristine cloud forests. "
              "It offers sanctuary to the largest population of the endangered Ethiopian wolf and Mountain Nyala, alongside glacial lakes and heather plateaus.",
          'details_omo':
              "Omo National Park lies on the west bank of the Omo River in southern Ethiopia. "
              "Encompassing over 4,000 square kilometers of wilderness, it is celebrated for diverse fauna, untamed river ecosystems, and indigenous cultures.",
          'details_addis':
              "Addis Ababa is the vibrant capital and diplomatic heart of Africa, hosting the African Union headquarters. "
              "Founded in the late 19th century by Emperor Menelik II, it boasts bustling markets like Merkato, world-class museums, and rich coffee culture.",

          // Details Screen UI
          'scheduleOverview': "Schedule Overview",
          'leaveReview': "Leave a Review",
          'shareExperience': "Share your experience...",
          'bookNow': "Book Now",
          'message': "Message",
          'from': "From",
          'perTrip': "/trip",
          'ticket': "Ticket",
          'hotel': "Hotel",
          'meal': "Meal",
          'submit': "Submit",
          'messageSent': "Message Sent!",
          'messageSentDesc':
              "Your message has been sent successfully. We will get back to you shortly!",
          'done': "Done",
          'sendMessageTo': "Send Message to",
          'host': "Host",
          'askQuestion': "Ask a question or inquire about tour details",
          'writeMessageHint': "Write your message here...",
          'sendMessage': "Send Message",

          // Hotel Names
          'Tukul Village Hotel': "Tukul Village Hotel",
          'Jerusalem Hotel': "Jerusalem Hotel",
          'Roha Hotel': "Roha Hotel",
          'Ben Abeba Lodge': "Ben Abeba Lodge",
          'Remhai Hotel': "Remhai Hotel",
          'Ark Hotel Axum': "Ark Hotel Axum",
          'Kaleb Hotel': "Kaleb Hotel",
          'Goha Hotel Gondar': "Goha Hotel Gondar",
          'Circle Hotel Gondar': "Circle Hotel Gondar",
          'Taye Belay Hotel': "Taye Belay Hotel",
          'Ras Hotel Harar': "Ras Hotel Harar",
          'Harar Maru Hotel': "Harar Maru Hotel",
          'Belayneh Hotel': "Belayneh Hotel",
          'Afar Camp Lodge': "Afar Camp Lodge",
          'Erta Ale Base Camp': "Erta Ale Base Camp",
          'Kanta Lodge': "Kanta Lodge",
          'Konso Eco Lodge': "Konso Eco Lodge",
          'Addis View Hotel': "Addis View Hotel",
          'Shashamane Hotel': "Shashamane Hotel",
          'Limalimo Lodge': "Limalimo Lodge",
          'Simien Lodge': "Simien Lodge",
          'Gich Camp': "Gich Camp",
          'Ras Dashen Hotel': "Ras Dashen Hotel",
          'Taye Hotel': "Taye Hotel",
          'Afar Tribal Village': "Afar Tribal Village",
          'Mekele Touring Hotel': "Mekele Touring Hotel",
          'Swaynes Hotel': "Swaynes Hotel",
          'Arba Minch Paradise Lodge': "Arba Minch Paradise Lodge",
          'Bekele Molla Arba Minch': "Bekele Molla Arba Minch",
          'Bale Mountain Lodge': "Bale Mountain Lodge",
          'Bale Mountains Hotel': "Bale Mountains Hotel",
          'Omo River Lodge': "Omo River Lodge",
          'Mago Lodge': "Mago Lodge",
          'Sheraton Addis': "Sheraton Addis",
          'Hilton Addis Ababa': "Hilton Addis Ababa",
          'Skylight Hotel': "Skylight Hotel",
          'Radisson Blu Addis': "Radisson Blu Addis",
          'Sapphire Addis Hotel': "Sapphire Addis Hotel",

          // Hotel Amenities
          'WiFi': "WiFi",
          'Pool': "Pool",
          'Gym': "Gym",
          'Spa': "Spa",
          'Restaurant': "Restaurant",
          'Parking': "Parking",

          // Hotel List Screen
          'hotelsIn': "Hotels in",
          'selectHotel': "Select a Hotel",
          'perNight': "/night",
          'rating': "Rating",
          'amenities': "Amenities",
          'viewDetails': "View Details",
          'selectThisHotel': "Select This Hotel",

          // Hotel Booking Form
          'bookYourStay': "Book Your Stay",
          'personalDetails': "Personal Details",
          'fullName': "Full Name",
          'emailAddress': "Email Address",
          'stayDates': "Stay Dates",
          'checkIn': "Check-in Date",
          'checkOut': "Check-out Date",
          'guests': "Number of Guests",
          'totalPrice': "Total Price",
          'confirmBooking': "Confirm Booking",
          'nights': "nights",
          'selectDate': "Select Date",
          'guestsHint': "e.g. 2",
          'nameError': "Please enter your name",
          'emailError': "Please enter your email",
          'emailValidError': "Enter a valid email",
          'guestError': "Enter number of guests",
          'guestMinError': "At least 1 guest",
          'dateError': "Please select check-in and check-out dates.",
          'dateOrderError': "Check-out must be after check-in.",

          // Booking Success
          'bookingConfirmed': "Booking Confirmed!",
          'bookingSuccessMsg':
              "Your stay has been booked successfully. We look forward to welcoming you!",
          'bookingDetails': "Booking Details",
          'hotelLabel': "Hotel",
          'destination': "Destination",
          'checkInLabel': "Check-in",
          'checkOutLabel': "Check-out",
          'guestsLabel': "Guests",
          'totalLabel': "Total",
          'goHome': "Go to Home",
          'bookAnother': "Book Another",

          // Profile Page
          'profileExplorer': "Visit Ethiopia Explorer",
          'goldTraveler': "Gold Traveler",
          'tripsTaken': "Trips Taken",
          'reviews': "Reviews",
          'calendarSubtitle': "View Ethiopian Calendar events",
          'converterSubtitle': "Convert between Gregorian & Geez calendar",
          'currencySubtitle': "Ethiopian Birr exchange rates",
          'languageSubtitle': "Change app language (English / አማርኛ)",
          'aboutSubtitle': "App version and group members",
          'logOut': "Log Out",

          // Favorites
          'noFavorites': "No favorites yet",
          'noFavoritesMsg':
              "Tap the heart icon on any place to add it to your favorites.",
          'removeFavorite': "Remove",
          'addedToFav': "Added to Favorites",
          'removedFromFav': "Removed from Favorites",

          // Language dialog
          'chooseLanguage': "Choose Language",

          // About Page
          'aboutTitle': "About Visit Ethiopia",
          'appDescription':
              "A travel guide app for exploring the beautiful destinations of Ethiopia.",
          'groupMembers': "Group Members",

          // Login Screen
          'welcomeBack': "Welcome back",
          'signInSubtitle': "Sign in to continue exploring Ethiopia",
          'demoCredentials': "Demo Login: visit@gmail.com / visit",
          'emailHint': "Email address",
          'passwordHint': "Password",
          'forgotPassword': "Forgot password?",
          'loginBtn': "Login",
          'or': "or",
          'noAccount': "Don't have an account?",
          'signUp': "Sign Up",
          'discoverSoul': "Discover Ethiopia's Soul",
        },

        // ═════════════════════════════════════════════════════════════════════
        // ── AMHARIC (am) ─────────────────────────────────────────────────────
        // ═════════════════════════════════════════════════════════════════════
        'am': {
          // App / Navigation
          'tit': 'ኢትዮጵያ',
          'hometitle': "ወዴት መሄድ \n ትፈልጋለህ?",
          'popular': "ታዋቂ ቦታዎች",
          'seeAll': "ሁሉንም ይመልከቱ",
          'exploreByCategory': "በምድብ ያስሱ",
          'heroSubtitle':
              "አስደናቂ መልክዓ ምድሮችን፣ ጥንታዊ ታሪክን እና ድምቅ ባህልን ያግኙ።",
          'login': "ግባ",
          'calendar': "የቀን መቁጠሪያ",
          'today': "ዛሬ",
          'calendarconverter': "የቀን መቁጠሪያ መቀየሪያ",
          'language': "ቋንቋ",
          'about': "ስለ",
          'currency': "የምንዛሬ መቀየሪያ",
          'favorites': "ተወዳጆች",
          'home': "ቤት",
          'profile': "መገለጫ",

          // Bottom navigation
          'navHome': "ቤት",
          'navCalendar': "ቀን መቁጠሪያ",
          'navFavorites': "ተወዳጆች",
          'navProfile': "መገለጫ",

          // Categories
          'All': "ሁሉም",
          'Historical Place': "ታሪካዊ ቦታ",
          'Landscape': "መልክዓ ምድር",
          'Cultural': "ባህላዊ",
          'Mountains': "ተራሮች",
          'Parks': "ፓርኮች",
          'Lakes': "ሀይቆች",
          'City': "ከተማ",

          // Place Names (Historical & Others)
          'Lalibela': "ላሊበላ",
          'Axum': "አክሱም",
          'Fasil Ghebbi': "ፋሲል ግቢ",
          'Harar Jugol': "ሀረር ጁጎል",
          'Dallol': "ዳሎል",
          'Konso Cultural Landscape': "የኮንሶ ባህላዊ መልክዓ ምድር",
          'Tiya': "ትያ",
          'Semien Mountains': "የስሜን ተራሮች",
          'Ras Dashen': "ራስ ዳሸን",
          'Erta Ale': "ኤርታ አሌ",
          'Nechisar National Park': "ነጭ ሳር ብሔራዊ ፓርክ",
          'Bale Mountains National Park': "የባሌ ተራሮች ብሔራዊ ፓርክ",
          'Omo National Park': "የኦሞ ብሔራዊ ፓርክ",
          'Addis Ababa': "አዲስ አበባ",

          // Place Locations
          'Amhara, Lalibela': "አማራ, ላሊበላ",
          'Tigray ,Axum': "ትግራይ, አክሱም",
          'Tigray, Axum': "ትግራይ, አክሱም",
          'Amhara , Gonder': "አማራ, ጎንደር",
          'Amhara, Gonder': "አማራ, ጎንደር",
          'Harar Town': "ሀረር ከተማ",
          'Afar Region': "አፋር ክልል",
          'SNNP , Konso': "ደቡብ, ኮንሶ",
          'SNNP, Konso': "ደቡብ, ኮንሶ",
          'SNNP , Gurage': "ደቡብ, ጉራጌ",
          'SNNP, Gurage': "ደቡብ, ጉራጌ",
          'Afar ,Semera': "አፋር, ሰመራ",
          'Afar, Semera': "አፋር, ሰመራ",
          'SNNP , Abra Minch': "ደቡብ, አርባ ምንጭ",
          'SNNP, Abra Minch': "ደቡብ, አርባ ምንጭ",
          'Oromiya , Bale': "ኦሮሚያ, ባሌ",
          'Oromiya, Bale': "ኦሮሚያ, ባሌ",
          'SNNP , Omo': "ደቡብ, ኦሞ",
          'SNNP, Omo': "ደቡብ, ኦሞ",
          'Ethiopia , Addis Ababa': "ኢትዮጵያ, አዲስ አበባ",
          'Ethiopia, Addis Ababa': "ኢትዮጵያ, አዲስ አበባ",

          // Place Details (Historical & Natural Heritage)
          'details_lalibela':
              "ላሊበላ በአማራ ክልል የሚገኝ ታሪካዊ ከተማ ሲሆን ከዓለት በተፈለፈሉ አስደናቂ አብያተ ክርስቲያናት ዝነኛ ነው። "
              "በዩኔስኮ የዓለም ቅርስነት የተመዘገበ ሲሆን ለኢትዮጵያ ኦርቶዶክስ ተዋሕዶ እምነት ተከታዮች ዋነኛ የሐጅና የጸሎት ማዕከል ነው።",
          'details_axum':
              "አክሱም የቀደምቱ የአክሱማዊት መንግሥት ዋና ከተማ ነበረች። በንግድ እና በባሕር ኃይል በመላው ቀይ ባሕር አካባቢ ዝነኛ ነበረች። "
              "ግዙፎቹ ሐውልቶች እና ጥንታዊ ፍርስራሾች በ1980 ዓ.ም. በዩኔስኮ የዓለም ቅርስነት ተመዝግበዋል።",
          'details_fasil':
              "ፋሲል ግቢ በ17ኛው ክፍለ ዘመን በአፄ ፋሲለደስ በጎንደር የተገነባ የቤተ መንግሥት ከተማ ነው። "
              "የህንፃው ጥበብ የህንድ፣ የአረብ እና የባሮክ ውህድ ቅልቅል ሲሆን በ1979 በዩኔስኮ የዓለም ቅርስነት ተመዝግቧል።",
          'details_harar':
              "ሀረር ጁጎል በ16ኛው ክፍለ ዘመን የተገነባ ጥንታዊ የድንጋይ ግንብ የተከበበች ታሪካዊ ከተማ ናት። "
              "በእስልምና እምነት 4ኛዋ ቅድስት ከተማ ተብላ የምትጠራ ሲሆን 82 መስጊዶች እና ውብ ባህላዊ ቤቶች አሏት።",
          'details_dallol':
              "ዳሎል በአፋር ክልል ዳናኪል ስምጥ ሸለቆ ውስጥ የሚገኝ እጅግ አስደናቂ ፍል ውሃና የጨው ሜዳ ነው። "
              "ከባህር ጠለል በታች 130 ሜትር ዝቅ ብሎ የሚገኝ ሲሆን በዓለም ላይ ካሉ እጅግ ሞቃታማና ውብ የተፈጥሮ ቀለማት ካላቸው ስፍራዎች አንዱ ነው።",
          'details_konso':
              "የኮንሶ ባህላዊ መልክዓ ምድር ከ400 ዓመታት በላይ የዘለቀ የእርከን እርሻና የመከላከያ ድንጋይ ግንቦች ጥበብ ነው። "
              "የማህበረሰቡ ድንቅ ምህንድስና እና ዋጋ የሚባሉት የእንጨት ቅርፃ ቅርጾች በዩኔስኮ የዓለም ቅርስነት አስመዝግበውታል።",
          'details_tiya':
              "ትያ በማዕከላዊ ኢትዮጵያ በሶዶ ጉራጌ አካባቢ የሚገኝ ጥንታዊ የአርኪዎሎጂ ቦታ ነው። "
              "ያልተፈቱ ምስጢራዊ ምልክቶች የተቀረጹባቸው 36 ጥንታዊ የመቃብር ሐውልቶችን የያዘ የዩኔስኮ የዓለም ቅርስ ነው።",
          'details_semien':
              "የስሜን ተራሮች ብሔራዊ ፓርክ በሰሜን ኢትዮጵያ የሚገኝ አስደናቂ የተራራ ሰንሰለት ነው። "
              "የዋሊያ አይቤክስ፣ ጭላዳ ዝንጀሮ እና የቀይ ቀበሮ መኖሪያ ሲሆን ጥልቁ ገደላገደልና ውብ ተፈጥሮው የብዙ ቱሪስቶች መዳረሻ ነው።",
          'details_ras_dashen':
              "ራስ ዳሸን በኢትዮጵያ ከፍተኛው እና በአፍሪካ 14ኛው ረጅም የተራራ ጫፍ ሲሆን 4,550 ሜትር ከፍታ አለው። "
              "በስሜን ተራሮች ብሔራዊ ፓርክ ውስጥ የሚገኝ ሲሆን ስሙ በንጉሱ ፊት ለፊት የሚዋጋ ጀግና መሪን ያመለክታል።",
          'details_erta_ale':
              "ኤርታ አሌ በአፋር ክልል ዳናኪል ድብርት ውስጥ የሚገኝ ሁልጊዜ ንቁ የሆነ የእሳተ ገሞራ ጋሻ ነው። "
              "በዓለም ላይ ካሉ ጥቂት ቋሚ የቀለጠ የላቫ ሀይቆች አንዱን በውስጡ የያዘ አስደናቂ እሳተ ገሞራ ነው።",
          'details_nechisar':
              "ነጭ ሳር ብሔራዊ ፓርክ በአባያ እና በጫሞ ሀይቆች መካከል በአርባ ምንጭ አቅራቢያ የሚገኝ 750 ካሬ ኪሎ ሜትር ስፋት ያለው ፓርክ ነው። "
              "የእግዚአብሔር ድልድይ፣ ሰፊው የነጭ ሳር ሜዳ፣ ግዙፍ አዞዎችና በርካታ የአዕዋፍ ዝርያዎች መገኛ ነው።",
          'details_bale':
              "የባሌ ተራሮች ብሔራዊ ፓርክ ከፍተኛ የተራራ ሰንሰለቶችንና ውብ ደኖችን ያቀፈ ነው። "
              "ዝነኛው የኢትዮጵያ ቀይ ቀበሮ እና የደጋ አጋዘን (የተራራ ኒያላ) መኖሪያ ሲሆን ጥርት ያሉ ጅረቶችና ሀይቆች አሉት።",
          'details_omo':
              "የኦሞ ብሔራዊ ፓርክ በደቡብ ኢትዮጵያ በኦሞ ወንዝ ምዕራባዊ ዳርቻ የሚገኝ ሰፊ የተፈጥሮ ፓርክ ነው። "
              "ከ4,000 ካሬ ኪሎ ሜትር በላይ ስፋት ያለው ሲሆን የተለያዩ የዱር አራዊትና የጥንታዊ ማህበረሰቦች መኖሪያ ነው።",
          'details_addis':
              "አዲስ አበባ የኢትዮጵያ ዋና ከተማ እና የአፍሪካ ህብረት መቀመጫ ናት። "
              "በ19ኛው ክፍለ ዘመን መጨረሻ በአፄ ምኒልክ የተመሰረተች ሲሆን እንደ መርካቶ ያሉ ግዙፍ ገበያዎች፣ ሙዚየሞችና የበለጸገ የቡና ባህል ያላት ከተማ ናት።",

          // Details Screen UI
          'scheduleOverview': "የጉዞ ዝርዝር",
          'leaveReview': "አስተያየት ስጥ",
          'shareExperience': "ልምድዎን ያጋሩ...",
          'bookNow': "አሁን ያስይዙ",
          'message': "መልዕክት",
          'from': "ከ",
          'perTrip': "/ጉዞ",
          'ticket': "ትኬት",
          'hotel': "ሆቴል",
          'meal': "ምግብ",
          'submit': "ላክ",
          'messageSent': "መልዕክትዎ ተልኳል!",
          'messageSentDesc':
              "መልዕክትዎ በተሳካ ሁኔታ ተልኳል። በቅርቡ ምላሽ እንሰጥዎታለን!",
          'done': "ጨርስ",
          'sendMessageTo': "መልዕክት ላክ ለ",
          'host': "አዘጋጅ",
          'askQuestion': "ጥያቄ ይጠይቁ ወይም ስለ ጉብኝቱ ዝርዝር ያግኙ",
          'writeMessageHint': "መልዕክትዎን እዚህ ይጻፉ...",
          'sendMessage': "መልዕክት ላክ",

          // Hotel Names
          'Tukul Village Hotel': "ጡኩል ቪሌጅ ሆቴል",
          'Jerusalem Hotel': "ጀሩሳሌም ሆቴል",
          'Roha Hotel': "ሮሃ ሆቴል",
          'Ben Abeba Lodge': "ቤን አበባ ሎጅ",
          'Remhai Hotel': "ረምሃይ ሆቴል",
          'Ark Hotel Axum': "አርክ ሆቴል አክሱም",
          'Kaleb Hotel': "ካሌብ ሆቴል",
          'Goha Hotel Gondar': "ጎሃ ሆቴል ጎንደር",
          'Circle Hotel Gondar': "ሰርክል ሆቴል ጎንደር",
          'Taye Belay Hotel': "ታዬ በላይ ሆቴል",
          'Ras Hotel Harar': "ራስ ሆቴል ሀረር",
          'Harar Maru Hotel': "ሀረር ማሩ ሆቴል",
          'Belayneh Hotel': "በላይነህ ሆቴል",
          'Afar Camp Lodge': "አፋር ካምፕ ሎጅ",
          'Erta Ale Base Camp': "ኤርታ አሌ ቤዝ ካምፕ",
          'Kanta Lodge': "ካንታ ሎጅ",
          'Konso Eco Lodge': "ኮንሶ ኢኮ ሎጅ",
          'Addis View Hotel': "አዲስ ቪው ሆቴል",
          'Shashamane Hotel': "ሻሸመኔ ሆቴል",
          'Limalimo Lodge': "ሊማሊሞ ሎጅ",
          'Simien Lodge': "ስሜን ሎጅ",
          'Gich Camp': "ግች ካምፕ",
          'Ras Dashen Hotel': "ራስ ዳሸን ሆቴል",
          'Taye Hotel': "ታዬ ሆቴል",
          'Afar Tribal Village': "አፋር ጎሳ መንደር",
          'Mekele Touring Hotel': "መቀሌ ቱሪንግ ሆቴል",
          'Swaynes Hotel': "ስዋይንስ ሆቴል",
          'Arba Minch Paradise Lodge': "አርባ ምንጭ ፓራዳይስ ሎጅ",
          'Bekele Molla Arba Minch': "በቀለ ሞላ አርባ ምንጭ",
          'Bale Mountain Lodge': "ባሌ ማውንቴን ሎጅ",
          'Bale Mountains Hotel': "ባሌ ተራሮች ሆቴል",
          'Omo River Lodge': "ኦሞ ሪቨር ሎጅ",
          'Mago Lodge': "ማጎ ሎጅ",
          'Sheraton Addis': "ሸራተን አዲስ",
          'Hilton Addis Ababa': "ሂልተን አዲስ አበባ",
          'Skylight Hotel': "ስካይላይት ሆቴል",
          'Radisson Blu Addis': "ራዲሰን ብሉ አዲስ",
          'Sapphire Addis Hotel': "ሳፋየር አዲስ ሆቴል",

          // Hotel Amenities
          'WiFi': "ዋይፋይ",
          'Pool': "መዋኛ ገንዳ",
          'Gym': "ጂም",
          'Spa': "ስፓ",
          'Restaurant': "ሬስቶራንት",
          'Parking': "የመኪና ማቆሚያ",

          // Hotel List Screen
          'hotelsIn': "ሆቴሎች በ",
          'selectHotel': "ሆቴል ይምረጡ",
          'perNight': "/ሌሊት",
          'rating': "ደረጃ",
          'amenities': "አገልግሎቶች",
          'viewDetails': "ዝርዝር ይመልከቱ",
          'selectThisHotel': "ይህን ሆቴል ይምረጡ",

          // Hotel Booking Form
          'bookYourStay': "ቆይታዎን ያስይዙ",
          'personalDetails': "የግል መረጃ",
          'fullName': "ሙሉ ስም",
          'emailAddress': "የኢሜይል አድራሻ",
          'stayDates': "የቆይታ ቀናት",
          'checkIn': "የመግቢያ ቀን",
          'checkOut': "የመውጫ ቀን",
          'guests': "የእንግዶች ቁጥር",
          'totalPrice': "ጠቅላላ ዋጋ",
          'confirmBooking': "ቦታ ያረጋግጡ",
          'nights': "ሌሊቶች",
          'selectDate': "ቀን ይምረጡ",
          'guestsHint': "ለምሳሌ 2",
          'nameError': "እባክዎን ስምዎን ያስገቡ",
          'emailError': "እባክዎን ኢሜይልዎን ያስገቡ",
          'emailValidError': "ትክክለኛ ኢሜይል ያስገቡ",
          'guestError': "የእንግዶችን ቁጥር ያስገቡ",
          'guestMinError': "ቢያንስ 1 እንግዳ",
          'dateError': "እባክዎን የመግቢያ እና የመውጫ ቀናትን ይምረጡ።",
          'dateOrderError': "የመውጫ ቀን ከመግቢያ ቀን በኋላ መሆን አለበት።",

          // Booking Success
          'bookingConfirmed': "ቦታው ተይዟል!",
          'bookingSuccessMsg':
              "ቆይታዎ በተሳካ ሁኔታ ተይዟል። እርስዎን ለማስተናገድ በጉጉት እንጠብቃለን!",
          'bookingDetails': "የቦታ ማስያዣ ዝርዝር",
          'hotelLabel': "ሆቴል",
          'destination': "መዳረሻ",
          'checkInLabel': "መግቢያ",
          'checkOutLabel': "መውጫ",
          'guestsLabel': "እንግዶች",
          'totalLabel': "ጠቅላላ",
          'goHome': "ወደ ዋና ገጽ ሂድ",
          'bookAnother': "ሌላ ቦታ ያስይዙ",

          // Profile Page
          'profileExplorer': "የኢትዮጵያ ጉብኝት አሳሽ",
          'goldTraveler': "ወርቅ ተጓዥ",
          'tripsTaken': "የተደረጉ ጉዞዎች",
          'reviews': "ግምገማዎች",
          'calendarSubtitle': "የኢትዮጵያ ቀን መቁጠሪያ ክስተቶችን ይመልከቱ",
          'converterSubtitle': "በግሪጎሪያን እና በግዕዝ ቀን መቁጠሪያ መካከል ይቀይሩ",
          'currencySubtitle': "የኢትዮጵያ ብር ምንዛሬ ዋጋዎች",
          'languageSubtitle': "የመተግበሪያ ቋንቋ ይቀይሩ (English / አማርኛ)",
          'aboutSubtitle': "የመተግበሪያ ስሪት እና የቡድን አባላት",
          'logOut': "ውጣ",

          // Favorites
          'noFavorites': "ምንም ተወዳጆች የሉም",
          'noFavoritesMsg':
              "ማንኛውም ቦታ ላይ የልብ ቅርጽ ምልክት በመጫን ወደ ተወዳጆችዎ ያክሉ።",
          'removeFavorite': "አስወግድ",
          'addedToFav': "ወደ ተወዳጆች ተጨምሯል",
          'removedFromFav': "ከተወዳጆች ተወግዷል",

          // Language dialog
          'chooseLanguage': "ቋንቋ ይምረጡ",

          // About Page
          'aboutTitle': "ስለ ኢትዮጵያ ጉብኝት",
          'appDescription':
              "የኢትዮጵያን ውብና ታሪካዊ መዳረሻዎች ለማሰስ የተዘጋጀ የጉዞ መመሪያ መተግበሪያ።",
          'groupMembers': "የቡድን አባላት",

          // Login Screen
          'welcomeBack': "እንኳን ደህና መጡ",
          'signInSubtitle': "ኢትዮጵያን ማሰስ ለመቀጠል ይግቡ",
          'demoCredentials': "የሙከራ መለያ: visit@gmail.com / visit",
          'emailHint': "የኢሜይል አድራሻ",
          'passwordHint': "የይለፍ ቃል",
          'forgotPassword': "የይለፍ ቃል ረሱ?",
          'loginBtn': "ግባ",
          'or': "ወይም",
          'noAccount': "መለያ የለዎትም?",
          'signUp': "ይመዝገቡ",
          'discoverSoul': "የኢትዮጵያን ነፍስ ያግኙ",
        },
      };
}
