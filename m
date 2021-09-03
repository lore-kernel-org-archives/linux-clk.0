Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E5AC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 17:31:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C8AF610E6
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 17:31:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350257AbhICRcM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Sep 2021 13:32:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:42276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1350214AbhICRcM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Sep 2021 13:32:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23030610E6;
        Fri,  3 Sep 2021 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630690271;
        bh=AVQ3D9eLA0luMiI/hzKq+79RBzyZcW3X3ujPRZZOFsY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=g1Gf8y+sQQ2xvOxUN6HW0Ibomjk0os5Lu1Ue98BjLG4Lqm1HxH21DxIykq5Ngu4UU
         K/xRcRZPE3+RNBm/k3ErUKG1fdQcBx/2HZZXAszDTe8Bkrh6vO6Lq7fORmMxAlQ9G4
         nsIjfU0DYsAJHgcEmR0uYZ1c8fRIT7ISvvCQ5LXVqbqVkOeCsvfMZEdHT6igqhP1yw
         nhSBECkpM90zhxOQYiq05R1ZwE1StdmiRzDL/Oob93yHyoLR8Mtd41xH2Za+OYeiRh
         u2AZLd7Au7uCzCzKhrYSKvhvFDpTZLMr3PfysZsno1nYyzRvPF7fFxRwaglm65V8fg
         skAgnbcsghEig==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jan Kotas <jank@cadence.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org, pali@kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH RFC] dt-bindings: clk: fixed-mmio-clock: Document mapping MMIO values to clock rates
Date:   Fri,  3 Sep 2021 19:31:07 +0200
Message-Id: <20210903173107.950-1-kabel@kernel.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210903152615.31453-1-kabel@kernel.org>
References: 
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The 'fixed-mmio-clock' binding currently only allows for the fixed-rate
clock frequency to be read directly from the MMIO register.

There are, however, systems for which the value of a register uniquely
determines the frequency, but it is not encoded as a number in the
register. Rather the register may contain the latched values of the
strapping pins during system reset, and the clock rate can be determined
from the value of one strapping pin.

For example on Armada 37xx, the GPIO1[9] pin must be brough low or high
during system reset depending on whether the reference clock rate is
25 MHz or 40 MHz.

Extend this binding by adding two more properties:
- clock-rate-table-mask - if present, the register value will be masked
                          with the value of this property before mapping
- clock-rate-table - table mapping possible clock rates to register
                     values

Signed-off-by: Marek Behún <kabel@kernel.org>
---
This patch applies only after fixed-mmio-clock is converted to YAML by
  dt-bindings: clk: fixed-mmio-clock: Convert to YAML

This is a RFC and does not contain actual driver change. I would like
to hear your opinions.

The reason why I wrote this is that there are several clk drivers
reading one bit of a register and then registering fixed-rate clock
with frequency depending on that one bit. Most of them are drivers
also registering other clocks, but there is at least one,
armada-37xx-xtal, which only does this.

I think that systems where the reference clock can have different rates
and the rate is encoded into value of a strapping pin during reset
should describe these reference clocks in device tree with a table
mapping these possible rates to values of strapping pins.
---
 .../bindings/clock/fixed-mmio-clock.yaml      | 60 +++++++++++++++++--
 1 file changed, 55 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
index 1453ac849a65..67fef63cdd8c 100644
--- a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
@@ -4,16 +4,15 @@
 $id: http://devicetree.org/schemas/clock/fixed-mmio-clock.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Binding for simple memory mapped IO fixed-rate clock sources
+title: Binding for memory mapped IO fixed-rate clock sources
 
 description:
   This binding describes a fixed-rate clock for which the frequency can
-  be read from a single 32-bit memory mapped I/O register.
-
-  It was designed for test systems, like FPGA, not for complete,
-  finished SoCs.
+  be determined from value read from a single 32-bit memory mapped I/O
+  register.
 
 maintainers:
+  - Marek Behún <kabel@kernel.org>
   - Jan Kotas <jank@cadence.com>
 
 properties:
@@ -29,11 +28,50 @@ properties:
   clock-output-names:
     maxItems: 1
 
+  clock-rate-table:
+    $ref: /schemas/types.yaml#/definitions/uint32-matrix
+    description: |
+      If this property is present, it means that the MMIO register does
+      not contain the clock rate itself, but rather that different
+      values of this register (possibly masked, see the
+      'clock-rate-table-mask' property) correspond to different clock
+      rates, and this property maps each possible clock rate to
+      corresponding register value.
+
+      Some SOCs, for example, allow for multiple possible frequencies of
+      reference clocks, and the system can determine clock rate by the
+      values of strapping pins during reset, which are latched into some
+      MMIO registers.
+
+  clock-rate-table-mask:
+    description:
+      Mask to be applied to the MMIO value before mapping the value to
+      corresponding clock rate via 'clock-rate-table'.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+    items:
+      minItems: 2
+      maxItems: 2
+      items:
+        - description:
+            Clock rate in Hertz.
+        - description:
+            MMIO value (masked with value of the 'clock-rate-table-mask'
+            property, if that property is present) corresponding to this
+            clock rate.
+
 required:
   - compatible
   - reg
   - "#clock-cells"
 
+if:
+  required:
+    - clock-rate-table-mask
+then:
+  required:
+    - clock-rate-table
+
 additionalProperties: false
 
 examples:
@@ -44,4 +82,16 @@ examples:
       reg = <0xfd020004 0x4>;
       clock-output-names = "sysclk";
     };
+
+  - |
+    xtalclk: xtal-clk {
+      compatible = "marvell,armada-3700-xtal-clock", "fixed-mmio-clock";
+      #clock-cells = <0>;
+      reg = <0x8 0x4>;
+      clock-rate-table-mask = <0x200>;
+      clock-rate-table = <25000000 0x000>,
+                         <40000000 0x200>;
+      clock-output-names = "xtal";
+    };
+
 ...
-- 
2.32.0

