Return-Path: <SRS0=rfa6=QI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0B3C282D8
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6B552218EA
	for <linux-clk@archiver.kernel.org>; Fri,  1 Feb 2019 15:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="M1VoXvE1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbfBAPnh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Feb 2019 10:43:37 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34599 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730829AbfBAPn0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Feb 2019 10:43:26 -0500
Received: by mail-lj1-f196.google.com with SMTP id u89-v6so6230291lje.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Feb 2019 07:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=87uAT10+TXiQ8RUQObJ13rsTWKA95oUQQrz1NYnUkkc=;
        b=M1VoXvE1Szk5NA7GJTJMsRcCil+0rnZt7ypHyOVEdwDVa4dZSQ+kppG5DCm4N0JTOE
         GT62Ww17WS3ODFsfZmD48Jz54ZXKIU3Kse/Ckp2XT1JRwZtGhS5ltyuC9bMky2+s35ei
         /GjtCGUkPWOp4cXCDJ3h5p5wDVeHg0LndW2LM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=87uAT10+TXiQ8RUQObJ13rsTWKA95oUQQrz1NYnUkkc=;
        b=GPWCpBrTVDHBOgnrNfukFUurhZOjJzY1drt8Vru8wUsQgZB0Ju4tTNHjZq21SDs5NM
         3jK7SeTQ0IA6+hKhK1mrJ56s7JseOS176I9E90h/nchUW73LfFZSmMv9JVzB4FDf/kUe
         EHT6WWN44t4mb6MMfxk8z5cjiJ1JZlNuV5TSetz3OFTMmu9VdnQbl/DPZfjRD85VoOTl
         dXlhWuPJi26dEczeDddaFYSJqGk5UvIr7maucklU6wo57Z0i0vIqpDAlfIx6c5Q5Ully
         td+0KNJW8Cqh0DQv1IDmSQr5l8NTRTErM5m2T59LRQ1GyJf/Mrvr+HcTyksxO5RV5rht
         8PZg==
X-Gm-Message-State: AJcUukeONm7bgMAiSYjjhGMfN0u/GqtuHBlIqs/XPQdZ6/w/IOTLZw+H
        GDskpl3lBZsaQhnOQ2elgwAshA==
X-Google-Smtp-Source: ALg8bN4Q3v+ELltV8yrXXTQiDUCRBw/HFQzvbq5ATN7sdZy1/CP4lI5ssgFWBSQmOj1gE+dKktvsug==
X-Received: by 2002:a2e:5dd9:: with SMTP id v86-v6mr31776125lje.86.1549035804241;
        Fri, 01 Feb 2019 07:43:24 -0800 (PST)
Received: from localhost.localdomain ([217.76.202.68])
        by smtp.gmail.com with ESMTPSA id i13-v6sm1305712ljg.82.2019.02.01.07.43.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 01 Feb 2019 07:43:23 -0800 (PST)
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
Subject: [PATCH v7 23/23] arm64: dts: allwinner: a64-amarula-relic: Add Techstar TS8550B MIPI-DSI panel
Date:   Fri,  1 Feb 2019 21:12:32 +0530
Message-Id: <20190201154232.10505-24-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20190201154232.10505-1-jagan@amarulasolutions.com>
References: <20190201154232.10505-1-jagan@amarulasolutions.com>
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
index df0de0772d6b..a5a0a650b589 100644
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

