cmake_minimum_required (VERSION 3.6)
project (BOSS CXX)

IF(CMAKE_BUILD_TYPE STREQUAL "Debug")
   SET(BOSS_LIB_NAME "BOSSd")
   SET(CMAKE_CONFIGURATION_TYPES "Debug" CACHE STRING "" FORCE)
ELSE()
   SET(BOSS_LIB_NAME "BOSS")
   SET(CMAKE_CONFIGURATION_TYPES "Release" CACHE STRING "" FORCE)
ENDIF()

SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O3 -std=c++11")
ADD_DEFINITIONS(/DNOMINMAX=1)

SET(BWAPI_INCL_DIR /tmp/bwapi/include)
SET(RAPIDJSON_INCL_DIR /tmp/rapidjson/include/rapidjson)

INCLUDE_DIRECTORIES(
   ${BWAPI_INCL_DIR}
   ${RAPIDJSON_INCL_DIR}
   include/
)

SET(BOSS_DEPENDENCIES
   ${BWAPI_INCL_DIR}/BWAPI.h
)

SET(BOSS_INCLUDES
   include/ActionInProgress.h
   include/ActionSet.h
   include/ActionType.h
   include/ActionTypeData.h
   include/Array.hpp
   include/BaseTypes.h
   include/BOSSAssert.h
   include/BOSSException.h
   include/BuildOrder.h
   include/BuildOrderPlot.h
   include/CombatSearch_BestResponse.h
   include/CombatSearch_BestResponseData.h
   include/CombatSearch_Bucket.h
   include/CombatSearch_BucketData.h
   include/CombatSearch_IntegralData.h
   include/CombatSearch_Integral.h
   include/Constants.h
   include/CombatSearch.h
   include/BOSS.h
   include/BuildingData.h
   include/CombatSearchParameters.h
   include/CombatSearchResults.h
   include/Common.h
   include/BuildOrderSearchGoal.h
   include/DFBB_BuildOrderSearchParameters.h
   include/DFBB_BuildOrderSearchResults.h
   include/DFBB_BuildOrderSmartSearch.h
   include/DFBB_BuildOrderStackSearch.h
   include/Eval.h
   include/GraphViz.hpp
   include/GameState.h
   include/HatcheryData.h
   include/BOSSLogger.h
   include/JSONTools.h
   include/NaiveBuildOrderSearch.h
   include/Position.hpp
   include/PrerequisiteSet.h
   include/Timer.hpp
   include/Tools.h
   include/UnitData.h
)
SOURCE_GROUP("BOSS_INCL" FILES ${BOSS_INCLUDES})

SET(BOSS_SRC
   source/ActionInProgress.cpp
   source/ActionSet.cpp
   source/ActionType.cpp
   source/ActionTypeData.cpp
   source/BOSSAssert.cpp
   source/BOSSException.cpp
   source/BuildOrder.cpp
   source/BuildOrderPlot.cpp
   source/CombatSearch.cpp
   source/BOSS.cpp
   source/BuildingData.cpp
   source/CombatSearch_BestResponse.cpp
   source/CombatSearch_BestResponseData.cpp
   source/CombatSearch_Bucket.cpp
   source/CombatSearch_BucketData.cpp
   source/CombatSearch_IntegralData.cpp
   source/CombatSearchParameters.cpp
   source/CombatSearchResults.cpp
   source/CombatSearch_Integral.cpp
   source/Constants.cpp
   source/BuildOrderSearchGoal.cpp
   source/DFBB_BuildOrderSearchParameters.cpp
   source/DFBB_BuildOrderSearchResults.cpp
   source/DFBB_BuildOrderSmartSearch.cpp
   source/DFBB_BuildOrderStackSearch.cpp
   source/Eval.cpp
   source/GameState.cpp
   source/HatcheryData.cpp
   source/BOSSLogger.cpp
   source/JSONTools.cpp
   source/NaiveBuildOrderSearch.cpp
   source/PrerequisiteSet.cpp
   source/Tools.cpp
   source/UnitData.cpp
)
SOURCE_GROUP("BOSS" FILES ${BOSS_SRC})

SET(BOSS
   ${BOSS_DEPENDENCIES}
   ${BOSS_INCLUDES}
   ${BOSS_SRC}
)
ADD_LIBRARY(${BOSS_LIB_NAME} STATIC ${BOSS})
SET_TARGET_PROPERTIES(${BOSS_LIB_NAME} PROPERTIES LINKER_LANGUAGE CXX)