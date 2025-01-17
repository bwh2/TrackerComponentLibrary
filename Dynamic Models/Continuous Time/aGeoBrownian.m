function [aVal,aJacob,aHess,papt]=aGeoBrownian(x,t,a)
%AGEOBROWNIAN This provides the drift function value matrix of the
%             multivariate geometric Brownian motion process, also known as
%             the Black- Scholes models. The stochastic differential
%             equation for the ith component of the model is:
%             dx(i)=a(i)*x(i) dt+sum_{j=1}^m DMat(i,j)x(i) dw(j) 
%             where dw is the differential of a Wiener process and a is a
%             vector of constants. This just implements a.*x. This drift
%             function goes with the diffusion function DGeoBrownian.
%
%INPUTS: x The xDimX1 target state vector.
%        t An unused time component so that this function can be used with
%          Runge-Kutta methods that expect the function to take two
%          parameters.
%        a The xDimX1 coefficient vector.
%
%OUTPUTS: aVal The xDimXN time-derivative of the state vector under the
%              linear motion model.
%       aJacob The xDimXxDim Jacobian of aVal. This is such that
%              aJacob(:,k) is the partial derivative of aVal with respect
%              to the kth element of x.
%        aHess The xDimXxDimXxDim hypermatrix such that aHess(:,k1,k2) is
%              the second partial derivative of aVal with respect to
%              elements k1 and k2 of x (all zero in this instance). It is
%              the same for all x.
%         papt The xDimX1 partial derivative of aVal with respect to t (all
%              zero in this instance).
%
%The model is given in Chapter 2.4 of [1].
%
%REFERENCES:
%[1] E. Platen and N. Bruti-Liberati, Numerical Solution of Stochastic
%    Differential Equations with Jumps in Finance. Berlin: Springer-Verlag,
%    2010.
%
%December 2018 David F. Crouse, Naval Research Laboratory, Washington D.C.
%(UNCLASSIFIED) DISTRIBUTION STATEMENT A. Approved for public release.

aVal=x.*a;

if(nargout>1)
    aJacob=diag(a);
    if(nargout>2)
        xDim=length(x);
        aHess=zeros(xDim,xDim,xDim);
        
        if(nargout>3)
            papt=zeros(xDim,1);
        end
    end
end
end

%LICENSE:
%
%The source code is in the public domain and not licensed or under
%copyright. The information and software may be used freely by the public.
%As required by 17 U.S.C. 403, third parties producing copyrighted works
%consisting predominantly of the material produced by U.S. government
%agencies must provide notice with such work(s) identifying the U.S.
%Government material incorporated and stating that such material is not
%subject to copyright protection.
%
%Derived works shall not identify themselves in a manner that implies an
%endorsement by or an affiliation with the Naval Research Laboratory.
%
%RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE OF THE
%SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO INDEMNIFY THE NAVAL
%RESEARCH LABORATORY FOR ALL THIRD-PARTY CLAIMS RESULTING FROM THE ACTIONS
%OF RECIPIENT IN THE USE OF THE SOFTWARE.
