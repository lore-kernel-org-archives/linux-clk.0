Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809EDC2B9F4
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jun 2021 23:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4DC5E610A1
	for <linux-clk@archiver.kernel.org>; Sat, 19 Jun 2021 23:07:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbhFSXJq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Jun 2021 19:09:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhFSXJp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Jun 2021 19:09:45 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE840C061574
        for <linux-clk@vger.kernel.org>; Sat, 19 Jun 2021 16:07:31 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b37so19385218ljr.13
        for <linux-clk@vger.kernel.org>; Sat, 19 Jun 2021 16:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4uAsztydLxaZMfHizjxDP1al8AsnqSFgMu5crT3VCU=;
        b=Sn9bsc5ADVvuS6+e2GkSc5wBvD6amldvMb1fw30E8014lsQjBsbYJ+xhar6EogJ67C
         9uUZNIDJPjcwvAkBYOtksD5u83CHMImhP68wwZlRFeRZKWl0vhgOyTBPsjWGj3dGANXc
         LDXOw4wISsaD9crRdpXfyQNAHzbCmnjPi4DvMvEiaCtKyeERY31gLyZ3sSJJDVNVcWtY
         EEZQZHHOkyfkHlCOSAumrExrCSTL4clb+HOLBEUADAr+37j9CdbyjQ0q9OUniDuGy9gz
         VZZt9e6dlUJ5ECXOPBIrNZkyDrr97bXx/tfttjCUWeMXfmn7rIBenoxBXTzZgWPO4S4C
         SLzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=j4uAsztydLxaZMfHizjxDP1al8AsnqSFgMu5crT3VCU=;
        b=eOfwADjjt/t8yQJarJPDeuYXGVDlS8aPdNcTwICqqRIXA0yRw4Z167wEp5fUZZFUDt
         hkefy3O7sd13UfIQddsUKs/FZT7D1SXdBs30Ai0xk7Hv76pD3yL2xXUfo7+2lnbz7m5C
         ug5wlg4xSQRctp84woL6hcb9W4/cFniaFzUSuT/GQYhlLTNr5YOivIpBxerYM727DMzv
         988tTuS7T6/ihdT2l7jlOmLEq8ZZ1MlSVvsGTX60BH2JwsDaVQHvrR3SeriOLYEkxoHf
         +tMyNXVv3N7bRBzRY9GbLDKOTYfmv4FPpJe58VwuhSB9DUJmCvVJDTQEgXbEi/GaImKH
         E6gw==
X-Gm-Message-State: AOAM532Gksy327ckZYspWUmmvRGE9oA4sUws5Gnx+aHKX7RB9ZW/ZnQe
        5m+hbLNZhxl2kps3a4BVEOU/MQ==
X-Google-Smtp-Source: ABdhPJwewL0RPC2zcGPDeGJs5fjAVTPR+mwOmkB54KjhcwGEqKwgxuiYUTrPR6ySYzKxFxv/dtSCvg==
X-Received: by 2002:a2e:b165:: with SMTP id a5mr6831035ljm.82.1624144049898;
        Sat, 19 Jun 2021 16:07:29 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id s21sm1579392lji.57.2021.06.19.16.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jun 2021 16:07:29 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: u8500: Rewrite in YAML and extend
Date:   Sun, 20 Jun 2021 01:05:25 +0200
Message-Id: <20210619230526.1864087-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This rewrites the ux500/u8500 clock bindings in YAML schema and extends them
with the PRCC reset controller.

The bindings are a bit idiomatic but it just reflects their age, the ux500
platform was used as guinea pig for early device tree conversion of platforms
in 2015. The new subnode for the reset controller follows the pattern of the
old bindings and adds a node with reset-cells for this.

Cc: devicetree@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../bindings/clock/stericsson,u8500-clks.yaml | 113 ++++++++++++++++++
 .../devicetree/bindings/clock/ux500.txt       |  64 ----------
 .../reset/stericsson,db8500-prcc-reset.h      |  51 ++++++++
 3 files changed, 164 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/ux500.txt
 create mode 100644 include/dt-bindings/reset/stericsson,db8500-prcc-reset.h

diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
new file mode 100644
index 000000000000..b3eca95299ab
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST-Ericsson DB8500 (U8500) clocks
+
+maintainers:
+  - Ulf Hansson <ulf.hansson@linaro.org>
+  - Linus Walleij <linus.walleij@linaro.org>
+
+description: While named "U8500 clocks" these clocks are inside the
+  DB8500 digital baseband system-on-chip and its siblings such as
+  DB8520. These bindings consider the clocks present in the SoC
+  itself, not off-chip clocks. There are four different on-chip
+  clocks - RTC (32 kHz), CPU clock (SMP TWD), PRCMU (power reset and
+  control management unit) clocks and PRCC (peripheral reset and
+  clock controller) clocks.
+
+properties:
+  compatible:
+    oneOf:
+      - const: stericsson,u8500-clks
+      - const: stericsson,u8540-clks
+      - const: stericsson,u9540-clks
+
+  reg:
+    items:
+      - description: PRCC 1 register area
+      - description: PRCC 2 register area
+      - description: PRCC 3 register area
+      - description: PRCC 5 register area
+      - description: PRCC 6 register area
+
+  prcmu-clock:
+    description: A subnode with one clock cell for PRCMU (power, reset, control
+      management unit) clocks. The cell indicates which PRCMU clock in the
+      prcmu-clock node the consumer wants to use.
+    type: object
+
+    properties:
+      '#clock-cells':
+        const: 1
+
+    additionalProperties: false
+
+  prcc-periph-clock:
+    description: A subnode with two clock cells for PRCC (peripheral
+      reset and clock controller) peripheral clocks. The first cell indicates
+      which PRCC block the consumer wants to use, possible values are 1, 2, 3,
+      5, 6. The second cell indicates which clock inside the PRCC block it
+      wants, possible values are 0 thru 31.
+    type: object
+
+    properties:
+      '#clock-cells':
+        const: 2
+
+    additionalProperties: false
+
+  prcc-kernel-clock:
+    description: A subnode with two clock cells for PRCC (peripheral reset
+      and clock controller) kernel clocks. The first cell indicates which PRCC
+      block the consumer wants to use, possible values are 1, 2, 3, 5, 6. The
+      second cell indicates which clock inside the PRCC block it wants, possible
+      values are 0 thru 31.
+    type: object
+
+    properties:
+      '#clock-cells':
+        const: 2
+
+    additionalProperties: false
+
+  prcc-reset-controller:
+    description: A subnode with two reset cells for the reset portions of the
+      PRCC (peripheral reset and clock controller). The first cell indicates
+      which PRCC block the consumer wants to use, possible values are 1, 2, 3
+      5 and 6. The second cell indicates which reset line inside the PRCC block
+      it wants to control, possible values are 0 thru 31.
+
+  rtc32k-clock:
+    description: A subnode with zero clock cells for the 32kHz RTC clock.
+    type: object
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    additionalProperties: false
+
+  smp-twd-clock:
+    description: A subnode for the ARM SMP Timer Watchdog cluster with zero
+      clock cells.
+    type: object
+
+    properties:
+      '#clock-cells':
+        const: 0
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - prcmu-clock
+  - prcc-periph-clock
+  - prcc-kernel-clock
+  - rtc32k-clock
+  - smp-twd-clock
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/clock/ux500.txt b/Documentation/devicetree/bindings/clock/ux500.txt
deleted file mode 100644
index e52bd4b72348..000000000000
--- a/Documentation/devicetree/bindings/clock/ux500.txt
+++ /dev/null
@@ -1,64 +0,0 @@
-Clock bindings for ST-Ericsson Ux500 clocks
-
-Required properties :
-- compatible : shall contain only one of the following:
-  "stericsson,u8500-clks"
-  "stericsson,u8540-clks"
-  "stericsson,u9540-clks"
-- reg : shall contain base register location and length for
-  CLKRST1, 2, 3, 5, and 6 in an array. Note the absence of
-  CLKRST4, which does not exist.
-
-Required subnodes:
-- prcmu-clock: a subnode with one clock cell for PRCMU (power,
-  reset, control unit) clocks. The cell indicates which PRCMU
-  clock in the prcmu-clock node the consumer wants to use.
-- prcc-periph-clock: a subnode with two clock cells for
-  PRCC (programmable reset- and clock controller) peripheral clocks.
-  The first cell indicates which PRCC block the consumer
-  wants to use, possible values are 1, 2, 3, 5, 6. The second
-  cell indicates which clock inside the PRCC block it wants,
-  possible values are 0 thru 31.
-- prcc-kernel-clock: a subnode with two clock cells for
-  PRCC (programmable reset- and clock controller) kernel clocks
-  The first cell indicates which PRCC block the consumer
-  wants to use, possible values are 1, 2, 3, 5, 6. The second
-  cell indicates which clock inside the PRCC block it wants,
-  possible values are 0 thru 31.
-- rtc32k-clock: a subnode with zero clock cells for the 32kHz
-  RTC clock.
-- smp-twd-clock: a subnode for the ARM SMP Timer Watchdog cluster
-  with zero clock cells.
-
-Example:
-
-clocks {
-	compatible = "stericsson,u8500-clks";
-	/*
-	 * Registers for the CLKRST block on peripheral
-	 * groups 1, 2, 3, 5, 6,
-	 */
-	reg = <0x8012f000 0x1000>, <0x8011f000 0x1000>,
-	    <0x8000f000 0x1000>, <0xa03ff000 0x1000>,
-	    <0xa03cf000 0x1000>;
-
-	prcmu_clk: prcmu-clock {
-		#clock-cells = <1>;
-	};
-
-	prcc_pclk: prcc-periph-clock {
-		#clock-cells = <2>;
-	};
-
-	prcc_kclk: prcc-kernel-clock {
-		#clock-cells = <2>;
-	};
-
-	rtc_clk: rtc32k-clock {
-		#clock-cells = <0>;
-	};
-
-	smp_twd_clk: smp-twd-clock {
-		#clock-cells = <0>;
-	};
-};
diff --git a/include/dt-bindings/reset/stericsson,db8500-prcc-reset.h b/include/dt-bindings/reset/stericsson,db8500-prcc-reset.h
new file mode 100644
index 000000000000..ea906896c70f
--- /dev/null
+++ b/include/dt-bindings/reset/stericsson,db8500-prcc-reset.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _DT_BINDINGS_STE_PRCC_RESET
+#define _DT_BINDINGS_STE_PRCC_RESET
+
+#define DB8500_PRCC_1				1
+#define DB8500_PRCC_2				2
+#define DB8500_PRCC_3				3
+#define DB8500_PRCC_6				6
+
+/* Reset lines on PRCC 1 */
+#define DB8500_PRCC_1_RESET_UART0		0
+#define DB8500_PRCC_1_RESET_UART1		1
+#define DB8500_PRCC_1_RESET_I2C1		2
+#define DB8500_PRCC_1_RESET_MSP0		3
+#define DB8500_PRCC_1_RESET_MSP1		4
+#define DB8500_PRCC_1_RESET_SDI0		5
+#define DB8500_PRCC_1_RESET_I2C2		6
+#define DB8500_PRCC_1_RESET_SPI3		7
+#define DB8500_PRCC_1_RESET_SLIMBUS0		8
+#define DB8500_PRCC_1_RESET_I2C4		9
+#define DB8500_PRCC_1_RESET_MSP3		10
+#define DB8500_PRCC_1_RESET_PER_MSP3		11
+#define DB8500_PRCC_1_RESET_PER_MSP1		12
+#define DB8500_PRCC_1_RESET_PER_MSP0		13
+#define DB8500_PRCC_1_RESET_PER_SLIMBUS		14
+
+/* Reset lines on PRCC 2 */
+#define DB8500_PRCC_2_RESET_I2C3		0
+#define DB8500_PRCC_2_RESET_PWL			1
+#define DB8500_PRCC_2_RESET_SDI4		2
+#define DB8500_PRCC_2_RESET_MSP2		3
+#define DB8500_PRCC_2_RESET_SDI1		4
+#define DB8500_PRCC_2_RESET_SDI3		5
+#define DB8500_PRCC_2_RESET_HSIRX		6
+#define DB8500_PRCC_2_RESET_HSITX		7
+#define DB8500_PRCC_1_RESET_PER_MSP2		8
+
+/* Reset lines on PRCC 3 */
+#define DB8500_PRCC_3_RESET_SSP0		1
+#define DB8500_PRCC_3_RESET_SSP1		2
+#define DB8500_PRCC_3_RESET_I2C0		3
+#define DB8500_PRCC_3_RESET_SDI2		4
+#define DB8500_PRCC_3_RESET_SKE			5
+#define DB8500_PRCC_3_RESET_UART2		6
+#define DB8500_PRCC_3_RESET_SDI5		7
+
+/* Reset lines on PRCC 6 */
+#define DB8500_PRCC_3_RESET_RNG			0
+
+#endif
-- 
2.31.1

