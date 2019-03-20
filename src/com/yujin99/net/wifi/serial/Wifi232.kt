package com.yujin99.net.wifi.serial

import org.apache.commons.net.telnet.TelnetClient
import java.io.PrintStream

open class Wifi232 {
    val telnetClient by lazy {
        TelnetClient().apply {
            connect(IP, PORT)
        }
    }
    val telGetStream by lazy { telnetClient.inputStream } //读取命令的流
    val telPutStream by lazy { PrintStream(telnetClient.outputStream) } //写命令的流

    fun sendCmd(cmd: String): String {
        val b = ByteArray(1024)
        var size: Int
        val sBuffer = StringBuffer(300)
        telPutStream.println(cmd)
        System.out.println("Sended $cmd")

        closeAll()
        return sBuffer.toString()
    }

    private fun closeAll() {
        try {
            telPutStream.close()
            telGetStream.close()
            telnetClient.disconnect()
        }
        catch (e:Exception){
            e.printStackTrace()
        }
    }

    fun testTouch(s:String):String{
        System.out.println(s)
        return s
    }

    companion object {
        const val IP = "192.168.11.251"
        const val PORT = 8899
    }
}

fun main(args: Array<String>) {
//    TODO:test form here
//    System.out.println(Wifi232().sendCmd("DLR11111111ZDRR11111111Z"))
}