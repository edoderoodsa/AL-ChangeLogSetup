codeunit 50602 "ChangeLogSetup"
{
    trigger OnRun()
    begin
        SetupBasicChangeLog(true);
    end;

    local procedure SetupBasicChangeLog(ActivateMe: Boolean)
    var
        ChangeLogSetup: Record "Change Log Setup";

        ChangeLogEntry: Record "Change Log Entry";  //table405
    begin

        if not ChangeLogSetup.Get() then
            ChangeLogSetup.Init();
        ChangeLogSetup."Change Log Activated" := ActivateMe;
        ChangeLogSetup.Modify(true);

        AddLogTable(3, 6);
        AddLogTable(8, 11);
        AddLogTable(13, 14);
        AddLogTable(91, 94); //Customer Posting Group
        AddLogTable(250, 252); //Gen. Business Posting Group
        AddLogTable(311, 315); //
        AddLogTable(324, 326); //VAT Product Posting Group
        AddLogTable(402, 404); //
        AddLogTable(30); //Item Translation
        AddLogTable(42); //Rounding Method
        AddLogTable(50); //Accounting Period
        AddLogTable(79); //Company Information
        AddLogTable(98); //General Ledger Setup
        AddLogTable(131); //Incoming Documents Setup
        AddLogTable(135); //Acc. Sched. KPI Web Srv. Setup
        AddLogTable(152); //Resource Group
        AddLogTable(200); //Work Type
        AddLogTable(204); //Unit of Measure
        AddLogTable(208); //Job Posting Group
        AddLogTable(242); //
        AddLogTable(247); //
        AddLogTable(248); //VAT Reg. No. Srv Config
        AddLogTable(277); //Bank Account Posting Group
        AddLogTable(321); //Tax Group
        AddLogTable(232); //VAT Business Posting Group
        AddLogTable(340); //Customer Discount Group
        AddLogTable(341); //Item Discount Group
        AddLogTable(407); //
        AddLogTable(443); //
        AddLogTable(487); //
        AddLogTable(500); //
        AddLogTable(550); //
        AddLogTable(743); //
        AddLogTable(746); //VAT Reports Configuration
        AddLogTable(760); //
        AddLogTable(762); //
        AddLogTable(763); //
        AddLogTable(770); //
        AddLogTable(800); //
        AddLogTable(801); //
        AddLogTable(843); //
        AddLogTable(869); //
        AddLogTable(888); //
        AddLogTable(905); //
        AddLogTable(959); //
        AddLogTable(980); //
        AddLogTable(1050); //
        AddLogTable(1060); //
        AddLogTable(1108); //
        AddLogTable(1140); //
        AddLogTable(1200); //
        AddLogTable(1270); //
        AddLogTable(1275); //
        AddLogTable(1307); //
        AddLogTable(1312); //
        AddLogTable(1319); //
        AddLogTable(1366); //
        AddLogTable(1432); //
        AddLogTable(1512); //
        AddLogTable(1601); //
        AddLogTable(1650); //
        AddLogTable(1660); //
        AddLogTable(1802); //
        AddLogTable(1803); //
        AddLogTable(1806); //
        AddLogTable(1807); //
        AddLogTable(1827); //
        AddLogTable(1853); //
        AddLogTable(1876); //
        AddLogTable(1877); //
        AddLogTable(1878); //
        AddLogTable(1879); //
        AddLogTable(1950); //
        AddLogTable(1996); //
        AddLogTable(2020); //
        AddLogTable(2110); //
        AddLogTable(2118); //
        AddLogTable(2509); //
        AddLogTable(2580); //
        AddLogTable(2681); //
        AddLogTable(2682); //
        AddLogTable(2850); //
        AddLogTable(3700); //
        AddLogTable(3901); //
        AddLogTable(3902); //
        AddLogTable(4509); //
        AddLogTable(4760); //
        AddLogTable(4810); //
        AddLogTable(5079); //
        AddLogTable(5095); //
        AddLogTable(5122); //
        AddLogTable(5218); //
        AddLogTable(5264); //
        AddLogTable(5268); //
        AddLogTable(5269); //
        AddLogTable(5305); //
        AddLogTable(5310); //
        AddLogTable(5324); //
        AddLogTable(5330); //
        AddLogTable(5388); //Post Configuration
        AddLogTable(5466); //
        AddLogTable(5515); //
        AddLogTable(5603); //
        AddLogTable(5604); //
        AddLogTable(5605); //
        AddLogTable(5606); //FA Posting Group
        AddLogTable(5649); //FA Posting Group Buffer
        AddLogTable(5719); //
        AddLogTable(5769); //
        AddLogTable(5813); //
        AddLogTable(5911); //
        AddLogTable(5928); //
        AddLogTable(5945); //
        AddLogTable(5945); //
        AddLogTable(6060); //
        AddLogTable(6081); //
        AddLogTable(6300); //
        AddLogTable(6303); //
        AddLogTable(6304); //Power BI User Configuration
        AddLogTable(6309); //
        AddLogTable(6565); //
        AddLogTable(6721); //
        AddLogTable(7006); //
        AddLogTable(7008); //
        AddLogTable(7200); //
        AddLogTable(7880); //
        AddLogTable(8451); //
        AddLogTable(8627); //
        AddLogTable(9176); //
        AddLogTable(9178); //
        AddLogTable(9180); //
        AddLogTable(9701); //
        AddLogTable(11408); //
        AddLogTable(20101); //
        AddLogTable(50101); //
        AddLogTable(73001); //
        AddLogTable(73002); //
        AddLogTable(73003); //
        AddLogTable(73702); //
        AddLogTable(73705); //
        AddLogTable(99000765); //
        AddLogTable(99000875); //

        AddGLAccountFields();
        AddCustomerFields();
        AddSupplierFields();
        AddItemFields();
    end;


    local procedure AddLogField(TableNo: Integer; FieldNo: Integer)
    var
        FieldSetup: Record "Change Log Setup (Field)"; //table404
        Object: Record AllObjWithCaption;
    begin
        if (Object.Get(Object."Object Type"::TableData, TableNo)) then begin
            FieldSetup.Init();
            FieldSetup.Validate("Table No.", TableNo);
            FieldSetup.Validate("Field No.", FieldNo);
            FieldSetup."Log Deletion" := true;
            FieldSetup."Log Insertion" := true;
            FieldSetup."Log Modification" := true;
            if not FieldSetup.Insert(true) then
                FieldSetup.Modify();
        end
    end;

    local procedure AddSupplierFields()
    begin
        AddChangeLogSomeFields(23);

        AddLogField(23, 1);//No
        AddLogField(23, 2);//Name
        AddLogField(23, 5);//Address
        AddLogField(23, 7);//City
        AddLogField(23, 21);//Posting Group
        AddLogField(23, 22);//Currency Code
        AddLogField(23, 27);//Payment Terms
        AddLogField(23, 29);//Purchaser Code
        AddLogField(23, 35);//Country Region
        AddLogField(23, 39);//Blocked
        AddLogField(23, 47);//Payment Method
        AddLogField(23, 86);//VAT Registration No.
        AddLogField(23, 90);//GLN
        AddLogField(23, 102);//Email
        AddLogField(23, 109);//Tax Liable
        AddLogField(23, 5700);//Responsibility Center
        AddLogField(23, 7600);//Base Calendar Code
        AddLogField(23, 8510);//Over-Receipt Code
    end;

    local procedure AddItemFields()
    begin
        AddChangeLogSomeFields(27);

        AddLogField(27, 1);//No.
        AddLogField(27, 3);//Description
        AddLogField(27, 8);//Base Unit of Measure
        AddLogField(27, 11);//Inventory Posting Group
        AddLogField(27, 16);//Statistics Group
        AddLogField(27, 18);//Unit Price
        AddLogField(27, 20);//Profit%
        AddLogField(27, 22);//Unit Cost
        AddLogField(27, 31);//Vendor No.
        AddLogField(27, 47);//Tariff No.
        AddLogField(27, 49);//Country/Region Purchased Code
        AddLogField(27, 54);//Blocked
        AddLogField(27, 56);//Block Reason
        AddLogField(27, 87);//Price Includes VAT
        AddLogField(27, 90);//VAT Bus. Posting Gr. (Price)
        AddLogField(27, 91);//Gen. Prod. Posting Group
        AddLogField(27, 99);//VAT Prod. Posting Group
        AddLogField(27, 8003);//Sales Blocked
        AddLogField(27, 8004);//Purchaseing Blocked
    end;

    local procedure AddGLAccountFields()
    begin
        AddChangeLogSomeFields(15);

        AddLogField(15, 1);//
        AddLogField(15, 2);//Name
        AddLogField(15, 4);//Account Type
        AddLogField(15, 6);//Global Dimension 1 Code
        AddLogField(15, 7);//Global Dimension 2 Code
        AddLogField(15, 9);//Income/Balance
        AddLogField(15, 10);//Debit/Credit
        AddLogField(15, 13);//Blocked
        AddLogField(15, 14);//Direct Posting
        AddLogField(15, 43);//Gen. Posting Type
        AddLogField(15, 44);//Gen. Bus. Posting Group
        AddLogField(15, 45);//Gen. Prod. Posting Group
        AddLogField(15, 55);//Tax Liable
        AddLogField(15, 57);//VAT Bus. Posting Group
        AddLogField(15, 58);//VAT Prod. Posting Group
    end;

    local procedure AddCustomerFields()
    begin
        AddChangeLogSomeFields(18);

        AddLogField(18, 1);   //No.
        AddLogField(18, 2);   //Name
        AddLogField(18, 5);   //Address
        AddLogField(18, 7);   //City
        AddLogField(18, 20);  //Credit Limit (LCY)
        AddLogField(18, 22);  //Currency Code
        AddLogField(18, 23);  //Customer Price Group
        AddLogField(18, 27);  //Payment Terms Code
        AddLogField(18, 29);  //Salesperson Code
        AddLogField(18, 34);  //Customer Disc. Group
        AddLogField(18, 35);  //Country/Region Code
        AddLogField(18, 102); //Email
        AddLogField(18, 288); //Preferred Bank Account Code    
    end;

    local procedure AddLogTable(startID: Integer; endID: Integer)
    i: Integer;
    begin
        for i := startID to endID do
            AddLogTable(i);
    end;

    local procedure AddLogTable(tableID: Integer)
    var
        ChangeLogSetupTable: Record "Change Log Setup (Table)";
    begin
        ChangeLogSetupTable.Init();
        ChangeLogSetupTable.Validate("Table No.", TableID);
        ChangeLogSetupTable."Log Deletion" := ChangeLogSetupTable."Log Deletion"::"All Fields";
        ChangeLogSetupTable."Log Insertion" := ChangeLogSetupTable."Log Insertion"::"All Fields";
        ChangeLogSetupTable."Log Modification" := ChangeLogSetupTable."Log Modification"::"All Fields";
        if not ChangeLogSetupTable.Insert() then
            ChangeLogSetupTable.Modify();
    end;

    local procedure AddChangeLogSomeFields(TableNo: Integer)
    var
        ChangeLogSetupTable: Record "Change Log Setup (Table)";
    begin
        ChangeLogSetupTable.Validate("Table No.", TableNo);
        ChangeLogSetupTable."Log Deletion" := ChangeLogSetupTable."Log Deletion"::"Some Fields";
        ChangeLogSetupTable."Log Insertion" := ChangeLogSetupTable."Log Insertion"::"Some Fields";
        ChangeLogSetupTable."Log Modification" := ChangeLogSetupTable."Log Modification"::"Some Fields";
        if not ChangeLogSetupTable.Insert() then
            ChangeLogSetupTable.Modify();
    end;
}
