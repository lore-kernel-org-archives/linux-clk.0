Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79000C433E0
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 09:57:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2474F23975
	for <linux-clk@archiver.kernel.org>; Thu, 21 Jan 2021 09:57:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728531AbhAUJ5E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Jan 2021 04:57:04 -0500
Received: from www.zeus03.de ([194.117.254.33]:44362 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728655AbhAUJzj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 21 Jan 2021 04:55:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=uksYeCcVUFxrvm
        Pit7jOD0T+OgZnQ7UmlfpvXIEtP50=; b=nY2TLTUy5BwiRuDreMBJrQXgfarjPV
        rGEwv0QlKDXOAR+xZIuuKsmItPF1MUO93woOF9FvHppqR1n+toL+GHrpXmI0fI6R
        Xt6WS1NhMrs6u1LQ/RiTgpZeBID64eJh6lR0OxABiwb2MKqCHbn4EN+I4TTid/1c
        +66FynKRGzAyE=
Received: (qmail 1784134 invoked from network); 21 Jan 2021 10:54:29 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 10:54:29 +0100
X-UD-Smtp-Session: l3s3148p1@bYLKDma5or4gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH V2 4/4] v3u: enable other I2C busses for testing
Date:   Thu, 21 Jan 2021 10:54:20 +0100
Message-Id: <20210121095420.5023-5-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
References: <20210121095420.5023-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Not for upstream!

Not-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
* removed bus 6
* moved to falcon-cpu.dtsi

 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index 90aa1395a49f..6dcd4683b071 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -57,6 +57,38 @@ &i2c1 {
 	clock-frequency = <400000>;
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c3 {
+	pinctrl-0 = <&i2c3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c4 {
+	pinctrl-0 = <&i2c4_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
+&i2c5 {
+	pinctrl-0 = <&i2c5_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <100000>;
+};
+
 &i2c6 {
 	pinctrl-0 = <&i2c6_pins>;
 	pinctrl-names = "default";
@@ -76,6 +108,26 @@ i2c1_pins: i2c1 {
 		function = "i2c1";
 	};
 
+	i2c2_pins: i2c2 {
+		groups = "i2c2";
+		function = "i2c2";
+	};
+
+	i2c3_pins: i2c3 {
+		groups = "i2c3";
+		function = "i2c3";
+	};
+
+	i2c4_pins: i2c4 {
+		groups = "i2c4";
+		function = "i2c4";
+	};
+
+	i2c5_pins: i2c5 {
+		groups = "i2c5";
+		function = "i2c5";
+	};
+
 	i2c6_pins: i2c6 {
 		groups = "i2c6";
 		function = "i2c6";
-- 
2.29.2

