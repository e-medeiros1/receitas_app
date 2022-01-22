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
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
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
        title: const Text('Settings'),
      ),
      drawer: const MainDrawer(),
      body: Column(children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              _createWidget(
                'Gluten Free',
                'Shows only gluten free meals',
                settings.isGlutenFree,
                (value) => setState(() => settings.isGlutenFree = value),
              ),
              _createWidget(
                'Zero Lactose',
                'Shows only meals with Zero lactose',
                settings.isLactoseFree,
                (value) => setState(() => settings.isLactoseFree = value),
              ),
              _createWidget(
                'Vegan foods',
                'Shows only vegan meals',
                settings.isVegan,
                (value) => setState(() => settings.isVegan = value),
              ),
              _createWidget(
                'Vegetarian foods',
                'Shows only vegetarian meals',
                settings.isVegetarian,
                (value) => setState(() => settings.isVegetarian = value),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
