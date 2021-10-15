Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B4CC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6B185611C3
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240707AbhJOOz6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236248AbhJOOz5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 10:55:57 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F3DA6C061764;
        Fri, 15 Oct 2021 07:53:50 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc9963.dip0.t-ipconnect.de [87.188.153.99])
        by mail.bugwerft.de (Postfix) with ESMTPSA id BA77548E45D;
        Fri, 15 Oct 2021 14:53:49 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v4 4/9] dt-bindings: clock: cs2000-cp: document cirrus,dynamic-mode
Date:   Fri, 15 Oct 2021 16:53:21 +0200
Message-Id: <20211015145326.1018458-5-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015145326.1018458-1-daniel@zonque.org>
References: <20211015145326.1018458-1-daniel@zonque.org>
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

