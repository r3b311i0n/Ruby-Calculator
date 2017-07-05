require 'gtk3'
window = Gtk::Window.new
window.title = 'Calculator'

# Button declarations
zero = Gtk::Button.new(label: '0')
one = Gtk::Button.new(label: '1')
two = Gtk::Button.new(label: '2')
three = Gtk::Button.new(label: '3')
four = Gtk::Button.new(label: '4')
five = Gtk::Button.new(label: '5')
six = Gtk::Button.new(label: '6')
seven = Gtk::Button.new(label: '7')
eight = Gtk::Button.new(label: '8')
nine = Gtk::Button.new(label: '9')

# Operators
add = Gtk::Button.new(label: '+')
subtract = Gtk::Button.new(label: '-')
multiply = Gtk::Button.new(label: '*')
divide = Gtk::Button.new(label: '/')

equals = Gtk::Button.new(label: '=')
clear_button = Gtk::Button.new(label: 'C')

# Text boxes
input = Gtk::Entry.new
output = Gtk::Label.new

# Containers

# First row of numbers
number_container_three = Gtk::Box.new(:horizontal, 1)
number_container_three.add(seven)
number_container_three.add(eight)
number_container_three.add(nine)
# Second row of numbers
number_container_two = Gtk::Box.new(:horizontal, 1)
number_container_two.add(four)
number_container_two.add(five)
number_container_two.add(six)
# Final row of numbers
number_container_one = Gtk::Box.new(:horizontal, 1)
number_container_one.add(one)
number_container_one.add(two)
number_container_one.add(three)

# Number container
number_container = Gtk::Box.new(:vertical, 1)
number_container.add(number_container_one)
number_container.add(number_container_two)
number_container.add(number_container_three)
number_container.add(zero)

# I/O containers
text_container = Gtk::Box.new(:vertical, 3)

text_container.add(input)
text_container.add(output)

# Operator containers
operator_container_one = Gtk::Box.new(:horizontal, 2)
operator_container_two = Gtk::Box.new(:horizontal, 2)
operator_container_one.add(add)
operator_container_one.add(subtract)
operator_container_two.add(multiply)
operator_container_two.add(divide)
operator_container = Gtk::Box.new(:vertical, 2)
operator_container.add(operator_container_one)
operator_container.add(operator_container_two)
operator_container.add(clear_button)

# Main container
main_container = Gtk::Box.new(:vertical, 6)
sub_container = Gtk::Box.new(:horizontal, 3)
sub_container.add(number_container)
sub_container.add(operator_container)

main_container.add(text_container)
main_container.add(sub_container)
main_container.add(equals)

# Insert input
def insert_number(text, input)
  input.insert_text(text.to_s, 1, input.text.length)
end

# Event handlers

# For numbers
# noinspection RubyResolve
nine.signal_connect(:clicked) do
  insert_number('9', input)
end
# noinspection RubyResolve
eight.signal_connect(:clicked) do
  insert_number('8', input)
end
# noinspection RubyResolve
seven.signal_connect(:clicked) do
  insert_number('7', input)
end
# noinspection RubyResolve
six.signal_connect(:clicked) do
  insert_number('6', input)
end
# noinspection RubyResolve
five.signal_connect(:clicked) do
  insert_number('5', input)
end
# noinspection RubyResolve
four.signal_connect(:clicked) do
  insert_number('4', input)
end
# noinspection RubyResolve
three.signal_connect(:clicked) do
  insert_number('3', input)
end
# noinspection RubyResolve
two.signal_connect(:clicked) do
  insert_number('2', input)
end
# noinspection RubyResolve
one.signal_connect(:clicked) do
  insert_number('1', input)
end
# noinspection RubyResolve
zero.signal_connect(:clicked) do
  insert_number('0', input)
end

# For operators
# noinspection RubyResolve
add.signal_connect(:clicked) do
  insert_number('+', input)
end
# noinspection RubyResolve
subtract.signal_connect(:clicked) do
  insert_number('-', input)
end
# noinspection RubyResolve
multiply.signal_connect(:clicked) do
  insert_number('*', input)
end
# noinspection RubyResolve
divide.signal_connect(:clicked) do
  insert_number('/', input)
end

# Answer
# noinspection RubyResolve
equals.signal_connect(:clicked) do
  begin
    @output = instance_eval input.text
    output.text = @output.to_s
  rescue SyntaxError => se
    puts se
  end
end

# Clear fields
# noinspection RubyResolve
clear_button.signal_connect(:clicked) do
  input.text = ''
  output.text = ''
end

# Init
# noinspection RubyResolve
window.border_width = 30
window.add(main_container)
# noinspection RubyResolve
window.resizable = false

# noinspection RubyResolve
window.signal_connect(:destroy) do
  Gtk.main_quit
end

window.show_all
Gtk.main