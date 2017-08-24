# Output for SeparateChaining

The following shows the state of the hash table as it processes the
following commands:
* `star_wars_movies = SeparateChaining.new`
* `star_wars_movies["Star Wars: The Phantom Menace"] = "Number One"`
* `star_wars_movies["Star Wars: Attack of the Clones"] = "Number Two"`
* `star_wars_movies["Star Wars: Revenge of the Sith"] = "Number Three"`
* `star_wars_movies["Star Wars: A New Hope"] = "Number Four"`
* `star_wars_movies["Star Wars: The Empire Strikes Back"] = "Number Five"`
* `star_wars_movies["Star Wars: Return of the Jedi"] = "Number Six"`
    
In the following, integers represent nodes as follows

0 . `key = "Star Wars: The Phantom Menace", value = "Number One"`
1. `key = "Star Wars: Attack of the Clones", value = "Number Two"`
2. `key = "Star Wars: Revenge of the Sith", value = "Number Three"`
3. `key = "Star Wars: A New Hope", value = "Number Four"`
4. `key = "Star Wars: The Empire Strikes Back", value = "Number Five"`
5. `key = "Star Wars: Return of the Jedi", value = "Number Six"`

* The notation `(LF: xx%)` gives the load factor.
* The notation `.` represents an empty cell in the array
* The notation `[a, b, c]` represents a linked list at a particular cell in the array

```
(LF: 16%) [0].....
(LF: 33%) [0]..[1]..
(LF: 50%) [0]..[1].[2]
(LF: 66%) [0]..[1][3][2] # at this point, it resizes, and has to reinsert nodes 0-3
(LF: 41%) ......[0].....
(LF: 41%) ...[1]..[0].....
(LF: 41%) ...[1][3].[0].....
(LF: 41%) ...[1][3].[0]....[2]
(LF: 41%) ..[4][1][3].[0]....[2] # it's done resizing, and can insert node 4 and 5
(LF: 50%) ..[4][1, 5][3].[0]....[2]
```