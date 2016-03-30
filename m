Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43643 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752708AbcC3O7s (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 30 Mar 2016 10:59:48 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 5/5] arm64: dts: salvator-x: populate EXTALR
Date: Wed, 30 Mar 2016 16:58:22 +0200
Message-Id: <1459349902-13243-6-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
References: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

It can be used for the watchdog.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Since V1, added tag.

 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index 26f140d7cb6d1e..dbea5078fec367 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -289,6 +289,10 @@
 	clock-frequency = <16666666>;
 };
 
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
-- 
2.7.0

