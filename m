Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8396C4361B
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 08:59:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C07B122DFA
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 08:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbgLTI7l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Dec 2020 03:59:41 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:4325 "EHLO
        esa5.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727375AbgLTI7l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Dec 2020 03:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1608454780; x=1639990780;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y0wHXlnsAMbE60+mGCPUfMp1sy07D1GG/F7OoDffyCQ=;
  b=ZLthajFGIYxvCry5meGNRvKI1flR85t+ONSnvpa92/bIReLAHCjdNhus
   AXpg//6X5xAEgiMxUEawUC/ySbTUPV4T6irsa8IzWmH9QiqPAnPRE78DD
   0MK7x7o/4KpzOLtwOVa63TtS1W2JRSPSyuUOT6pIaMzzoQCyKsveuXFcU
   FkagAbaXgJEn6r9DM5Dz1P2SnGxZqgBeJwTNws8+gHjuqVzsMRgkHVMPP
   GeUm7hBRXBvBVSuU30IiBM983riXYdBLqnHscR31hF8HGtSK14OTt5tKV
   uBGX8VTf85Q+watuxOmRWOKYEP5UzZRYrbmjXRE0JZ54NCoM6TT0vGFXK
   A==;
IronPort-SDR: gYmJHMBhhIn0Zcub5057hhAQVGHeSHHpHFxt8BBpdlFAk+X+BdB1n56UcczqqRkSvX84jgeqKx
 3++ZAI0cnfDgUOR4k5hkIsp+yvksVoyrLz7o3hzcrxwUxz05KxTt9UKVkNITzYbfy5ArMSFUOA
 NBbA+j0YogtFGQd0hSCdeW5VC1CLNtEDhFNT+MRy4wQImld+QWH8WZpEWHilELhdWiKHfO3+x6
 wdSiKibmSITcG2PVE+csbcjZol65uucXNtWYzzLj4TOm0m5ykwb1HOlviaFDb+pVJsp3ZsLXZ7
 Sgg=
X-IronPort-AV: E=Sophos;i="5.78,434,1599494400"; 
   d="scan'208";a="155618015"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Dec 2020 16:57:31 +0800
IronPort-SDR: A1vVPwJC+m23a0pm+IOzksTG2a1gZps0SezIC6jY9jT9Gj512dJa9DKUFcZS3NMU0A0ugN1/2y
 pjJGBIhkuCtjPt38t1xLipiZ5Z+i8+RQtr0C7K0UkxnWwRH7A8Zath1dgeSRcbTndEsffFn9RT
 1Mko1NY/9+/cF7FQG0yIcLFsCf9OEwTBTtEcucJ1VabvKXfXefLkocs2+tbzBSrrBkeK8FZ4lp
 L5w1yTxkSXurkGzrVMzrPB24+6nWLdo+dvm9QqPjY6wKmv1A+hGrg/KOVY6hkQZSzAtng+riy5
 ZIU7BpdBxbBh0lZFcQ7bE3I9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2020 00:42:44 -0800
IronPort-SDR: ok5mOuf8ypX+6nd1KvoGTIdqI0RGYK4248GcSp3mMmV9lozq0m16yx2MDFqGZsOd93cfsuivdA
 kO3s7aaMZ3zIO3CxWwhYD9TB6wmtEwc4JNxED40gLOJLQUnSMUOBcsdorLybGHa8ML7/KtkEE+
 o49CmaBn9d9QZpR6MQ13oJDHiAl/ZCkFce2YIRjXnwjUNLGophjZHyFe6fmOCBvwExrEzhGYVU
 HBPrDH1h8SMuZaffaGlYW6Hbh5535F3KwDoLny6OuwTgs9nrMDwnOr2y8+y5XDUqYup93SmUWW
 WL8=
WDCIronportException: Internal
Received: from twf009363.ad.shared (HELO twashi.fujisawa.hgst.com) ([10.84.70.7])
  by uls-op-cesaip02.wdc.com with ESMTP; 20 Dec 2020 00:57:31 -0800
From:   Damien Le Moal <damien.lemoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH 2/2] dt-binding: clock: Document canaan,k210-clk bindings
Date:   Sun, 20 Dec 2020 17:57:25 +0900
Message-Id: <20201220085725.19545-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220085725.19545-1-damien.lemoal@wdc.com>
References: <20201220085725.19545-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the device tree bindings of the Canaan Kendryte K210 SoC clock
driver in Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml.
The header file include/dt-bindings/clock/k210-clk.h is modified to
include the complete list of IDs for all clocks of the SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/canaan,k210-clk.yaml       | 54 ++++++++++++++++++
 include/dt-bindings/clock/k210-clk.h          | 56 +++++++++++++++----
 2 files changed, 99 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml

diff --git a/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
new file mode 100644
index 000000000000..565ca468cb44
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/canaan,k210-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan Kendryte K210 Clock Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Canaan Kendryte K210 SoC clocks driver bindings. The clock
+  controller node must be defined as a child node of the K210
+  system controller node.
+
+  See also:
+  - dt-bindings/clock/k210-clk.h
+
+properties:
+  compatible:
+    const: canaan,k210-clk
+
+  clocks:
+    description:
+      Phandle of the SoC 26MHz fixed-rate oscillator clock.
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/k210-clk.h>
+    clocks {
+      in0: oscillator {
+        compatible = "fixed-clock";
+        #clock-cells = <0>;
+        clock-frequency = <26000000>;
+      };
+    };
+
+    /* ... */
+    sysclk: clock-controller {
+      #clock-cells = <1>;
+      compatible = "canaan,k210-clk";
+      clocks = <&in0>;
+    };
diff --git a/include/dt-bindings/clock/k210-clk.h b/include/dt-bindings/clock/k210-clk.h
index 5a2fd64d1a49..a48176ad3c23 100644
--- a/include/dt-bindings/clock/k210-clk.h
+++ b/include/dt-bindings/clock/k210-clk.h
@@ -3,18 +3,52 @@
  * Copyright (C) 2019-20 Sean Anderson <seanga2@gmail.com>
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
-#ifndef K210_CLK_H
-#define K210_CLK_H
+#ifndef CLOCK_K210_CLK_H
+#define CLOCK_K210_CLK_H
 
 /*
- * Arbitrary identifiers for clocks.
- * The structure is: in0 -> pll0 -> aclk -> cpu
- *
- * Since we use the hardware defaults for now, set all these to the same clock.
+ * Kendryte K210 SoC clock identifiers (arbitrary values).
  */
-#define K210_CLK_PLL0   0
-#define K210_CLK_PLL1   0
-#define K210_CLK_ACLK   0
-#define K210_CLK_CPU    0
+#define K210_CLK_ACLK	0
+#define K210_CLK_CPU	0
+#define K210_CLK_SRAM0	1
+#define K210_CLK_SRAM1	2
+#define K210_CLK_AI	3
+#define K210_CLK_DMA	4
+#define K210_CLK_FFT	5
+#define K210_CLK_ROM	6
+#define K210_CLK_DVP	7
+#define K210_CLK_APB0	8
+#define K210_CLK_APB1	9
+#define K210_CLK_APB2	10
+#define K210_CLK_I2S0	11
+#define K210_CLK_I2S1	12
+#define K210_CLK_I2S2	13
+#define K210_CLK_I2S0_M	14
+#define K210_CLK_I2S1_M	15
+#define K210_CLK_I2S2_M	16
+#define K210_CLK_WDT0	17
+#define K210_CLK_WDT1	18
+#define K210_CLK_SPI0	19
+#define K210_CLK_SPI1	20
+#define K210_CLK_SPI2	21
+#define K210_CLK_I2C0	22
+#define K210_CLK_I2C1	23
+#define K210_CLK_I2C2	24
+#define K210_CLK_SPI3	25
+#define K210_CLK_TIMER0	26
+#define K210_CLK_TIMER1	27
+#define K210_CLK_TIMER2	28
+#define K210_CLK_GPIO	29
+#define K210_CLK_UART1	30
+#define K210_CLK_UART2	31
+#define K210_CLK_UART3	32
+#define K210_CLK_FPIOA	33
+#define K210_CLK_SHA	34
+#define K210_CLK_AES	35
+#define K210_CLK_OTP	36
+#define K210_CLK_RTC	37
 
-#endif /* K210_CLK_H */
+#define K210_NUM_CLKS	38
+
+#endif /* CLOCK_K210_CLK_H */
-- 
2.29.2

