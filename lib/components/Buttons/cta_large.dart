import 'package:finamp/services/feedback_helper.dart';
import 'package:flutter/material.dart';

class CTALarge extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool vertical;
  final void Function() onPressed;

  const CTALarge({super.key, required this.text, required this.icon, this.vertical = false, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).colorScheme.primary;
    return ElevatedButton(
      onPressed: () {
        FeedbackHelper.feedback(FeedbackType.selection);
        onPressed();
      },
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
        backgroundColor: WidgetStateProperty.all<Color>(
          Theme.of(context).brightness == Brightness.dark
              ? accentColor.withOpacity(0.3)
              : Color.alphaBlend(accentColor.withOpacity(0.8), Colors.white),
        ),
      ),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: vertical ? Axis.vertical : Axis.horizontal,
        alignment: vertical ? WrapAlignment.center : WrapAlignment.start,
        children: [
          Icon(
            icon,
            size: 28,
            color: Theme.of(context).brightness == Brightness.dark ? accentColor : Colors.white,
            weight: 1.5,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
