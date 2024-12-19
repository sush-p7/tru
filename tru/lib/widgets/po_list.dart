// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tru/assets/app_colors.dart';

// Food Item Model
class FoodItem {
  final String id;
  final String code;
  final String name;
  final String price;
  final String qty;
  final String rate;

  FoodItem({
    required this.qty,
    required this.rate,
    required this.id,
    required this.code,
    required this.name,
    required this.price,
  });
}

class ProductLine {
  final String? pODetail_Company;
  final String? pODetail_OpenLine;
  final String? pODetail_VoidLine;
  final String? pODetail_PONUM;
  final String? pODetail_POLine;
  final String? pODetail_LineDesc;
  final String? pODetail_IUM;
  final String? pODetail_UnitCost;
  final String? pODetail_DocUnitCost;
  final String? pODetail_OrderQty;
  final String? pODetail_XOrderQty;
  final String? pODetail_Taxable;
  final String? pODetail_PUM;
  final String? pODetail_CostPerCode;
  final String? pODetail_PartNum;
  final String? pODetail_VenPartNum;
  final String? pODetail_CommentText;
  final String? pODetail_ClassID;
  final String? pODetail_RevisionNum;
  final String? pODetail_RcvInspectionReq;
  final String? pODetail_VendorNum;
  final String? pODetail_AdvancePayBal;
  final String? pODetail_DocAdvancePayBal;
  final String? pODetail_Confirmed;
  final String? pODetail_DateChgReq;
  final String? pODetail_QtyChgReq;
  final String? pODetail_PartNumChgReq;
  final String? pODetail_RevisionNumChgReq;
  final String? pODetail_ConfirmDate;
  final String? pODetail_ConfirmVia;
  final String? pODetail_PrcChgReq;
  final String? pODetail_PurchCode;
  final String? pODetail_OrderNum;
  final String? pODetail_OrderLine;
  final String? pODetail_Linked;
  final String? pODetail_ExtCompany;
  final String? pODetail_GlbCompany;
  final String? pODetail_ContractActive;
  final String? pODetail_ContractQty;
  final String? pODetail_ContractUnitCost;
  final String? pODetail_ContractDocUnitCost;
  final String? pODetail_Rpt1AdvancePayBal;
  final String? pODetail_Rpt2AdvancePayBal;
  final String? pODetail_Rpt3AdvancePayBal;
  final String? pODetail_Rpt1UnitCost;
  final String? pODetail_Rpt2UnitCost;
  final String? pODetail_Rpt3UnitCost;
  final String? pODetail_ContractQtyUOM;
  final String? pODetail_Rpt1ContractUnitCost;
  final String? pODetail_Rpt2ContractUnitCost;
  final String? pODetail_Rpt3ContractUnitCost;
  final String? pODetail_BaseQty;
  final String? pODetail_BaseUOM;
  final String? pODetail_BTOOrderNum;
  final String? pODetail_BTOOrderLine;
  final String? pODetail_VendorPartOpts;
  final String? pODetail_MfgPartOpts;
  final String? pODetail_SubPartOpts;
  final String? pODetail_MfgNum;
  final String? pODetail_MfgPartNum;
  final String? pODetail_SubPartNum;
  final String? pODetail_SubPartType;
  final String? pODetail_ConfigUnitCost;
  final String? pODetail_ConfigBaseUnitCost;
  final String? pODetail_ConvOverRide;
  final String? pODetail_BasePartNum;
  final String? pODetail_BaseRevisionNum;
  final String? pODetail_Direction;
  final String? pODetail_Per;
  final String? pODetail_MaintainPricingUnits;
  final String? pODetail_OverrideConversion;
  final String? pODetail_RowsManualFactor;
  final String? pODetail_KeepRowsManualFactorTmp;
  final String? pODetail_ShipToSupplierDate;
  final String? pODetail_Factor;
  final String? pODetail_PricingQty;
  final String? pODetail_PricingUnitPrice;
  final String? pODetail_UOM;
  final String? pODetail_GroupSeq;
  final String? pODetail_DocPricingUnitPrice;
  final String? pODetail_OverridePriceList;
  final String? pODetail_QtyOption;
  final String? pODetail_OrigComment;
  final String? pODetail_SmartString;
  final String? pODetail_SmartStringProcessed;
  final String? pODetail_DueDate;
  final String? pODetail_ContractID;
  final String? pODetail_LinkToContract;
  final String? pODetail_SelCurrPricingUnitPrice;
  final String? pODetail_ChangedBy;
  final String? pODetail_ChangeDate;
  final String? pODetail_PCLinkRemoved;
  final String? pODetail_TaxCatID;
  final String? pODetail_NoTaxRecalc;
  final String? pODetail_InUnitCost;
  final String? pODetail_DocInUnitCost;
  final String? pODetail_Rpt1InUnitCost;
  final String? pODetail_Rpt2InUnitCost;
  final String? pODetail_Rpt3InUnitCost;
  final String? pODetail_InAdvancePayBal;
  final String? pODetail_DocInAdvancePayBal;
  final String? pODetail_Rpt1InAdvancePayBal;
  final String? pODetail_Rpt2InAdvancePayBal;
  final String? pODetail_Rpt3InAdvancePayBal;
  final String? pODetail_InContractUnitCost;
  final String? pODetail_DocInContractUnitCost;
  final String? pODetail_Rpt1InContractUnitCost;
  final String? pODetail_Rpt2InContractUnitCost;
  final String? pODetail_Rpt3InContractUnitCost;
  final String? pODetail_DocExtCost;
  final String? pODetail_ExtCost;
  final String? pODetail_Rpt1ExtCost;
  final String? pODetail_Rpt2ExtCost;
  final String? pODetail_Rpt3ExtCost;
  final String? pODetail_DocMiscCost;
  final String? pODetail_MiscCost;
  final String? pODetail_Rpt1MiscCost;
  final String? pODetail_Rpt2MiscCost;
  final String? pODetail_Rpt3MiscCost;
  final String? pODetail_TotalTax;
  final String? pODetail_DocTotalTax;
  final String? pODetail_Rpt1TotalTax;
  final String? pODetail_Rpt2TotalTax;
  final String? pODetail_Rpt3TotalTax;
  final String? pODetail_TotalSATax;
  final String? pODetail_DocTotalSATax;
  final String? pODetail_Rpt1TotalSATax;
  final String? pODetail_Rpt2TotalSATax;
  final String? pODetail_Rpt3TotalSATax;
  final String? pODetail_TotalDedTax;
  final String? pODetail_DocTotalDedTax;
  final String? pODetail_Rpt1TotalDedTax;
  final String? pODetail_Rpt2TotalDedTax;
  final String? pODetail_Rpt3TotalDedTax;
  final String? pODetail_CommodityCode;
  final String? pODetail_VS_DiscAmt_c;
  final String? pODetail_VS_DiscPer_c;
  final String? pODetail_VS_PreDiscRate_c;
  final String? pODetail_VS_ReceiptTolAllowed_c;
  final String? pODetail_VS_ReceiptTolAllowedNegative_c;
  final String? pODetail_VS_UnitCost_c;
  final String? pODetail_VS_SpaceCertificate_c;
  final String? pODetail_VS_BatchNum_c;
  final String? pODetail_VS_MfgDate_c;
  final String? pODetail_VS_ExpDate_c;
  final String? pODetail_VS_BestBeforeDate_c;
  final String? pODetail_VS_COABestBeforeDate_c;
  final String? pODetail_VS_COAExpDate_c;
  final String? pODetail_VS_COAMfgDate_c;
  final String? pODetail_VS_COABatch_c;
  final String? pODetail_VS_COAReceived_c;
  final String? pODetail_VS_IMPONum_c;
  final String? pODetail_VS_ContainerNum_c;
  final String? pODetail_VS_Grossweight_c;
  final String? pODetail_VS_InvoiceDate_c;
  final String? pODetail_VS_InvoiceNum_c;
  final String? pODetail_VS_InvoiceValue_c;
  final String? pODetail_VS_JobNo_c;
  final String? pODetail_VS_NetWeight_c;
  final String? pODetail_VS_PlantCode_c;
  final String? pODetail_VS_PO_c;
  final String? pODetail_VS_Sector_c;
  final String? pODetail_VS_ContractNum_c;
  final String? pODetail_VS_AdditionalDescr_c;
  final String? pODetail_VS_SAPBatch_c;
  final String? pODetail_VS_VasDescription_c;
  final String? pODetail_VS_LotNum_c;
  final String? pODetail_VS_PartCrossDockDesc_c;
  final String? pODetail_VS_InPalletQty_c;
  final String? pODetail_VS_DockNo_c;
  final String? pODetail_VS_Location_c;
  final String? pODetail_VS_DamageQty_c;
  final String? pODetail_VS_RCI_LotNum_c;
  final String? pODetail_VS_RCI_PHRStatus_c;
  final String? pODetail_VS_RCI_RDD_c;
  final String? pODetail_VS_RCI_TNOPAL_c;
  final String? pODetail_VS_RCI_QualityStatus_c;

  ProductLine(
      this.pODetail_Company,
      this.pODetail_OpenLine,
      this.pODetail_VoidLine,
      this.pODetail_PONUM,
      this.pODetail_POLine,
      this.pODetail_LineDesc,
      this.pODetail_IUM,
      this.pODetail_UnitCost,
      this.pODetail_DocUnitCost,
      this.pODetail_OrderQty,
      this.pODetail_XOrderQty,
      this.pODetail_Taxable,
      this.pODetail_PUM,
      this.pODetail_CostPerCode,
      this.pODetail_PartNum,
      this.pODetail_VenPartNum,
      this.pODetail_CommentText,
      this.pODetail_ClassID,
      this.pODetail_RevisionNum,
      this.pODetail_RcvInspectionReq,
      this.pODetail_VendorNum,
      this.pODetail_AdvancePayBal,
      this.pODetail_DocAdvancePayBal,
      this.pODetail_Confirmed,
      this.pODetail_DateChgReq,
      this.pODetail_QtyChgReq,
      this.pODetail_PartNumChgReq,
      this.pODetail_RevisionNumChgReq,
      this.pODetail_ConfirmDate,
      this.pODetail_ConfirmVia,
      this.pODetail_PrcChgReq,
      this.pODetail_PurchCode,
      this.pODetail_OrderNum,
      this.pODetail_OrderLine,
      this.pODetail_Linked,
      this.pODetail_ExtCompany,
      this.pODetail_GlbCompany,
      this.pODetail_ContractActive,
      this.pODetail_ContractQty,
      this.pODetail_ContractUnitCost,
      this.pODetail_ContractDocUnitCost,
      this.pODetail_Rpt1AdvancePayBal,
      this.pODetail_Rpt2AdvancePayBal,
      this.pODetail_Rpt3AdvancePayBal,
      this.pODetail_Rpt1UnitCost,
      this.pODetail_Rpt2UnitCost,
      this.pODetail_Rpt3UnitCost,
      this.pODetail_ContractQtyUOM,
      this.pODetail_Rpt1ContractUnitCost,
      this.pODetail_Rpt2ContractUnitCost,
      this.pODetail_Rpt3ContractUnitCost,
      this.pODetail_BaseQty,
      this.pODetail_BaseUOM,
      this.pODetail_BTOOrderNum,
      this.pODetail_BTOOrderLine,
      this.pODetail_VendorPartOpts,
      this.pODetail_MfgPartOpts,
      this.pODetail_SubPartOpts,
      this.pODetail_MfgNum,
      this.pODetail_MfgPartNum,
      this.pODetail_SubPartNum,
      this.pODetail_SubPartType,
      this.pODetail_ConfigUnitCost,
      this.pODetail_ConfigBaseUnitCost,
      this.pODetail_ConvOverRide,
      this.pODetail_BasePartNum,
      this.pODetail_BaseRevisionNum,
      this.pODetail_Direction,
      this.pODetail_Per,
      this.pODetail_MaintainPricingUnits,
      this.pODetail_OverrideConversion,
      this.pODetail_RowsManualFactor,
      this.pODetail_KeepRowsManualFactorTmp,
      this.pODetail_ShipToSupplierDate,
      this.pODetail_Factor,
      this.pODetail_PricingQty,
      this.pODetail_PricingUnitPrice,
      this.pODetail_UOM,
      this.pODetail_GroupSeq,
      this.pODetail_DocPricingUnitPrice,
      this.pODetail_OverridePriceList,
      this.pODetail_QtyOption,
      this.pODetail_OrigComment,
      this.pODetail_SmartString,
      this.pODetail_SmartStringProcessed,
      this.pODetail_DueDate,
      this.pODetail_ContractID,
      this.pODetail_LinkToContract,
      this.pODetail_SelCurrPricingUnitPrice,
      this.pODetail_ChangedBy,
      this.pODetail_ChangeDate,
      this.pODetail_PCLinkRemoved,
      this.pODetail_TaxCatID,
      this.pODetail_NoTaxRecalc,
      this.pODetail_InUnitCost,
      this.pODetail_DocInUnitCost,
      this.pODetail_Rpt1InUnitCost,
      this.pODetail_Rpt2InUnitCost,
      this.pODetail_Rpt3InUnitCost,
      this.pODetail_InAdvancePayBal,
      this.pODetail_DocInAdvancePayBal,
      this.pODetail_Rpt1InAdvancePayBal,
      this.pODetail_Rpt2InAdvancePayBal,
      this.pODetail_Rpt3InAdvancePayBal,
      this.pODetail_InContractUnitCost,
      this.pODetail_DocInContractUnitCost,
      this.pODetail_Rpt1InContractUnitCost,
      this.pODetail_Rpt2InContractUnitCost,
      this.pODetail_Rpt3InContractUnitCost,
      this.pODetail_DocExtCost,
      this.pODetail_ExtCost,
      this.pODetail_Rpt1ExtCost,
      this.pODetail_Rpt2ExtCost,
      this.pODetail_Rpt3ExtCost,
      this.pODetail_DocMiscCost,
      this.pODetail_MiscCost,
      this.pODetail_Rpt1MiscCost,
      this.pODetail_Rpt2MiscCost,
      this.pODetail_Rpt3MiscCost,
      this.pODetail_TotalTax,
      this.pODetail_DocTotalTax,
      this.pODetail_Rpt1TotalTax,
      this.pODetail_Rpt2TotalTax,
      this.pODetail_Rpt3TotalTax,
      this.pODetail_TotalSATax,
      this.pODetail_DocTotalSATax,
      this.pODetail_Rpt1TotalSATax,
      this.pODetail_Rpt2TotalSATax,
      this.pODetail_Rpt3TotalSATax,
      this.pODetail_TotalDedTax,
      this.pODetail_DocTotalDedTax,
      this.pODetail_Rpt1TotalDedTax,
      this.pODetail_Rpt2TotalDedTax,
      this.pODetail_Rpt3TotalDedTax,
      this.pODetail_CommodityCode,
      this.pODetail_VS_DiscAmt_c,
      this.pODetail_VS_DiscPer_c,
      this.pODetail_VS_PreDiscRate_c,
      this.pODetail_VS_ReceiptTolAllowed_c,
      this.pODetail_VS_ReceiptTolAllowedNegative_c,
      this.pODetail_VS_UnitCost_c,
      this.pODetail_VS_SpaceCertificate_c,
      this.pODetail_VS_BatchNum_c,
      this.pODetail_VS_MfgDate_c,
      this.pODetail_VS_ExpDate_c,
      this.pODetail_VS_BestBeforeDate_c,
      this.pODetail_VS_COABestBeforeDate_c,
      this.pODetail_VS_COAExpDate_c,
      this.pODetail_VS_COAMfgDate_c,
      this.pODetail_VS_COABatch_c,
      this.pODetail_VS_COAReceived_c,
      this.pODetail_VS_IMPONum_c,
      this.pODetail_VS_ContainerNum_c,
      this.pODetail_VS_Grossweight_c,
      this.pODetail_VS_InvoiceDate_c,
      this.pODetail_VS_InvoiceNum_c,
      this.pODetail_VS_InvoiceValue_c,
      this.pODetail_VS_JobNo_c,
      this.pODetail_VS_NetWeight_c,
      this.pODetail_VS_PlantCode_c,
      this.pODetail_VS_PO_c,
      this.pODetail_VS_Sector_c,
      this.pODetail_VS_ContractNum_c,
      this.pODetail_VS_AdditionalDescr_c,
      this.pODetail_VS_SAPBatch_c,
      this.pODetail_VS_VasDescription_c,
      this.pODetail_VS_LotNum_c,
      this.pODetail_VS_PartCrossDockDesc_c,
      this.pODetail_VS_InPalletQty_c,
      this.pODetail_VS_DockNo_c,
      this.pODetail_VS_Location_c,
      this.pODetail_VS_DamageQty_c,
      this.pODetail_VS_RCI_LotNum_c,
      this.pODetail_VS_RCI_PHRStatus_c,
      this.pODetail_VS_RCI_RDD_c,
      this.pODetail_VS_RCI_TNOPAL_c,
      this.pODetail_VS_RCI_QualityStatus_c);
}

class CustomFoodList extends StatelessWidget {
  // List of food items
  final List<FoodItem> foodItems;
  final List<ProductLine>? productLine;

  const CustomFoodList({
    super.key,
    this.productLine,
    required this.foodItems,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              shrinkWrap: true, // Important for nested scrolling
              physics:
                  const AlwaysScrollableScrollPhysics(), // Ensures scrollability
              itemCount: foodItems.length,
              separatorBuilder: (context, index) => const Divider(
                // color: Colors.grey[300],
                height: 0,
                thickness: 0,
              ),
              itemBuilder: (context, index) {
                final item = foodItems[index];
                return Container(
                  // height: 100,
                  decoration: BoxDecoration(
                    // color: AppColors.primaryText, // Move color here
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(
                      '${item.id} - ${item.code}\n₹ ${item.price}',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w800),
                    ),
                    subtitle: Text(
                      '${item.name} \nQty -${item.qty}, Rate -${item.rate} ₹',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          color: AppColors.primaryText,
                          fontWeight: FontWeight.w500),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
