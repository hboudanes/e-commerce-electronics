import 'package:e_commerce_electronics/theme/constants/images_path.dart';
import 'package:e_commerce_electronics/theme/constants/theme_colors.dart';
import 'package:e_commerce_electronics/theme/constants/theme_gradient.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CartProduct extends StatelessWidget {
  String? rating;
  String image;
  String title;
  double price;
  double? oldPrice;
  CartProduct(
      {Key? key,
      this.rating,
      required this.image,
      required this.title,
      required this.price,
      this.oldPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.12), blurRadius: 10)
        ],
        borderRadius: BorderRadius.circular(18.r),
        color: ThemeColors.primary,
      ),
      child: Stack(children: [
        Container(
          height: 168.h,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: ThemeGradient.productCart,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18.r),
              topRight: Radius.circular(18.r),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 6.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.9),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 39.w,
                      height: 21.h,
                      decoration: BoxDecoration(
                          color: ThemeColors.scaffold,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.4.w),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                rating ?? '',
                                style: TextStyle(
                                    fontFamily: 'Poppinslight',
                                    fontSize: 10.sp,
                                    color: Colors.white),
                              ),
                              SvgPicture.asset(ImagesPath.ratingStar,
                                  width: 9.72.h,
                                  semanticsLabel: 'A red up arrow')
                            ]),
                      ),
                    ),
                    SvgPicture.asset(ImagesPath.heartEmpty,
                        width: 15.27.w,
                        height: 13.12.h,
                        semanticsLabel: 'A red up arrow')
                  ]),
            ),
            Stack(
              children: [
                Container(
                  height: 170.h,
                  padding: EdgeInsets.only(right: 15.w),
                  width: double.infinity,
                  // color: Colors.amber,
                  alignment: Alignment.bottomLeft,

                  child: Image.asset(
                    image,
                    alignment: Alignment.bottomLeft,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 119.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 40.r,
                          width: 40.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: ThemeColors.primary,
                          ),
                          child: SvgPicture.asset(
                            ImagesPath.shoppingCart,
                            width: 15.02.r,
                            height: 15.02.r,
                          ),
                        ),
                        SizedBox(
                          width: 9.w,
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
                height: 36.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  title,
                  style: TextStyle(
                      height: 1,
                      fontFamily: 'PoppinsSemiblod',
                      color: Colors.white,
                      fontSize: 15.sp),
                )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child:
                  Wrap(crossAxisAlignment: WrapCrossAlignment.end, children: [
                Text(
                  '\$${price.toString()}',
                  style: TextStyle(
                      // backgroundColor: Colors.amber,
                      fontFamily: 'Poppins',
                      fontSize: 18.sp,
                      color: Colors.white),
                ),
                SizedBox(
                  width: 9.4.w,
                ),
                Text(
                  oldPrice != null ? '\$${oldPrice.toString()}' : "",
                  style: TextStyle(
                      // backgroundColor: Colors.pink,
                      fontFamily: 'Poppinslight',
                      decoration: TextDecoration.lineThrough,
                      fontSize: 10.sp,
                      color: Colors.white),
                )
              ]),
            )
          ],
        ),
      ]),
    );
  }
}
