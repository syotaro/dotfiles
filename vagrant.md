
# sshで入れるように

vagrant ssh-config >> ~/.ssh/config

# http://dqn.sakusakutto.jp/2014/09/vagrant_chefsolo_20149.html

```sh
brew cask install 'chefdk'
brew cask install 'vagrant'
brew cask install 'virtualbox'
```

# 最低限必要なVagrant Pluginをインストール

```sh
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-vbguest
```

# Vagrant CloudからBoxを探して使う
- http://www.vagrantbox.es/ のリストを使ったり vagrant box add するのは古いやり方です。今どきは box add する必要はほとんどありません。
- https://vagrantcloud.com/ から適当なBoxを探して、Vagrantfileに下記のように書くだけです。

```sh
vim Vagrantfile
config.vm.box = "chef/centos-6.5"
```

- これで vagrant upすれば、vagrantcloud.com からBoxファイルを自動でダウンロードしてくれます。(同時にローカルにキャッシュされて、２回目以降はキャッシュが使われるので高速です。)

# vagrant upしてchef-soloで"hello world"するまで

- 以上のインストールができたところで、早速 hello worldする レシピを作って vagrant upまでやってみましょう！
- 作業用ディレクトリを作る

```sh
$ cd /tmp
$ mkdir vgtest
$ cd vgtest
$ vi Vagrantfile
```

- Vagrantfileを作成。下記のように記述。
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/centos-6.5"
  config.omnibus.chef_version = :latest

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = "./cookbooks"
    chef.add_recipe "hello"
  end

end
$ mkdir -p cookbooks/hello/recipes/
$ echo "log 'hello world'" > cookbooks/hello/recipes/default.rb
これで準備はできました！
起動してプロビジョンする
$ vagrant up
下記のようなログが出れば成功です！
(途中、"SSL validation of HTTPS"のような警告が出ますが無視して大丈夫です。)
```sh
==> default: [2014-09-23T16:58:09+00:00] INFO: *** Chef 11.16.2 ***
==> default: [2014-09-23T16:58:09+00:00] INFO: Chef-client pid: 2251
==> default: [2014-09-23T16:58:12+00:00] INFO: Setting the run_list to ["recipe[hello]"] from CLI options
==> default: [2014-09-23T16:58:12+00:00] INFO: Run List is [recipe[hello]]
==> default: [2014-09-23T16:58:12+00:00] INFO: Run List expands to [hello]
==> default: [2014-09-23T16:58:12+00:00] INFO: Starting Chef Run for localhost
==> default: [2014-09-23T16:58:12+00:00] INFO: Running start handlers
==> default: [2014-09-23T16:58:12+00:00] INFO: Start handlers complete.
==> default: [2014-09-23T16:58:12+00:00] INFO: hello world
==> default: [2014-09-23T16:58:12+00:00] INFO: Chef Run complete in 0.020542169 seconds
==> default: [2014-09-23T16:58:12+00:00] INFO: Running report handlers
==> default: [2014-09-23T16:58:12+00:00] INFO: Report handlers complete
```
なお、vagrant upがプロビジョニング(=ChefSolo実行)してくれるのは初回起動時のみです。 この後、レシピをいじってプロビジョニングを再実行したい場合は
$ vagrant provision
してください。
うまく動きましたか？
