Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C24FC31D68
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 12:19:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231887AbhLNMTB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:19:01 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:48170 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231889AbhLNMS7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Dec 2021 07:18:59 -0500
Received: from hq-00021.fritz.box (p57bc964a.dip0.t-ipconnect.de [87.188.150.74])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 650164ECA20;
        Tue, 14 Dec 2021 12:09:37 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v4 4/9] dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
Date:   Tue, 14 Dec 2021 13:09:24 +0100
Message-Id: <20211214120929.2829705-5-daniel@zonque.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214120929.2829705-1-daniel@zonque.org>
References: <20211214120929.2829705-1-daniel@zonque.org>
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

