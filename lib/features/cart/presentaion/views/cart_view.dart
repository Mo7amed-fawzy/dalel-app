import 'package:flutter/material.dart';
import 'package:dalel_app/core/utils/app_colors.dart';
import 'package:dalel_app/core/utils/app_text_styles.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    // مثال على عناصر الكارت
    final cartItems = [
      {"name": "Historical Tour Ticket", "price": 50.0, "quantity": 2},
      {"name": "Museum Entry", "price": 30.0, "quantity": 1},
      {"name": "City Guide Book", "price": 20.0, "quantity": 3},
    ];

    double totalPrice = cartItems.fold(
        0,
        (sum, item) =>
            sum + (item['price'] as double) * (item['quantity'] as int));

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.offWhite,
                AppColors.primaryColor.withOpacity(0.2)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Cart",
                      style: CustomTextStyles.pacifico400style64
                          .copyWith(fontSize: 28),
                    ),
                    Icon(Icons.shopping_cart,
                        color: AppColors.deepBrown, size: 32),
                  ],
                ),
                const SizedBox(height: 20),

                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 6,
                        shadowColor: AppColors.deepBrown.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor:
                                AppColors.primaryColor.withOpacity(0.2),
                            child: Text(
                              "${item['quantity']}",
                              style: CustomTextStyles.poppins600style28
                                  .copyWith(
                                      fontSize: 16,
                                      color: AppColors.primaryColor),
                            ),
                          ),
                          title: Text(item['name'] as String,
                              style: CustomTextStyles.poppins500style18
                                  .copyWith(color: AppColors.deepBrown)),
                          subtitle: Text(
                              "\$${(item['price'] as double).toStringAsFixed(2)} each",
                              style: CustomTextStyles.poppins400style12
                                  .copyWith(color: AppColors.deepGrey)),
                          trailing: Text(
                              "\$${((item['price'] as double) * (item['quantity'] as int)).toStringAsFixed(2)}",
                              style: CustomTextStyles.poppins500style18
                                  .copyWith(color: AppColors.grey)),
                        ),
                      );
                    },
                  ),
                ),

                // Total Price and Checkout Button
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.deepBrown.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -5),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total:",
                          style: CustomTextStyles.poppins600style28
                              .copyWith(fontSize: 20)),
                      Text("\$${totalPrice.toStringAsFixed(2)}",
                          style: CustomTextStyles.poppins600style28
                              .copyWith(fontSize: 20)),
                      ElevatedButton(
                        onPressed: () {
                          // TODO: Handle checkout
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                        ),
                        child: Text(
                          "Checkout",
                          style: CustomTextStyles.poppins500style18
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
