Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 445F6C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15CA3206A2
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="r3QAP4yq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388341AbeLQThI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:37:08 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:24857 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726758AbeLQThH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 14:37:07 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 43JWbG1f2vz60;
        Mon, 17 Dec 2018 20:35:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1545075339; bh=B0IHFVymz4dj8jF2LKmyqX+dBVLS/zqRKUHcldhF5Gk=;
        h=Date:From:Subject:To:Cc:From;
        b=r3QAP4yqmHq5ohv2mGSblubtmuQu0og9rS0DDxWSZzVsXD1vS3CQmEKD7AUppxmtd
         /BHKpER3w4meNax3vP6LYIZgW5Iy2d5lAo63jd+GlXgG3kh9rH9v9MQw/lUV1PP2m0
         vRCPITXVDEY/f2MqepoARGUynQUafPYxzX8gxW1kI+ekpDp7pKWrCRh6MmhDD9knMo
         W0mQg3WC8GbtB/QaY6kj/rJP5IOHnbSjXBSZ2berNG2yGJVCpjsT6S9+2ACFFkQ+t8
         AFyt8TYDiyRrNAZkxtAYMTk4fH8I3X4PwuYBEI5b4m7+xPtIZ8yOhZpM6M9J7D9TGe
         Rfb/L3lk7MMFA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.2 at mail
Date:   Mon, 17 Dec 2018 20:37:04 +0100
Message-Id: <e07fdef0c9a959a6e820a040048e9ab5b7aec9d2.1545075103.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] clk: at91: enable AUDIOPLL as source for PCKx
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SAMA5D2x have 6 sources, the last being AUDIOPLL.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 arch/arm/boot/dts/sama5d2.dtsi | 2 +-
 drivers/clk/at91/dt-compat.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sama5d2.dtsi b/arch/arm/boot/dts/sama5d2.dtsi
index dd0dda6ed44b..6c8c15c363e4 100644
--- a/arch/arm/boot/dts/sama5d2.dtsi
+++ b/arch/arm/boot/dts/sama5d2.dtsi
@@ -526,7 +526,7 @@
 					#address-cells = <1>;
 					#size-cells = <0>;
 					interrupt-parent = <&pmc>;
-					clocks = <&clk32k>, <&main>, <&plladiv>, <&utmi>, <&mck>;
+					clocks = <&clk32k>, <&main>, <&plladiv>, <&utmi>, <&mck>, <&audio_pll_pmc>;
 
 					prog0: prog0 {
 						#clock-cells = <0>;
diff --git a/drivers/clk/at91/dt-compat.c b/drivers/clk/at91/dt-compat.c
index b95bb4e2a927..19badfc51f50 100644
--- a/drivers/clk/at91/dt-compat.c
+++ b/drivers/clk/at91/dt-compat.c
@@ -17,7 +17,7 @@
 
 #define PERIPHERAL_ID_MIN	2
 
-#define PROG_SOURCE_MAX		5
+#define PROG_SOURCE_MAX		6
 #define PROG_ID_MAX		7
 
 #define SYSTEM_MAX_ID		31
-- 
2.19.2

