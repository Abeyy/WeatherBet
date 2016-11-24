1.  setup extconf

	i.	create the file
		
		touch extconf.rb
	
	ii. add commands (remember to replace [CLASSNAME] with the class name)

		require 'mkmf-rice' 
		create_makefile('[CLASSNAME]')

	iii.run extconf

		ruby ./extconf.rb

2.	create your .cpp file

	i.	create the file

		touch [CLASSNAME].cpp

	ii. include headers and namespace directives (in [CLASSNAME].cpp)

		#include "rice/Class.hpp"
		using namespace Rice;

	iii.write some clever stuff (in [CLASSNAME].cpp)
		
		[returnType] [methodName_1]([arguments...]) {
			[implementation]
		}
		[returnType] [methodName_2]([arguments...]) {
			[implementation]
		}
		[returnType] [methodName_n]([arguments...]) {
			[implementation]
		}

	iv. expose your C/C++ code to ruby (in [CLASSNAME].cpp)

		extern "C"

		void Init_[CLASSNAME]()
		{
		  Class rb_c = define_class("[CLASSNAME]")
		    .define_method("methodName_1", &methodName_1)
		    .define_method("methodName_2", &methodName_2)
		    .define_method("methodName_n", &methodName_n);
		}

3.	compile your code (by calling make)
	
	make

4.	require your module where you need it
	
	require "#{Rails.root}/Cstuff/[CLASSNAME]"

5.	call your methods
	
	[CLASSNAME].new.[methodName] ([arguments...])
