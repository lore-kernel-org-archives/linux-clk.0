Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F21C282C5
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1BD521726
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 20:01:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="J/w9SOD6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732384AbfAXUBX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 15:01:23 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32943 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727745AbfAXUBX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Jan 2019 15:01:23 -0500
Received: by mail-pf1-f193.google.com with SMTP id c123so3553691pfb.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Jan 2019 12:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=viWBxNLdmx5hdu4igYEdtrD9NNJ9I5QzFtzjPLFp1Zg=;
        b=J/w9SOD6T4AdblpX5nwobBrlOLEkBmczgfC3EY9vW9U5isU0HSHZCQg04H+zLA8Amt
         ByrPzdOucoh0P1rugWULznnraWoSn7rsrzqZud/+tHUIuLElI4DOx6twc5+bMHFdvdIq
         Okztp/hQTyVgLiSWJe+rS0nY8Sw6pUepTXGKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=viWBxNLdmx5hdu4igYEdtrD9NNJ9I5QzFtzjPLFp1Zg=;
        b=BKlDp5bN6Eep7DBW1qCAGuEaL4eYX+nJs9XrPIu/lHdo7WPBldyeJhnyuFO7JegQto
         S7Hx3Y4Gx7kao+O/NgB6ERxi1sKuybI+924IhRfcPkIax8PLaQc7830eLFl2NMBqvGwD
         x4IP0cBr39KS+lXYgA6H54TbO97ZxrJqHP3COOZuiOq0iKq3y6/P/HQeREyRZleW2HYK
         5Ydeh4OkPL/Okf5DtaonLk3nFVhY6TPI7tTa4liOyly86bP1J/5k7KOheud9oLhqbSR8
         ODIT6+7M7dgAmx29DjrTDqhcKF4bnM1dHQigtuB6O340TU1fQtaTT0Wlb98PKS8IUIEc
         zIPA==
X-Gm-Message-State: AJcUukdfdbXqvcEtU2a2IipQ/Tjbr2cjMzhChgKM8jdFjVf/1MqyFAfF
        rS6DYc9cRc72Sj1QDgskMe815A==
X-Google-Smtp-Source: ALg8bN5A1xFJznW/r2sFKdv7KvB++13U9DACtd4l4I48QlIcvSwutN75lpAJXn4lrCOTyle7kzJtzA==
X-Received: by 2002:a63:e950:: with SMTP id q16mr7215772pgj.138.1548360082660;
        Thu, 24 Jan 2019 12:01:22 -0800 (PST)
Received: from localhost.localdomain ([115.97.179.75])
        by smtp.gmail.com with ESMTPSA id x11sm61637003pfe.72.2019.01.24.12.01.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 24 Jan 2019 12:01:22 -0800 (PST)
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
Subject: [PATCH v6 22/22] arm64: dts: allwinner: a64-amarula-relic: Add Techstar TS8550B MIPI-DSI panel
Date:   Fri, 25 Jan 2019 01:29:00 +0530
Message-Id: <20190124195900.22620-23-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190124195900.22620-1-jagan@amarulasolutions.com>
References: <20190124195900.22620-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Amarula A64-Relic board by default bound with Techstar TS8550B
MIPI-DSI panel, add support for it.

DSI panel connected via board DSI port with,
- DLDO2 as VCC supply
- DLDO2 as IOVCC supply
- DLDO1 as VCC-DSI supply
- PD24 gpio for reset pin
- PD23 gpio for backlight enable pin

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../allwinner/sun50i-a64-amarula-relic.dts    | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
index f180c841ac3c..703055f2a4fb 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts
@@ -9,6 +9,7 @@
 #include "sun50i-a64.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "Amarula A64-Relic";
@@ -18,6 +19,14 @@
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <1 2 4 8 16 32 64 128 512>;
+		default-brightness-level = <2>;
+		enable-gpios = <&pio 3 23 GPIO_ACTIVE_HIGH>; /* LCD-BL-EN: PD23 */
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -83,6 +92,30 @@
 	};
 };
 
+&de {
+	status = "okay";
+};
+
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	vcc-dsi-supply = <&reg_dldo1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "techstar,ts8550b", "sitronix,st7701";
+		reg = <0>;
+		VCC-supply = <&reg_dldo2>;
+		IOVCC-supply = <&reg_dldo2>;
+		reset-gpios = <&pio 3 24 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD24 */
+		backlight = <&backlight>;
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -160,6 +193,12 @@
 	status = "okay";
 };
 
+&pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm_pin>;
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
-- 
2.18.0.321.gffc6fa0e3

