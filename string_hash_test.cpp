#include "string_hash.hpp"

#include <unordered_map>
#include <cassert>

int main( int argc, char* argv[] )
{
	std::string s( "hello" );
	std::string_view sv = "hello";
	const char* cc = "hello";
	
	// compile time
	static_assert( "hello"_sh == shash( "hello" ) );

	// yeah, you need to run in debug to test this
	assert( "hello"_sh == shash( s ) );
	assert( "hello"_sh == shash( sv ) );
	assert( "hello"_sh == shash( cc ) );
	assert( "hell"_sh != shash( cc ) );

	// std::hash test 
	std::unordered_map< shash, int > test;
	test["hello"] = 0;

	auto tf = test.find( "hello" );
	assert( tf == test.find( "hello"_sh ) );
	assert( tf == test.find( s ) );

	return 0;
}
