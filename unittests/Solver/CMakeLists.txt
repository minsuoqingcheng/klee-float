add_klee_unit_test(SolverTest
  SolverTest.cpp)
target_link_libraries(SolverTest PRIVATE kleaverSolver)

add_klee_unit_test(ExprSolverConsistencyTest
  ExprSolverConsistencyTest.cpp)
target_link_libraries(ExprSolverConsistencyTest PRIVATE kleaverSolver)
