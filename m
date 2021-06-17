Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 584FDC2B9F4
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D18B613E1
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233130AbhFQTLe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 15:11:34 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37028 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231807AbhFQTLa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jun 2021 15:11:30 -0400
Received: from hq-00021.fritz.box (p57bc9ba2.dip0.t-ipconnect.de [87.188.155.162])
        by mail.bugwerft.de (Postfix) with ESMTPSA id E0A0D4C1579;
        Thu, 17 Jun 2021 19:09:19 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 4/9] dt-bindings: clock: cs2000-cp: document cirrus,clock-skip flag
Date:   Thu, 17 Jun 2021 21:09:07 +0200
Message-Id: <20210617190912.262809-5-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617190912.262809-1-daniel@zonque.org>
References: <20210617190912.262809-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 68efed8e5033..8ad090372988 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -49,6 +49,12 @@ properties:
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

