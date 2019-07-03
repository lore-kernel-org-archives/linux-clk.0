Return-Path: <SRS0=btre=VA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F6E8C5B578
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 07:32:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6288921881
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jul 2019 07:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726327AbfGCHcp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jul 2019 03:32:45 -0400
Received: from inva021.nxp.com ([92.121.34.21]:45510 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727127AbfGCHcp (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 3 Jul 2019 03:32:45 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6715E200359;
        Wed,  3 Jul 2019 09:32:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 85D3D20034D;
        Wed,  3 Jul 2019 09:32:33 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id ECDC3402C3;
        Wed,  3 Jul 2019 15:32:21 +0800 (SGT)
From:   jun.li@nxp.com
To:     shawnguo@kernel.org, sboyd@kernel.org, robh+dt@kernel.org
Cc:     mark.rutland@arm.com, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
        mturquette@baylibre.com, Peter.Chen@nxp.com, ping.bai@nxp.com,
        leonard.crestez@nxp.com, daniel.baluta@nxp.com, jun.li@nxp.com,
        Anson.Huang@nxp.com, aisheng.dong@nxp.com, peng.fan@nxp.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: imx8mm-evk: enable usb1 and typec support
Date:   Wed,  3 Jul 2019 15:23:27 +0800
Message-Id: <20190703072327.38165-3-jun.li@nxp.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20190703072327.38165-1-jun.li@nxp.com>
References: <20190703072327.38165-1-jun.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Li Jun <jun.li@nxp.com>

USB1 port has typec connector with power delivery support:
- Dual data role: host and device.
- Dual power role: source and sink, prefer power sink.

Signed-off-by: Li Jun <jun.li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dts | 65 ++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
index ee7f2b2..fcfee8b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx8mm.dtsi"
 
 / {
@@ -115,6 +116,21 @@
 	status = "okay";
 };
 
+&usbotg1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
 &usdhc2 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
@@ -257,6 +273,42 @@
 	};
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_i2c2>;
+	status = "okay";
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_typec1>;
+		reg = <0x50>;
+		interrupt-parent = <&gpio2>;
+		interrupts = <11 8>;
+		status = "okay";
+
+		port {
+			typec1_dr_sw: endpoint {
+				remote-endpoint = <&usb1_drd_sw>;
+			};
+		};
+
+		typec1_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+				     PDO_VAR(5000, 20000, 3000)>;
+			op-sink-microwatt = <15000000>;
+			self-powered;
+		};
+	};
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 
@@ -299,6 +351,13 @@
 		>;
 	};
 
+	pinctrl_i2c2: i2c2grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C2_SCL_I2C2_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C2_SDA_I2C2_SDA			0x400001c3
+		>;
+	};
+
 	pinctrl_pmic: pmicirq {
 		fsl,pins = <
 			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x41
@@ -320,6 +379,12 @@
 		>;
 	};
 
+	pinctrl_typec1: typec1grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x159
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX	0x140
-- 
2.7.4

