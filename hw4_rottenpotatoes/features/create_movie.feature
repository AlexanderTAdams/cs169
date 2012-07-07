Feature: add a movie to the movies table
 
  As a Moviegoer
  So that I can see new movies
  I want create movies that don't exist in the database yet

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  When I am on the home page
  Then I should not see "Inception"

Scenario: add a movie with a specific title, rating and release date

  When I am on the Create New Movie page
  And I add the movie: Inception, R, 20-Jul-2011
  Then I should be on the home page
  Then I should see "Inception"

