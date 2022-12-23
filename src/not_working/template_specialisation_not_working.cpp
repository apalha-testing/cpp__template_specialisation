#include "template_specialisation_not_working.hpp"

// This does not work
template<int DIM>
typename std::enable_if<DIM == 1, void>::type
foo<DIM>::function()
{
    std::cout << DIM << "\n";
}

template<int DIM>
typename std::enable_if<DIM == 2, void>::type
foo<DIM>::function()
{
    std::cout << DIM << "\n";
}


// // This works but very tedious
// template<>
// void foo<1>::function()
// {
//     std::cout << 1 << "\n";
// }
// 
// template<>
// void foo<2>::function()
// {
//     std::cout << 10*2 << "\n";
// }
// 
// template<>
// void foo<200>::function()
// {
//     std::cout << 10*200 << "\n";
// }
