# see License.txt for copyright and terms of use

# Included makefile for testing alloctool.

ifndef TEST_MAKEFILE
$(error This makefile should be included in Test.incl.mk, not used stand-alone)
endif

.PHONY: alloctool-check
alloctool-check:
# check that it can parse C/C++ that has qualifiers in it
	./alloctool -fa-print-stack-alloc-addr-taken \
           Test/stack_alloc_parse_qual.cc \
           > /dev/null
# check -fa-print-stack-alloc
	./alloctool -fa-print-stack-alloc Test/stack_alloc1.cc \
           > Test/stack_alloc1.cc.out
	diff Test/stack_alloc1.cc.cor Test/stack_alloc1.cc.out
# check -fa-print-stack-alloc-addr-taken
	./alloctool -fa-print-stack-alloc-addr-taken Test/stack_alloc2.cc \
           > Test/stack_alloc2.cc.out
	diff Test/stack_alloc2.cc.cor Test/stack_alloc2.cc.out
# check -fa-heapify-stack-alloc-addr-taken
	./alloctool -fa-heapify-stack-alloc-addr-taken Test/stack_alloc3.c \
           > Test/stack_alloc3.c.patch.out
	diff Test/stack_alloc3.c.patch.cor Test/stack_alloc3.c.patch.out
