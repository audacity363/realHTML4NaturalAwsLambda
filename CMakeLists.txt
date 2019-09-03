cmake_minimum_required(VERSION 3.15)

project(awsNatWrapper VERSION 1.0 LANGUAGES C CXX)
add_definitions(-DAWS)

find_package(aws-lambda-runtime REQUIRED)
find_package(AWSSDK COMPONENTS s3)

include_directories(
    ./libs/realHTML4NaturalCore/include 
    ./libs/realHTML4NaturalCore/natuser/include
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/include
    ./libs/realHTML4NaturalCore/libs/rh4n_logging/include
    ./libs/realHTML4NaturalCore/libs/rh4n_utils/include
    ./libs/realHTML4NaturalCore/libs/rh4n_var2name/include
    ./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/include
    ./libs/realHTML4NaturalCore/libs/rh4n_jsongenerator/include
    ./libs/rh4n_aws_JSONConverter/include
    ./apps/natcaller/include)

add_library(rh4nutils STATIC 
    ./libs/realHTML4NaturalCore/libs/rh4n_utils/src/rh4n_utils
    ./libs/realHTML4NaturalCore/libs/rh4n_utils/src/rh4n_utils_prop)
set_property(TARGET rh4nutils PROPERTY POSITION_INDEPENDENT_CODE ON)

add_library(rh4nlogging STATIC
    ./libs/realHTML4NaturalCore/libs/rh4n_logging/src/rh4n_logging)
set_property(TARGET rh4nlogging PROPERTY POSITION_INDEPENDENT_CODE ON)


add_library(rh4nvars STATIC 
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_array
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_bool
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_dump
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_float
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_free
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_group
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_integer
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_load
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_print
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_string
    ./libs/realHTML4NaturalCore/libs/rh4n_vars/src/rh4n_vars_ustring)
set_property(TARGET rh4nvars PROPERTY POSITION_INDEPENDENT_CODE ON)

add_library(rh4nldaparser STATIC
    ./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/src/rh4n_ldaparser.c
    ./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/src/rh4n_lda_filehandling
	./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/src/rh4n_lda_array
	./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/src/rh4n_lda_utils
	./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/src/rh4n_lda_variables
	./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/src/rh4n_lda_print
	./libs/realHTML4NaturalCore/libs/rh4n_ldaparser/src/rh4n_lda_free)
set_property(TARGET rh4nldaparser PROPERTY POSITION_INDEPENDENT_CODE ON)

add_library(rh4nvar2name STATIC
    ./libs/realHTML4NaturalCore/libs/rh4n_var2name/src/rh4n_v2n
    ./libs/realHTML4NaturalCore/libs/rh4n_var2name/src/rh4n_v2n_resolvenames
	./libs/realHTML4NaturalCore/libs/rh4n_var2name/src/rh4n_v2n_resolveposition)
set_property(TARGET rh4nvar2name PROPERTY POSITION_INDEPENDENT_CODE ON)

add_library(rh4njsongenerator STATIC
    ./libs/realHTML4NaturalCore/libs/rh4n_jsongenerator/src/rh4n_json_generator
    ./libs/realHTML4NaturalCore/libs/rh4n_jsongenerator/src/rh4n_json_group
    ./libs/realHTML4NaturalCore/libs/rh4n_jsongenerator/src/rh4n_json_array)
set_property(TARGET rh4njsongenerator PROPERTY POSITION_INDEPENDENT_CODE ON)

add_library(realHTML4Natural SHARED
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_jumptab
    ./libs/realHTML4NaturalCore/natuser/src/ncuxinit
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_genjson
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_init
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_utils
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_variablereadout
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_geturlobj
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_mbn
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_getbodyobj
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_getbodyvar
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_geturlvar
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_getuser
    ./libs/realHTML4NaturalCore/natuser/src/rh4n_nat_debug_init

    ./libs/realHTML4NaturalCore/natuser/src/var_parm_handling/rh4n_nat_a_handling
	./libs/realHTML4NaturalCore/natuser/src/var_parm_handling/rh4n_nat_i_handling
	./libs/realHTML4NaturalCore/natuser/src/var_parm_handling/rh4n_nat_l_handling
	./libs/realHTML4NaturalCore/natuser/src/var_parm_handling/rh4n_nat_f_handling
	./libs/realHTML4NaturalCore/natuser/src/var_parm_handling/rh4n_nat_dt_handling
	./libs/realHTML4NaturalCore/natuser/src/var_parm_handling/rh4n_nat_np_handling
	./libs/realHTML4NaturalCore/natuser/src/var_parm_handling/rh4n_nat_u_handling

    ./libs/realHTML4NaturalCore/natuser/src/put_var_handling/rh4n_nat_put_a
	./libs/realHTML4NaturalCore/natuser/src/put_var_handling/rh4n_nat_put_i
	./libs/realHTML4NaturalCore/natuser/src/put_var_handling/rh4n_nat_put_l
	./libs/realHTML4NaturalCore/natuser/src/put_var_handling/rh4n_nat_put_f
	./libs/realHTML4NaturalCore/natuser/src/put_var_handling/rh4n_nat_put_aton)
target_link_libraries(realHTML4Natural PRIVATE rh4nutils rh4nlogging rh4nvars rh4nldaparser rh4nvar2name rh4njsongenerator)

add_library(rh4nawsjsonconverter STATIC
    ./libs/rh4n_aws_JSONConverter/src/utils/NameStack.cpp
    ./libs/rh4n_aws_JSONConverter/src/signatures/Types
    ./libs/rh4n_aws_JSONConverter/src/signatures/ArraySignature
    ./libs/rh4n_aws_JSONConverter/src/signatures/ObjectSignatureNode.cpp
    ./libs/rh4n_aws_JSONConverter/src/signatures/ObjectSignature.cpp
    ./libs/rh4n_aws_JSONConverter/src/RH4NObject.cpp
    ./libs/rh4n_aws_JSONConverter/src/RH4NArray.cpp
    ./libs/rh4n_aws_JSONConverter/src/RH4NObjectArray.cpp)
set_property(TARGET rh4nawsjsonconverter PROPERTY POSITION_INDEPENDENT_CODE ON)
target_link_libraries(rh4nawsjsonconverter PRIVATE AWS::aws-lambda-runtime)

add_executable(natcaller 
    ./apps/natcaller/src/main.c
    ./apps/natcaller/src/rh4n_nat_errorhandling.c
    ./apps/natcaller/src/rh4n_nat_parmgeneration.c
    ./apps/natcaller/src/rh4n_natcall_process.c)
target_link_libraries(natcaller rh4nutils rh4nlogging rh4nvars rh4nldaparser rh4nvar2name rh4njsongenerator ${CMAKE_DL_LIBS})

add_executable(lambdaHandler ./apps/bootstrapper/src/main.cpp)
target_link_libraries(lambdaHandler PUBLIC AWS::aws-lambda-runtime ${AWSSDK_LINK_LIBRARIES} rh4nlogging rh4nutils rh4nvars rh4nldaparser rh4nvar2name)

add_executable(test ./apps/test/main.cpp)
target_link_libraries(test PUBLIC AWS::aws-lambda-runtime ${AWSSDK_LINK_LIBRARIES}) 

aws_lambda_package_target(lambdaHandler)
