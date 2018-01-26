require_relative '../lib/cat.rb'
require_relative '../lib/dog.rb'
require_relative '../lib/fish.rb'
require 'pry'

class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(name)
    @@all << self
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
    "I am a human."
  end

  def buy_fish(name)
    a = Fish.new(name)
    # binding.pry
    # @pets[:fishes] = []
    @pets[:fishes] << a
  end

  def buy_cat(name)
    a = Cat.new(name)
    @pets[:cats] = []
    @pets[:cats] << a
  end

  def buy_dog(name)
    a = Dog.new(name)
    @pets[:dogs] = []
    @pets[:dogs] << a
  end

  def walk_dogs
    @pets[:dogs].each{|a| a.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each{|a| a.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each{|a| a.mood = "happy"}
  end

  def sell_pets

    @pets.each {|type, pets| pets.each do |v| v.mood = "nervous"end}
    @pets.each{|type,pets|pets.clear}
  end

  def list_pets
    binding.pry
    return "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end


end
