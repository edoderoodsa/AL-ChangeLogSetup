pageextension 50602 "ChangeLogSetupExt" extends "Change Log Setup"
{
    actions
    {
        addlast("&Setup")
        {
            action("Add Default Setup")
            {
                ApplicationArea = All;
                Image = Setup;
                Caption = 'Insert Default Setup';
                ToolTip = 'Automagically fill the dynamic structure of a default setup for BC Change Log.';
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    ChangeLogSetup: Codeunit "ChangeLogSetup";
                    ConfirmAddSetupQst: Label 'Do you want to add the default setup to the existing setup?';
                begin
                    if Confirm(ConfirmAddSetupQst, true) then
                        ChangeLogSetup.Run();
                end;
            }
            action("Delete")
            {
                ApplicationArea = All;
                Image = Delete;
                Caption = 'Delete Current Setup';
                ToolTip = 'Clear *all* the current Change Log Setup, so you can start from scratch.';
                Promoted = true;
                PromotedCategory = New;
                trigger OnAction()
                var
                    ChangeLogSetupTable: Record "Change Log Setup (Table)";

                    ConfirmAddSetupQst: Label 'Do you want to delete the default setup?';
                begin
                    if Confirm(ConfirmAddSetupQst, true) then
                        ChangeLogSetupTable.DeleteAll();
                end;
            }
        }    
    } 
}
