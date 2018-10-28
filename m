Return-Path: <SRS0=wuwk=NI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02143C6786F
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF79220665
	for <linux-clk@archiver.kernel.org>; Sun, 28 Oct 2018 12:09:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="sX8mmoUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF79220665
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727551AbeJ1Uxm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 28 Oct 2018 16:53:42 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54211 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726379AbeJ1Uxl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 28 Oct 2018 16:53:41 -0400
Received: by mail-wm1-f66.google.com with SMTP id l26-v6so5485006wmh.3;
        Sun, 28 Oct 2018 05:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pCVwO2pBEbg5sBAY1S5GVLpFl6+CDS82i+nFBiJ4vHk=;
        b=sX8mmoUQLkygILuV+2MGSm1ScxZ3ofrqzRoLm/Ayt2MkedJplBijJ/3ikqJdv5zgFn
         W2ib/INgEQ3tD6qKRLMqdcHdInLW96oCur+JWfD2q5RhsV7kJO4bbslaa01UsJuBgt2o
         pQ2l/I+tgxt233wNL5S44/Da5Js7UUSkVCw3/91AfsqWFq/H4rqJFDHDe+AI2MCO4wIQ
         AUSsPVJumTvh/3uPHDBh32xVY2eFwl9icpGu34vJZK8ZPuPVXVBP+E1VqWxvKHPG0lwL
         rpO4EoSrxL98h/we/Sw9Z3JtgjFS2Ta7pIm2fI7XHY2PDVnEnsN1QwkwCD8eTHq+vJnQ
         JNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pCVwO2pBEbg5sBAY1S5GVLpFl6+CDS82i+nFBiJ4vHk=;
        b=KR07NWZ61xFohoXkhPgUKOWwFqp7K00VC5PFXciH38ZC7JOpGmQSFvMpGVeIBu/TVO
         pFRJxGjvoCZcnzRAKy67HbrmhrBhdxouJRg9Dd2BVyVWhHW8Q4u6CXmQOWpiq4Rls8c3
         f5B5tLnD+7RtC5Z7w6rVIKvfRrtsJp6RIMe8QfwKxBC0E39k/DgB8WisnDPza2Yag+72
         0SnNjxjwHRJhYISydhc+3dt0CKGZ6n0Q7xFEOTiZ+AT+uRWm81JXWlBYDDyOlGS7ypys
         IJffDlpIRpf/gVl90bPvWmRTq6h3vvG2fuUsmksTmS3xtI9Vc93ki6cisIsR8IZ9VP3m
         BHxw==
X-Gm-Message-State: AGRZ1gKpaZq/SlOC4kpUdKJ/P78z78Til84hGzVBMEIf5AQArJxcvMjB
        T3zIk5b5Oghma6tlNTZvR6I=
X-Google-Smtp-Source: AJdET5fvl+mLbUnYQ5xB6fNfeieKwUqPRZRPtd/vV7ppsIkT7JA0/bjjThDq48Jl4m/e+G6m32UYJQ==
X-Received: by 2002:a1c:4601:: with SMTP id t1-v6mr1910446wma.102.1540728551551;
        Sun, 28 Oct 2018 05:09:11 -0700 (PDT)
Received: from blackbox.darklights.net (p200300DCD7072200691979D1FB980407.dip0.t-ipconnect.de. [2003:dc:d707:2200:6919:79d1:fb98:407])
        by smtp.googlemail.com with ESMTPSA id 193-v6sm11699772wmj.21.2018.10.28.05.09.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Oct 2018 05:09:11 -0700 (PDT)
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To:     narmstrong@baylibre.com, jbrunet@baylibre.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
        devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to the HHI register area
Date:   Sun, 28 Oct 2018 13:08:59 +0100
Message-Id: <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock controller on Meson8/Meson8m2 and Meson8b is part of a
register region called "HHI". This register area contains more
functionality than just a clock controller:
- the clock controller
- some reset controller bits
- temperature sensor calibration data (on Meson8b and Meson8m2 only)
- HDMI controller

Allow access to this HHI register area as "system controller". Also
migrate the Meson8 and Meson8b clock controllers to this new node.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm/boot/dts/meson.dtsi   |  7 +++++++
 arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
 arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
index 0d9faf1a51ea..ad903d1a2cb6 100644
--- a/arch/arm/boot/dts/meson.dtsi
+++ b/arch/arm/boot/dts/meson.dtsi
@@ -80,6 +80,13 @@
 			#size-cells = <1>;
 			ranges = <0x0 0xc1100000 0x200000>;
 
+			hhi: system-controller@4000 {
+				compatible = "amlogic,meson-hhi-sysctrl",
+					     "simple-mfd",
+					     "syscon";
+				reg = <0x4000 0x400>;
+			};
+
 			assist: assist@7c00 {
 				compatible = "amlogic,meson-mx-assist", "syscon";
 				reg = <0x7c00 0x200>;
diff --git a/arch/arm/boot/dts/meson8.dtsi b/arch/arm/boot/dts/meson8.dtsi
index 7162e0ca05b0..3e3d9c54cddc 100644
--- a/arch/arm/boot/dts/meson8.dtsi
+++ b/arch/arm/boot/dts/meson8.dtsi
@@ -190,13 +190,6 @@
 };
 
 &cbus {
-	clkc: clock-controller@4000 {
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		compatible = "amlogic,meson8-clkc";
-		reg = <0x8000 0x4>, <0x4000 0x400>;
-	};
-
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
 		reg = <0x4404 0x9c>;
@@ -323,6 +316,14 @@
 	status = "okay";
 };
 
+&hhi {
+	clkc: clock-controller {
+		compatible = "amlogic,meson8-clkc";
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+};
+
 &hwrng {
 	compatible = "amlogic,meson8-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index cd1ca9dda126..f92aab0aa247 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -159,13 +159,6 @@
 };
 
 &cbus {
-	clkc: clock-controller@4000 {
-		#clock-cells = <1>;
-		#reset-cells = <1>;
-		compatible = "amlogic,meson8b-clkc";
-		reg = <0x8000 0x4>, <0x4000 0x400>;
-	};
-
 	reset: reset-controller@4404 {
 		compatible = "amlogic,meson8b-reset";
 		reg = <0x4404 0x9c>;
@@ -313,6 +306,14 @@
 	status = "okay";
 };
 
+&hhi {
+	clkc: clock-controller {
+		compatible = "amlogic,meson8-clkc";
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+	};
+};
+
 &hwrng {
 	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
 	clocks = <&clkc CLKID_RNG0>;
-- 
2.19.1

