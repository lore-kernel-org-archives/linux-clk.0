Return-Path: <SRS0=TP+b=D2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C14C54FB2
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 12:06:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BEB5822283
	for <linux-clk@archiver.kernel.org>; Mon, 19 Oct 2020 12:06:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgJSMGV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Oct 2020 08:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726866AbgJSMGU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Oct 2020 08:06:20 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD48EC0613DD
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2020 05:06:19 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id ho6G2300H4C55Sk01o6GfZ; Mon, 19 Oct 2020 14:06:17 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0000WR-ME; Mon, 19 Oct 2020 14:06:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kUTvc-0005mG-LL; Mon, 19 Oct 2020 14:06:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/6] dt-bindings: gpio: rcar: Add r8a779a0 support
Date:   Mon, 19 Oct 2020 14:06:12 +0200
Message-Id: <20201019120614.22149-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201019120614.22149-1-geert+renesas@glider.be>
References: <20201019120614.22149-1-geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the compatible value for the GPIO block in the Renesas R-Car
V3U (R8A779A0) SoC.

While this GPIO block is mostly compatible with GPIO blocks on R-Car
Gen3 SoCs, there are small differences, and one of the new registers
needs to be configured differently from its initial reset state.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested on actual hardware.
---
 Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
index 5026662e45081b6c..f2541739ee3b9f7c 100644
--- a/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/renesas,rcar-gpio.yaml
@@ -48,6 +48,9 @@ properties:
               - renesas,gpio-r8a77995     # R-Car D3
           - const: renesas,rcar-gen3-gpio # R-Car Gen3 or RZ/G2
 
+      - items:
+          - const: renesas,gpio-r8a779a0  # R-Car V3U
+
   reg:
     maxItems: 1
 
-- 
2.17.1

