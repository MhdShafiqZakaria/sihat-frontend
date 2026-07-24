import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/dto/queue/queue_number_dto.dart';
import 'package:flutter_test_sihat/viewmodel/dashboard/dashboard_vm.dart';
import 'package:flutter_test_sihat/view/shared/app_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({super.key});

  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  @override
  void initState() {
    super.initState();
    // Trigger the first fetch once the widget is mounted.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final vm = context.read<DashboardVm>();
      if (!vm.isLoading && vm.queueNumberDto == null) {
        vm.loadQueueNumber();
      }
    });
  }

  Future<void> _refresh() => context.read<DashboardVm>().loadQueueNumber();

  void _joinQueue() {
    // TODO: call the join-queue endpoint once the networking layer exists.
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Joining queue…')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppbar(),
      body: SafeArea(
        child: Consumer<DashboardVm>(
          builder: (context, vm, _) {
            // Full-screen loader only on the first load (no data yet).
            if (vm.isLoading && vm.queueNumberDto == null && vm.errorMessage == null) {
              return const Center(child: CircularProgressIndicator());
            }

            return RefreshIndicator(
              onRefresh: _refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (vm.errorMessage != null && vm.queueNumberDto == null)
                      _ErrorBanner(message: vm.errorMessage!, onRetry: _refresh)
                    else
                      _QueueDetailsCard(dto: vm.queueNumberDto),
                    const SizedBox(height: 24),
                    const _SectionTitle('Join Queue'),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: _joinQueue,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                      ),
                      child: const Text('Confirm & Join Queue'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// The main white card summarising today's queue state.
class _QueueDetailsCard extends StatelessWidget {
  final QueueNumberDto? dto;

  const _QueueDetailsCard({required this.dto});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    final nowServing = dto?.currentlyAttendingNumber ?? '—';
    final isYourTurn =
        dto?.userQueueNumber != null &&
        dto?.userQueueNumber == dto?.currentlyAttendingNumber;

    return Card(
      color: colors.surfaceContainerLowest,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Top status row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Pill(
                  // TODO: pull clinic hours from the backend when available.
                  label: 'OPEN UNTIL 5:00 PM',
                  background: colors.surfaceContainerHigh,
                  foreground: colors.onSurfaceVariant,
                ),
                _Pill(
                  label: isYourTurn ? 'YOUR TURN' : 'SERVING NOW',
                  background: colors.primary,
                  foreground: colors.onPrimary,
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Date (session semantics are unclear, so show today's date).
            Text(
              DateFormat('EEEE, d MMMM').format(DateTime.now()),
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium?.copyWith(
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),

            // Hero: now-serving number
            Text(
              'NOW SERVING',
              textAlign: TextAlign.center,
              style: textTheme.labelMedium?.copyWith(
                color: colors.onSurfaceVariant,
                letterSpacing: 1.2,
              ),
            ),
            Text(
              nowServing,
              textAlign: TextAlign.center,
              style: textTheme.displayLarge?.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.w700,
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),

            // Metrics row
            // TODO: these come from the backend (not in QueueNumberDto yet).
            Row(
              children: [
                Expanded(
                  child: _MetricTile(label: 'PATIENTS WAITING', value: '--'),
                ),
                Container(
                  width: 1,
                  height: 40,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  color: colors.outlineVariant,
                ),
                Expanded(
                  child: _MetricTile(label: 'EST WAIT TIME', value: '--'),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Disclaimer
            Text(
              'Estimated wait time is for guidance only and may vary based on clinical priorities.',
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                fontStyle: FontStyle.italic,
                color: colors.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 12),

            Divider(color: colors.outlineVariant, height: 1),
            const SizedBox(height: 12),

            // Location row
            Row(
              children: [
                Text(
                  'AT:',
                  style: textTheme.labelMedium?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 8),
                _Pill(
                  // TODO: pull counter/location from the backend when available.
                  label: 'Registration Counter',
                  background: colors.primaryContainer,
                  foreground: colors.onPrimaryContainer,
                ),
                const Spacer(),
                Text(
                  'Select a service below',
                  style: textTheme.bodySmall?.copyWith(
                    color: colors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Flat pill/tag — used for status chips (no elevation, unlike Card).
class _Pill extends StatelessWidget {
  final String label;
  final Color background;
  final Color foreground;

  const _Pill({
    required this.label,
    required this.background,
    required this.foreground,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: textTheme.labelSmall?.copyWith(
          color: foreground,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

/// A metric column: small label + large value.
class _MetricTile extends StatelessWidget {
  final String label;
  final String value;

  const _MetricTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: textTheme.labelSmall?.copyWith(
            color: colors.onSurfaceVariant,
            letterSpacing: 1.0,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: textTheme.displaySmall?.copyWith(
            color: colors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String text;

  const _SectionTitle(this.text);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Text(
      text,
      style: textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: colors.onSurface,
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorBanner({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colors.errorContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error_outline, color: colors.onErrorContainer, size: 32),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(
              color: colors.onErrorContainer,
            ),
          ),
          const SizedBox(height: 12),
          FilledButton.tonal(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}
