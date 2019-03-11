Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD19C43381
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:38:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BC3772087C
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 13:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iHSqwI6H"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727652AbfCKNiY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 09:38:24 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:39099 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbfCKNiS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 09:38:18 -0400
Received: by mail-pg1-f196.google.com with SMTP id h8so4062305pgp.6
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JpkYvz2XVIh29oXHw9wh2ZVrMuDNfed6jV8hIQF4UlE=;
        b=iHSqwI6HDgJucsXctyUIRXrQ9/vL1sObFZBZeTrlGMRQBhzCraj2xChMOHdqo21edI
         gMrmSYXvA7GZfTKCsRn7+Z8Rpo3jxWsH/FyEeuZSrNHn7FV7A/91HBlV/ChZKyO42n8o
         PjB/V+1nZ3cynylJXJJg7Yu7pEroNs29AzHOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JpkYvz2XVIh29oXHw9wh2ZVrMuDNfed6jV8hIQF4UlE=;
        b=n7BJuiW8Ea72uiaYfO6tGOCSRrV6+TUxHarLflQ67nEhvGf6jElufwi/J1lmu6tRLm
         4IsEDdvs9X/ktuvoua6sxREIKztRqYivZG1qtMDO79mceGdLfm7hFZDdta5bgdUapNgU
         UCTeCEkM8PTruCXiFTTW98t2mDkLqN7nUAWbovjuuYs5QPoPN5KEy95DDl0HtN/rm1/h
         h8VIJ9YO02T6Vymo1T1e6RIOua3rmOEWQJDjJqjyU4iyhsVhURXPe2xndI0DyeKgOcew
         9LM23Z+Mg/Db18kz+RTbcmWdwr6wx4ZmaDCb4TzoOevEQH/PZ2pHFOKQoZa1MpohQjrU
         RI/w==
X-Gm-Message-State: APjAAAV2ruMm16vBZxdojjyzxK39YikIB82VsjrES+zRWiaOgrZVf8F6
        D13Cf/jzNRY8MjZWUgv9kOoSfw==
X-Google-Smtp-Source: APXvYqxA2/p+Oe4YFcvNjoPQCuNCDDxv42eoG4JOiltR8aSciBTB/VWnd1XF9ltTFWLKjnGgdUXuOA==
X-Received: by 2002:a17:902:501:: with SMTP id 1mr33497507plf.72.1552311497008;
        Mon, 11 Mar 2019 06:38:17 -0700 (PDT)
Received: from localhost.localdomain ([183.82.224.199])
        by smtp.gmail.com with ESMTPSA id s79sm9960397pfa.61.2019.03.11.06.38.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 06:38:16 -0700 (PDT)
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
Subject: [PATCH v8 12/15] arm64: dts: allwinner: a64: Add MIPI DSI pipeline
Date:   Mon, 11 Mar 2019 19:06:34 +0530
Message-Id: <20190311133637.18334-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190311133637.18334-1-jagan@amarulasolutions.com>
References: <20190311133637.18334-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add MIPI DSI pipeline for Allwinner A64.

- dsi node, with A64 compatible since it doesn't support
  DSI_SCLK gating unlike A33
- dphy node, with A64 compatible with A33 fallback since
  DPHY on A64 and A33 is similar
- finally, attach the dsi_in to tcon0 for complete MIPI DSI

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
Tested-by: Merlijn Wajer <merlijn@wizzup.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
index e628d063931b..5525fc571fc6 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
@@ -360,6 +360,12 @@
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
@@ -946,6 +952,45 @@
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

