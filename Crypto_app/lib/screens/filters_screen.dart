import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _isProofOfWork = false;
  bool _isProofOfStake = false;
  bool _isProofOfauthority = false;
  bool _isStableCoins = false;

  @override
  initState() {
    _isProofOfWork = widget.currentFilters['PoW'] ?? false;
    _isProofOfStake = widget.currentFilters['PoS'] ?? false;
    _isProofOfauthority = widget.currentFilters['PoA'] ?? false;
    _isStableCoins = widget.currentFilters['stable'] ?? false;
    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description,
      ),
      onChanged: (bool newValue) {
        setState(() {
          updateValue(newValue);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'PoW': _isProofOfWork,
                'PoS': _isProofOfStake,
                'PoA': _isProofOfauthority,
                'stable': _isStableCoins,
              };
              widget.saveFilters(selectedFilters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your Crypto selection.',
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'PoW',
                  'Proof Of Work',
                  _isProofOfWork,
                  (newValue) {
                    setState(
                      () {
                        _isProofOfWork = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'PoS',
                  'Proof Of Stake.',
                  _isProofOfStake,
                  (newValue) {
                    setState(
                      () {
                        _isProofOfStake = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'PoA',
                  'Proof Of authority',
                  _isProofOfauthority,
                  (newValue) {
                    setState(
                      () {
                        _isProofOfauthority = newValue;
                      },
                    );
                  },
                ),
                _buildSwitchListTile(
                  'stable',
                  'Stable Coins',
                  _isStableCoins,
                  (newValue) {
                    setState(
                      () {
                        _isStableCoins = newValue;
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
