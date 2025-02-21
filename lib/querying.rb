def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT books.title, books.year
	FROM books
	WHERE books.series_id = 1
	ORDER BY books.year;"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT characters.name, characters.motto
	FROM characters 
	GROUP BY characters.motto
	HAVING MAX(length(characters.motto))
	ORDER BY characters.motto ASC LIMIT 1;"
end


def select_value_and_count_of_most_prolific_species
  "SELECT characters.species, COUNT(characters.species)
	FROM characters 
	GROUP BY characters.species
	HAVING COUNT(characters.species)
	ORDER BY characters.species DESc LIMIT 1;"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name
	FROM series
	INNER JOIN authors 
	ON authors.id = series.id
	JOIN subgenres
	ON series.subgenre_id = subgenres.id;"
end

def select_series_title_with_most_human_characters
  "SELECT series.title
	FROM series
	INNER JOIN authors 
	ON authors.id = series.author_id
	JOIN characters
	ON characters.author_id = authors.id
	GROUP BY series.title
	ORDER BY SUM(characters.species) = 'human' ASC LIMIT 1;"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.character_id)
	FROM characters
	LEFT OUTER JOIN character_books
	ON characters.id = character_books.character_id
	GROUP BY characters.name
	ORDER BY COUNT(character_books.character_id) DESC;"
end
