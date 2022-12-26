//------------------------------------------------------------------------------
#ifndef TEMPLATE_SPECIALISATION_H
#define TEMPLATE_SPECIALISATION_H
//------------------------------------------------------------------------------

#include <stdio.h>
#include <iostream>
#include <type_traits>

template <int DIM>
class foo
{
public:
  template<int D = DIM>
  typename std::enable_if<D == 1, void>::type
  function();
  
  template<int D = DIM>
  typename std::enable_if<D == 2, void>::type
  function();
  
  template<int D = DIM>
  typename std::enable_if<D == 200, void>::type
  function();

};

#include "template_specialisation_tpp.tpp"

//------------------------------------------------------------------------------
#endif  // TEMPLATE_SPECIALISATION_H
//------------------------------------------------------------------------------
