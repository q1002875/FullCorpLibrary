//
//  UIImage_extension.swift
//  FullSmartLife
//
//  Created by Luke on 2019/6/11.
//  Copyright © 2019 FULL CORP. All rights reserved.
//

import Foundation

extension UIImage {
    convenience init(view: UIView) {

        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage)!)

    }
    convenience init?(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        guard let cgImage = image?.cgImage else { return nil }
        self.init(cgImage: cgImage)
    }
    
    func scaleImageToSize() -> UIImage {
           
            let size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
           UIGraphicsBeginImageContext(size)
           
           self.draw(in: CGRect(origin: CGPoint.zero, size: size))
           
           let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
           
           UIGraphicsEndImageContext()
           
           return scaledImage!
       }
    
    enum gatewayStatus {
        static let onlineLight      = "home_Online_1"
        static let onlineDark       = "home_Online_2"
        static let offline          = "home_gray"
    }
    
    enum global {
        static let addIcon          = "Global_Icon_Add"
        static let add              = "Global_Icon_AddIcon"
        static let minus            = "Global_Icon_MinusIcon"
        static let easyModeOn       = "Global_Icon_Easymode_On"
        static let easyModeOff      = "Global_Icon_Easymode_Off"
        static let choose           = "Global_Icon_Choose"
        static let notChoose        = "Global_Icon_noChoose"
        static let selected         = "selected"
        static let spotlight        = "Global_Icon_Select_Image"
        static let unselected       = "unselected"
        static let stopWatch        = "Global_Icon_Delay"
        static let infinityIcon     = "Global_Icon_NotDelay"
        static let stopWatchInGrey  = "Global_Icon_DelayGrayColor"
        static let undefined        = "Global_Icon_Undefined"
        static let edit             = "Global_Icon_Edit"
        static let gateway          = "Global_Icon_Gateway"
        static let upperRightPlus    = "Global_Icon_Guide"
        static let record           = "Global_Icon_Record"
        static let refresh          = "Global_Icon_Refresh"
        static let menuIcon         = "Global_Icon_MenuFilled"
        static let highlight        = "Global_Icon_Select_Image"
        static let refreshRound     = "refreshIcon"
        static let trash            = "Global_Icon_Trash"
        static let moreOperation    = "Global_Icon_MoreOperation"
        static let set              = "Global_Icon_set"
        static let toDoList1        = "Global_Icon_TodoList1"
        static let toDoList2        = "Global_Icon_TodoList2"
        enum instructionArrow {
            static let up           = "Global_Icon_Up"
            static let right        = "Global_Icon_Next"
            static let down         = "Global_Icon_Down"
            static let left         = "Global_Icon_Previous"
            static let thickRight   = "Global_Icon_ThickArrowRight"
            static let thickLeft    = "Global_Icon_ThickArrowLeft"
        }
        enum arrow {
            static let right        = "Global_Icon_R"
            static let left         = "Global_Icon_L"
        }
        enum satellite {
            static let green        = "Global_Icon_IsConnect"
            static let orange       = "Global_Icon_NotConnect"
        }
    }
    
    enum gatewayScene {
        case `default`
        case home
        case away
        case sleep
        var large: String {
            switch self {
            case .default:  return "Gateway"
            case .home:     return "home"
            case .away:     return "out"
            case .sleep:    return "sleep"
            }
        }
        var small: String {
            switch self {
            case .default:  return "mode_default"
            case .home:     return "mode_home"
            case .away:     return "mode_out"
            case .sleep:    return "mode_sleep"
            }
        }
    }
    
    enum actionCluster {
        static let `switch`         = "ActionCluster_Switch"
        static let lightLevel       = "ActionCluster_Lighting_Leve"
        static let curtain          = "ActionCluster_Curtains"
        static let lightColor       = "ActionCluster_Lighting_color"
        static let curtains         = "ActionCluster_Curtains"
        enum siren {
            static let `default`    = "ActionCluster_Siren"
            static let red          = "ActionCluster_Siren_Red"
            static let siren        = "ActionCluster_Siren-1"
        }
        enum gas {
            static let on           = "ActionCluster_Gas ON"
            static let off          = "ActionCluster_Gas OFF"
        }
        enum lighting {
            static let `default`    = "ActionCluster_Lighting"
            static let color        = "ActionCluster_Lighting_color"
            static let colorRGB     = "ActionCluster_Lighting_Color_RGB"
            static let level        = "ActionCluster_Lighting_Leve"
            
        }
        enum water {
            static let on           = "ActionCluster_Water ON"
            static let off          = "ActionCluster_Water OFF"
        }
    }
    enum displayCluster {
        static let temperature      = "DisplayCluster_Temperature"
        static let humidity         = "DisplayCluster_Humidity"
        static let pm2_5            = "DisplayCluster-PM2.5"
        static let energy           = "DisplayCluster_Energy"
        static let luminance1024    = "DisplayCluster_1024"
        static let luminance        = "DisplayCluster_Luminance"
        static let location         = "DisplayCluster_Location"
        static let damage           = "DisplayCluster_damage"
        static let dinning          = "DisplayCluster_dining"
        static let reading          = "DisplayCluster_Rain"
        static let home             = "DisplayCluster_home"
        static let sleep            = "DisplayCluster_sleep"
        static let safety           = "DisplayCluster_safety"
        static let rf               = "DisplayCluster_RF"
        static let rs485            = "DisplayCluster_RS485"
        static let waterMeter       = "DisplayCluster_WaterMeter"
        
        enum door {
            static let lock         = "DisplayCluster_Door_Lock"
            static let unlock       = "DisplayCluster_SmartCardReader_Unlock"
            static let closed       = "DisplayCluster_Door"
            static let opened       = "DisplayCluster_Door_Opened"
            static let toiletOpen   = "DisplayCluster_ToiletDoor_Opened"
            static let toiletClosed = "DisplayCluster_ToiletDoor_Closed"
            static let toiletUse    = "DisplayCluster_ToiletDoor_Used"
            static let toiletNotUse = "DisplayCluster_ToiletDoor_NotUsed"
        }
        enum glass {
            static let normal       = "DisplayCluster_Glass"
            static let red          = "DisplayCluster_Glass_Red"
        }
        enum controlPanel {
            static let on1          = "DisplayCluster_Ctrl_Panel_1"
            static let on2          = "DisplayCluster_Ctrl_Panel_2"
            static let on3          = "DisplayCluster_Ctrl_Panel_3"
        }
        enum bed {
            static let offBed       = "DisplayCluster_OffBed"
            static let getUp        = "DisplayCluster_GetUp"
            static let bedSide      = "DisplayCluster_Bedside"
            static let onBed        = "DisplayCluster_OnBed"
        }
        enum co2 {
            static let `default`    = "DisplayCluster_CO2"
            static let low          = "DisplayCluster-0-700"
            static let middle       = "DisplayCluster-700-1000"
            static let high         = "DisplayCluster-1000-2000"
            static let veryHigh     = "DisplayCluster-2000"
        }
        enum gas {
            static let normal       = "DisplayCluster_Gas"
            static let red          = "DisplayCluster_Gas_Red"
        }
        enum voc {
            static let green        = "DisplayCluster_voc_green"
            static let red          = "DisplayCluster_voc_red"
        }
        enum hcho {
            static let green        = "DisplayCluster_hcho_green"
            static let red          = "DisplayCluster_hcho_red"
        }
        enum smoke {
            static let normal       = "DisplayCluster_Smoke"
            static let red          = "DisplayCluster_Smoke_Red"
        }
        enum pir {
            static let normal       = "DisplayCluster_Pir"
            static let red          = "DisplayCluster_Pir_Red"
        }
        enum rain {
            static let raining      = "DisplayCluster_Rain"
            static let noRain       = "DisplayCluster_noRain"
        }
        enum water {
            static let normal       = "DisplayCluster_Water"
            static let red          = "DisplayCluster_Water_Red"
        }
        enum siren {
            static let normal       = "DisplayCluster_Siren"
            static let red          = "DisplayCluster_Siren_Red"
        }
        enum sos {
            static let normal       = "DisplayCluster_SOS"
            static let red          = "DisplayCluster_SOS_Red"
        }
        enum mControl {
            static let close        = "DisplayCluster_MControl_Close"
            static let on           = "DisplayCluster_MControl_On"
            static let open         = "DisplayCluster_MControl_Open"
            static let stop         = "DisplayCluster_MControl_Stop"
            static let stop1        = "DisplayCluster_MControl_Stop-1"
            static let under        = "DisplayCluster_MControl_Under"
        }
        enum fallDetection {
            static let normal       = "DisplayCluster-slip-normal"
            static let fall         = "DisplayCluster-slip-trigger"
        }
    }
    enum deviceIcon {
        static let batteryLow       = "low_power"
        static let bThermometer     = "Device_Icon_Bodythermometer"
        static let co2              = "Device_Icon_CO2"
        static let co2InColors      = "set_device_co2"
        static let thermoInColors   = "set_device_thermo"
        static let compositeSensor  = "Device_Icon_CompositeSensor"
        static let controlPanel     = "Device_Icon_CONTROLPANEL"
        static let cpn01            = "Device_Icon_CPN01"
        static let cpn02            = "Device_Icon_CPN02"
        static let curtains         = "Device_Icon_Curtains"
        static let curtainSwitch1   = "Device_Icon_CurtainSwitch"
        static let curtainSwitch2   = "Device_Icon_CurtainSwitch2"
        static let door             = "Device_Icon_Door"
        static let eDoorLock        = "Device_E-DoorLock"
        static let faucet           = "Device_Icon_Faucet"
        static let gasSensor        = "Device_Icon_Gas"
        static let gasControl       = "Device_Icon_GasControl"
        static let glass            = "Device_Icon_Glass"
        static let imager37         = "Device_Icon_Imager37"
        static let inside           = "Device_Icon_in"
        static let ipCam            = "Device_Icon_IPCam"
        static let ir               = "Device_Icon_IR"
        static let lightingController = "Device_Icon_LightingController"
        static let lightControl6plus = "Device_Icon_LightingController_6+"
        static let lighting         = "Device_Icon_Lighting"
        static let lightingRGB      = "Device_Icon_Lighting_RGB"
        static let lightSensor      = "Device_Icon_LightSensor"
        static let mapList          = "Device_Icon_mapList"
        static let outsite          = "Device_Icon_out"
        static let pir              = "Device_Icon_Pir"
        static let plug             = "Device_Icon_Plug"
        static let pm2_5            = "Device_Icon_PM2.5"
        static let qModule          = "Device_Icon_Q-module"
        static let remote4buttons   = "Device_Icon_Remote"
        static let remote6buttons   = "Device_Icon_Remote2"
        static let rf               = "Device_Icon_RF"
        static let rs485            = "Device_Icon_RS485"
        static let scenePanel       = "Device_Icon_SCENEPANEL"
        static let siren            = "Device_Icon_Siren"
        static let smartCardReader  = "Device_Icon_SmartCardReader"
        static let smartDoorLock    = "Device_Icon_SmartDoorLock"
        static let smokeSensor      = "Device_Icon_Smoke"
        static let solenoid         = "Device_Icon_Solenoid"
        static let sos              = "Device_Icon_SOS"
        static let sosRed           = "DisplayCluster_SOS_Red"
        static let th               = "Device_Icon_T&H"
        static let voice            = "Device_Icon_Vioce"
        static let waterSensor      = "Device_Icon_Water"
        static let waterStop        = "Device_Icon_WaterStop"
        static let selectedStar     = "Device_Icon_SelectedStar"
        static let unselectedStar   = "Device_Icon_UnselectedStar"
        static let nh3              = "Device_Icon_nh3"
        static let h2s              = "Device_Icon_h2s"
        static let indicator7       = "Device_Icon_indicator7"
        static let toiletIR         = "Device_Icon_toiletIR"
        static let fwPaper          = "Device_Icon_fwPaper"
        
        static let undefined        = "Device_Icon_Undefined"
    }
    
    enum yale {
        static let clock            = "ic_access_time_white_48pt"
        static let verifiedUser     = "ic_verified_user_white_48pt"
        static let coution          = "ic_report_problem_white_48pt"
        static let noPeople         = "ic_not_interested_48pt"
        enum battery {
            static let normal       = "ic_battery_full_white_48pt"
            static let alert        = "ic_battery_alert_white_48pt"
        }
    }
    
    enum rc {
        enum fourBtns {
            static let upperLeft    = "RC_4btns_UpperLeft"
            static let upperRight   = "RC_4btns_UpperRight"
            static let lowerLeft    = "RC_4btns_LowerLeft"
            static let lowerRight   = "RC_4btns_LowerRight"
            static let background   = "RC_4btns_Background"
        }
        enum sixBtns {
            static let upperLeft    = "RC_6btns_UpperLeft"
            static let upperRight   = "RC_6btns_UpperRight"
            static let left         = "RC_6btns_Left"
            static let right        = "RC_6btns_Right"
            static let lowerLeft    = "RC_6btns_LowerLeft"
            static let lowerRight   = "RC_6btns_LowerRight"
            static let background   = "RC_6btns_Background"
        }
    }
    
    enum rf {
        static let setting              = "RF_Setting"
        static let listIcon             = "RF_List_icon"
        static let host                 = "RF_Host"
        static let macroList            = "macro_List"
        enum buttons {
            enum general {
                static let right        = "RF_right"
                static let left         = "RF_left"
                static let up           = "RF_up"
                static let down         = "RF_down"
                static let enter        = "RF_enter"
                static let powerSwitch  = "RF_power"
                static let input        = "RF_input"
                static let list         = "RF_List_icon"
            }
            enum progress {
                static let play         = "RF_play"
                static let pause        = "RF_pause"
                static let stop         = "RF_stop"
                static let rewind       = "RF_<<"
                static let fastForward  = "RF_>>"
                static let toBegin      = "RF_|<<"
                static let next         = "RF_>>|"
            }
            enum volumn {
                static let down         = "RF_vol_minus"
                static let up           = "RF_vol_plus"
                static let mute         = "RF_mute"
            }
            enum chanel {
                static let down         = "RF_ch_down"
                static let up           = "RF_ch_up"
            }
            enum numbers {
                static let no0          = "RF_no_00"
                static let no1          = "RF_no_01"
                static let no2          = "RF_no_02"
                static let no3          = "RF_no_03"
                static let no4          = "RF_no_04"
                static let no5          = "RF_no_05"
                static let no6          = "RF_no_06"
                static let no7          = "RF_no_07"
                static let no8          = "RF_no_08"
                static let no9          = "RF_no_09"
                static let no10         = "RF_no_10"
                static let no11         = "RF_no_11"
                static let no12         = "RF_no_12"
            }
        }
        enum device {
            static let host         = "RF_Host"
            
        }
        enum learn {
            static let no1          = "RF_Learn_1"
            static let no2          = "RF_Learn_2"
        }
        enum operating {
            static let no1          = "RF_Operating_1"
            static let no2          = "RF_Operating_2"
        }
        enum panel {
            static let no0          = "RF_Panel_0"
            static let no1          = "RF_Panel_1"
            static let no2          = "RF_Panel_2"
            static let no3          = "RF_Panel_3"
            static let no4          = "RF_Panel_4"
        }
        enum settingStep {
            static let step1        = "RF_Step1"
            static let step2        = "RF_Step2"
            static let step3        = "RF_Step3"
        }
        enum deviceIcon {
            static let lightBulb    = "RF_id0"
            static let tv           = "RF_id1"
            static let stereo       = "RF_id2"
            static let mediaPlayer  = "RF_id3"
            static let audioControl = "RF_id4"
            static let chanelBox    = "RF_id5"
            static let caTv         = "RF_id6"
            static let cdPlayer     = "RF_id7"
            static let fan          = "RF_id8"
            static let airPurifier  = "RF_id9"
        }
    }
    
    enum mode {
        enum home {
            static let area         = "Home_Area"
            static let automation   = "Home_Automation"
            static let group        = "Home_Gorup"
            static let schedule     = "Home_Schedule"
            static let selectAll    = "Home_Select All"
            static let sensors      = "Home_Sensor"
            static let `switch`     = "Home_Switch"
        }
        static let banner           = "mode_banner"
    }
    enum smartDoor {
        static let countdown        = "countdown"
        static let counter          = "counter"
        enum openDoorSource {
            static let password     = "source_0"
            static let app          = "source_1"
            static let fingerprint  = "source_2"
            static let card         = "source_3"
        }
    }
    enum background {
        static let background1      = "background1"
        static let background2      = "background2"
        static let background3      = "background3"
        static let background4      = "background4"
        static let background5      = "background5"
        static let background6      = "background6"
        
        static let coustom          = "modeCoustom"
        static let sleep            = "modeSleep"
        static let goOut            = "modeGoout"
        static let home             = "modeHome"
        
        static let welcomeImage     = "welcome_image"
        
        static let backgroundBlue      = "backgroundBlue"
        static let backgroundGreen     = "backgroundGreen"
        static let backgroundGray      = "backgroundGray"
        static let backgroundYellow    = "backgroundYellow"
        static let backgroundPink      = "backgroundPink"
        
        
        static let gwIconBlueDark   = "blueDark"
        static let gwIconBlueLight  = "blueLight"
        
        static let gwIconGreenDark   = "greenDark"
        static let gwIconGreenLight  = "greenLight"
        
        static let gwIconGrayDark   = "grayDark"
        static let gwIconGrayLight  = "grayLight"
        
        static let gwIconYellowDark  = "yellowDark"
        static let gwIconYellowLight = "yellowLight"
        
        static let gwIconPinkDark   = "pinkDark"
        static let gwIconPinkLight  = "pinkLight"
        
        
    }
    
    enum addGateway {
        static let gatewayWithPlug  = "006"
        static let flipGateway      = "007"
        static let scanQrCode       = "ScanQrCode"
    }
}
