import 'package:e_commerce_electronics/theme/constants/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'components/cart_product.dart';
import 'package:e_commerce_electronics/test/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(scaffoldBackgroundColor: ThemeColors.scaffold),
          debugShowCheckedModeBanner: false,
          home: MyHomePage(),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Column(
          children: [
            SizedBox(
              height: 27.1.h,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'asset/icon/drag_handle.svg',
                  width: 18.75.h,
                  height: 8,
                )
              ],
            ),
            SizedBox(height: 37.9.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: Test.categories.map((e) {
                  return Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(e,
                            style: TextStyle(
                                fontFamily: 'PoppinsSemiblod',
                                color: Colors.white,
                                fontSize: 14.sp)),
                        SizedBox(
                          width: 32.5.w,
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            //  Text(e,
            //                 style: TextStyle(
            //                     fontFamily: 'PoppinsSemiblod',
            //                     color: Colors.white,
            //                     fontSize: 14.sp)),
            //             SizedBox(
            //               width: 100.5.w,
            //             ),
            SizedBox(
              height: 32.h,
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 11.h,
                crossAxisSpacing: 11.w,
                childAspectRatio: 164 / 256,
                children: Test.product
                    .map(
                      (e) => CartProduct(
                        rating: e['rating'],
                        image: e['image'],
                        title: e['name'],
                        price: e['price'],
                        oldPrice: e['oldPrice'],
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
