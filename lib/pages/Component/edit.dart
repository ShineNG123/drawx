import 'package:flutter/material.dart';
import 'dart:math';

class EditPages extends StatefulWidget {
  const EditPages({Key? key}) : super(key: key);

  @override
  _EditPagesState createState() => _EditPagesState();
}

class _EditPagesState extends State<EditPages> {
  List<Map<String, dynamic>> _options = [];
  List<double> _probabilities = [];

  List<Map<String, dynamic>> _presetTemplate1 = [
    {'name': 'Template1-1', 'probability': 0.1},
    {'name': 'Template1-2', 'probability': 0.2},
    {'name': 'Template1-3', 'probability': 0.3},
  ];

  List<Map<String, dynamic>> _presetTemplate2 = [
    {'name': 'Template2-1', 'probability': 0.1},
    {'name': 'Template2-2', 'probability': 0.2},
    {'name': 'Template2-3', 'probability': 0.3},
  ];

  List<Map<String, dynamic>> _presetTemplate3 = [
    {'name': 'Template3-1', 'probability': 0.1},
    {'name': 'Template3-2', 'probability': 0.2},
    {'name': 'Template3-3', 'probability': 0.3},
  ];

  bool _showPresets = false;

  void _generateRandomOptions(int count) {
    List<Map<String, dynamic>> randomOptions = [];
    List<double> randomProbabilities = [];
    for (int i = 0; i < count; i++) {
      randomOptions.add({'name': 'Random options${Random().nextInt(100)}', 'probability': Random().nextDouble()});
    }
    setState(() {
      _options = randomOptions;
      _probabilities = randomProbabilities;
    });
  }

  void _showPresetTemplates() {
    setState(() {
      _showPresets = !_showPresets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('EditPages')),
      body: Stack(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _options.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print('choose  ${_options[index]['name']}');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(_options[index]['name']),
                      Text((_options[index]['probability'] * 100).toStringAsFixed(2) + '%'),
                    ],
                  ),
                ),
                );
              },
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: ElevatedButton(
              onPressed: () {
                _showPresetTemplates();
                // Use of pre-defined prize templates
                // List<Map<String, dynamic>> presetOptions = List.generate(_presetTemplates.length, (index) {
                //   return {
                //     'name': _presetTemplates[index]['name'] as String,
                //     'probability': _presetTemplates[index]['probability'] as double,
                //   };
                // });
                // setState(() {
                //   _options = presetOptions;
                //   _probabilities = presetOptions.map((option) => option['probability'] as double).toList();
                // });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
              child: const Text('Show preset templates'),
            ),
          ),
          if (_showPresets) ...[
            Positioned(
              left: 0,
              bottom: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // use Generate random options1
                      List<Map<String, dynamic>> presetOptions = List.generate(_presetTemplate1.length, (index) {
                        return {
                          'name': _presetTemplate1[index]['name'] as String,
                          'probability': _presetTemplate1[index]['probability'] as double,
                        };
                      });
                      setState(() {
                        _options = presetOptions;
                        _probabilities = presetOptions.map((option) => option['probability'] as double).toList();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    child: const Text('Preset template 1'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // use Preset template 2
                      List<Map<String, dynamic>> presetOptions = List.generate(_presetTemplate2.length, (index) {
                        return {
                          'name': _presetTemplate2[index]['name'] as String,
                          'probability': _presetTemplate2[index]['probability'] as double,
                        };
                      });
                      setState(() {
                        _options = presetOptions;
                        _probabilities = presetOptions.map((option) => option['probability'] as double).toList();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    child: const Text('Preset template 2'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // useing Preset template 3
                      List<Map<String, dynamic>> presetOptions = List.generate(_presetTemplate3.length, (index) {
                        return {
                          'name': _presetTemplate3[index]['name'] as String,
                          'probability': _presetTemplate3[index]['probability'] as double,
                        };
                      });
                      setState(() {
                        _options = presetOptions;
                        _probabilities = presetOptions.map((option) => option['probability'] as double).toList();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: Colors.black,
                    ),
                    child: const Text('Preset template 3'),
                  ),
                ],
              ),
            ),
          ],
          Positioned(
            right: 0,
            bottom: 0,
            child: ElevatedButton(
              onPressed: () {
                // Generate random options
                _generateRandomOptions(5);
                print('Generate random options: $_options');
                print('Generate random probabilities: $_probabilities');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.black,
              ),
              child: const Text('Generate random options'),
            ),
          ),
        ],
      ),
    );
  }
}


//to show the edited goods and properity
class EditWheelOfFortune extends StatefulWidget {
  final List<String> options;
  final List<double> probabilities;

  EditWheelOfFortune({required this.options, required this.probabilities});

  @override
  _EditWheelOfFortuneState createState() => _EditWheelOfFortuneState();
}

class _EditWheelOfFortuneState extends State<EditWheelOfFortune> {
  void _addOption(String name, double probability) {
    setState(() {
      widget.options.add(name);
      widget.probabilities.add(probability);
    });
  }

  void _deleteOption(int index) {
    setState(() {
      widget.options.removeAt(index);
      widget.probabilities.removeAt(index);
    });

    if (widget.options.isEmpty) {
      Navigator.pop(context);
    }
  }

  void _editOption(int index, String newName, double newProbability) {
    setState(() {
      widget.options[index] = newName;
      widget.probabilities[index] = newProbability;
    });
  }

  Future<void> _showEditDialog([int? index]) async {
    final TextEditingController nameController = TextEditingController(
        text: index == null ? '' : widget.options[index]);
    final TextEditingController probController = TextEditingController(
        text: index == null
            ? ''
            : widget.probabilities[index].toString());

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: probController,
                decoration: const InputDecoration(labelText: 'Probability'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Save'),
              onPressed: () {
                if (index == null) {
                  _addOption(nameController.text,
                      double.tryParse(probController.text) ?? 1.0);
                } else {
                  _editOption(index, nameController.text,
                      double.tryParse(probController.text) ?? 1.0);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Wheel of Fortune')),
      body: ListView.builder(
        itemCount: widget.options.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.options[index]),
            subtitle: Text('Probability: ${widget.probabilities[index]}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _showEditDialog(index);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteOption(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showEditDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
