# frozen_string_literal: true

# 見直し:https://rex.libertyfish.co.jp/exam_histories
# リファレンス:https://docs.ruby-lang.org/ja/latest/doc/spec=2fvariables.html

# グローバル変数
$all = 'living things'
class Animal
  # クラス変数
  @@category_name = 'Animal'
  def category
    p "Your category is #{@@category_name}. You are #{$all}"
  end
end

class Dog < Animal
  # 定数
  SOUND = 'bowwow'

  def called_name(name)
    # インスタンス変数
    @kind = 'Dog'
    p "Your name is #{name}. You are #{@kind}. You can make a sound #{SOUND}"
  end

  def self.action(action)
    "#{action},and #{SOUND}"
  end
end

class Cat < Animal
  # 定数
  SOUND = 'meow'
  def called_name(name)
    @kind = 'Cat'
    p "Your name is #{name}. You are #{@kind}. You can make a sound #{SOUND}"
  end

  def self.action(action)
    "#{action},and #{SOUND}"
  end
end

# クラスメソッドの呼び出し
dog = Dog.action('run')
cat = Cat.action('jump')
p dog
p cat

# インスタンスメソッドの呼び出し
dog_profile = Dog.new
cat_profile = Cat.new
p dog_profile.called_name('Po chi')
p cat_profile.called_name('Tam')
p dog_profile.category
p cat_profile.category
