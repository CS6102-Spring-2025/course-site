
# GF(2^8) mod R(X) = X^8 + X^4 + X^3 + X + 1
_.<X> = GF(2)[]
F.<X> = GF(2^8, modulus=X^8 + X^4 + X^3 + X +1)


# We are defining a mapping from GF(2^8)-->GF(2^2^2^2) 
# Let g = (g7, g6, g5, g4, g3, g2, g1, g0) \in GF(2^8)
# and b = (b7, b6, b5, b4, b3, b2, b1, b0) \in GF(2^2^2^2)
# We need a matrix A such that g = Ab, and then A^{-1} will be our desired matrix.
# This is as per the "Change of basis" strategy (See Wiki..)
# Let's assume g is in polynomial basis
# as per the slides we can write: g = [WZY, ZY, WY, Y, WZ, Z, W, 1]b, where each WZY, ZY etc are column vectors 
# (basically polynomials). As per the technique for "change of basis", each of these can be represented as an element of
# GF(2^8), which is basically the "old basis" here. In a nutshell, we want every product term (e.g. WZY) or single term (Y)
# to be elements of GF(2^8).

# Now the question is, how to determine W,Z,Y.
# They depends on 4 polynomials:
# R(X) = X^8 + X^4 + X^3 + X + 1 -- GF(2^8)
# S(W) = W^2 + W + 1 -- GF(2^2)
# Q(Z) = Z^2 + Z + N -- GF(2^2^2)
# P(Y) = Y^2 + Y + mu -- GF(2^2^2^2)

# Here we do not know the values of mu and N. Let's first get them.
# As per the slides, N is a root of the poly S(W). It should be in GF(2^2). 
# The irreducable poly of GF(2^2) is S(W). Let us find out its roots...
_.<U> = GF(2)[]
F22.<U> = GF(2^2, modulus=U^2 + U + 1)
print(F22.modulus().roots(F22)) 

# Well, the roots are U and U + 1. Now, GF(2^2) is a subfield of GF(2^8). So the same roots will also be there in GF(2^8).
# However, there representation will be different. To find out the representation, let us first find out the at least one root of U^2 + U + 1
# in GF(2^8). This is straightforward, just take modulo R(X). Let us (for convenience) denote the root in GF(2^8) as N. They are found as follows:
# Basically, we find N such that N^2 + N + 1 mod R(X) = 0

# Write your code here for finding N
#------------------------------------

N = 0
for n in range(256):
    N = F.fetch_int(n)
    if ( (N^2 + N + 1) == F(0)):
        print(hex(N.integer_representation())) 

print("Found N...")

# Let's associate U with N = 188. The U + 1 is then N = 189. This is also another root!!! 
# So, we found representations of both the roots in GF(2^8).

# Ok, let's (just) choose N = 188.
N = F.fetch_int(188)

# Next, we have to find mu. According to the theory, mu should be a root of the irreducable polynomial defining GF(2^4).
# There are two such polynomials: x^4 + x^3 + 1 and x^4 + x^3 + x^2 + x + 1.
# Once again, we find the root mod R(X). The rest of the logic is the same as the one for finding N. 

_.<V> = GF(2)[]
F24.<V> = GF(2^4, modulus=V^4 + V^3 + 1)
print(F24.modulus().roots(F24)) 
#print(F24(V^14))
# The roots are V, V^2, V^3 + 1, V^3 + V^2 + V. Now lets see the roots in X^4 + X^3 + 1 mod R(X)

mu = 0
for m in range(256):
    mu = F.fetch_int(m)
    if ( (mu^4 + mu^3 + 1) == F(0)):
        print(hex(mu.integer_representation()))     

# The first root is X^3 + X^2 + 1. We associate this with V in GF(2^4). Rest of the roots can be checked easily. 

#mu = 0
#for m in range(256):
#    mu = F.fetch_int(m)
#    if ( (mu^4 + mu^3 + mu^2 + mu + 1) == F(0)):
#        print(hex(mu.integer_representation())) 
           

print("Found mu...")

# We have total 4(8) values, we choose mu = 236
mu = F.fetch_int(236)

# Now, our polynomials are well-defined. We just need to find out roots of these polies mod R(X).
for y in range(256):
    Y = F.fetch_int(y)
    if (Y^2 + Y + mu == F(0)):
        print(Y.integer_representation())

print("Found Y...")

# Let's choose Y = 255
Y = F.fetch_int(255)


# Next, find W
for w in range(256):
    W = F.fetch_int(w)
    if (W^2 + W + 1 == F(0)):
        print(W.integer_representation())

print("Found W...")

# Let's choose W = 189
W = F.fetch_int(189)

# Finally, find Z
for z in range(256):
    Z = F.fetch_int(z)
    if (Z^2 + Z + N == F(0)):
        print(Z.integer_representation())

print("Found Z...")

# Let's choose W = 189
Z = F.fetch_int(92)

# All set!! Let's find out the products mod R(X)

# [WZY, ZY, WY, Y, WZ, Z, W, 1]
gamma_0 = F(1)
gamma_1 = F(W)
gamma_2 = F(Z)
gamma_3 = F(W*Z)
gamma_4 = F(Y)
gamma_5 = F(W*Y)
gamma_6 = F(Z*Y)
gamma_7 = F(W*Z*Y)

# Finally, create the matrix

V = F.vector_space(map = False)
a = [list(reversed(list(V(gamma_7)))), list(reversed(list(V(gamma_6)))), list(reversed(list(V(gamma_5)))), list(reversed(list(V(gamma_4)))), list(reversed(list(V(gamma_3)))), list(reversed(list(V(gamma_2)))), list(reversed(list(V(gamma_1)))), list(reversed(list(V(gamma_0))))]
A = matrix(a).transpose()
#print(A)

A_inv = ~A
print(A)


# Let's do some symbolic computation... We define symbolic variables g_7, g_6, g_5, g_4, g_3, g_2, g_1, g_0
vars = SR.var('g_7, g_6, g_5, g_4, g_3, g_2, g_1, g_0')
iMz = matrix(ZZ, A_inv)
#print(iMz)
#print(vector(vars))
#print("")
#print(iMz*vector(vars))

#(g_5 + g_7, g_1 + g_2 + g_3 + g_4 + g_5 + g_6, g_2 + g_3, g_2 + g_3 + g_4 + g_5 + g_6, g_2 + g_4, g_2 + g_7, g_1 + g_2 + g_4 + g_7, g_0 + g_1 + g_2 + g_5 + g_6 + g_7)
# So, let (g7, g6, g5, g4, g3, g2, g1, g0) be the input bits in GF(2^8).
# We get the following bits in GF(2^2^2^2)
#b7 = g5 + g7
#b6 = g1 + g2 + g3 + g4 + g5 + g6
#b5 = g2 + g3
#b4 = g2 + g3 + g4 + g5 + g6 
#b3 = g2 + g4 
#b2 = g2 + g7 
#b1 = g1 + g2 + g4 + g7  
#b0 = g0 + g1 + g2 + g5 + g6 + g7

# Let's check it..
g = F.fetch_int(201)
g7, g6, g5, g4, g3, g2, g1, g0 = list(reversed(list(V(g))))
#print(g7, g6, g5, g4, g3, g2, g1, g0)

b7 = g5 + g7
b6 = g1 + g2 + g3 + g4 + g5 + g6
b5 = g2 + g3 
b4 = g2 + g3 + g4 + g5 + g6 
b3 = g2 + g4 
b2 = g2 + g7 
b1 = g1 + g2 + g4 + g7  
b0 = g0 + g1 + g2 + g5 + g6 + g7

print(b7, b6, b5, b4, b3, b2, b1, b0)

# Should also get the same with matrix multiplication


#print(list(reversed(list(V(g)))))
b = A_inv * vector(list(reversed(list(V(g)))))
print(b)



# Now, we shall compute the inverse in the polynomial basis

# Input: b7, b6, b5, b4, b3, b2, b1, b0

# First, split things as  GF(2^4^2)
gamma_1 = [b7, b6, b5, b4]
gamma_0 = [b3, b2, b1, b0]

print(gamma_1)
print(gamma_0)

# Now write the inverse equation as different functions
def GFadd(alist, blist):
    # both list should have the same length
    l = len(alist)
    clist = []
    for i in range(l):
        clist.append(alist[i] + blist[i])
    return clist

def GFmult222(alist, blist):
    
    # Prepare to map to GF(2^2^2)
    Gamma_1 = alist[0:2] # in GF(2^2)
    Gamma_0 = alist[2:4] # in GF(2^2)
    
    Delta_1 = blist[0:2] # in GF(2^2)
    Delta_0 = blist[2:4] # in GF(2^2)
    
    M0 = GFmult22(Delta_0, Gamma_0)  # Multiplication in GF(2^2)
    #print(M0)
    A0 = GFadd(Delta_0 , Delta_1)
    A1 = GFadd(Gamma_0 , Gamma_1)
    M1 = GFmult22(A0, A1)           # Multiplication in GF(2^2)
    #print(M1)
    S1 = GFscale22N(Gamma_1)        # Scaling in GF(2^2) with N (just swapping)
    #print(S1)
    M2 = GFmult22(S1, Delta_1)      # Multiplication in GF(2^2)
    #print(M2)
    
    D1 = GFadd(M0 , M1)
    D0 = GFadd(M0 , M2)
    
    #print(Gamma_1)
    #print(Gamma_0)
    
    #print(Delta_1)
    #print(Delta_0)
    return D1, D0
    
def GFmult22(alist, blist):
    # Assume that lists have size 2
    l = len(alist)
        
    c1 = alist[0] 
    c0 = alist[1] 

    d1 = blist[0] 
    d0 = blist[1]
    
    r1 = c0*d0 + (c0 + c1)*(d0 + d1)
    r0 = c0*d0 + c1*d1        
    
    return [r1, r0]

def GFscale22N(alist):
    # Scaling with N
    #l = len(alist)
    return alist[1], alist[0]    

def GFinv22(alist):
    l = len(alist)
    return alist    

def GFsqsc222(alist):
    # length of list is 4
    Gamma_1 = alist[0:2] # in GF(2^2)
    Gamma_0 = alist[2:4] # in GF(2^2)
    
    #mu = N^2
    S1 = GFscale22N(Gamma_1)        # Scaling in GF(2^2) with N (just swapping)
    S0 = GFscale22N(Gamma_0)        # Scaling in GF(2^2) with N (just swapping)
    
    return 0

add_gamma_1_gamma_0 = GFadd(gamma_1, gamma_0)
#print(add_gamma_1_gamma_0)

mult_gamma_1_gamma_0 = GFmult222(gamma_1, gamma_0)

mu_gamma_2_222 = GFsqsc222(gamma_1)

#print(mult_gamma_1_gamma_0)
#delta_1 = 
#delta_0 = 



"""
# Let us consider the field GF((2^4)^2) with Poly Q(Y) = Y^2 + Y + mu
# We are trying to map GF((2^4)^2) -- > GF(2^8)
# So, we have to check the condition:
# for some alpha \in GF(2^8), Q(alpha) mod R(X) == 0 mod R(X)

# Let's first decide mu. According to the theory, mu should be a root of the irreducable polynomial defining GF(2^4).
# There are two such polynomials: x^4 + x^3 + 1 and x^4 + x^3 + x^2 + x + 1.
# But here is a catch: mu should be treated as an element in GF(2^8). So basically we have to find out an
# element in GF(2^8) which corresponds to a root of (one of the) polynomials mentioned above. 
# Now how to do that? -- Observe the fact even an element of GF(2^4) (which is basically a polynomial of max degree 3) 
# is also an element of GF(2^8). Since we are mapping to GF(2^8), we need every polynomial to be defined in that field.

# Let's first check the roots of the two irrreducable polynomials in GF(2^4)
# Case 1.   
_.<S> = GF(2)[]
F1.<S> = GF(2^4, modulus=S^4 + S^3 + 1)
print(F1.modulus().roots(F1))

#_.<T> = GF(2)[]
#F11.<T> = GF(2^4, modulus=T^4 + T^3 + T^2 + T + 1)
#print(F11.modulus().roots(F11))

R.<x> = PolynomialRing(F)
f1 = x^4 + x^3 + 1
print(f1.roots(F))


#P = (S^7 + S^6 + S^5 + S^3 + S^2)^4 + (S^7 + S^6 + S^5 + S^3 + S^2)^3 + 1
#P = ((S^3 + S^2 + 1)^3 + 1)^4 + ((S^3 + S^2 + 1)^3 + 1)^3 + 1
P =  (S^3 + S^2 + S + 1)^4 + (S^3 + S^2 + S + 1)^3 + 1
print(F1(P))
print("stop")

P1 = (X^7 + X^6 + X^5 + X^3 + X^2)^4 + (X^7 + X^6 + X^5 + X^3 + X^2)^3 + 1
print(F(P1))
"""



#for s in range(16):
#    S = F1.fetch_int(s)
#    print(S, S.integer_representation())


"""
R = GF(2)['s']
for p in R.polynomials(4):
    if p.is_irreducible():
        #print(p)
        #print(p.is_primitive())
        if (p.is_primitive()):
            print(p)
            print(p.roots(F1))
"""
#for s in range(16):
#    S = F1.fetch_int(s)
    #if (S.is_irreducible()):
    #    print(S)
#    if (S.is_primitive()):
#        print(S)    
        
#print(F1.modulus().roots(F1))
