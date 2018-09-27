Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03F8C43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8A681215EB
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 11:50:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HgC372y+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A681215EB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727992AbeI0SIh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 14:08:37 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44561 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbeI0SIg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 14:08:36 -0400
Received: by mail-pf1-f195.google.com with SMTP id k21-v6so1723941pff.11
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 04:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6C6BP6wiV8DJwbrf/SCB3GLbXtKIBEXPAdIqWbI2Ah8=;
        b=HgC372y+kMaun1ZZVCzPtqSaWFcWehMBcy6Wts57qWNG9meCOWyewTXAdo1UMfqfGd
         gYjFX7STgWMNC0k2C1j406ttK6xzj06CfZw+zI9I6Z/4OYq+nbXwsq5orGHDLU2O04lr
         aP7K1gVWupGdkMmOsm5Rrcx7N5P3iNyPUQJOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6C6BP6wiV8DJwbrf/SCB3GLbXtKIBEXPAdIqWbI2Ah8=;
        b=jkbq7cO8ULpTOkL5ukptiJ4wbBcB7BXmgqNLiH7fEOX9APhbB4YjhQRwEkynA5P9Ff
         OPdzGzpv9meq1roGKyVfv51dUHkCK0e3ME4AAb94rG/pARodJxUAy3okEH5rl51JyiKN
         8AiSpdw9SDPNirSyXR61448ClUqeiMx5e9FdxAnLaGk8NpZ9mMbGFCOJzAal7W0BXamD
         0J3P2cuXoISYV7qHuemWUoPgug5c7sK4BTeE7bADmFt8UaIP+mYrRErFoxitFPxrSr0d
         mpweMIsb1v3kB33Qg2IAgOroxl+zfr68Q5TL5onvQNZdHePQYqmGVjZJs5BWoVK1tl8n
         KenA==
X-Gm-Message-State: ABuFfojUzuxj71lu3lBxCTDVo10ucZSbsCJE41H85vHj+Ig8Yg1H/14U
        Zm9aBjIrqw6N2GVYVtM5bke2kg==
X-Google-Smtp-Source: ACcGV60D6xtfzA51/uFAMqT7wDVlXMs8ytHcFDGD5s+a+4rsxfBymBWkqlQjUrJ+fW+qzTywbPb5WQ==
X-Received: by 2002:a17:902:286a:: with SMTP id e97-v6mr10787981plb.340.1538049040132;
        Thu, 27 Sep 2018 04:50:40 -0700 (PDT)
Received: from localhost.localdomain ([183.82.230.83])
        by smtp.gmail.com with ESMTPSA id v36-v6sm3744872pgn.85.2018.09.27.04.50.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Sep 2018 04:50:39 -0700 (PDT)
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
Subject: [PATCH 12/12] arm64: dts: allwinner: bananapi-m64: Bananapi S070WV20-CT16 DSI panel
Date:   Thu, 27 Sep 2018 17:18:50 +0530
Message-Id: <20180927114850.24565-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.18.0.321.gffc6fa0e3
In-Reply-To: <20180927114850.24565-1-jagan@amarulasolutions.com>
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927114850.QnxFDZT_9eN0S8Qm3jafjoHE7CqbdxMz0lrLjZViNak@z>

This patch add support for Bananapi S070WV20-CT16 DSI panel to
BPI-M64 board.

DSI panel connected via board DSI port with,
- DC1SW as AVDD supply
- DCDC1 as DVDD supply
- PD6 gpio for reset pin
- PD5 gpio for backlight enable pin
- PD7 gpio for backlight vdd supply

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
index ef1c90401bb2..c0be949be68d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
@@ -45,6 +45,7 @@
 #include "sun50i-a64.dtsi"
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pwm/pwm.h>
 
 / {
 	model = "BananaPi-M64";
@@ -56,6 +57,24 @@
 		serial1 = &uart1;
 	};
 
+	vdd_bl: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "bl-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pio 3 7 GPIO_ACTIVE_HIGH>; /* PD7 */
+		enable-active-high;
+	};
+
+	backlight_dsi: backlight-dsi {
+		compatible = "pwm-backlight";
+		pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
+		brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
+		default-brightness-level = <2>;
+		enable-gpios = <&pio 3 5 GPIO_ACTIVE_HIGH>; /* PD5 */
+		power-supply = <&vdd_bl>;
+	};
+
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
@@ -101,6 +120,23 @@
 	status = "okay";
 };
 
+&dphy {
+	status = "okay";
+};
+
+&dsi {
+	status = "okay";
+
+	panel@0 {
+		compatible = "bananapi,s070wv20-ct16-dsi";
+		reg = <0>;
+		avdd-supply = <&reg_dc1sw>;
+		dvdd-supply = <&reg_dldo1>;
+		reset-gpios = <&pio 3 6 GPIO_ACTIVE_HIGH>; /* PD6 */
+		backlight = <&backlight_dsi>;
+	};
+};
+
 &ehci0 {
 	status = "okay";
 };
@@ -193,6 +229,12 @@
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

