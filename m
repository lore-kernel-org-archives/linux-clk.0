Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27C0FC636D6
	for <linux-clk@archiver.kernel.org>; Thu, 23 Feb 2023 17:11:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229586AbjBWRLw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Feb 2023 12:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbjBWRLv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Feb 2023 12:11:51 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C7D57D3B;
        Thu, 23 Feb 2023 09:11:36 -0800 (PST)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8FF7A8573B;
        Thu, 23 Feb 2023 18:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677172295;
        bh=Nf/P0ayFUpGFdK1UOwFUmICvUugkXNWxEwlW5PRq+R8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wzUliG17HOjAKxFrj+0xwX+qIMmjqXrGN57aRtmw6YKFcseNwodOOp1GMkxX2OnPN
         sIYR4SeMEXeS/DKPxGdG+VqauOgWZszT/YYHrTOe46+VLiEhPYyBjth3DRhrxkfjhU
         O8lJKLjSYKqiC4P/oljmtdVCo92wSDQWkFhmdEwi4avldq4MqwUYAMYJm5B8Z0evUR
         o698NpU71Y2nwYJa5h1r85QQp5C0sBwW9Sx1mxrjG6Iw+54P04OeDIPL5QPkPQom9c
         qWdCV9YQ8ZDRjZo5N3Ly1Jwc4zmj3oVmfwzVyFu8tE6TXaxbK6q0EG3vpU8DtOb+Jq
         AaBA+yOu1N1jw==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marco Felsch <m.felsch@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 5/5] arm64: dts: imx8mp: Add analog audio output on i.MX8MP EVK
Date:   Thu, 23 Feb 2023 18:11:14 +0100
Message-Id: <20230223171114.59164-5-marex@denx.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223171114.59164-1-marex@denx.de>
References: <20230223171114.59164-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable SAI3 on i.MX8MP EVK, add WM8960 codec binding and regulator.
This is all that is needed to get analog audio output operational
on i.MX8MP EVK.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jacky Bai <ping.bai@nxp.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marco Felsch <m.felsch@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: No change
V3: No change
V4: - Update codec node name and phandle label
    - Use just sound for the sound node name
    - Rebase on next 20230223
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 60 ++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 7816853162b3f..9ed94f271ef9a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -40,6 +40,16 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_audio_pwr: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	reg_can1_stby: regulator-can1-stby {
 		compatible = "regulator-fixed";
 		regulator-name = "can1-stby";
@@ -83,6 +93,23 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	sound {
+		compatible = "fsl,imx-audio-wm8960";
+		model = "wm8960-audio";
+		audio-cpu = <&sai3>;
+		audio-codec = <&wm8960>;
+		audio-routing =
+			"Headphone Jack", "HP_L",
+			"Headphone Jack", "HP_R",
+			"Ext Spk", "SPK_LP",
+			"Ext Spk", "SPK_LN",
+			"Ext Spk", "SPK_RP",
+			"Ext Spk", "SPK_RN",
+			"LINPUT1", "Mic Jack",
+			"LINPUT3", "Mic Jack",
+			"Mic Jack", "MICB";
+	};
 };
 
 &flexspi {
@@ -344,6 +371,17 @@ &i2c3 {
 	pinctrl-0 = <&pinctrl_i2c3>;
 	status = "okay";
 
+	wm8960: codec@1a {
+		compatible = "wlf,wm8960";
+		reg = <0x1a>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+		clock-names = "mclk";
+		wlf,shared-lrclk;
+		wlf,hp-cfg = <3 2 3>;
+		wlf,gpio-cfg = <1 3>;
+		SPKVDD1-supply = <&reg_audio_pwr>;
+	};
+
 	pca6416: gpio@20 {
 		compatible = "ti,tca6416";
 		reg = <0x20>;
@@ -422,6 +460,16 @@ &pwm4 {
 	status = "okay";
 };
 
+&sai3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai3>;
+	assigned-clocks = <&clk IMX8MP_CLK_SAI3>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL1_OUT>;
+	assigned-clock-rates = <12288000>;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
 &snvs_pwrkey {
 	status = "okay";
 };
@@ -668,6 +716,18 @@ MX8MP_IOMUXC_UART3_TXD__UART1_DCE_RTS	0x140
 		>;
 	};
 
+	pinctrl_sai3: sai3grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_TXFS__AUDIOMIX_SAI3_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI3_TXC__AUDIOMIX_SAI3_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXD__AUDIOMIX_SAI3_RX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_TXD__AUDIOMIX_SAI3_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI3_MCLK__AUDIOMIX_SAI3_MCLK	0xd6
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28		0xd6
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
+		>;
+	};
+
 	pinctrl_uart2: uart2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
-- 
2.39.1

