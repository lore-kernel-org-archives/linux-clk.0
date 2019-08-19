Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82A8C3A5A0
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BA5FB2086C
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nw9Dwk3Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727730AbfHSNCW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 09:02:22 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34462 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727728AbfHSNCW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Aug 2019 09:02:22 -0400
Received: by mail-pf1-f195.google.com with SMTP id b24so1149900pfp.1
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 06:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=kgB5pCuOS2QWyyNQUlCeMbbF7mRF+VE6sHHJ2GG7b1c=;
        b=nw9Dwk3QD2aloehUTET6YzOtYe6ra0WCysGEa6TihGulv553Lr1X+HSYd/2rg+jiaB
         52ovxI4pcqXrV/m2Dedi1UjjV5ga8rEYW2ds9BoTNqUdRvLqGaVrGtlVzGk4Q5wyjlWQ
         iSN/EMURafFVa3z4DnfSYWt4a8FdwNAuJeknlGyH8haT0WOi8tsXDJg2IgtZosn0Igdl
         IOKJmpYZiDfIFg8wmxdECQJ4kLNHfvehjTh00bxK1hPdEOhnbKdm8VrNGnXgUv3dPZr7
         AJjPxQ2bfDD0tAZeY8dhttfynSZJwNsoL2R+PoolRdgDuA0aZpFQJ+6/AMp4Klb3nxrA
         8AXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=kgB5pCuOS2QWyyNQUlCeMbbF7mRF+VE6sHHJ2GG7b1c=;
        b=N2D09hk0IBMKSKfY/nAqldP9lB7Qy0Gj/JDBIEDorp4ym7ruBOPuSk+2/7y1/d84Bz
         vqa3WoYyJ2m/ifxdLn7AhqHW6e9eeb/5PTtcX9wI+YugOVZu9U1ATDP2LQa5GlNTW0lQ
         eD0NmuHx7j45e1RQQ4bt1DH9N/VgC0bHkig51Nr2jnCK4JQFEq3C1TDUtwhLVyX/NsvM
         V+eS+mtl3xfijCMk44Btk2mp6cczM9Jm75SeNiNgYpTiZPhVYJPEXdearySaBOwQFQHC
         BRIOz4YCReURF3HIlwV34KKWm0Q1rT7tHLaPEVDbB+93wpn9OB+wwcGW9ay5rPWRlFU6
         RcSg==
X-Gm-Message-State: APjAAAWdO6BPFW5BSKiqgwruDHp89wd45fiUApwpgIz7rEjuZJ6WrUxz
        l9zcRy/hU8DSewcL4gBRrdW4
X-Google-Smtp-Source: APXvYqyxTu93lSgG0ipCJ/sEY9G898TS5YJu+VnCzNMANbL34jMSGysDOcwcQmR8TknOEIRGN6bn9Q==
X-Received: by 2002:a62:144f:: with SMTP id 76mr24023906pfu.62.1566219741193;
        Mon, 19 Aug 2019 06:02:21 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id l123sm20626464pfl.9.2019.08.19.06.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 06:02:20 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 6/8] arm64: dts: bitmain: Source common clock for UART controllers
Date:   Mon, 19 Aug 2019 18:31:41 +0530
Message-Id: <20190819130143.18778-7-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
References: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Remove fixed clock and source common clock for UART controllers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts |  9 ---------
 arch/arm64/boot/dts/bitmain/bm1880.dtsi            | 12 ++++++++++++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
index 3e8c70778e24..7a2c7f9c2660 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
+++ b/arch/arm64/boot/dts/bitmain/bm1880-sophon-edge.dts
@@ -49,12 +49,6 @@
 		reg = <0x1 0x00000000 0x0 0x40000000>; // 1GB
 	};
 
-	uart_clk: uart-clk {
-		compatible = "fixed-clock";
-		clock-frequency = <500000000>;
-		#clock-cells = <0>;
-	};
-
 	soc {
 		gpio0: gpio@50027000 {
 			porta: gpio-controller@0 {
@@ -173,21 +167,18 @@
 
 &uart0 {
 	status = "okay";
-	clocks = <&uart_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart0_default>;
 };
 
 &uart1 {
 	status = "okay";
-	clocks = <&uart_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1_default>;
 };
 
 &uart2 {
 	status = "okay";
-	clocks = <&uart_clk>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart2_default>;
 };
diff --git a/arch/arm64/boot/dts/bitmain/bm1880.dtsi b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
index 8471662413da..fa6e6905f588 100644
--- a/arch/arm64/boot/dts/bitmain/bm1880.dtsi
+++ b/arch/arm64/boot/dts/bitmain/bm1880.dtsi
@@ -174,6 +174,9 @@
 		uart0: serial@58018000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x58018000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
@@ -184,6 +187,9 @@
 		uart1: serial@5801A000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x5801a000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
@@ -194,6 +200,9 @@
 		uart2: serial@5801C000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x5801c000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
@@ -204,6 +213,9 @@
 		uart3: serial@5801E000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x0 0x5801e000 0x0 0x2000>;
+			clocks = <&clk BM1880_CLK_UART_500M>,
+				 <&clk BM1880_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-- 
2.17.1

