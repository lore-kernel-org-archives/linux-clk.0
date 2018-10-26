Return-Path: <SRS0=HxJ1=NG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6F2C6786E
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26A8120651
	for <linux-clk@archiver.kernel.org>; Fri, 26 Oct 2018 14:46:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ccIoRDYI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26A8120651
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbeJZXXn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Oct 2018 19:23:43 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44862 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727721AbeJZXXn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Oct 2018 19:23:43 -0400
Received: by mail-pg1-f195.google.com with SMTP id w3-v6so633361pgs.11
        for <linux-clk@vger.kernel.org>; Fri, 26 Oct 2018 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1UIfZkOCW86vmEfbDReHGNULNL3CxxC1cQh+1lPeF98=;
        b=ccIoRDYIlAA7z2KUEaU/mgEhe7ssvwJKOWidHhYo/8uuEC5VIfNY/qI3H6W33HCUPx
         h15bbHzPXuVJxTn0Vtas9iP/oSkfs6WqAAOLREX5PHmCjKfQ74UdYmB7uZh1XSwUBmXN
         jmeaMd4Bj9LvFY0T1Yn8EOZ72ouI+tS3L2aOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1UIfZkOCW86vmEfbDReHGNULNL3CxxC1cQh+1lPeF98=;
        b=HP2T6xmZXZeyH6MyMOj2gFgV3p9WrTuUc4hzYbSaEzBPdAh7eoIkwfPf0+Zj6tIbIb
         hYFi4dG1jOFUyz/RU9Fq8VyoeemMm/19+vOLuatJbbILJrmYm7Cut4aDlrdbj2WJUh4t
         u7Icg4S6sUn1XthXg3qKb5zWcuvbD5nlCH8AGQ6YAck/EBnLRaucGLR+UiiFuSF7rXBc
         nbItrnqBdrk+fZXtM7GXycC4j4QkdgXB62vHIkktL7NulohVpJaqhfYu/D7BaziPMwc4
         gBnWPmVGPFwLkMqngK57jIV2GkKKkvjQsFn6v3DMeklx7MIO4CLXezR2tp3b/dwYi99i
         u7iw==
X-Gm-Message-State: AGRZ1gIUhupFnitgB7yY0j/qh6cXvzGtoHnc/5aGSlHiPuYD42JeWaMs
        GvK4OfvHFFM8icU+Lvk4dD8b7Q==
X-Google-Smtp-Source: AJdET5cGOPtvpIK1RgmWyNbi4looQMZYa/ZaKTJ0NurZJOC4sgru0+rqqesme2etWzwlGOU8YYWPzQ==
X-Received: by 2002:a63:224f:: with SMTP id t15mr3736191pgm.69.1540565182326;
        Fri, 26 Oct 2018 07:46:22 -0700 (PDT)
Received: from localhost.localdomain ([27.7.51.1])
        by smtp.gmail.com with ESMTPSA id z22-v6sm12044467pgv.24.2018.10.26.07.46.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Oct 2018 07:46:21 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Cc:     Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v3 23/25] arm64: dts: allwinner: a64: Add DSI pipeline
Date:   Fri, 26 Oct 2018 20:13:42 +0530
Message-Id: <20181026144344.27778-24-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20181026144344.27778-1-jagan@amarulasolutions.com>
References: <20181026144344.27778-1-jagan@amarulasolutions.com>
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
Tested-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- add allwinner,tcon-channel property
- add dsi nodes in ascending physical address 
Changes for v2:
- use A64 dphy compatible

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

