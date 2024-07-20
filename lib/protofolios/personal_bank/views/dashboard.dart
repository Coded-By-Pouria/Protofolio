import 'package:flutter/material.dart';
import 'package:my_portfolio/protofolios/personal_bank/widgets/credit_cards_list.dart';
import 'package:my_portfolio/shared/partition_layout.dart';
import '../widgets/transaction_box.dart';
import '../widgets/activity_bar_chart.dart';
import '../widgets/expenses_statistics.dart';
import '../widgets/quick_transfer_card.dart';
import '../widgets/balance_history_chart_card.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  Widget makeARow(
    int firstFlex,
    int secondFlex,
    Widget firstChild,
    Widget secondWidget,
    double? height,
  ) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(
        bottom: 0,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            flex: firstFlex,
            child: firstChild,
          ),
          const SizedBox(
            width: 20,
          ),
          Flexible(
            fit: FlexFit.tight,
            flex: secondFlex,
            child: secondWidget,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PartitionLayout(
      partitions: [
        PartitionRow(
          [
            PartitionItem(
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("کارت های من"),
                  Text("دیدن همه"),
                ],
              ),
              75,
            ),
            PartitionItem(
              const Text("تراکنش های اخیر"),
              25,
            ),
          ],
          null,
        ),
        PartitionRow(
          [
            PartitionItem(
              const CreditCardsList(),
              75,
            ),
            PartitionItem(
              const TransactionsBox(),
              25,
            )
          ],
          300,
        ),
        PartitionRow(
          [
            PartitionItem(const Text("فعالیت هفتگی"), 75),
            PartitionItem(const Text("تاریخچه موجودی"), 25),
          ],
          null,
        ),
        PartitionRow(
          [
            PartitionItem(ActivityBarChart(), 75),
            PartitionItem(const ExpensesStatistics(), 25),
          ],
          400,
        ),
        PartitionRow([
          PartitionItem(const Text("انتقال سریع"), 35),
          PartitionItem(const Text("تاریخچه موجودی"), 65),
        ], null),
        PartitionRow(
          [
            PartitionItem(QuickTransferCard(), 35),
            PartitionItem(BalanceHistoryChartCard(), 65),
          ],
          350,
        ),
      ],
    );
  }
}
