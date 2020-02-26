# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end

# movie_with_director_name(director_name, movie_data)
#it's guna take your movie_data and plug it into this new hash{}, it this case, it adds a director_name

# Your code after this point

  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method

def movies_with_director_key(name, movies_collection)
  result = []
  i = 0
  while i < movies_collection.length do
    movie_data = movies_collection[i]
    result << movie_with_director_name(name, movie_data)
    i += 1
  end
  result
end

  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash
  # all_totals = {"Alpha Films" => 40, "Omega Films" => 30}

    
def gross_per_studio(collection)
  all_totals = {}
  i = 0
  while i < collection.length do
    studio_name = collection[i][:studio]
    sum_of_gross = collection[i][:worldwide_gross]
    if !all_totals[studio_name]
      all_totals[studio_name] = sum_of_gross
    else
      all_totals[studio_name] += sum_of_gross
    end
    i += 1
  end
  pp all_totals
end

  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  # [[{:title => "Test", :director_name => "A"}], ...[], ... []]
  

def movies_with_directors_set(source)
  i = 0
  new_array_of_array = []
  while i < source.length do
    hash_with_dir_and_movies = source[i]
    director_name = hash_with_dir_and_movies[:name]
    directors_movies = hash_with_dir_and_movies[:movies]
    new_array_of_array << movies_with_director_key(director_name, directors_movies)
    i += 1
  end
  new_array_of_array
end
  

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
