(*
This file reads in all of the P-matrices in `databases/andreas_threefolds.txt` and verifies that all
of the entries are correct.

Currently, we only test if the degree matrix, anticanonical class and the Picard number 
is as expected, and if they all are gorenstein.
*)

$include "../complexity_one.mpl"

with(convex):
with(ComplexityOne):
with(CodeTools):

t1 := time():

printf("Parsing and verifying gorenstein_database.txt...\n"):

Ps := ImportPMatrixList("../databases/andreas_threefolds.txt"):

t2 := time():

printf("Parsing succesfull. Performing gorenstein tests...\n"):

# Check the gorenstein condition for every P-matrix.
for i from 1 to nops(Ps) do
    Test(isGorenstein(TVarOne(Ps[i])), true, quiet, label = cat("Row: ", i, ", Gorenstein test")):
end do:

t3 := time():
printf("Time for verifying degree matrix : %gs\n", t2 - t1):
printf("Time for gorentein tests: %gs\n", t3 - t2):