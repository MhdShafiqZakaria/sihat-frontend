import 'package:flutter/material.dart';

enum DetailCardStatus {
  approved,      // Ready to Collect, Completed - green
  pending,       // Pending, In Progress - orange
  rejected,      // Rejected, Cancelled - red
}
class DetailCard extends StatelessWidget {
  final String? label;          // e.g., 'Appointment', 'GL Request' (optional)
  final String id;              // e.g., 'GL-2026-9912', 'APT-001'
  final DetailCardStatus status;
  final Widget icon;
  final String? date;           // Optional date string
  final String destination;     // e.g., 'Pusat Kesihatan UNIMAS'

  const DetailCard({
    super.key,
    this.label,
    required this.id,
    required this.status,
    required this.icon,
    this.date,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Status chip + accent bar colors based on Material 3 color scheme
    final (statusLabel, statusBgColor, statusTextColor, accentColor) =
        _getStatusStyle(colors);

    return SizedBox(
      width: double.infinity,
      child: Card(
        margin: const EdgeInsets.all(10),
        clipBehavior: Clip.antiAlias,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Left accent bar using status color
              Container(color: accentColor, width: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Label (optional) + ID row
                      if (label != null) ...[
                        Text(
                          label!,
                          style: textTheme.labelLarge?.copyWith(
                            color: colors.onSurfaceVariant,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            id,
                            style: textTheme.titleLarge?.copyWith(
                              color: colors.onSurface,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: colors.primaryContainer,
                              shape: BoxShape.circle,
                            ),
                            child: icon,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Status chip + Date row
                      Row(
                        spacing: 12,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: statusBgColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              statusLabel,
                              style: textTheme.labelMedium?.copyWith(
                                color: statusTextColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          if (date != null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: colors.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                date!,
                                style: textTheme.labelMedium?.copyWith(
                                  color: colors.onSurfaceVariant,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Divider(),
                      const SizedBox(height: 8),
                      // Destination row
                      Row(
                        children: [
                          Icon(
                            Icons.local_hospital_outlined,
                            size: 20,
                            color: colors.onSurfaceVariant,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              destination,
                              style: textTheme.bodyMedium?.copyWith(
                                color: colors.onSurface,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Returns (label, backgroundColor, textColor, accentColor) for the status
  /// Uses Material 3 semantic colors: tertiaryContainer for success (green),
  /// secondaryContainer for warning (orange), errorContainer for error (red).
  /// The accentColor (tertiary/secondary/error) is used for the left accent bar.
  (String, Color, Color, Color) _getStatusStyle(ColorScheme colors) {
    switch (status) {
      case DetailCardStatus.approved:
        return (
          'Ready to Collect',
          colors.tertiaryContainer,      // Green container
          colors.onTertiaryContainer,    // Green text
          colors.tertiary,               // Green accent bar
        );
      case DetailCardStatus.pending:
        return (
          'Pending',
          colors.secondaryContainer,     // Orange/amber container
          colors.onSecondaryContainer,   // Orange text
          colors.secondary,              // Orange accent bar
        );
      case DetailCardStatus.rejected:
        return (
          'Rejected',
          colors.errorContainer,         // Red container
          colors.onErrorContainer,       // Red text
          colors.error,                  // Red accent bar
        );
    }
  }
}