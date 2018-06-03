classdef utAddTransDisc < utDiscrete;
    
    properties (ClassSetupParameter)
        % Parm values to be combined sequentially.
        parmCase = {1 2 3 4 5};
    end
    
    properties
        Dummy1, Dummy2  % Provide the dummy variables that were used to make parent classes abstract.
        ThisCase
    end
    
    methods
        
        function testCase=utAddTransDisc(varargin)  % Constructor
            testCase=testCase@utDiscrete(varargin{:});
        end
        
    end
    
    methods (TestClassSetup, ParameterCombination='sequential')
        
        function ClassSetup(testCase,parmCase)
            % Computations specific to the AddTrans distribution.
            testCase.ThisCase  = parmCase;
            switch parmCase
                case 1
                    testCase.Dist = AddTrans(Binomial(53,.44),-2.3);
                    testCase.EstParmCodes = 'frf';
                case 2
                    testCase.Dist = AddTrans(BinomialMixed([(1:10)/11]),0.75);
                    testCase.SkipAllEst = true;
%                     testCase.EstParmCodes = 'ffffffffffr';  % P's cannot be varied but they are counted as parameters
                case 3
                    testCase.Dist = AddTrans(Geometric(0.1),-2.3);
                    testCase.EstParmCodes = 'rf';  % Don't adjust both constant and mean since they can trade off.
                case 4
                    testCase.Dist = AddTrans(Poisson(23.5),20.9);
                    testCase.EstParmCodes = 'rf';  % Don't adjust both constant and mean since they can trade off.
                case 5
                    testCase.Dist = AddTrans(UniformInt(0,100),1.65);
                    testCase.SkipAllEst = true;
%                     testCase.EstParmCodes = 'ffr';
            end
            fprintf('\nInitialized %s\n',testCase.Dist.StringName)

            testCase.Dist.XGrain = 10;  % Be lenient on accepting X values
            
            testCase.SetupXs;  % xvalues at which PDF, CDF, etc should be evaluated & xMLE used to estimate MLE

            % testCase.Dist.SearchOptions.MaxFunEvals = 30000;
            % testCase.Dist.SearchOptions.MaxIter = 20000;
            
            % Adjust tolerances as appropriate for this distribution & parameters:
            SetTolerances(testCase,0.01);
            
            utGenericMethodSetup(testCase);   % Initialize many standard computations
            
        end
        
    end  % TestClassSetup
    
end  % utAddTransDisc


