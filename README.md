# fl_mlkit_translate_text

谷歌mlkit翻译文Flutter 插件，支持Android和IOS。

Google mlkit translate text for flutter plugin , supports Android and IOS.

```dart

void func() {
  FlMlkitTranslateText translate = FlMlkitTranslateText();

  /// translation
  translate.translate('');

  /// Switching translation languages
  translate.switchLanguage(translateText.sourceLanguage, translateText.targetLanguage);

  /// Get downloaded models
  translate.getDownloadedModels();

  /// Downloaded model
  translate.downloadedModel(TranslateLanguage.english);

  /// Delete downloaded model
  translate.deleteDownloadedModel(TranslateLanguage.english);

  /// Whether downloaded model
  translate.isModelDownloaded(TranslateLanguage.english);

  /// Be sure to call this method when you no longer use translation
  translate.dispose();
}

```
![](https://github.com/Wayaer/fl_mlkit_translate_text/raw/main/res/translate.png) ![](https://github.com/Wayaer/fl_mlkit_translate_text/raw/main/res/manager.png)
<img src="https://github.com/Wayaer/fl_mlkit_translate_text/blob/main/res/translate.png" width="50%"><img src="https://github.com/Wayaer/fl_mlkit_translate_text/blob/main/res/manager.png" width="50%">
