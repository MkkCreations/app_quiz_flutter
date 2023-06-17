import 'package:flutter/material.dart';

class TheRow extends StatefulWidget {
  const TheRow({super.key, required this.label, required this.description});

  final String label;
  final String description;

  @override
  State<TheRow> createState() => _TheRowState();
}

class _TheRowState extends State<TheRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 41, 126, 133).withOpacity(0.3),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 25,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      child: Row(
        /* mainAxisAlignment: MainAxisAlignment.spaceBetween, */
        children: [
          Text(widget.label,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          const SizedBox(width: 16),
          Expanded(
              child: Text(
            widget.description,
            style: const TextStyle(fontSize: 14),
          )),
        ],
      ),
    );
  }
}
