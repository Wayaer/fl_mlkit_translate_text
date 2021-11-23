import 'dart:async';

import 'package:flutter/services.dart';

const MethodChannel _channel = MethodChannel('fl_mlkit_translate_text');

class FlMlkitTranslateText {
  factory FlMlkitTranslateText() => _singleton ??= FlMlkitTranslateText._();

  FlMlkitTranslateText._();

  static FlMlkitTranslateText? _singleton;

  TranslateLanguage _sourceLanguage = TranslateLanguage.english;

  TranslateLanguage get sourceLanguage => _sourceLanguage;

  TranslateLanguage _targetLanguage = TranslateLanguage.chinese;

  TranslateLanguage get targetLanguage => _targetLanguage;

  /// translation
  Future<TranslateTextModel?> translate(String text) async {
    if (text.isEmpty) return null;
    final Map<dynamic, dynamic>? map =
        await _channel.invokeMapMethod<dynamic, dynamic>('translate', text);
    if (map != null) return TranslateTextModel.fromMap(map);
    return null;
  }

  /// Switching translation languages
  Future<bool> switchLanguage(
      TranslateLanguage source, TranslateLanguage target) async {
    bool? state = await _channel.invokeMethod<bool?>('switchLanguage',
        {'source': toAbbreviations(source), 'target': toAbbreviations(target)});
    if (state == true) {
      _sourceLanguage = source;
      _targetLanguage = target;
    }
    getCurrentLanguage();
    return state ?? false;
  }

  /// Get current language
  Future<void> getCurrentLanguage() async {
    final Map<dynamic, dynamic>? map =
        await _channel.invokeMapMethod('getCurrentLanguage');
    if (map != null) {
      _sourceLanguage = toTranslateLanguage(map['source']);
      _targetLanguage = toTranslateLanguage(map['target']);
    }
  }

  /// Get downloaded models
  Future<List<TranslateRemoteModel>> getDownloadedModels() async {
    final Map<dynamic, dynamic>? map =
        await _channel.invokeMapMethod('getDownloadedModels');
    if (map != null) return TranslateRemoteModels.fromMap(map).models;
    return [];
  }

  /// Downloaded model
  Future<bool> downloadedModel(TranslateLanguage language) async {
    final bool? state = await _channel.invokeMethod(
        'downloadedModel', toAbbreviations(language));
    return state ?? false;
  }

  /// Delete downloaded model
  Future<bool> deleteDownloadedModel(TranslateLanguage language) async {
    final bool? state = await _channel.invokeMethod(
        'deleteDownloadedModel', toAbbreviations(language));
    return state ?? false;
  }

  /// Whether downloaded model
  Future<bool> isModelDownloaded(TranslateLanguage language) async {
    final bool? state = await _channel.invokeMethod(
        'isModelDownloaded', toAbbreviations(language));
    return state ?? false;
  }

  /// Be sure to call this method when you no longer use translation
  Future<bool> dispose() async {
    bool? state = await _channel.invokeMethod('dispose');
    return state ?? false;
  }

  String toAbbreviations(TranslateLanguage language) {
    switch (language) {
      case TranslateLanguage.afrikaans:
        return 'af';
      case TranslateLanguage.albanian:
        return 'sq';
      case TranslateLanguage.arabic:
        return 'ar';
      case TranslateLanguage.belarusian:
        return 'be';
      case TranslateLanguage.bulgarian:
        return 'bg';
      case TranslateLanguage.bengali:
        return 'bn';
      case TranslateLanguage.catalan:
        return 'ca';
      case TranslateLanguage.chinese:
        return 'zh';
      case TranslateLanguage.croatian:
        return 'hr';
      case TranslateLanguage.czech:
        return 'cs';
      case TranslateLanguage.danish:
        return 'da';
      case TranslateLanguage.dutch:
        return 'nl';
      case TranslateLanguage.english:
        return 'en';
      case TranslateLanguage.esperanto:
        return 'eo';
      case TranslateLanguage.estonian:
        return 'et';
      case TranslateLanguage.finnish:
        return 'fi';
      case TranslateLanguage.french:
        return 'fr';
      case TranslateLanguage.galician:
        return 'gl';
      case TranslateLanguage.georgian:
        return 'ka';
      case TranslateLanguage.german:
        return 'de';
      case TranslateLanguage.greek:
        return 'el';
      case TranslateLanguage.gujarati:
        return 'gu';
      case TranslateLanguage.haitianCreole:
        return 'ht';
      case TranslateLanguage.hebrew:
        return 'he';
      case TranslateLanguage.hindi:
        return 'hi';
      case TranslateLanguage.hungarian:
        return 'hu';
      case TranslateLanguage.icelandic:
        return 'is';
      case TranslateLanguage.indonesian:
        return 'id';
      case TranslateLanguage.irish:
        return 'ga';
      case TranslateLanguage.italian:
        return 'it';
      case TranslateLanguage.japanese:
        return 'ja';
      case TranslateLanguage.kannada:
        return 'kn';
      case TranslateLanguage.korean:
        return 'ko';
      case TranslateLanguage.lithuanian:
        return 'lt';
      case TranslateLanguage.latvian:
        return 'lv';
      case TranslateLanguage.macedonian:
        return 'mk';
      case TranslateLanguage.marathi:
        return 'mr';
      case TranslateLanguage.malay:
        return 'ms';
      case TranslateLanguage.maltese:
        return 'mt';
      case TranslateLanguage.norwegian:
        return 'no';
      case TranslateLanguage.persian:
        return 'fa';
      case TranslateLanguage.polish:
        return 'pl';
      case TranslateLanguage.portuguese:
        return 'pt';
      case TranslateLanguage.romanian:
        return 'ro';
      case TranslateLanguage.russian:
        return 'ru';
      case TranslateLanguage.slovak:
        return 'sk';
      case TranslateLanguage.slovenian:
        return 'sl';
      case TranslateLanguage.spanish:
        return 'es';
      case TranslateLanguage.swedish:
        return 'sv';
      case TranslateLanguage.swahili:
        return 'sw';
      case TranslateLanguage.tagalog:
        return 'tl';
      case TranslateLanguage.tamil:
        return 'ta';
      case TranslateLanguage.telugu:
        return 'te';
      case TranslateLanguage.thai:
        return 'th';
      case TranslateLanguage.turkish:
        return 'tr';
      case TranslateLanguage.ukrainian:
        return 'uk';
      case TranslateLanguage.urdu:
        return 'ur';
      case TranslateLanguage.vietnamese:
        return 'vi';
      case TranslateLanguage.welsh:
        return 'cy';
    }
  }

  TranslateLanguage toTranslateLanguage(String language) {
    switch (language) {
      case 'af':
        return TranslateLanguage.afrikaans;
      case 'sq':
        return TranslateLanguage.albanian;
      case 'ar':
        return TranslateLanguage.arabic;
      case 'be':
        return TranslateLanguage.belarusian;
      case 'bg':
        return TranslateLanguage.bulgarian;
      case 'bn':
        return TranslateLanguage.bengali;
      case 'ca':
        return TranslateLanguage.catalan;
      case 'zh':
        return TranslateLanguage.chinese;
      case 'hr':
        return TranslateLanguage.croatian;
      case 'cs':
        return TranslateLanguage.czech;
      case 'da':
        return TranslateLanguage.danish;
      case 'nl':
        return TranslateLanguage.dutch;
      case 'en':
        return TranslateLanguage.english;
      case 'eo':
        return TranslateLanguage.esperanto;
      case 'et':
        return TranslateLanguage.estonian;
      case 'fi':
        return TranslateLanguage.finnish;
      case 'fr':
        return TranslateLanguage.french;
      case 'gl':
        return TranslateLanguage.galician;
      case 'ka':
        return TranslateLanguage.georgian;
      case 'de':
        return TranslateLanguage.german;
      case 'el':
        return TranslateLanguage.greek;
      case 'gu':
        return TranslateLanguage.gujarati;
      case 'ht':
        return TranslateLanguage.haitianCreole;
      case 'he':
        return TranslateLanguage.hebrew;
      case 'hi':
        return TranslateLanguage.hindi;
      case 'hu':
        return TranslateLanguage.hungarian;
      case 'is':
        return TranslateLanguage.icelandic;
      case 'id':
        return TranslateLanguage.indonesian;
      case 'ga':
        return TranslateLanguage.irish;
      case 'it':
        return TranslateLanguage.italian;
      case 'ja':
        return TranslateLanguage.japanese;
      case 'kn':
        return TranslateLanguage.kannada;
      case 'ko':
        return TranslateLanguage.korean;
      case 'lt':
        return TranslateLanguage.lithuanian;
      case 'lv':
        return TranslateLanguage.latvian;
      case 'mk':
        return TranslateLanguage.macedonian;
      case 'mr':
        return TranslateLanguage.marathi;
      case 'ms':
        return TranslateLanguage.malay;
      case 'mt':
        return TranslateLanguage.maltese;
      case 'no':
        return TranslateLanguage.norwegian;
      case 'fa':
        return TranslateLanguage.persian;
      case 'pl':
        return TranslateLanguage.polish;
      case 'pt':
        return TranslateLanguage.portuguese;
      case 'ro':
        return TranslateLanguage.romanian;
      case 'ru':
        return TranslateLanguage.russian;
      case 'sk':
        return TranslateLanguage.slovak;
      case 'sl':
        return TranslateLanguage.slovenian;
      case 'es':
        return TranslateLanguage.spanish;
      case 'sv':
        return TranslateLanguage.swedish;
      case 'sw':
        return TranslateLanguage.swahili;
      case 'tl':
        return TranslateLanguage.tagalog;
      case 'ta':
        return TranslateLanguage.tamil;
      case 'te':
        return TranslateLanguage.telugu;
      case 'th':
        return TranslateLanguage.thai;
      case 'tr':
        return TranslateLanguage.turkish;
      case 'uk':
        return TranslateLanguage.ukrainian;
      case 'ur':
        return TranslateLanguage.urdu;
      case 'vi':
        return TranslateLanguage.vietnamese;
      case 'cy':
        return TranslateLanguage.welsh;
    }
    return TranslateLanguage.english;
  }
}

class TranslateRemoteModels {
  TranslateRemoteModels.fromMap(Map<dynamic, dynamic> data)
      : success = data['success'] as bool,
        models = _getTranslateRemoteModel(data['models'] as List<dynamic>?);

  late bool success;
  late List<TranslateRemoteModel> models;
}

List<TranslateRemoteModel> _getTranslateRemoteModel(List<dynamic>? data) =>
    data != null
        ? List<TranslateRemoteModel>.unmodifiable(
            data.map<dynamic>((dynamic e) => TranslateRemoteModel.fromMap(e)))
        : [];

class TranslateRemoteModel {
  TranslateRemoteModel.fromMap(Map<dynamic, dynamic> data)
      : language = FlMlkitTranslateText()
            .toTranslateLanguage(data['language'] as String),
        modelType = _toTranslateRemoteModelType(data['modelType'] as String?),
        isBaseModel = data['isBaseModel'] as bool?;

  late TranslateLanguage language;

  /// Null on ios
  bool? isBaseModel;

  /// Null on ios
  TranslateRemoteModelType? modelType;
}

TranslateRemoteModelType _toTranslateRemoteModelType(String? type) {
  switch (type) {
    case 'UNKNOWN':
      return TranslateRemoteModelType.unknown;
    case 'BASE':
      return TranslateRemoteModelType.base;
    case 'AUTOML':
      return TranslateRemoteModelType.automl;
    case 'TRANSLATE':
      return TranslateRemoteModelType.translate;
    case 'ENTITY_EXTRACTION':
      return TranslateRemoteModelType.entityextraction;
    case 'CUSTOM':
      return TranslateRemoteModelType.custom;
    case 'DIGITAL_INK':
      return TranslateRemoteModelType.digitalink;
  }
  return TranslateRemoteModelType.unknown;
}

enum TranslateRemoteModelType {
  unknown,
  base,
  automl,
  translate,
  entityextraction,
  custom,
  digitalink,
}

class TranslateTextModel {
  TranslateTextModel.fromMap(Map<dynamic, dynamic> data)
      : text = data['text'] as String?,
        success = data['success'] as bool;

  late bool success;
  late String? text;
}

enum TranslateLanguage {
  afrikaans,
  albanian,
  arabic,
  belarusian,
  bulgarian,
  bengali,
  catalan,
  chinese,
  croatian,
  czech,
  danish,
  dutch,
  english,
  esperanto,
  estonian,
  finnish,
  french,
  galician,
  georgian,
  german,
  greek,
  gujarati,
  haitianCreole,
  hebrew,
  hindi,
  hungarian,
  icelandic,
  indonesian,
  irish,
  italian,
  japanese,
  kannada,
  korean,
  lithuanian,
  latvian,
  macedonian,
  marathi,
  malay,
  maltese,
  norwegian,
  persian,
  polish,
  portuguese,
  romanian,
  russian,
  slovak,
  slovenian,
  spanish,
  swedish,
  swahili,
  tagalog,
  tamil,
  telugu,
  thai,
  turkish,
  ukrainian,
  urdu,
  vietnamese,
  welsh,
}
