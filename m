Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1541FC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 21 Sep 2021 18:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F13EB61211
	for <linux-clk@archiver.kernel.org>; Tue, 21 Sep 2021 18:50:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhIUSvj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Sep 2021 14:51:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231615AbhIUSvi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Sep 2021 14:51:38 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5CB9C061574
        for <linux-clk@vger.kernel.org>; Tue, 21 Sep 2021 11:50:09 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id b20so1559033lfv.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Sep 2021 11:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KMbxJO3zOwv+duZ5IuR+6ZjICt4Z4s7ZUFMq1VCBLos=;
        b=TsSMI6eFs+RMIquRD9Gigga3UXYwbEITTLawMWULvEyKsvyeMkXrnp5/vhWt1wA1eN
         OeGcC9ZprJYyeCnnsW3MGb4DkuY3wQjiw+nMOomaCavRssXta7H5nlA05pduOcWk+cn4
         ElFSGqODJ3nARUXumWhRINqv+8X/2O0lxjpSuzr6lpTX6ucTi73/0cwI1MmrRsIKQBIj
         qNnRY334+jtDWld+mZboooDRc2eEQKS2rFwsvsiYaS30TpZiquQPBboI11YWPurib8rG
         Cxg5uow1JopDeR5BPBlrvaPnlYO2csu/k4l8P9km4j2996T6ZGrI7l+4fBDa2W+V4zG6
         B8iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KMbxJO3zOwv+duZ5IuR+6ZjICt4Z4s7ZUFMq1VCBLos=;
        b=oGAcfIIyl5JumnNSjqX+4SzEeLJhC297FX5joIcLXcly54tnBATsjayO1o3tdjGyuY
         JNlEASzR/TfQEil+ilnc0iRPCUAhLxksw0eMOxSWfR5E+tdynMzLKr4OUwFLjdiNDZPH
         E13CmkA0bhjjnvfwXM0gm2L9yygy1pEsY9DBHKbjSNEDqv0Ky8/GyurEXxtt7xNYteRv
         8ofGjPtH6yCZ0nJh2mnhWzlebl7qL9xeWXTB+0fwhzqePLHVwOU5w3vdkseSukhbnghT
         SKZn1eL+qDchierEpA/K28hAQfUBOoIZcZiCCpOlCiueGkx+jxe2cgEabw86100Mm8u5
         nfqw==
X-Gm-Message-State: AOAM532cXyoojjXDycyd1bfVTVtI9VMuGgYEGbc7Jzbnkt8u4mWBuaXg
        R+PcJMOR61eyq4yOFt4AhM6LJTTBccaXnQ==
X-Google-Smtp-Source: ABdhPJzdZq8nwHpSkXDV8HvdteSr66qM57XixIqRr86/TpikNWEPnwaRNVr2EAtk9e5ls+PeL+PEww==
X-Received: by 2002:a05:6512:22d5:: with SMTP id g21mr19214050lfu.270.1632250207111;
        Tue, 21 Sep 2021 11:50:07 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j10sm1637408ljh.9.2021.09.21.11.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 11:50:06 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 1/2 v3] dt-bindings: clock: u8500: Rewrite in YAML and extend
Date:   Tue, 21 Sep 2021 20:48:02 +0200
Message-Id: <20210921184803.1757916-1-linus.walleij@linaro.org>
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
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Collect Rob's and Ulf's review tags.
ChangeLog v1->v2:
- Use an enum for compatible.
- Mark the reset controller as object (node)
- Mandate 2 #reset-cells on the reset controller.
- Small blurb that PRCC 4 does not exist.
- Rebase on v5.14-rc1
- Cc Philipp Zabel
---
 .../bindings/clock/stericsson,u8500-clks.yaml | 121 ++++++++++++++++++
 .../devicetree/bindings/clock/ux500.txt       |  64 ---------
 .../reset/stericsson,db8500-prcc-reset.h      |  51 ++++++++
 3 files changed, 172 insertions(+), 64 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/ux500.txt
 create mode 100644 include/dt-bindings/reset/stericsson,db8500-prcc-reset.h

diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
new file mode 100644
index 000000000000..9bc95a308477
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
@@ -0,0 +1,121 @@
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
+  clock controller) clocks. For some reason PRCC 4 does not exist so
+  the itemization can be a bit unintuitive.
+
+properties:
+  compatible:
+    enum:
+      - stericsson,u8500-clks
+      - stericsson,u8540-clks
+      - stericsson,u9540-clks
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
+    type: object
+
+    properties:
+      '#reset-cells':
+        const: 2
+
+    additionalProperties: false
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

