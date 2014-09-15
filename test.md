

* TOC
{:toc}

高機能なMarkdown parserである[kramdown](http://kramdown.gettalong.org/)を、Markedで使った時のメモ

## kramdownのメリットとデメリット

- メリット
  - toc(目次)の自動生成機能
  - [CodeRay](http://coderay.rubychan.de/)による美麗なsyntax hilight
  - definition listほか、多くの[Syntax](http://kramdown.gettalong.org/syntax.html)をサポートする
  - その他、やたらと多い[Option](http://kramdown.gettalong.org/options.html)
- デメリット
  - 広く普及しているGFM（[GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown)）と互換性に乏しい（=オレオレmarkdownになりやすい）
  - coderayが、shのレンダリングをサポートしていない


## Markedでkramdownを利用する手順

```sh
  # kramdownをインストール

$ gem install kramdown
  # coderayのレンダリングがshをサポートしておらず、使い勝手が悪いので利用しない
$ gem uninstall coderay
  # バージョンを確認
$ kramdown --version
1.4.1
```

以下は、必要に応じて実施する。

```diff
  # デフォルトのoption設定を変更（例：coderayの行番号をデフォルト表示しない）
$ vim `rbenv prefix`/lib/ruby/gems/*/gems/kramdown-`kramdown -v`/lib/kramdown/options.rb
- define(:coderay_line_numbers, Symbol, :inline, 
+ define(:coderay_line_numbers, Symbol, nil, 
```

kramdownを起動する為のシェルを用意する。非アスキー文字の場合、正常に処理できないので、環境変数 RUBYOPT で -E オプションを指定する。（詳細は、下記サイトが詳しいです）
- [Happy-Go-Lucky: MarsEdit や Marked で kramdown を用いた変換が機能しなくなったけど回避できたという話](http://www.toshiya240.com/2013/12/marsedit-marked-kramdown.html)

```sh
#! /bin/sh
# Kramdown for Marked2 & MarsEdit3
CMD=${HOME}/.rbenv/shims/kramdown
export RUBYOPT=-EUTF-8
$CMD $@
```

用意したkramdownのシェルを、Marked2の設定画面から読み込ませる

- `Marked 2` > `Advanced` > `Custom Processor`
