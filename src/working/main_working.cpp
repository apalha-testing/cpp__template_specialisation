

#include "template_specialisation_working.hpp"

int main(){
    foo<1> object_1;
    object_1.function();
    
    foo<2> object_2;
    object_2.function();
    
    foo<200> object_200;
    object_200.function();
    
    return 0;
}
