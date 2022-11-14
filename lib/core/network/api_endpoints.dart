class ApiEndPoints {
  static const String baseUrl =
      'https://creatuexamcms.creatudevelopers.com.np/api/v1/';
  static const String login = 'user/login';
  static const String register = 'user/register';
  static const String articleListUrl = 'news_and_event';
  static const String articleDetail = '';
  static const String aboutus = 'get-about-us';
  static const String setting = 'setting';
  static const String disclaimer = 'get-disclaimer';
  static const String privacyPolicy = 'get-privacy';
  static const String termsAndCondition = 'get-term-condition';
  static const String sendVerificationCode = 'forgot-password';
  static const String checkVerificationCode = 'user/checkVerificationCode';
  static const String resetPassword = 'reset-password';
  static const String changePassword = 'user/changepassword';
  static const String bookList = 'get-books';
  static const String bookStockedList = 'get-stocked-books';
  static const String orderBook = 'order-book';
  static const String orderBookList = 'get-book-orders';

  //
  static const String allCourseCtegories = 'get-course-category';
  static const String courseList = 'get-course-package';
  static const String recommendedCourseList =
      'get-recommended-course-package?limit=20';
  static const String courseDetails = 'get-course-package/';
  static const String courseListByCategory = 'get-course-by-category';
  static const String setsByCourse = 'get-course-package-sets/';
  static const String videosByCourse = 'get-course-package-videos';
  static const String notesByCourse = 'get-course-package-notes';
  static const String discussionForumList = 'get-discussion-forums';
  static const String discussionForumDetails = 'get-discussion-forums/';
  static const String storeComment = 'store-forum-comment';
  static const String createDiscussion = 'create-discussion-forum';
  static const String updateProfile = 'user/update';
  static const String userProfile = 'user/get';
}
