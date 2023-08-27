- waste:
    instruction -> CPU
	ADD A, B        ; A+=B
	LEA C, [A, B]   ;  (load effectif address) C=A+B

- instruction per clock
	IPC:
        number of instruction per clock
	ILP:
        instruction level paralelism (execute multiple instructions in parallel)

- single instruction, multiple data:
    SIMD:
        Single Instruction Multiple Data, (handle mutiple datas with one instruction)
    SSE:
        PADDD, A, INPUT[] ; load 4 elements from INPUT and add them to A
                          ; instead of them add line by line from array
    	SSE     | 04 
    	AVX     | 08
    	AVX-512 | 16

- Caching:
    - load to memory / store in memory
    - each core has a set of memory L1, L2, L3
    - depends on size this memory slots get used
    - CPU -> L1(32kb) -> L2(256kb) -> L3 (8 Mbyte) -> memory (16 Gega)
    - to deeper your search for data the more time it takes

- Multithreading:
    - core is physical part in CPU
    - when reading data from caching, threads make difference
    - when reading data from memory, threads doesn't make that difference

- Python revisited:
- The Haversine Distance Problem:
- Clean code, Horrible Performance:

