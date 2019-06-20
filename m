Return-Path: <SRS0=jKhQ=UT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852BBC48BE3
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C75C2084A
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jun 2019 15:00:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VdSslLtI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732064AbfFTPAj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jun 2019 11:00:39 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36904 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732113AbfFTPAj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jun 2019 11:00:39 -0400
Received: by mail-wr1-f66.google.com with SMTP id v14so3393118wrr.4
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2019 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
        b=VdSslLtIXp8jR0pmF12UjHiRAZxnZj61IXQmVJgReoJLPHEfMYQY6/e2NGkRzRFu8D
         us6kk3w+O5Imf29ygHn0TnHf61CISxKiE7hCnSRJMcYTA8VPFszQYzTSRW1na1aZQhO6
         +hTVcykF0PBuBlMzoCwEIZdMUUuXjc9UgHETxodcfV4oUi3rgg2GTHl7iS1ZazL2a++G
         pONuFmHIGIcHuL4GHYgFNKivOmsCsUNuedYxk2rzKekPImvLfygMg4aw5tEJADlFSJB4
         r8XU9CosbiXJT4pqWs4DjxGjTEZ5ld4TXDNxUoJseuYRaM70tnf6wAKYmghLabwgnK0A
         IvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RQ6YaugFGkpRgh3juxH1I5rV90U2Bkw0dj0SZEZKwc=;
        b=nZNeCvrudXj20IlhjCr35NIoXOvbZoBym2NEfFTcanS/903HyqpQyeItuvXGW/2E2c
         W0E2eefAtY+ij5XdOthnjukFcqmW6zZu1+vogCWIauRwuhD+FdTPhqopYlVlX2hEbmiZ
         yFDUEiCarfZhgbbqLvNn9g2pdKBGoiizZ2mPsYqsoDdjiMTKoWDjJ3G7cOmmM4q3tCc0
         9VdUtyWDqb9wAVoNNuZOeZ7J9FGjCRFS0vdUM/D60+JK5pRWYwgbizo0t/36P5+cSnN7
         /arVum9LhXYFEfsMVk4VZfPyGbE0FCKD50rYXlJFnv8Xu187T4bmPb5ripyeTeyqGZgM
         jCVQ==
X-Gm-Message-State: APjAAAXDZmUw3SWfvvmrrmn7zVZ6ah/nwxSIoJDwaQn7+VWSEBO99mDB
        BKoEvs0ZxG8l860DV1PzIWCcmg==
X-Google-Smtp-Source: APXvYqzFkcqp+IU136AcFO26klI3508FIczvmeG6WnfapKtGfZQW34ACEjuxr2v58Y3CPceRgYRm6w==
X-Received: by 2002:adf:f812:: with SMTP id s18mr27170003wrp.32.1561042836447;
        Thu, 20 Jun 2019 08:00:36 -0700 (PDT)
Received: from bender.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 20 Jun 2019 08:00:35 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com, khilman@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, martin.blumenstingl@googlemail.com,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [RFC/RFT 14/14] arm64: dts: meson-g12b-odroid-n2: enable DVFS
Date:   Thu, 20 Jun 2019 17:00:13 +0200
Message-Id: <20190620150013.13462-15-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable DVFS for the Odroid-N2 by setting the clock, OPP and supply
for each cores of each CPU clusters.

The first cluster uses the "VDDCPU_B" power supply, and the second
cluster uses the "VDDCPU_A" power supply.

Each power supply can achieve 0.73V to 1.01V using 2 distinct PWM
outputs clocked at 800KHz with an inverse duty-cycle.

DVFS has been tested by running the arm64 cpuburn at [1] and cycling
between all the possible cpufreq translations of each cluster and
checking the final frequency using the clock-measurer, script at [2].

[1] https://github.com/ssvb/cpuburn-arm/blob/master/cpuburn-a53.S
[2] https://gist.github.com/superna9999/d4de964dbc0f84b7d527e1df2ddea25f

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index c3e0735e6d9f..0db1547bfb5a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -114,6 +114,44 @@
 		/* FIXME: actually controlled by VDDCPU_B_EN */
 	};
 
+	vddcpu_a: regulator-vddcpu-a {
+		/*
+		 * MP8756GD Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_A";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_ab 0 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	vddcpu_b: regulator-vddcpu-b {
+		/*
+		 * Silergy SY8120B1ABC Regulator.
+		 */
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU_B";
+		regulator-min-microvolt = <721000>;
+		regulator-max-microvolt = <1022000>;
+
+		vin-supply = <&main_12v>;
+
+		pwms = <&pwm_AO_cd 1 1250 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	hub_5v: regulator-hub_5v {
 		compatible = "regulator-fixed";
 		regulator-name = "HUB_5V";
@@ -245,6 +283,48 @@
 	status = "okay";
 };
 
+&cpu0 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu1 {
+	cpu-supply = <&vddcpu_b>;
+	operating-points-v2 = <&cpu_opp_table_0>;
+	clocks = <&clkc CLKID_CPU_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu100 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu101 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu102 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
+&cpu103 {
+	cpu-supply = <&vddcpu_a>;
+	operating-points-v2 = <&cpub_opp_table_1>;
+	clocks = <&clkc CLKID_CPUB_CLK>;
+	clock-latency = <50000>;
+};
+
 &ext_mdio {
 	external_phy: ethernet-phy@0 {
 		/* Realtek RTL8211F (0x001cc916) */	
@@ -308,6 +388,22 @@
 	pinctrl-names = "default";
 };
 
+&pwm_ab {
+	pinctrl-0 = <&pwm_a_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin0";
+	status = "okay";
+};
+
+&pwm_AO_cd {
+	pinctrl-0 = <&pwm_ao_d_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&xtal>;
+	clock-names = "clkin1";
+	status = "okay";
+};
+
 /* SD card */
 &sd_emmc_b {
 	status = "okay";
-- 
2.21.0

