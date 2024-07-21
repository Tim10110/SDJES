import 'package:flutter/material.dart';


class LoginTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const LoginTextfield({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)
              ),
              hintText: hintText,
            ),
          ),
        );

  }
}

  class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged; // Ajout du paramètre onChanged

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.onChanged, // Définition du paramètre onChanged
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged, // Utilisation du paramètre onChanged
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

class LongTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;

  const LongTextField({super.key,
    required this.labelText,
    required this.controller,
    this.onChanged, // Définition du paramètre onChanged
  });


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: null, // Permet un nombre illimité de lignes
      controller: controller,
      onChanged: onChanged, 
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}

class RadioGroup extends StatefulWidget {
  final String title;
  final List<String> choices;
  final String? referenceText;
  final String? defaultChoice;
  final ValueChanged<String>? onChanged;

  const RadioGroup({super.key, 
    required this.title,
    required this.choices,
    this.referenceText,
    this.defaultChoice,
    this.onChanged,
  });

  @override
  _RadioGroupState createState() => _RadioGroupState();
}

class _RadioGroupState extends State<RadioGroup> {
  String? _selectedChoice;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    if (widget.defaultChoice != null && widget.defaultChoice!.isNotEmpty) {
      _selectedChoice = widget.defaultChoice;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (widget.referenceText != null && widget.referenceText!.isNotEmpty)
              IconButton(
                icon: Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
          ],
        ),
        if (widget.referenceText != null && widget.referenceText!.isNotEmpty && _isExpanded) ...[
          Text(
            widget.referenceText!,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
        ],
        Column(
          children: widget.choices.map((choice) {
            return RadioListTile(
              title: Text(choice),
              value: choice,
              groupValue: _selectedChoice,
              onChanged: (value) {
                setState(() {
                  _selectedChoice = value.toString();
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(value.toString());
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class CheckboxGroup extends StatefulWidget {
  final String title;
  final List<String> choices;
  final String? referenceText;
  final List<String>? defaultChoices;
  final ValueChanged<List<String>>? onChanged;

  const CheckboxGroup({super.key, 
    required this.title,
    required this.choices,
    this.referenceText,
    this.defaultChoices,
    this.onChanged,
  });

  @override
  _CheckboxGroupState createState() => _CheckboxGroupState();
}

class _CheckboxGroupState extends State<CheckboxGroup> {
  final List<String> _selectedChoices = [];
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    if (widget.defaultChoices != null && widget.defaultChoices!.isNotEmpty) {
      _selectedChoices.addAll(widget.defaultChoices!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (widget.referenceText != null && widget.referenceText!.isNotEmpty)
              IconButton(
                icon: Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                onPressed: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
              ),
            Flexible(
              child: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        if (widget.referenceText != null && widget.referenceText!.isNotEmpty && _isExpanded) ...[
          Text(
            widget.referenceText!,
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
          const SizedBox(height: 10),
        ],
        Column(
          children: widget.choices.map((choice) {
            return CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading, // Place le bouton à gauche du texte
              title: Text(choice),
              value: _selectedChoices.contains(choice),
              onChanged: (value) {
                setState(() {
                  if (value == true) {
                    _selectedChoices.add(choice);
                  } else {
                    _selectedChoices.remove(choice);
                  }
                });
                if (widget.onChanged != null) {
                  widget.onChanged!(_selectedChoices);
                }
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}


class DateField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller; // Ajout du contrôleur
  final Function(DateTime) onDateSelected;

  const DateField({
    super.key,
    required this.labelText,
    required this.controller,
    required this.onDateSelected,
  });

  @override
  _DateFieldState createState() => _DateFieldState();
}

class _DateFieldState extends State<DateField> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        widget.controller.text = picked.toString(); // Vous pouvez personnaliser le format de date ici
        widget.onDateSelected(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: TextFormField(
        controller: widget.controller,
        enabled: false, // Désactiver la saisie manuelle
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(color: Colors.black),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class CustomNumberField extends StatelessWidget {
  final String labelText;
  final void Function(int) onChanged;
  final TextEditingController controller;

  const CustomNumberField({super.key, required this.labelText, required this.onChanged, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: controller,
      onChanged: (value) {
        // Vérifier si la valeur est vide
        if (value.isEmpty) {
          onChanged(0);
          return;
        }
        // Convertir la chaîne en entier
        int intValue = int.tryParse(value) ?? 0;
        // Appeler la fonction onChanged avec la valeur convertie
        onChanged(intValue);
      },
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
