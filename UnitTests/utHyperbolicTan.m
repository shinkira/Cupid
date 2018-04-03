classdef utHyperbolicTan < utContinuous;
    
    properties (ClassSetupParameter)
        parmScale  = struct( 'p_005',.005 , 'p_01',.01 , 'p_1',.1 , 'p1',1 , 'p10',10 );
    end
    
    properties
       Dummy1, Dummy2  % Provide the dummy variables that were used to make parent classes abstract.
    end

    methods
        
        function testCase=utHyperbolicTan(varargin)  % Constructor
            testCase=testCase@utContinuous(varargin{:});
        end
        
    end
    
    methods (TestClassSetup, ParameterCombination='sequential')
        
        function ClassSetup(testCase,parmScale)
            % Computations specific to the HyperbolicTan distribution.
            testCase.Dist = HyperbolicTan(parmScale);
            fprintf('\nInitialized %s\n',testCase.Dist.StringName)

            SetupXs(testCase,100,2000);
            
            % Adjust tolerances as appropriate for this distribution & parameters:
            SetTolerances(testCase,0.002);  % Not very accurate
%            testCase.MLParmTolSE = 0.25;   % ML parameter estimation is not great
%            testCase.KurtRelTol = 0.004;
%            testCase.CenMomentAbsTol(2) = 
           
            utGenericMethodSetup(testCase);   % Initialize many standard computations

        end
        
    end  % TestClassSetup
    
end  % utHyperbolicTan


