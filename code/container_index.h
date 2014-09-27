/*
   container_index.h

   if BOUNDS_CHECK is defined,
   check index bound
*/

#ifndef CONTAINER_INDEX
#define CONTAINER_INDEX

#include <cassert>
#include <vector>
#include <deque>

namespace jw
{
	template <typename T>
	class vector: public std::vector<T>
	{
	public:
		// type
		typedef std::vector<T>		_Base;
		typedef typename _Base::size_type	size_type;

		T& operator[](size_type __n)
		{
#ifdef BOUNDS_CHECK
			assert( __n < _Base::size() );
#endif
			return _Base::operator[](__n);
		}

		const T& operator[](size_type __n) const
		{
#ifdef BOUNDS_CHECK
			assert( __n < _Base::size() );
#endif
			return _Base::operator[](__n);
		}
	};

	template <typename T>
	class deque: public std::deque<T>
	{
	public:
		// type
		typedef std::deque<T>		_Base;
		typedef typename _Base::size_type	size_type;

		T& operator[](size_type __n)
		{
#ifdef BOUNDS_CHECK
			assert( __n < _Base::size() );
#endif
			return _Base::operator[](__n);
		}

		const T& operator[](size_type __n) const
		{
#ifdef BOUNDS_CHECK
			assert( __n < _Base::size() );
#endif
			return _Base::operator[](__n);
		}
	};
}

#endif

