use v6;

use GraphQL;
use Types;

my @database =
    Person.new(id => 0,
               name => 'Gilligan',
               birthday => 'Friday',
               state => BAD),
    Person.new(id => 1,
               name => 'Skipper',
               birthday => 'Monday',
               state => UGLY),
    Person.new(id => 2,
               name => 'Professor',
               birthday => 'Tuesday',
               state => GOOD),
    Person.new(id => 3,
               name => 'Ginger',
               birthday => 'Wednesday',
               state => BAD),
    Person.new(id => 4,
               name => 'Mary Ann',
               birthday => 'Thursday',
               state => GOOD),
;

class Model
{
    method get-person($id)
    {
        @database[$id];
    }

    method list-people($start, $count)
    {
        @database[$start ..^ $start+$count]
    }

    method add-person(PersonInfo $newperson)
    {
        my $id = @database.elems;
        @database.push(Person.new(:$id,
                                  name => $newperson.name,
                                  birthday => $newperson.birthday,
                                  state => $newperson.state));
        return $id;
    }
    method update-person($id, PersonInfo $input)
    {
        for <name birthday state> -> $field
        {
            say "For $id, setting $field to " ~ $input."$field"();
            @database[$id]."$field"() = $_ with $input."$field"()
        }

        @database[$id]
    }
}

INIT $model = Model.new;
