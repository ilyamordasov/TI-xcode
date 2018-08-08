//
//  ADS1298_Configs.swift
//  TI
//
//  Created by Ilya Mordasov on 08/08/2018.
//  Copyright © 2018 Ilya Mordasov. All rights reserved.
//

import Cocoa

class ADS1298_Configs
{
    public let labels:Array<String> = ["CONFIG1", "CONFIG2", "CONFIG3", "LOFF", "CH1SET", "CH2SET", "CH3SET", "CH4SET", "CH5SET", "CH6SET", "CH7SET", "CH8SET", "RLD_SENSP", "RLD_SENSN", "LOFF_SENSP", "LOFF_SENSN", "LOFF_FLIP" , "GPIO", "PACE", "RESP", "CONFIG4", "WCT1", "WCT2"]
    
    public let addr:Array<UInt8> = [0x01, 0x02, 0x03, 0x17, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x18, 0x19]
    
    public let configs = [
        [[1, 0, 0, 0, 0, 1, 1, 0],[true, true, true, false, false, true, true, true], [true]], //CONFIG1
        [[0, 0, 0, 1, 0, 1, 0, 0],[false, false, true, true, false, true, true, true], [true]], //CONFIG2
        [[1, 1, 0, 0, 1, 1, 1, 0],[true, false, true, true, true, true, true, true], [true]], //CONFIG3
        [[0, 0, 0, 0, 0, 0, 1, 0],[true, true, true, true, true, true, true, true], [true]], //LOFF
        [[0, 1, 1, 0, 0, 0, 0, 0],[true, true, true, true, false, true, true, true], [true]], //CH1SET
        [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH2SET
        [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH3SET
        [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH4SET
        [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH5SET
        [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH6SET
        [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH7SET
        [[1, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, false, true, true, true], [true]], //CH8SET
        [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //RLD_SENSP
        [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //RLD_SENSN
        [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //LOFF_SENSP
        [[0, 0, 0, 0, 0, 0, 0, 1],[true, true, true, true, true, true, true, true], [false]], //LOFF_SENSN
        [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]], //LOFF_FLIP
        [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]], //GPIO
        [[0, 0, 0, 0, 0, 0, 0, 0],[false, false, false, true, true, true, true, true], [false]], //PACE
        [[0, 0, 1, 0, 0, 0, 0, 0],[true, true, false, true, true, true, true, true], [false]], //RESP
        [[1, 1, 1, 0, 1, 1, 1, 0],[true, true, true, false, true, true, true, false], [false]], //CONFIG4
        [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]], //WCT1
        [[0, 0, 0, 0, 0, 0, 0, 0],[true, true, true, true, true, true, true, true], [false]] //WCT2
    ]
    
    init()
    {
        print("ECG_DataSet init")
    }
}
