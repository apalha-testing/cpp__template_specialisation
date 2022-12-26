CXX = g++

TARGET_HPP = template_specialisation_hpp
TARGET_TPP = template_specialisation_tpp
BUILD_DIR   = build_make
INSTALL_DIR = install

CXXFLAGS = -std=c++11
IFLAGS_HPP = -I./src/working_hpp/
IFLAGS_TPP = -I./src/working_tpp/

OBJ_NAMES_HPP =  \
main

OBJ_NAMES_TPP =  \
main

OBJ_HPP = $(patsubst %,$(BUILD_DIR)/%_hpp.o,$(OBJ_NAMES_HPP))
OBJ_TPP = $(patsubst %,$(BUILD_DIR)/%_tpp.o,$(OBJ_NAMES_TPP))

dir_guard=@mkdir -p $(@D)

default: tpp

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(INSTALL_DIR):
	mkdir -p $(INSTALL_DIR)

.PHONY: clean

$(BUILD_DIR)/%_hpp.o: src/working_hpp/%_hpp.cpp
	$(CXX) $(CXXFLAGS) $(IFLAGS_HPP) $(DFLAGS) $(LFLAGS)-c -o $@ $<
	
$(BUILD_DIR)/%_tpp.o: src/working_tpp/%_tpp.cpp
	$(CXX) $(CXXFLAGS) $(IFLAGS_TPP) $(DFLAGS) $(LFLAGS)-c -o $@ $<
	
hpp: $(BUILD_DIR) $(OBJ_HPP)
	${CXX} -o $(TARGET_HPP) $(OBJ_HPP)
	
tpp: $(BUILD_DIR) $(OBJ_TPP)
	${CXX} -o $(TARGET_TPP) $(OBJ_TPP)
		
clean:
	rm $(BUILD_DIR)/*.o
	rm $(TARGET_WORKING)
	rm $(TARGET_NOT_WORKING)
