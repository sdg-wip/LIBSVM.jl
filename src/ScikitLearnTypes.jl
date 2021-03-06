using Compat
import ScikitLearnBase: BaseClassifier, BaseRegressor

abstract type AbstractSVC<:BaseClassifier end
abstract type AbstractSVR<:BaseRegressor end

mutable struct SVC<:AbstractSVC
    kernel::Kernel.KERNEL
    gamma::Union{Float64,Symbol}
    weights::Union{Dict, Void}
    cost::Float64
    degree::Int32
    coef0::Float64
    tolerance::Float64
    shrinking::Bool
    probability::Bool
    verbose::Bool

    fit::Union{SVM, Void}
end

mutable struct NuSVC<:AbstractSVC
    kernel::Kernel.KERNEL
    gamma::Union{Float64,Symbol}
    weights::Union{Dict, Void}
    nu::Float64
    cost::Float64
    degree::Int32
    coef0::Float64
    tolerance::Float64
    shrinking::Bool
    verbose::Bool

    fit::Union{SVM, Void}
end

mutable struct OneClassSVM<:AbstractSVC
    kernel::Kernel.KERNEL
    gamma::Union{Float64,Symbol}
    nu::Float64
    cost::Float64
    degree::Int32
    coef0::Float64
    tolerance::Float64
    shrinking::Bool
    verbose::Bool

    fit::Union{SVM, Void}
end

mutable struct NuSVR<:AbstractSVR
    kernel::Kernel.KERNEL
    gamma::Union{Float64,Symbol}
    nu::Float64
    cost::Float64
    degree::Int32
    coef0::Float64
    tolerance::Float64
    shrinking::Bool
    verbose::Bool

    fit::Union{SVM, Void}
end

mutable struct EpsilonSVR<:AbstractSVR
    kernel::Kernel.KERNEL
    gamma::Union{Float64,Symbol}
    epsilon::Float64
    cost::Float64
    degree::Int32
    coef0::Float64
    tolerance::Float64
    shrinking::Bool
    verbose::Bool

    fit::Union{SVM, Void}
end

"""
Linear SVM using LIBLINEAR
"""
mutable struct LinearSVC<:BaseClassifier
    solver::Linearsolver.LINEARSOLVER
    weights::Union{Dict, Void}
    tolerance::Float64
    cost::Float64
    p::Float64
    bias::Float64
    verbose::Bool

    fit::Union{LIBLINEAR.LinearModel, Void}
end

#Map types to Int for Libsvm C api
const SVMTYPES = Dict{Type, Int32}(
            SVC => 0,
            NuSVC => 1,
            OneClassSVM => 2,
            EpsilonSVR => 3,
            NuSVR => 4)
