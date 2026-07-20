import 'package:flutter/material.dart';
import 'package:flutter_test_sihat/view/shared/app_bar.dart';

enum CaseType { newCase, followUp }

class RequestGlForm extends StatefulWidget {
  const RequestGlForm({super.key});

  @override
  State<RequestGlForm> createState() => _RequestGlFormState();
}

class _RequestGlFormState extends State<RequestGlForm> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: MyAppbar(),

      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 400,
                child: Card(
                  margin: EdgeInsets.all(8),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Student Information',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),

                        Text('Personal Email Address'),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            decoration: InputDecoration(
                              focusColor: colors.onPrimaryContainer,
                              border: OutlineInputBorder(),
                              labelText: 'Email Address',
                              hintText: 'Example:abu123@unimas.my',
                              helperText: '*required',
                              //errorText: 'Invalid email address',
                            ),
                          ),
                        ),

                        SizedBox(height: 5),

                        Text('Other Phone Number'),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              hintText: 'Example:01234567890',
                              helperText: '*required',

                              //errorText: 'Invalid Phone Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              SizedBox(
                width: 400,
                child: Card(
                  margin: EdgeInsets.all(8),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Clinic Details',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),

                        Text('Hospital/Clinic'),
                        DropdownMenu(
                          onSelected: (value) {},
                          width: 350,
                          hintText: 'Please Select the Hospital/Clinic',
                          helperText: '*required',
                          enableFilter: true,

                          dropdownMenuEntries: <DropdownMenuEntry>[
                            DropdownMenuEntry(
                              value: 'Hospital',
                              label: 'Hospital',
                            ),
                            DropdownMenuEntry(value: 'Clinic', label: 'Clinic'),
                            DropdownMenuEntry(
                              value: 'Hospital1',
                              label: 'Hospital1',
                            ),
                            DropdownMenuEntry(
                              value: 'Clinic1',
                              label: 'Clinic1',
                            ),
                          ],
                        ),

                        SizedBox(height: 5),

                        Text('Treatment Type'),
                        SizedBox(
                          width: 350,
                          child: SegmentedButton<CaseType>(
                            style: SegmentedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: colors.surfaceBright,
                              selectedBackgroundColor: colors.primary,
                              selectedForegroundColor: colors.primaryContainer,
                            ),
                            segments: const <ButtonSegment<CaseType>>[
                              ButtonSegment<CaseType>(
                                value: CaseType.newCase,
                                label: Text('New Case'),
                              ),
                              ButtonSegment<CaseType>(
                                value: CaseType.followUp,
                                label: Text('Follow Up'),
                              ),
                            ],
                            selected: <CaseType>{CaseType.newCase},
                            onSelectionChanged: (Set<CaseType> newSelection) {
                              setState(() {
                                final selected = newSelection.first;
                              });
                            },
                          ),
                        ),

                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: 400,
                child: Card(
                  margin: EdgeInsets.all(8),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Representative',
                          style: textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5),

                        Text('Representative Name / Relationship'),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            decoration: InputDecoration(
                              focusColor: colors.onPrimaryContainer,
                              border: OutlineInputBorder(),
                              labelText: 'Representative Name / Relationship',
                              hintText: 'Example:Abu Abi / Father',
                              helperText: '*required',
                              //errorText: 'Invalid email address',
                            ),
                          ),
                        ),

                        SizedBox(height: 5),

                        Text('Representative Phone Number'),
                        SizedBox(
                          width: 350,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Phone Number',
                              hintText: 'Example:01234567890',
                              helperText: '*required',

                              //errorText: 'Invalid Phone Number',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 10),

              FilledButton(
                onPressed: () {},
                style: FilledButton.styleFrom(fixedSize: Size(350, 50)),
                child: Text("Submit Request"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
