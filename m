Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4A9C004D5
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 701D9215EB
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="WLVWLLQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 701D9215EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727480AbeI0SIa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 14:08:30 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:41233 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727677AbeI0SI3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 14:08:29 -0400
Received: by mail-pf1-f195.google.com with SMTP id m77-v6so1733363pfi.8
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 04:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tfYvWgBOL9KLxKgh81paM4/HEEsFVAXddPhrkTRK4m4=;
        b=WLVWLLQQWLh29BTr9C1A1fM+2yK2UYk9O8Kx+MaERrVagFOV79Tqc5YvGG370di43+
         qDu74xBytE9S/UGlWlvXruypco0h99d/o1RvmrvXYsJrXfV8TsIubuAbO8unR6YRvAOo
         RwjXOO22+xDXJu41cirOEFRoEPu+gKRe8YGyw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tfYvWgBOL9KLxKgh81paM4/HEEsFVAXddPhrkTRK4m4=;
        b=JZzobB0HgMIUwFAOmMVDyu8NTBb3hfVQVJVz4f2Ev7ilM+xWwLBGB048WQeAvArEuC
         jEUULlwudeTW/OnVjic2OiR2rQXzB0LcUNaxBN79a3KlMN+kStroJhTWV2+zzt1yZbwg
         uUwcOysdYb3fopJ4ZepfYYd/R4NHGfkWxSCQfi/ItwadddGU3aF+q7rETukOYYHjKgHe
         y2ZXI2dICOz5CPEgCO9osvfGHbP7jiF0Ffp3CQGrvvj3/RAtD5KNzyqAWboFwcaoSRgk
         I5/AgWLEHxWmBGilsjAJA4BJLWQ+hFHr6uEAvAZ+J6co0zl7EXYABsx/6fDA06Wf9zIs
         Yc5A==
X-Gm-Message-State: ABuFfohYr9AuVxjpb7VuKASrZHjXTVe0vTzDWc4c/yOrClw+bc8aQAc4
        rh+ABWU3aKGF0G0NAtp2zFSnhg==
X-Google-Smtp-Source: ACcGV60XWE8GqZkNX5B6LCUsEK9TyGpBphVhjIg8BXSyegRg+BCr9G4I1ZnDXPO/FgSJiiWqxhRbJQ==
X-Received: by 2002:a17:902:748a:: with SMTP id h10-v6mr6798178pll.192.1538049033779;
        Thu, 27 Sep 2018 04:50:33 -0700 (PDT)
Received: from localhost.localdomain ([183.82.230.83])
        by smtp.gmail.com with ESMTPSA id v36-v6sm3744872pgn.85.2018.09.27.04.50.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Sep 2018 04:50:33 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@free-electrons.com>,
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 11/12] arm64: dts: allwinner: a64: Add DSI pipeline
Date:   Thu, 27 Sep 2018 17:18:49 +0530
Message-Id: <20180927114850.24565-12-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20180927114850.24565-1-jagan@amarulasolutions.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927114849.gcRpbrgiU4EMhuK5__ePvrisfBrflJtDbskEaLeMUNk@z>

The A64 has a MIPI-DSI block which is similar to A31
without mod clock.

So, add dsi node with A64 compatible, dphy node with
A31 compatible and finally connect dsi to tcon0 to
make proper DSI pipeline.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index f3a66f888205..308eedc53150 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -320,6 +320,11 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					reg = <1>;
+
+					tcon0_out_dsi: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&dsi_in_tcon0>;
+					};
 				};
 			};
 		};
@@ -818,6 +823,45 @@
 			#interrupt-cells = <3>;
 		};
 
+
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
+			compatible = "allwinner,sun6i-a31-mipi-dphy";
+			reg = <0x01ca1000 0x1000>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>,
+				 <&ccu CLK_DSI_DPHY>;
+			clock-names = "bus", "mod";
+			resets = <&ccu RST_BUS_MIPI_DSI>;
+			status = "disabled";
+			#phy-cells = <0>;
+		};
+
 		pwm: pwm@1c21400 {
 			compatible = "allwinner,sun50i-a64-pwm",
 				     "allwinner,sun5i-a13-pwm";
-- 
2.18.0.321.gffc6fa0e3

