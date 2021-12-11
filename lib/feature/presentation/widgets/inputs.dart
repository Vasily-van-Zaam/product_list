import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:product_list/feature/presentation/theme/constant.dart';
import 'package:product_list/feature/presentation/widgets/wrap_buttonss.dart';

class MyTextFieldTwoInOne extends StatelessWidget {
  final Function(String)? onChangedLeft;
  final Function(String)? onChangedRight;
  final TextInputType? keyboardTypeLeft;
  final TextInputType? keyboardTypeRight;
  final Widget? prefix;
  final Widget? sufix;
  final TextEditingController? controllerLeft;
  final TextEditingController? controllerRight;

  // final
  const MyTextFieldTwoInOne({
    Key? key,
    this.onChangedLeft,
    this.onChangedRight,
    this.keyboardTypeLeft,
    this.keyboardTypeRight,
    this.prefix,
    this.sufix,
    this.controllerLeft,
    this.controllerRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InputDecoration _decorationInputText = InputDecoration(
      contentPadding: prefix != null ? inputContentPaddingMoreLeft : null,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(inputRadius),
            bottomLeft: Radius.circular(inputRadius)),
        borderSide: BorderSide(
            width: 1, color: Theme.of(context).colorScheme.onPrimary),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(inputRadius),
            bottomLeft: Radius.circular(inputRadius)),
        borderSide: BorderSide(
            width: 0, color: Theme.of(context).colorScheme.secondaryVariant),
      ),
    );
    InputDecoration _decorationInputMoeny = InputDecoration(
      contentPadding: sufix != null ? inputContentPaddingMoreRight : null,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(inputRadius),
            bottomRight: Radius.circular(inputRadius)),
        borderSide: BorderSide(
            width: 0, color: Theme.of(context).colorScheme.secondaryVariant),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(inputRadius),
            bottomRight: Radius.circular(inputRadius)),
        borderSide: BorderSide(
            width: 1, color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
    return WrapButtons(
      sufix: sufix,
      prefix: prefix,
      body: IntrinsicHeight(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: controllerLeft,
                keyboardType: keyboardTypeLeft,
                onChanged: onChangedLeft,
                decoration: _decorationInputText,
              ),
            ),
            Expanded(
                flex: 0,
                child: VerticalDivider(
                    thickness: 1,
                    width: 1,
                    color: Theme.of(context).colorScheme.secondary)),
            Expanded(
              flex: 1,
              child: TextFormField(
                controller: controllerRight,
                keyboardType: keyboardTypeRight,
                onChanged: onChangedRight,
                decoration: _decorationInputMoeny,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyAutocomplete extends StatefulWidget {
  final String? initialValue;
  final double optionsMaxHeight;
  final Widget? label;
  final String? hintText;
  final Function(String v)? onSelected;
  final Function(String v)? onRemoveElementOption;
  final double? width;
  final Function(String v)? onChange;
  final AutocompleteOptionsBuilder<String> optionsBuilder;
  const MyAutocomplete({
    Key? key,
    this.onRemoveElementOption,
    this.width,
    this.optionsMaxHeight = 300,
    this.onSelected,
    this.hintText,
    required this.optionsBuilder,
    this.onChange,
    this.label,
    this.initialValue,
  }) : super(key: key);

  @override
  _MyAutocompleteState createState() => _MyAutocompleteState();
}

class _MyAutocompleteState extends State<MyAutocomplete> {
  bool _isSelected = false;
  bool _changeField = false;
  late double _fieldWidth;
  late Function(String v) _onRemoveElementOption;

  @override
  void initState() {
    super.initState();
    _fieldWidth = widget.width ?? double.infinity;

    if (widget.onRemoveElementOption is Function(String v)) {
      _onRemoveElementOption = widget.onRemoveElementOption!;
    } else {
      _onRemoveElementOption = (String v) {};
    }
  }

  /////// FIELD
  Widget _defaultFieldViewBuilder(
      BuildContext context,
      TextEditingController textEditingController,
      FocusNode focusNode,
      Function() onFieldSubmitted) {
    !_changeField
        ? textEditingController.text = widget.initialValue ?? ''
        : null;
    return WrapButtons(
      sufix: IconButton(
        onPressed: () {
          textEditingController.clear();
        },
        icon: const Padding(
          padding: EdgeInsets.all(13.0),
          child: Icon(Icons.close, size: 15),
        ),
      ),
      body: TextFormField(
        maxLines: null,
        decoration: InputDecoration(
            contentPadding: inputContentPaddingMoreRight,
            label: widget.label,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(20),
                topRight: const Radius.circular(20),
                bottomLeft: _isSelected
                    ? const Radius.circular(20)
                    : const Radius.circular(0),
                bottomRight: _isSelected
                    ? const Radius.circular(20)
                    : const Radius.circular(0),
              ),
              borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary, width: 1),
            ),
            hintText: widget.hintText),
        controller: textEditingController,
        focusNode: focusNode,
        onChanged: (v) {
          if (_isSelected) {
            setState(() {
              _isSelected = false;
            });
          }
          setState(() {
            _changeField = true;
          });
          if (widget.onChange != null) widget.onChange!(v);
        },
        onFieldSubmitted: (String v) {
          textEditingController.clear();
          onFieldSubmitted();
        },
      ),
    );
  }

  //////// OPTION
  Widget _defaultOptionViewBuilder(
    BuildContext context,
    Function(String) onOption,
    Iterable<String> list,
  ) {
    return Align(
      alignment: Alignment.topCenter,
      child: Material(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Theme.of(context).colorScheme.secondaryVariant,
        elevation: 1.0,
        child: Container(
          constraints: BoxConstraints(
            maxHeight: widget.optionsMaxHeight,
            maxWidth: _fieldWidth,
          ),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              final String option = list.elementAt(index);

              return InkWell(
                onTap: () {
                  if (!_isSelected) {
                    setState(() {
                      _isSelected = true;
                    });
                  }
                  onOption(option);
                },
                child: Builder(
                  builder: (BuildContext context) {
                    final bool highlight =
                        AutocompleteHighlightedOption.of(context) == index;
                    if (highlight) {
                      SchedulerBinding.instance!
                          .addPostFrameCallback((Duration timeStamp) {
                        Scrollable.ensureVisible(context, alignment: 0.5);
                      });
                    }
                    return Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary))),
                      padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(flex: 1, child: Text(option)),
                          Expanded(
                            flex: 0,
                            child: IconButton(
                                onPressed: () {
                                  _onRemoveElementOption(option);
                                },
                                icon: const Icon(Icons.close, size: 15)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Autocomplete(
      onSelected: widget.onSelected,
      optionsViewBuilder: _defaultOptionViewBuilder,
      fieldViewBuilder: _defaultFieldViewBuilder,
      // optionsMaxHeight: 300,
      initialValue: TextEditingValue.empty,
      optionsBuilder: (TextEditingValue textEditingValue) {
        var res = widget.optionsBuilder(textEditingValue);

        return res;
      },
    );
  }
}
