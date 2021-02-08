class Owner
  # code goes here

  attr_reader :name, :species

  @@all = []

  def initialize name
    @name = name
    @species = "human"

    @@all << self

  end

  def self.all
    @@all
  end

  def say_species
    "I am a #{self.species}."
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.filter{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.filter{|cat| cat.owner == self}
  end

  def buy_cat name
    Cat.new name, self
  end
  
  def buy_dog name
    Dog.new name, self
  end

  def walk_dogs
    dogs.map{|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.map{|cat| cat.mood = "happy"}
  end

  def sell_pets
    dogs.map{|dog| dog.mood = "nervous"}
    cats.map{|cat| cat.mood = "nervous"}
    dogs.map{|dog| dog.owner = nil}
    cats.map{|cat| cat.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end
  




end