module d.core.foundations.hellouser.hello_user;

import std.stdio;
import std.string;

void main() {
  write("Enter your name: ");

  char[] name;
  readln(name);
  name = strip(name);

  writeln("Hello, ", name, "!");
}