Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F569C41537
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 09:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12616610A8
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 09:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243706AbhIAJhg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Sep 2021 05:37:36 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37094 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243560AbhIAJhf (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 1 Sep 2021 05:37:35 -0400
Received: from hq-00021.holoplot.net (unknown [194.162.236.226])
        by mail.bugwerft.de (Postfix) with ESMTPSA id D81C432D174;
        Wed,  1 Sep 2021 09:36:37 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 4/9] dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
Date:   Wed,  1 Sep 2021 11:36:26 +0200
Message-Id: <20210901093631.1403278-5-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901093631.1403278-1-daniel@zonque.org>
References: <20210901093631.1403278-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This new flag exists to enable the dynamic mode of the hardware.
When not given, the static mode is used.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Rob Herring <robh@kernel.org>
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

