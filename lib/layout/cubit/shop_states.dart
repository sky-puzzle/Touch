import 'package:touch_clinic/model/ads.dart';

abstract class ShopStates {}

class ShopInitialStates extends ShopStates {}

class ShopChangeNag extends ShopStates {}
class UploadImageStates extends ShopStates {}
class UploadErrorImageStates extends ShopStates {}
class LoadingUploadingStates extends ShopStates{}
class SuccessUploadingStates extends ShopStates{
 UploadAds? uploadAds;

 SuccessUploadingStates(this.uploadAds);
}
class ErrorUploadingStates extends ShopStates{
   final String error;

   ErrorUploadingStates(this.error);
}class LoadingUploadContractStates extends ShopStates{}
class SuccessUploadContractStates extends ShopStates{}
class ErrorUploadContractStates extends ShopStates{
   final String error;

   ErrorUploadContractStates(this.error);
}
class LoadingAdsStates extends ShopStates{}
class SuccessAdsStates extends ShopStates{}
class ErrorAdsStates extends ShopStates{
   final String error;

   ErrorAdsStates(this.error);
}
class LoadingContractStates extends ShopStates{}
class SuccessContractStates extends ShopStates{}
class ErrorContractStates extends ShopStates{
   final String error;

   ErrorContractStates(this.error);
}
class LoadingDownLoadStates extends ShopStates{}
class SuccessDownLoadStates extends ShopStates{}
class ErrorDownLoadStates extends ShopStates{}
// class ShopLoadingCategoryStates extends ShopStates{}
// class ShopLoadingProductStates extends ShopStates{}
// class ShopSuccessProductStates extends ShopStates{}
// class ShopErrorProductStates extends ShopStates{}
class ShopSuccessCategoryStates extends ShopStates{}
// class ShopErrorCategoryStates extends ShopStates{}
// class ShopLoadingFavoritesStates extends ShopStates{}
// class ShopSuccessFavoritesStates extends ShopStates{}
// class ShopErrorFavoritesStates extends ShopStates{}
// class ShopLoadingChangeFavoritesStates extends ShopStates{}
// class ShopSuccessChangeFavoritesStates extends ShopStates{
//
// }
// class ShopErrorChangeFavoritesStates extends ShopStates{}
// class ShopLoadingCartStates extends ShopStates{}
// class ShopSuccessCartStates extends ShopStates{}
// class ShopErrorCartStates extends ShopStates{}
class ShopLoadingAddCartStates extends ShopStates{}
class ShopSuccessAddCartStates extends ShopStates{

}
// class ShopErrorAddCartStates extends ShopStates{}
// class ShopLoadingUpdateCartStates extends ShopStates{}
class ShopSuccessUpdateCartStates extends ShopStates{}
// class ShopErrorUpdateCartStates extends ShopStates{}
// class ShopLoadingDeleteCartStates extends ShopStates{}
// class ShopSuccessDeleteCartStates extends ShopStates{
//
// }
// class ShopErrorDeleteCartStates extends ShopStates{}
//
//
//
// class ShopLoadingUserDataStates extends ShopStates{}
// class ShopSuccessUserDataStates extends ShopStates{}
class AppCreateDatabaseState extends ShopStates{}
class AppGetFromDatabaseState extends ShopStates{}
class AppDeleteFromDatabaseState extends ShopStates{}
 class AppChangeCartLocalState extends ShopStates{}
