Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428C8C3F6A3
	for <linux-clk@archiver.kernel.org>; Fri, 27 Aug 2021 12:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26B7A60FE7
	for <linux-clk@archiver.kernel.org>; Fri, 27 Aug 2021 12:02:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbhH0MDW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Aug 2021 08:03:22 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37078 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245011AbhH0MDV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Aug 2021 08:03:21 -0400
Received: from hq-00021.fritz.box (p57bc979a.dip0.t-ipconnect.de [87.188.151.154])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 5ED73327D08;
        Fri, 27 Aug 2021 11:54:27 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 4/9] dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
Date:   Fri, 27 Aug 2021 13:54:15 +0200
Message-Id: <20210827115420.3052019-5-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827115420.3052019-1-daniel@zonque.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This new flag exists to enable the dynamic mode of the hardware.
When not given, the static mode is used.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml       | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 9047d8a24a08..0abd6ba82dfd 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -54,6 +54,14 @@ properties:
       has missing pulses for up to 20 ms.
     $ref: /schemas/types.yaml#/definitions/flag
 
+  cirrus,dynamic-mode:
+    description:
+      In dynamic mode, the CLK_IN input is used to drive the
+      digital PLL of the silicon.
+      If not given, the static mode shall be used to derive the
+      output signal directly from the REF_CLK input.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 required:
   - compatible
   - reg
-- 
2.31.1

