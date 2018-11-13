Return-Path: <SRS0=nRqW=NY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E18C43441
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18D8820685
	for <linux-clk@archiver.kernel.org>; Tue, 13 Nov 2018 11:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="R54Bdr0t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18D8820685
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732512AbeKMVRA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Nov 2018 16:17:00 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38578 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732592AbeKMVQ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Nov 2018 16:16:59 -0500
Received: by mail-pl1-f195.google.com with SMTP id p4-v6so5854691plo.5
        for <linux-clk@vger.kernel.org>; Tue, 13 Nov 2018 03:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZgZNmPoaTkDf6ytgXj7F48CJwNB1w7qMXXV09tpNU38=;
        b=R54Bdr0t5wkh6hlo5cu4TtuMzPckKnfw9vn7bQ2q+LgPHvjnM1tVg3VxnLfno3HX1Q
         NFY8xjL0EPyD3DNNeMIE+aAVJ3tmc2z549KMdttRh64ke7GlZlGmbFbfc0ZRP9tt8Y0+
         v96mCqitAyGS+7trKg5WDAt7GAG6gDpqrH1DQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZgZNmPoaTkDf6ytgXj7F48CJwNB1w7qMXXV09tpNU38=;
        b=ChTKGXZUL1FKjYxgLxUkCEtOZckbGRaSfGfjplWjlgwLf64e+TDCxRMoU9cznqxcoR
         1czxMaJvCGgv+7srrJNfcbjSG/a0Z/LWI7I/kfgwGiDRBBdGT/M+ktYcK+t4erMOLwEm
         3bPcXR2AhhmK3fmWHohjhrfBAKX6YH3dSz8+pGI3YHmtWde/3Uof5bVIVdGGlrta3Dhg
         m4135CikxRtNjub7sIJPzu2X/MZOuotb0UdE5J1HZ1VicKxA52xccocytSd1BAD8RBlU
         8Zb3lpjzty4vLfjRsKh0QuJoNRcQU8rzst5JuQgGNPvCVyZ6EQI636bcQywq/1AobbCY
         u2uw==
X-Gm-Message-State: AGRZ1gKfc6BDS3GV5nwMEQfi6ydarSdvPVtH0Bgw2kfPw7VDYT5Po14a
        /DeI0MTI2pho2/XGfe6Gi0xw7g==
X-Google-Smtp-Source: AJdET5f8TIJpYsQwoXu33oV8ySOI4Udtx0acCilLCHNKQaIr+qp4JuFdPHjkslaoBTEPDyXPW0w55w==
X-Received: by 2002:a17:902:112b:: with SMTP id d40-v6mr4689104pla.48.1542107960743;
        Tue, 13 Nov 2018 03:19:20 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:3670:3f11:bc71:2ef7:4a39:e260])
        by smtp.gmail.com with ESMTPSA id 27-v6sm28531377pfm.36.2018.11.13.03.19.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 Nov 2018 03:19:20 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
        linux-amarula@amarulasolutions.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 24/26] arm64: dts: allwinner: a64: Add DSI pipeline
Date:   Tue, 13 Nov 2018 16:46:31 +0530
Message-Id: <20181113111633.20189-25-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181113111633.20189-1-jagan@amarulasolutions.com>
References: <20181113111633.20189-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The A64 has a MIPI-DSI block which is similar to A31
without mod clock.

So, add dsi node with A64 compatible, dphy node with
A31 compatible and finally connect dsi to tcon0 to
make proper DSI pipeline.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index f3a66f888205..d6f269883759 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -320,6 +320,12 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <1>;
+
+					tcon0_out_dsi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dsi_in_tcon0>;
+						allwinner,tcon-channel = <1>;
+					};
 				};
 			};
 		};
@@ -829,6 +835,45 @@
 			status = "disabled";
 		};
 
+		dsi: dsi@1ca0000 {
+			compatible = "allwinner,sun50i-a64-mipi-dsi";
+			reg = <0x01ca0000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>;
+			clock-names = "bus";
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			phys = <&dphy>;
+			phy-names = "dphy";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					#address-cells = <1>;
+					#size-cells = <0>;
+					reg = <0>;
+
+					dsi_in_tcon0: endpoint {
+						remote-endpoint = <&tcon0_out_dsi>;
+					};
+				};
+			};
+		};
+
+		dphy: d-phy@1ca1000 {
+			compatible = "allwinner,sun50i-a64-mipi-dphy",
+				     "allwinner,sun6i-a31-mipi-dphy";
+			reg = <0x01ca1000 0x1000>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>,
+				 <&ccu CLK_DSI_DPHY>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
 		hdmi: hdmi@1ee0000 {
 			compatible = "allwinner,sun50i-a64-dw-hdmi",
 				     "allwinner,sun8i-a83t-dw-hdmi";
-- 
2.18.0.321.gffc6fa0e3

