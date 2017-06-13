#!/usr/bin/env perl6

use v6;

use GraphQL;
use GraphQL::Server;

use Types;
use Model;

my $schema = GraphQL::Schema.new(State, Person, Query, PersonInfo, Mutation);

GraphQL-Server($schema);
