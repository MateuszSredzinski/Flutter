import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'transaction_list.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('\$${transaction.amonut}'),
            ),
          ),
        ),
        title: Text(transaction.title,
            style: Theme.of(context).textTheme.subtitle2),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 460
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                style: TextButton.styleFrom(primary: Colors.grey),
                onPressed: () => deleteTx(transaction.id),
                label: const Text('Delete'),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => deleteTx(transaction.id),
              ),
      ),
    );
  }
}
