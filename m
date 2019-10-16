Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4060FA3728
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 14:56:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DF7B21D71
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 14:56:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731480AbfJPO4y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 10:56:54 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:34414 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729584AbfJPO4y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 10:56:54 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id EEws2100F05gfCL06EwsXp; Wed, 16 Oct 2019 16:56:52 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkjM-0003sv-As; Wed, 16 Oct 2019 16:56:52 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iKkjM-0007oe-7o; Wed, 16 Oct 2019 16:56:52 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas: rcar-usb2-clock-sel: Fix typo in example
Date:   Wed, 16 Oct 2019 16:56:50 +0200
Message-Id: <20191016145650.30003-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The documented compatible value for R-Car H3 is
"renesas,r8a7795-rcar-usb2-clock-sel", not
"renesas,r8a77950-rcar-usb2-clock-sel".

Fixes: 311accb64570db45 ("clk: renesas: rcar-usb2-clock-sel: Add R-Car USB 2.0 clock selector PHY")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This binding has no DTS users in upstream, nor in the BSP?
---
 .../devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
index e96e085271c134f4..83f6c6a7c41c76ca 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
+++ b/Documentation/devicetree/bindings/clock/renesas,rcar-usb2-clock-sel.txt
@@ -46,7 +46,7 @@ Required properties:
 Example (R-Car H3):
 
 	usb2_clksel: clock-controller@e6590630 {
-		compatible = "renesas,r8a77950-rcar-usb2-clock-sel",
+		compatible = "renesas,r8a7795-rcar-usb2-clock-sel",
 			     "renesas,rcar-gen3-usb2-clock-sel";
 		reg = <0 0xe6590630 0 0x02>;
 		clocks = <&cpg CPG_MOD 703>, <&usb_extal>, <&usb_xtal>;
-- 
2.17.1

