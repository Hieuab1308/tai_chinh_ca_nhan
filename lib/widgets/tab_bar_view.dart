import 'package:flutter/material.dart';
import 'package:thu_chi_ca_nhan/widgets/transaction_list.dart';

class TypeTabBar extends StatefulWidget {
  const TypeTabBar({super.key, required this.category, required this.monthYear});
  final String category;
  final String monthYear;

  @override
  State<TypeTabBar> createState() => _TypeTabBarState();
}

class _TypeTabBarState extends State<TypeTabBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const TabBar(
              tabs: [
                Tab(text: "Thu nhập"),
                Tab(text: "Chi tiêu"),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  TransactionList(
                    category: widget.category, // Truy cập widget.category
                    monthYear: widget.monthYear, // Truy cập widget.monthYear
                    type: 'credit',
                  ),
                  TransactionList(
                    category: widget.category,
                    monthYear: widget.monthYear,
                    type: 'debit',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
