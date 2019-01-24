Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC73C282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2E32321726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:00:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QYsYsypJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726126AbfAXUAq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:00:46 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:36025 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731006AbfAXUAq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 15:00:46 -0500
Received: by mail-pf1-f194.google.com with SMTP id b85so3538045pfc.3
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 12:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xwpaWClSendD5Xkx2lUaVTi5eWkEg90FnJ0FqvjhOj0=;
        b=QYsYsypJagdj/V1uz+Y4z3lwNY/8xf/URMlBzZFLZXQMAvZvcEi2YYnqh5lYilkoFV
         qm4oAD9ZV2IK9XxC9cLHXNBhdhFhC24k1y7dVR9L36iIzd+aE3wn2ITnj3O2sPwiRMMy
         VgfUfii3Na2aZX+4n+GP1NXnDHCKyjwQyv9oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xwpaWClSendD5Xkx2lUaVTi5eWkEg90FnJ0FqvjhOj0=;
        b=AX9Ougbb2YKPVp5MIx0TTdt2xzmTdGtyTOrTD7zaT3V51PAKhu4+dp7TgcJTMQQ1ng
         Fq+Uu+JLXRreLzUCEPuZ1Aa+VNepZKrVQjaUWD9hXA/lriGBdWOkuCP1K3YEWXguLBxH
         UQV1v22nVLYW0Ts2j9Iam8VhTeSFUAKkRN+KCtD95sJ+2W9MpkxW7RXkjBfHAZ2/up1E
         y6kpjQAHTd+MXWKNnJ9GLkdvoKUekcQZuxYGbr1y+yMbC37IlG0bBOnrmRNeSF2/YAqJ
         z+85TmoT9IKAlQ9dM1GOLztdeUIjgUNPQuBPMVDRr+cmUMxcg0Ypm4fNwl8wpM5dncnY
         horA==
X-Gm-Message-State: AJcUukehlhZe7Vmnq4JrtzsVDs4Bee8qtxXBCCBnToxkGxASrA/nrDzF
        3s/4MQyo5I1xJPkcZ4wcaa2OGQ==
X-Google-Smtp-Source: ALg8bN5x0pNK0SoyiVbuvpPPACaM2kXdEluSIyfT8qju6M+leMFjvcVk8I4XQsgLIPHYYwomVYfDNw==
X-Received: by 2002:a62:9419:: with SMTP id m25mr8223547pfe.147.1548360045461;
        Thu, 24 Jan 2019 12:00:45 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.12.00.39
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 12:00:44 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-amarula@amarulasolutions.com, linux-sunxi@googlegroups.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v6 16/22] arm64: dts: allwinner: a64: Add DSI pipeline
Date:   Fri, 25 Jan 2019 01:28:54 +0530
Message-Id: <20190124195900.22620-17-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The A64 has a MIPI-DSI block which is similar to A31.

Add dsi, dphy nodes with A31 fallback compatible and finally
connect the dsi node to tcon0 node to make proper DSI pipeline.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index cdc154b14a7e..e18d81aff813 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -358,6 +358,12 @@
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
@@ -935,6 +941,47 @@
 			status = "disabled";
 		};
 
+		dsi: dsi@1ca0000 {
+			compatible = "allwinner,sun50i-a64-mipi-dsi",
+				     "allwinner,sun6i-a31-mipi-dsi";
+			reg = <0x01ca0000 0x1000>;
+			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_MIPI_DSI>,
+				 <&ccu CLK_DSI_DPHY>;
+			clock-names = "bus", "mod";
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
 		csi: csi@1cb0000 {
 			compatible = "allwinner,sun50i-a64-csi";
 			reg = <0x01cb0000 0x1000>;
-- 
2.18.0.321.gffc6fa0e3

