import 'package:flutter/material.dart';
import 'package:receitas_app/components/main_drawer.dart';
import 'package:receitas_app/models/settings.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen(
      {Key? key, required this.onChangedSettings, required this.settings})
      : super(key: key);

  final Function(Settings) onChangedSettings;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createWidget(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    Color color,
  ) {
    return SwitchListTile.adaptive(
      activeTrackColor: color,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onChangedSettings(settings!);
      },
      subtitle: Text(subtitle),
    );
  }

  dynamic settings = Settings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade50,
        title: Center(child: const Text('Settings')),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        // Container(
        //   padding: const EdgeInsets.all(20),
        //   child: Text(
        //     'Settings',
        //     style: Theme.of(context).textTheme.headline6,
        //   ),
        // ),
        Expanded(
          child: ListView(
            children: [
              _createWidget(
                'Gluten-free',
                'Only shows gluten-free meals',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
                Colors.cyan.shade50,
              ),
              _createWidget(
                'Lactose-free',
                'Only shows lactose-free meals',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
                Colors.cyan.shade50,
              ),
              _createWidget(
                'Vegan foods',
                'Shows only vegan meals',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
                Colors.cyan.shade50,
              ),
              _createWidget(
                'Vegetarian foods',
                'Shows only vegetarian meals',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
                Colors.cyan.shade50,
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
