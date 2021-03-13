# MyLearningEnglishWordsApp

英単語学習アプリ

# 環境構築
基本的にライブラリの管理は`Swift Package Manager`を使用する
対応していないライブラリに関しては、回避策を用いる
### 静的解析
- swiftlint
```
brew install swiftlint
```

### PJファイル作成
- xcodegen
```
swift run xcodegen
```

### モジュール作成
```
bundle exec generamba gen {モジュール名} swifty_viper
```
