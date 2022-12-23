CXX = g++

TARGET_WORKING = template_specialisation_working
TARGET_NOT_WORKING = template_specialisation_not_working
BUILD_DIR   = build_make
INSTALL_DIR = install

CXXFLAGS = -std=c++11
IFLAGS_WORKING = -I./src/working/
IFLAGS_NOT_WORKING = -I./src/not_working/

OBJ_NAMES_WORKING =  \
main

OBJ_NAMES_NOT_WORKING =  \
main\
template_specialisation

OBJ_WORKING = $(patsubst %,$(BUILD_DIR)/%_working.o,$(OBJ_NAMES_WORKING))
OBJ_NOT_WORKING = $(patsubst %,$(BUILD_DIR)/%_not_working.o,$(OBJ_NAMES_NOT_WORKING))

dir_guard=@mkdir -p $(@D)

default: not_working

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(INSTALL_DIR):
	mkdir -p $(INSTALL_DIR)

.PHONY: clean

$(BUILD_DIR)/%_working.o: src/working/%_working.cpp
	$(CXX) $(CXXFLAGS) $(IFLAGS_WORKING) $(DFLAGS) $(LFLAGS)-c -o $@ $<
	
$(BUILD_DIR)/%_not_working.o: src/not_working/%_not_working.cpp
	$(CXX) $(CXXFLAGS) $(IFLAGS_NOT_WORKING) $(DFLAGS) $(LFLAGS)-c -o $@ $<
	
working: $(BUILD_DIR) $(OBJ_WORKING)
	${CXX} -o $(TARGET_WORKING) $(OBJ_WORKING)
	
not_working: $(BUILD_DIR) $(OBJ_NOT_WORKING)
	${CXX} -o $(TARGET_NOT_WORKING) $(OBJ_NOT_WORKING)
		
clean:
	rm $(BUILD_DIR)/*.o
	rm $(TARGET_WORKING)
	rm $(TARGET_NOT_WORKING)
