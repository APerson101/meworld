import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/repository/rapyd_helper.dart';
import '../../../../core/services/service_locator.dart';

class WalletTxnsView extends ConsumerWidget {
  const WalletTxnsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(loadTxnsHistory).when(
      data: (data) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Transactions History"),
          ),
          body: data.isNotEmpty
              ? Column(
                  children: [
                    ...data
                        .map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListTile(
                                    leading: Icon(
                                      e.amount < 0 ? Icons.remove : Icons.add,
                                      color: e.amount < 0
                                          ? Colors.red
                                          : Colors.green,
                                    ),
                                    title: Text(e.amount.toString()),
                                    subtitle: Text(e.amount < 0
                                        ? 'receiver: ${e.destination_ewallet_id}'
                                        : 'sender: ${e.source_ewallet_id}'),
                                  ),
                                ),
                              ),
                            ))
                        .toList()
                  ],
                )
              : const Center(child: Text("No history yet")),
        );
      },
      error: (Object error, StackTrace? stackTrace) {
        debugPrintStack(stackTrace: stackTrace);
        return const Material(
            child: Center(
          child: Text("Failed to load history, please try again"),
        ));
      },
      loading: () {
        return const CircularProgressIndicator.adaptive();
      },
    );
  }
}

final loadTxnsHistory = FutureProvider((ref) async {
  return await sl<RapydAPI>().getWalletHistory();
});
