# `class_name` lets us search for the given name in the documentation system.
class_name AutoDocumentation extends Node

## A brief description of your script that gets generated at the top in bold font. We can use
## the same BBCode used with [RichTextLabel] in documentation comments. Furthermore there are
## a number of custom BBCode tags designed for use with the documentation comments for referencing
## classes, member functions, variables, constants etc.
##
## A more detailed description of the script. If the long description is meant to span over
## multiple lines it isn't enough to use new-lines to break apart individual paragraphs.
##
## For example this sentence will be part of the first paragraph in the long description.
## [br][br]
## Instead we need to break the lines with the BBCode tag for this purpose: [code][br][/code].
## As a consequence, this paragraph will be seaparated by a line break in the autogenerated
## documentation.
## [br][br]
## By using two [code][br][/code] tags we introduce a visual separation line break.
## [br][br]
## For class documentation comments specifically, we can also define links to tutorials like this:
##
## @tutorial(GDScript Documentation Comments): https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html

## The description of [code]auto_documentation_signal[/code] goes here. It can span multiple line
## just like the long description for [AutoDocumentation]. This applies more broadly to all
## documentation comments, the only exception being enum values shown below.
## [color=lime]Note[/color] that at the time of this writing the auto documentation doesn't
## generate proper signal types.
signal auto_documentation_signal(parameter: int)

## This is a description of the [code]Direction[/code] enum defined below. [color=lime]Note[/color]
## that the enum values are documented on the same line as the enum and
## [b]cannot span multiple lines[/b].
enum Direction {
	UP    = 0,  ## Direction up.
	DOWN  = 1,  ## Direction down.
	LEFT,       ## Direction left. The left out value is generated in the auto documentation.
	RIGHT = 3,  ## Direction right.
}

## The documentation for [code]CONSTANT[/code] goes here.
const CONSTANT := 9.8

## [color=lime]Note[/color] that the types gets generated in the auto documentation as well.
## For example, [code]untyped_variable[/code] here is inferred as [Variant] since we didn't
## specify a type.
var untyped_variable

## Auto documentation extracts the given static type.
var typed_variable: int

## Auto documentation also extracts the default values if there are any.
var default_variable := 42.0

## [color=lime]Note[/color] that the annotation doesn't appear in the auto documentation.
## This applies to all anotation types like [annotation @GDScript.@onready] as well,
## not just [annotation @GDScript.@export].
@export var exported_variable := 0

## We can use the BBCode [code]codeblock[/code] tag for demonstrating how to use functions or any
## other code we might want do include in our explanation:
## [br][br]
## Usage:
##
## [codeblock]
## func _ready() -> void:
##     # ...
##     public_function()
## [/codeblock]
## [br]
## [color=lime]Note[/color] that we use (four) spaces for indentation and not tabs because the
## documentation comments parser deletes tabs.
func public_function() -> void:
	pass

# [code]_hidden_private_function[/code] isn't documented because we use regular comments. And because
# its name starts with an underscore it's treated as private so it's not shown in the help window.
func _hidden_private_function() -> void:
	pass

## [code]_visible_private_function[/code] is documented. Even though its name starts with
## an underscore, it shows up in the help window.
func _visible_private_function(parameter1: int, parameter2: String = "") -> float:
	return 0.0

## Documenting an inner class is exacly the same as documenting any other class. This class is
## found separately in the help search menu under [AutoDocumentation.Inner].
##
## The same rules apply here while thehe documentation must immediately precede the class
## definition, just like for variables, constants, functions etc.
## [br][br]
## [color=lime]Note[/color] that we can reference member variables from other classes like this:
## [member AutoDocumentation.untyped_variable]. For a list of all supported tags see the tutorial
## link leading to the official documentation.
## [br][br]
## [color=lime]Note[/color] that this time we left out the tutorial name so the URL is used
## in the auto documentation instead.
##
## @tutorial: https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_documentation_comments.html
class Inner:

	## All the regular documentation comments are supported for inner classes, exemplified here
	## for [code]untyped_inner_variable[/code].
	var untyped_inner_variable

	## Documentation for [code]inner_class_function[/code].
	func inner_class_function() -> void:
		pass
