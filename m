Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C238C4321E
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34363611F0
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240642AbhJOOz6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240628AbhJOOz5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 10:55:57 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D32D9C061762;
        Fri, 15 Oct 2021 07:53:50 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc9963.dip0.t-ipconnect.de [87.188.153.99])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 5212148E45B;
        Fri, 15 Oct 2021 14:53:49 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v4 3/9] dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
Date:   Fri, 15 Oct 2021 16:53:20 +0200
Message-Id: <20211015145326.1018458-4-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015145326.1018458-1-daniel@zonque.org>
References: <20211015145326.1018458-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This mode allows the PLL to maintain lock even when CLK_IN has
missing pulses for up to 20 ms.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 79b90500f6ac..9047d8a24a08 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -48,6 +48,12 @@ properties:
       - 3 # CS2000CP_AUX_OUTPUT_PLL_LOCK: pll lock status
     default: 0
 
+  cirrus,clock-skip:
+    description:
+      This mode allows the PLL to maintain lock even when CLK_IN
+      has missing pulses for up to 20 ms.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
-- 
2.31.1

