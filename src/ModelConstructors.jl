isdefined(Base, :__precompile__) && __precompile__(true)

module ModelConstructors

    using DataFrames, Dates, Distributed, Distributions
    using ForwardDiff, Nullables, Printf, Random
    using LinearAlgebra, OrderedCollections, SpecialFunctions

    import Base.isempty, Base.<, Base.min, Base.max, Base.length, Base.iterate, Base.size
    import Base.sum, Base.getindex, Base.-
    import Distributions.log2π, Distributions.params, Distributions.mean, Distributions.std
    import Distributions.pdf, Distributions.logpdf, Distributions.Distribution
    import Distributions.rand, Distributions.Matrixvariate, Distributions.LinearAlgebra
    import LinearAlgebra.rank
    import SpecialFunctions.gamma
    import UnPack: unpack
    export
        # distributions_ext.jl
        BetaAlt, GammaAlt, RootInverseGamma, DegenerateMvNormal, DegenerateDiagMvTDist,
        MatrixNormal, <=, logpdf, init_deg_mvnormal,

        # settings.jl
        Setting, get_setting,

        # observables.jl
        Observable, PseudoObservable, check_mnemonics,

        # defaults.jl
        default_settings!, default_test_settings!,

        # abstractmodel.jl
        AbstractModel, description,
        n_states, n_states_augmented, n_shocks_exogenous, n_shocks_expectational,
        n_equilibrium_conditions, n_observables, n_parameters, n_parameters_regime_switching, n_parameters_steady_state,
        n_parameters_free, n_pseudo_observables, get_dict, get_key,
        spec, subspec, saveroot, dataroot,
        data_vintage, data_id, cond_vintage,
        logpath, workpath, rawpath, tablespath, figurespath, inpath, filestring_base, workpath,
        rawpath, tablespath, figurespath, logpath, savepath, inpath, filestring,

        # parameters.jl
        parameter, parameter_ad, Transform, NullablePrior, AbstractParameter,
        Parameter, ParameterVector, ScaledParameter,
        UnscaledParameter, SteadyStateParameter, SteadyStateParameterGrid,
        transform_to_real_line, transform_to_model_space,
        differentiate_transform_to_real_line, differentiate_transform_to_model_space,
        update, update!, transform_to_model_space, transform_to_real_line, Interval,
        ParamBoundsError, Untransformed, SquareRoot, moments,
        prior, get_untransformed_values, parameters2namedtuple,

        # distributions_ext.jl
        Uniform, Exponential, Normal, BetaAlt, GammaAlt, RootInverseGamma, pdf, logpdf, rand,
        DegenerateMvNormal, rank, length, DgenerateDiagMvTDist, mean, std,
        MatrixNormal, size, params, truncmean,

        AbstractVectorParameter, VectorParameter, VectorParameterVector, ScaledVectorParameter,
        UnscaledVectorParameter, Untransformed,

        # regimes.jl
        set_regime_val!, regime_val, set_regime_prior!, regime_prior, set_regime_fixed!, regime_fixed,
        set_regime_valuebounds!, regime_valuebounds, toggle_regime!,

        # statistics.jl
        prior, posterior, posterior!,

        # util.jl
        info_print, warn_print, println, print, @test_matrix_approx_eq, @test_matrix_eq2,

        # Generic Model
        GenericModel,

        # Linear Regression
        LinearRegression

    	const VERBOSITY = Dict(:none => 0, :low => 1, :high => 2)

    include("parameters.jl")
    include("distributions_ext.jl")
    include("abstractmodel.jl")
    include("settings.jl")
    include("observables.jl")
    include("defaults.jl")
    include("statistics.jl")
    include("util.jl")
    include("regimes.jl")
    include("generic_model.jl")
    include("linear_regression.jl")
end
