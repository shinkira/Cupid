classdef AddPosTrans < AddTrans
    % AddPosTrans(BasisRV,Addend): Shifts the BasisRV by the specified additive constant which is constrained to be positive.
    % NEWJEFF: MLSE changes parm values directly, so it could produce an addend below zero.
    
    methods
        
        function obj=AddPosTrans(varargin) % BasisDist,Addend
            obj=obj@AddTrans;
            obj.FamilyName = 'AddPosTrans';
            switch nargin
                case 0
                case 2
                    obj.Setup(varargin{:});
                otherwise
                    ME = MException('AddPosTrans:Constructor','AddPosTrans constructor needs 0 or 2 arguments.');
                    throw(ME);
            end
        end

        function TransReals = TransParmsToReals(obj,Parms,~)
            TransReals = sqrt(Parms(end));
        end
        
        function TransParms = TransRealsToParms(obj,Reals,~)
            TransParms = Reals(end)^2;
        end
        
    end  % methods
    
end  % class AddPosTrans


