package com.yujin99.net.wifi.serial

import org.jboss.arquillian.container.test.api.Deployment
import org.jboss.arquillian.junit.Arquillian
import org.jboss.shrinkwrap.api.ShrinkWrap
import org.jboss.shrinkwrap.api.asset.EmptyAsset
import org.jboss.shrinkwrap.api.spec.JavaArchive
import org.junit.runner.RunWith

@RunWith(Arquillian::class)
class Wifi232Test {

    @org.junit.Test
    fun getTelnetClient() {
    }

    @org.junit.Test
    fun getTelGetStream() {
    }

    @org.junit.Test
    fun getTelPutStream() {
    }

    @org.junit.Test
    fun sendCmd() {
    }

    @org.junit.Test
    fun testTouch() {
    }

    companion object {
        @Deployment
        fun createDeployment(): JavaArchive {
            return ShrinkWrap.create(JavaArchive::class.java)
                    .addClass(Wifi232::class.java)
                    .addAsManifestResource(EmptyAsset.INSTANCE, "beans.xml")
        }
    }
}
