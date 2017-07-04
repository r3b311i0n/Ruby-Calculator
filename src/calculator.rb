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

# Text boxes
input = Gtk::TextView.new
output = Gtk::Label.new('Hello!')

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

# Main container
main_container = Gtk::Box.new(:vertical, 6)
sub_container = Gtk::Box.new(:horizontal, 3)
sub_container.add(number_container)
sub_container.add(operator_container)

main_container.add(text_container)
main_container.add(sub_container)
main_container.add(equals)

# Event handlers

# Init
# noinspection RubyResolve
window.border_width = 30
window.add(main_container)

window.show_all
Gtk.main