
// This works
template<int DIM>
template<int D>
typename std::enable_if<D == 1, void>::type
foo<DIM>::function()
{
    std::cout << D << "\n";
}

template<int DIM>
template<int D>
typename std::enable_if<D == 2, void>::type
foo<DIM>::function()
{
    std::cout << D << "\n";
}

template<int DIM>
template<int D>
typename std::enable_if<D == 200, void>::type
foo<DIM>::function()
{
    std::cout << D << "\n";
}

template class foo<1>;
template class foo<2>;
template class foo<200>;
