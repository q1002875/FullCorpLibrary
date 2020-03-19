//
//  NotificationName_Extension.swift
//  FullSmartLife
//
//  Created by Luke on 2018/10/24.
//  Copyright © 2018 FULL CORP. All rights reserved.
//

import UIKit

extension Notification.Name {
    
    static let appDidBecomeActive = Notification.Name("appDidBecomeActive")
    
    
    static let setRFRemoteControlResponse_QUEU_Complete = Notification.Name("setRFRemoteControlResponse_QUEU_完成")
    static let correctionTime_RESPONSE_QUEU_Complete = Notification.Name("correctionTime_RESPONSE_QUEU_完成")
    static let getPin_RESPONSE_QUEU_Complete = Notification.Name("getPin_RESPONSE_QUEU_完成")
    static let setPin_RESPONSE_QUEU_Complete = Notification.Name("SetPin_RESPONSE_QUEU_完成")
    static let didReceiveAutomationResponse = Notification.Name("didReceiveAutomationResponse")
    static let zigbee_actionResponse = Notification.Name("zigbee_zcl_ha_RESPONSE")
    static let viewGroupResponse = Notification.Name("ViewGroupResponse")
    static let storeSceneResponse = Notification.Name("StoreSceneResponse")
    static let getLogRecordResponse_QUEU_Complete = Notification.Name("GetLogRecordResponse_QUEU_完成")
    static let rawCommandResponse = Notification.Name("RawCommandResponse")
    static let smartDoorSettingRawCommand = Notification.Name("SmartDoorSettingRawCommand")
    static let getIRDeviceRepeater_Complete = Notification.Name("GetIRDeviceRepeater_完成")
    static let requestUserDeviceNameChange_QUEU_Complete = Notification.Name("要求改手機名稱_QUEU_完成")
    static let automationCheck_TRIGGER_Complete = Notification.Name("連動檢查_TRIGGER_完成")
    static let automationCheck_ACTION_Complete = Notification.Name("連動檢查_ACTION_完成")
    static let didReceivedGetAutomationResponse = Notification.Name("didReceivedGetAutomationResponse")
    static let didReceivedSetAutomationResponse = Notification.Name("didReceivedSetAutomationResponse")
    
    static let didKineticSwitchKeySOS_Complete = Notification.Name("didKineticSwitchKeySOS_Complete")
    
    static let gateway_set_mode_Response = Notification.Name("gateway_set_mode_Response")
    static let changeAreaNotifcation = Notification.Name("changeAreaNotifcation")
    static let getPermissionWithMobileID_QUEU_Complete = Notification.Name("GetPermissionWithMobileID_QUEU_完成")
    static let removePermissions_QUEU_Complete = Notification.Name("removePermissions_QUEU_完成")
    static let getPermissionsWithGatewayMAC_QUEU_Complete = Notification.Name("getPermissionsWithGatewayMAC_QUEU_完成")
    static let mobile_setPermissionNickName_QUEU_Complete = Notification.Name("mobile_setPermissionNickName_QUEU_完成")
    static let getPermissionsWithPermissionsID_QUEU_Complete = Notification.Name("getPermissionsWithPermissionsID_QUEU_完成")
    static let getAreaList_QUEU_Complete = Notification.Name("getAreaList_QUEU_完成")
    
    static let setAreaAndReload = Notification.Name("setAreaAndReload")
    
    static let setSingleDeviceAreaResponse_QUEU_Complete = Notification.Name("setSingleDeviceAreaResponse_QUEU_完成")
    static let getDataResponse_QUEU_Complete = Notification.Name("getDataResponse_QUEU_完成")
    static let getDataForRC_Response_QUEU_Complete = Notification.Name("getDataForRC_Response_QUEU_完成")
    static let getDataForRS485_Response_QUEU_Complete = Notification.Name("getDataForRS485_Response_QUEU_完成")
    static let doorTempDataUpdate_QUEU_Complete = Notification.Name("DoorTempDataUpdate_QUEU_完成")
    static let setDoorLockUser_QUEU_Complete = Notification.Name("SetDoorLockUser_QUEU_完成")
    static let setDoorLockTemporyary_QUEU_Complete = Notification.Name("SetDoorLockTemporyary_QUEU_完成")
    static let smartDoorLockDataSaved = Notification.Name("smartDoorLockDataSaved")
    static let getRFRepeaterResponse_QUEU_Complete = Notification.Name("getRFRepeaterResponse_QUEU_完成")
    static let delRFRemoteControlResponse_QUEU_Complete = Notification.Name("delRFRemoteControlResponse_QUEU_完成")
    static let getMarco_QUEU_Complete = Notification.Name("getMarco_QUEU_完成")
    static let IMAGER37_GET_AUTOMATION_QUEU_Complete = Notification.Name("IMAGER37_GET_AUTOMATION_QUEU_完成")
    static let RESEND_IMAGER37_GET_AUTOMATION_QUEU_Complete = Notification.Name("RESEND_IMAGER37_GET_AUTOMATION_QUEU_完成")
    static let userRoleChanged = Notification.Name("userRoleChanged")
    
    //Toilet
     static let getToiletGateWayList = Notification.Name("getToiletGateWayList")
     static let getTodoListToken = Notification.Name("getTodoListToken")
    
    
    //IR Transponder
    static let sendIrCommandSuccess = Notification.Name("IR-Success")
    static let irCommandDidLearn = Notification.Name("RCReceiveResponse")
    static let sendIrStudySuccess = Notification.Name("請求學習-Success")
    
    //RS485
    static let RS485_Device_Data_Retrieve = Notification.Name("Done_Loading_RS485_Device")
    static let RS485_modelId_485_received = Notification.Name("RS485_modelId_485_received")
    
    // received response
    static let didReceiveData = Notification.Name("didReceiveData")
    static let didReceivedListDeviceResponse = Notification.Name("Did_Received_ListDevice_Response")
    static let didReceivedImager37ListResponse = Notification.Name("Did_Received_Imager37List_Response")
    static let didReceivedUWBListResponse = Notification.Name("Did_Received_uwb_getList_Response")
    
    static let gatewayDetailUpdated = Notification.Name("gatewayDetailUpdated")
    static let gatewayDidAddDevice = Notification.Name("Did_Add_Device")
    static let gatewayDidRemoveDevice = Notification.Name("Did_Remove_Device")
    static let didReceivedDevicesValue = Notification.Name("Did_Received_DevicesValue")
    static let didReceivedDeviceName = Notification.Name("Did_Received_DeviceName")
    static let didReceiveReadAttributeResponse = Notification.Name("Did_Receive_ReadAttribute_Response")
    static let didReceiveCommonDefaultResponse = Notification.Name("didReceiveCommonDefaultResponse")
    
    static let didAddDeviceToList = Notification.Name("didAddDeviceToList")
    static let didRemoveDeviceFromList = Notification.Name("didRemoveDeviceFromList")
    
    //MultiSensor_6in1
    static let multiSensor6in1Unplugged = Notification.Name("multiSensor6in1Unplugged")
    
    //Kinetic Switch
    static let kineticSwitchDetailHandled = Notification.Name("kineticSwitchDetailHandled")
    
    static let kineticSwitchDataHandled = Notification.Name("kineticSwitchDataHandled")
    static let kineticSwitchCreated = Notification.Name("kineticSwitchCreated")
    static let kineticSwitchDeleted = Notification.Name("kineticSwitchDeleted")
    static let kineticSwitchKeyCreated = Notification.Name("kineticSwitchKeyCreated")
    static let kineticSwitchKeyDeleted = Notification.Name("kineticSwitchKeyDeleted")
    
    
    static let kineticSwitchKeyDidEdit = Notification.Name("kineticSwitchKeyDidEdit")
    
}

/*
 "correctionTime_RESPONSE_QUEU_完成"
 "getPin_RESPONSE_QUEU_完成"
 "SetPin_RESPONSE_QUEU_完成"
 "處理模式的_QUEU_完成"
 "zigbee_zcl_ha_RESPONSE"
 "ViewGroupResponse"
 "StoreSceneResponse"
 "GetLogRecordResponse_QUEU_完成"
 "RawCommandResponse"
 "SmartDoorSettingRawCommand"
 "GetIRDeviceRepeater_完成"
 "要求改手機名稱_QUEU_完成"
 "連動檢查_TRIGGER_完成"
 "IR-Success"
 "RCReceiveResponse"
 "GetLogRecordResponse_QUEU_完成"
 "gateway_set_mode_Response"
 "changeAreaNotifcation"
 "checkGatewayAdmin_QUEU_完成"
 "GetPermissionWithMobileID_QUEU_完成"
 "removePermissions_QUEU_完成"
 "getPermissionsWithGatewayMAC_QUEU_完成"
 "mobile_setPermissionNickName_QUEU_完成"
 "getPermissionsWithPermissionsID_QUEU_完成"
 "getAreaList_QUEU_完成"
 "setSingleDeviceAreaResponse_QUEU_完成"
 "getDataResponse_QUEU_完成"
 "getDataForRC_Response_QUEU_完成"
 "getDataForRS485_Response_QUEU_完成"
 "DoorDataUpdate_QUEU_完成"
 "SetDoorLockUser_QUEU_完成"
 "SetDoorLockTemporyary_QUEU_完成"
 "getRFRepeaterResponse_QUEU_完成"
 "delRFRemoteControlResponse_QUEU_完成"
 "getMarco_QUEU_完成"
 "IMAGER37_GET_AUTOMATION_QUEU_完成"
 "RESEND_IMAGER37_GET_AUTOMATION_QUEU_完成"
 "Done_Loading_RS485_Device"
 "RS485_modelId_485_received"
 "adminChange"
 
 */
