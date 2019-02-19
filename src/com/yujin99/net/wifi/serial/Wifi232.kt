package com.yujin99.net.wifi.serial

import org.apache.commons.net.telnet.TelnetClient
import java.io.PrintStream

open class Wifi232 {
    val telnetClient by lazy {
        TelnetClient().apply {
            connect("192.168.11.251", 8899)
//            connect("192.168.165.214",23)
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
//        while (true) { //读取Server返回来的数据，直到读到登陆标识，这个时候认为可以输入用户名
//            size = telGetStream.read(b)
//            if (-1 != size) {
//                sBuffer.append(String(b, 0, size))
//            } else {
//                break
//            }
//        }
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
}

fun main(args: Array<String>) {
//    System.out.println("111")
//    System.out.println(Wifi232().sendCmd("DLR11111111ZDRR11111111Z"))
    System.out.println("anbdfasdfjlsa@3123454252532424".split("@")[0])
}