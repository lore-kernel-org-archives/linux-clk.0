Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C659EC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 12:18:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231877AbhLNMS6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231531AbhLNMS5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 07:18:57 -0500
X-Greylist: delayed 557 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 14 Dec 2021 04:18:57 PST
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3B251C061574;
        Tue, 14 Dec 2021 04:18:57 -0800 (PST)
Received: from hq-00021.fritz.box (p57bc964a.dip0.t-ipconnect.de [87.188.150.74])
        by mail.bugwerft.de (Postfix) with ESMTPSA id D687C4ECA1F;
        Tue, 14 Dec 2021 12:09:36 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v4 3/9] dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
Date:   Tue, 14 Dec 2021 13:09:23 +0100
Message-Id: <20211214120929.2829705-4-daniel@zonque.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214120929.2829705-1-daniel@zonque.org>
References: <20211214120929.2829705-1-daniel@zonque.org>
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

