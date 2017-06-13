use v6;

use GraphQL::Types;

our $model;

enum State <GOOD BAD UGLY>;

class Person
{
    has ID $.id is required;
    has Str:D $.name is rw is required;
    has Str $.birthday is rw;
    has State $.state is rw;
}

class PersonInfo is GraphQL::InputObject
{
    has Str $.name;
    has Str $.birthday;
    has State $.state;
}

class Query
{
    method person(ID :$id!) returns Person
    {
        $model.get-person($id)
    }

    method listpeople(ID :$start, Int :$count) returns Array[Person]
    {
        Array[Person].new($model.list-people($start, $count))
    }
}

class Mutation
{
    method add(PersonInfo :$new!) returns ID
    {
        $model.add-person($new)
    }
    method update(ID :$id!, PersonInfo :$input!) returns Person
    {
        $model.update-person($id, $input)
    }
}
