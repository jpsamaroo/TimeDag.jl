const _UNARY_STUFF = [
    (-, b1),
    (exp, b1),
    (log, b1),
    (log10, b1),
    (log2, b1),
    (sqrt, b1),
    (cbrt, b1),
    (inv, b1),
    (!, b_boolean),
]

@testset "unary" begin
    for (f, block) in _UNARY_STUFF
        @testset "$f" begin
            _test_unary_op(f, block)
        end
    end

    @testset "inverse identities" begin
        @test -(-n1) === n1
        @test inv(inv(n1)) === n1
        @test !(!n_boolean) === n_boolean
    end
end

const _BINARY_FUNCTIONS = [+, -, *, /, ^, min, max, >, <, >=, <=]

@testset "binary" begin
    for f in _BINARY_FUNCTIONS
        @testset "$f" begin
            # Test evaluations with different alignments.
            _test_binary_op(f)
        end
    end
end