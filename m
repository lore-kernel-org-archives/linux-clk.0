Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6F5CECAAA3
	for <linux-clk@archiver.kernel.org>; Fri, 26 Aug 2022 09:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245698AbiHZJLs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Aug 2022 05:11:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245710AbiHZJLj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Aug 2022 05:11:39 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A28ECEB2C;
        Fri, 26 Aug 2022 02:11:35 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc9b74.dip0.t-ipconnect.de [87.188.155.116])
        by mail.bugwerft.de (Postfix) with ESMTPSA id B9BD528E698;
        Fri, 26 Aug 2022 09:11:33 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 1/2] dt-bindings: clock: cs2000-cp: Document cirrus,pll-lock-timeout-ms
Date:   Fri, 26 Aug 2022 11:11:21 +0200
Message-Id: <20220826091122.2344503-1-daniel@zonque.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This property can be used to set the maximum time to wait for the PLL to
lock.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
v1 -> v2: rename property to standard unit suffix, drop $ref, amend default value
 
.../devicetree/bindings/clock/cirrus,cs2000-cp.yaml          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 0abd6ba82dfd..8e68e1746d1c 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -62,6 +62,11 @@ properties:
       output signal directly from the REF_CLK input.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  cirrus,pll-lock-timeout-ms:
+    description:
+      Specifies the maximum time to wait for the PLL to lock, in milliseconds.
+    default: 100
+
 required:
   - compatible
   - reg
-- 
2.37.2

