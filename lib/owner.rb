class Owner
  attr_reader :name, :species

  @@all = []
  @@cats = []
  @@dogs = []

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat, self)
    @@cats << new_cat
  end

  def buy_dog(dog)
    new_dog = Dog.new(dog, self)
    @@dogs << new_dog
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
      self.cats.each {|x| x.mood = "happy"}
  end

  def sell_pets
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.cats.each {|x| x.mood = "nervous"}
    self.dogs.each {|dog| dog.owner = nil}
    self.cats.each {|x| x.owner = nil}
  end

  def list_pets
    my_dogs = @@dogs.select {|dog| dog.owner == self}
    my_cats = @@cats.select {|cat| cat.owner == self}
    "I have #{my_dogs.length} dog(s), and #{my_cats.length} cat(s)."
  end

end