Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA14C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B04D20855
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ASdE33FX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfBAPnq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:43:46 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:42233 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730783AbfBAPnV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:21 -0500
Received: by mail-lj1-f196.google.com with SMTP id l15-v6so6160033lja.9
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=592MwDOO4fFABylW/PjMmeCRDtBAYuoeRyepsTAixok=;
        b=ASdE33FXsWRKqy6F/hssWaVQ1QsAlThJ9aDI+xU6R1ZgX6YRCQwZwAoypxQHJTmZqK
         RsQRP6J3mrv0tTTV9nXZvIzqH5S73gsxHwPYiiU1ZvFc0e44zemPOFE7iTCKv1npb8iN
         tnAZUHu4uxERMbpbRHW0DBLweu8E70XTq3vdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=592MwDOO4fFABylW/PjMmeCRDtBAYuoeRyepsTAixok=;
        b=Wkj6NrXfERbD1sGOwPgrK6k0wvFyYLYxES3W6rpdU06kmSx1+rhBKF0xyt88+AUsl9
         amhcII9eN8HUm3Nek/eutYfVHDgfF1HqZyuJPVxtkP2VvOGayzi2LV5Bdzuw0ugVdriA
         sIsS8wVsfPRYPalBOvE5YY1CXiKUNhQ9W7+MIn4Fy9s+VLfXg9QVaZ9vXFsdBbwAeBmP
         uTbrYFQKO97YdAAuG13/ymT7mtHO/TEMHru6q6gwqVvKaYh7pBIsAlcvZdqJtiINX+2W
         E5cUR7ZWrUDD0iSvLWLuXGTs6WTN35HX8emIm5WwcuamWeXU+Dsh/4fHcwevJA1tjq4L
         VWMA==
X-Gm-Message-State: AJcUuke6hlSC9jQiL3ehWEdAkTtJmjfZloMrsYm/Ed47hI6i5Rd5qNQr
        aGxqsef0hoiu1c8lrjKf1rt/fg==
X-Google-Smtp-Source: ALg8bN4KGhCoNfa4yZRap6U1uakxpgRkOpnyPdXsyqJlvKzHPgkQvluGZF9rUFlkX+Xgzq01UctNgw==
X-Received: by 2002:a2e:910d:: with SMTP id m13-v6mr31326426ljg.187.1549035799118;
        Fri, 01 Feb 2019 07:43:19 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:18 -0800 (PST)
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
Subject: [DO NOT MERGE][PATCH v7 20/23] arm64: dts: allwinner: bananapi-m64: Bananapi S070WV20-CT16 DSI panel
Date:   Fri,  1 Feb 2019 21:12:29 +0530
Message-Id: <20190201154232.10505-21-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch add support for Bananapi S070WV20-CT16 DSI panel to
BPI-M64 board.

DSI panel connected via board DSI port with,
- DLDO1 as VDD supply
- PD6 gpio for reset pin
- PD5 gpio for backlight enable pin
- PD7 gpio for backlight vdd supply

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index c99f66271287..14ecc57c72cf 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -45,6 +45,7 @@
 #include "sun50i-a64.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "BananaPi-M64";
@@ -56,6 +57,15 @@
 		serial1 = &uart1;
 	};
 
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <1 2 4 8 16 32 64 128 512>;
+		default-brightness-level = <2>;
+		enable-gpios = <&pio 3 5 GPIO_ACTIVE_HIGH>; /* LCD-BL-EN: PD5 */
+		power-supply = <&reg_vdd_backlight>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -126,6 +136,15 @@
 		};
 	};
 
+	reg_vdd_backlight: vdd-backlight {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-backlight";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pio 3 7 GPIO_ACTIVE_HIGH>; /* LCD-PWR-EN: PD7 */
+		enable-active-high;
+	};
+
 	wifi_pwrseq: wifi_pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&r_pio 0 2 GPIO_ACTIVE_LOW>; /* PL2 */
@@ -169,6 +188,24 @@
 	status = "okay";
 };
 
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "bananapi,s070wv20-ct16-icn6211";
+		reg = <0>;
+		reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* LCD-RST: PD6 */
+		vdd-supply = <&reg_dldo1>;
+		backlight = <&backlight>;
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -261,6 +298,12 @@
 	status = "okay";
 };
 
+&r_pwm {
+	pinctrl-names = "default";
+	pinctrl-0 = <&r_pwm_pin>;
+	status = "okay";
+};
+
 &r_rsb {
 	status = "okay";
 
-- 
2.18.0.321.gffc6fa0e3

