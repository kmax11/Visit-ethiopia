import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // ── ENGLISH ──────────────────────────────────────────────────
        'en_US': {
          // App / Nav
          'tit': 'Ethiopia',
          'hometitle': "Where are you \n going?",
          'popular': "Popular Places",
          'login': "Login",
          'calendar': "Calendar",
          'calendarconverter': "Calendar Converter",
          'language': "Language",
          'about': "About",
          'currency': "Currency Converter",
          'favorites': "Favorites",
          'home': "Home",
          'profile': "Profile",

          // Place names
          'lalib': "Lalibela",
          'lalibelaLocation': "Amhara, Lalibela",

          // Details screen
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

          // Hotel List
          'hotelsIn': "Hotels in",
          'selectHotel': "Select a Hotel",
          'perNight': "/night",
          'rating': "Rating",
          'amenities': "Amenities",
          'wifi': "WiFi",
          'pool': "Pool",
          'gym': "Gym",
          'spa': "Spa",
          'restaurant': "Restaurant",
          'parking': "Parking",
          'viewDetails': "View Details",
          'selectThisHotel': "Select This Hotel",

          // Booking Form
          'bookYourStay': "Book Your Stay",
          'fullName': "Full Name",
          'emailAddress': "Email Address",
          'checkIn': "Check-in Date",
          'checkOut': "Check-out Date",
          'guests': "Number of Guests",
          'totalPrice': "Total Price",
          'confirmBooking': "Confirm Booking",
          'nights': "nights",
          'selectDate': "Select Date",
          'guestsHint': "e.g. 2",

          // Booking Success
          'bookingConfirmed': "Booking Confirmed!",
          'bookingSuccessMsg':
              "Your stay has been booked successfully. We look forward to welcoming you!",
          'bookingDetails': "Booking Details",
          'hotelLabel': "Hotel",
          'checkInLabel': "Check-in",
          'checkOutLabel': "Check-out",
          'guestsLabel': "Guests",
          'totalLabel': "Total",
          'goHome': "Go to Home",
          'bookAnother': "Book Another",

          // Favorites
          'noFavorites': "No favorites yet",
          'noFavoritesMsg':
              "Tap the heart icon on any place to add it to your favorites.",
          'removeFavorite': "Remove",
          'addedToFav': "Added to Favorites",
          'removedFromFav': "Removed from Favorites",

          // Language dialog
          'chooseLanguage': "Choose Language",

          // About
          'aboutTitle': "About Visit Ethiopia",
        },

        // ── AMHARIC ──────────────────────────────────────────────────
        'am': {
          // App / Nav
          'tit': 'ኢትዮጵያ',
          'hometitle': "ወዴት መሄድ \n ትፈልጋለህ?",
          'popular': "ታዋቂ ቦታዎች",
          'login': "ግባ",
          'calendar': "የቀን መቁጠሪያ",
          'calendarconverter': "የቀን መቁጠሪያ መቀየሪያ",
          'language': "ቋንቋ",
          'about': "ስለ",
          'currency': "ምንዛሬ መቀየሪያ",
          'favorites': "ተወዳጆች",
          'home': "ቤት",
          'profile': "መገለጫ",

          // Place names
          'lalib': "ላሊበላ",
          'lalibelaLocation': "አማራ, ላሊበላ",

          // Details screen
          'scheduleOverview': "የጉዞ ዝርዝር",
          'leaveReview': "አስተያየት ስጥ",
          'shareExperience': "ልምድህን ካፍ...",
          'bookNow': "አሁን ይያዙ",
          'message': "መልዕክት",
          'from': "ከ",
          'perTrip': "/ጉዞ",
          'ticket': "ትኬት",
          'hotel': "ሆቴል",
          'meal': "ምግብ",

          // Hotel List
          'hotelsIn': "ሆቴሎች በ",
          'selectHotel': "ሆቴል ይምረጡ",
          'perNight': "/ሌሊት",
          'rating': "ደረጃ",
          'amenities': "አገልግሎቶች",
          'wifi': "ዋይፋይ",
          'pool': "መዋኛ",
          'gym': "ጂም",
          'spa': "ስፓ",
          'restaurant': "ሬስቶራንት",
          'parking': "ፓርኪንግ",
          'viewDetails': "ዝርዝር ይመልከቱ",
          'selectThisHotel': "ይህን ሆቴል ይምረጡ",

          // Booking Form
          'bookYourStay': "ቆይታዎን ያስይዙ",
          'fullName': "ሙሉ ስም",
          'emailAddress': "ኢሜይል አድራሻ",
          'checkIn': "የመግቢያ ቀን",
          'checkOut': "የመውጫ ቀን",
          'guests': "የእንግዶች ቁጥር",
          'totalPrice': "ጠቅላላ ዋጋ",
          'confirmBooking': "ቦታ ያረጋግጡ",
          'nights': "ሌሊቶች",
          'selectDate': "ቀን ምረጥ",
          'guestsHint': "ለምሳሌ 2",

          // Booking Success
          'bookingConfirmed': "ቦታ ተያዘ!",
          'bookingSuccessMsg':
              "ቦታዎ በተሳካ ሁኔታ ተይዟል። እናስደስትዎ ይሆናል!",
          'bookingDetails': "የቦታ ዝርዝር",
          'hotelLabel': "ሆቴል",
          'checkInLabel': "መግቢያ",
          'checkOutLabel': "መውጫ",
          'guestsLabel': "እንግዶች",
          'totalLabel': "ጠቅላላ",
          'goHome': "ወደ ቤት ሂድ",
          'bookAnother': "ሌላ ያስይዙ",

          // Favorites
          'noFavorites': "ተወዳጆች የሉም",
          'noFavoritesMsg':
              "ማንኛውም ቦታ ላይ ልብ ምልክት ጠቅ ያድርጉ ወደ ተወዳጆቾ ለማስጨር።",
          'removeFavorite': "አስወግድ",
          'addedToFav': "ወደ ተወዳጆች ተጨምሯል",
          'removedFromFav': "ከተወዳጆች ተወግዷል",

          // Language dialog
          'chooseLanguage': "ቋንቋ ይምረጡ",

          // About
          'aboutTitle': "ስለ ኢትዮጵያ ጉብኝት",
        },
      };
}
