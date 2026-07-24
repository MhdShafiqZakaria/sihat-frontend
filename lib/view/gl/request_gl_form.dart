import 'package:flutter/material.dart';

enum CaseType { newCase, followUp }

class RequestGlForm extends StatefulWidget {
  const RequestGlForm({super.key});

  @override
  State<RequestGlForm> createState() => _RequestGlFormState();
}

class _RequestGlFormState extends State<RequestGlForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _repNameCtrl = TextEditingController();
  final _repPhoneCtrl = TextEditingController();

  CaseType _caseType = CaseType.newCase;
  String? _hospital;

// TODO: replace with real government hospital/clinic list from the GL networking layer.
  static const _hospitals = <String>[
    'Hospital Umum Sarawak',
    'Klinik Kesihatan Kota Samarahan',
    'Pusat Kesihatan UNIMAS',
    'Klinik 1Malaysia',
  ];

  @override
  void dispose() {
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _repNameCtrl.dispose();
    _repPhoneCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    // Local input theme so every field (incl. the DropdownMenu) shares the
    // outlined look from the mockup: ~10px radius, consistent stroke colours.
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: false,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: colors.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: colors.outlineVariant),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: colors.primary, width: 1.5),
          ),
        ),
      ),
      child: GestureDetector(
        // Dismiss the keyboard when tapping outside a field.
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('GL Form'),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _FormSection(
                      title: 'Student Information',
                      children: [
                        _LabeledField(
                          label: 'Personal Email Address',
                          field: TextFormField(
                            controller: _emailCtrl,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            autofillHints: const [AutofillHints.email],
                            decoration: const InputDecoration(
                              hintText: 'Example: abul123@gmail.com',
                            ),
                            validator: _validateEmail,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _LabeledField(
                          label: 'Other Phone Number',
                          field: TextFormField(
                            controller: _phoneCtrl,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: 'Example: 012-3456789',
                            ),
                            validator: _validatePhone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _FormSection(
                      title: 'Clinic Details',
                      children: [
                        _LabeledField(
                          label: 'Hospital / Clinic',
                          trailing: const _GovOnlyBadge(),
                          field: DropdownMenu<String>(
                            expandedInsets: EdgeInsets.zero,
                            initialSelection: _hospital,
                            enableFilter: true,
                            hintText: 'Government hospital or clinic name',
                            onSelected: (value) =>
                                setState(() => _hospital = value),
                            dropdownMenuEntries: _hospitals
                                .map((h) => DropdownMenuEntry<String>(
                                      value: h,
                                      label: h,
                                    ))
                                .toList(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _LabeledField(
                          label: 'Treatment Type',
                          field: SegmentedButton<CaseType>(
                            style: SegmentedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: colors.surfaceContainerHigh,
                              foregroundColor: colors.onSurfaceVariant,
                              selectedBackgroundColor: colors.primary,
                              selectedForegroundColor: colors.onPrimary,
                            ),
                            segments: const [
                              ButtonSegment<CaseType>(
                                value: CaseType.newCase,
                                label: Text('New'),
                              ),
                              ButtonSegment<CaseType>(
                                value: CaseType.followUp,
                                label: Text('Follow Up'),
                              ),
                            ],
                            selected: {_caseType},
                            onSelectionChanged: (selection) =>
                                setState(() => _caseType = selection.first),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    _FormSection(
                      title: 'Representative',
                      children: [
                        _LabeledField(
                          label: 'Representative Name / Relationship',
                          field: TextFormField(
                            controller: _repNameCtrl,
                            textInputAction: TextInputAction.next,
                            decoration: const InputDecoration(
                              hintText: 'Representative name and relationship',
                            ),
                            validator: (v) => (v == null || v.trim().isEmpty)
                                ? 'This field is required'
                                : null,
                          ),
                        ),
                        const SizedBox(height: 16),
                        _LabeledField(
                          label: 'Phone Number',
                          field: TextFormField(
                            controller: _repPhoneCtrl,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                            decoration: const InputDecoration(
                              hintText: 'Example: 012-3456789',
                            ),
                            validator: _validatePhone,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // Not in the mockup, but a form needs a submit action.
                    FilledButton(
                      onPressed: _submit,
                      style: FilledButton.styleFrom(
                        minimumSize: const Size.fromHeight(52),
                      ),
                      child: const Text('Submit Request'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if (form == null || !form.validate()) return;
    // TODO: wire to the GL networking layer (dto/feeder/viewmodel) once built.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Request submitted')),
    );
  }

  String? _validateEmail(String? value) {
    final text = value?.trim() ?? '';
    if (text.isEmpty) return 'Email is required';
    final email = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');
    if (!email.hasMatch(text)) return 'Enter a valid email address';
    return null;
  }

  String? _validatePhone(String? value) {
    final digits = (value ?? '').replaceAll(RegExp(r'[\s-]'), '');
    if (digits.isEmpty) return 'Phone number is required';
    if (!RegExp(r'^\+?\d{6,15}$').hasMatch(digits)) {
      return 'Enter a valid phone number';
    }
    return null;
  }
}

/// A flat, bordered card that groups related form fields.
class _FormSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const _FormSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
      color: colors.surfaceContainerLowest,
      elevation: 0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: colors.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 20, 16, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// A label sitting above a field, mirroring the mockup (label on top,
/// hint inside the input). Optionally shows a trailing tag (e.g. badge).
class _LabeledField extends StatelessWidget {
  final String label;
  final Widget field;
  final Widget? trailing;

  const _LabeledField({
    required this.label,
    required this.field,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(text: label, trailing: trailing),
        const SizedBox(height: 6),
        field,
      ],
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  final Widget? trailing;

  const _FieldLabel({required this.text, this.trailing});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      children: [
        Text(
          text,
          style: textTheme.labelLarge?.copyWith(
            color: colors.onSurfaceVariant,
            fontWeight: FontWeight.w500,
          ),
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );
  }
}

/// Small neutral pill marking the field as government-only.
class _GovOnlyBadge extends StatelessWidget {
  const _GovOnlyBadge();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: colors.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        'GOVERNMENT ONLY',
        style: textTheme.labelSmall?.copyWith(
          color: colors.onSurfaceVariant,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}
