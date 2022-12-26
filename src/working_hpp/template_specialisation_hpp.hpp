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
    template <int D = DIM>
    typename std::enable_if<D == 1, void>::type
    function()
    {
        std::cout << D << "\n";
    }

    template <int D = DIM>
    typename std::enable_if<(D > 1), void>::type
    function()
    {
        std::cout << 10*D << "\n";
    }

};


//------------------------------------------------------------------------------
#endif  // TEMPLATE_SPECIALISATION_H
//------------------------------------------------------------------------------
