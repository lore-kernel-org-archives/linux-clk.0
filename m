Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EBAC48BDF
	for <linux-clk@archiver.kernel.org>; Sun, 13 Jun 2021 20:45:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D02A96134F
	for <linux-clk@archiver.kernel.org>; Sun, 13 Jun 2021 20:45:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232098AbhFMUr5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Jun 2021 16:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231840AbhFMUr4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Jun 2021 16:47:56 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE880C061574
        for <linux-clk@vger.kernel.org>; Sun, 13 Jun 2021 13:45:45 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id g22so1953686pgk.1
        for <linux-clk@vger.kernel.org>; Sun, 13 Jun 2021 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nigauri-org.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hj6PxG9Uu38xsSuh/hPwTGIxfZIdP7m3pLuGKjMI4Ig=;
        b=bmu2JThxVHAxXOKEYhsFEtuH0nryHuVmYu4OmNnz+kZZWdpYhkWRc2E6+JxoadL7dt
         2RbYeGwq0TA/zqWtVfOrLWuziOLWAsjYdJ4ajxfi7s7wxW7PWFmO9H/i2YxE7GIQFb8m
         t88txhMBaBgPrkVc77atYDYUM2cx6EeSQWO32R5hX0fF7r+MV3FFncfZLuZq2Nk6TqXS
         mIT7kmINjqLUpFEaaUwojPFAmIwXVyxAxWPN0JWtzvFbYz9pWXm0V6kLyQlnOjFL30iK
         6iwoooocEtD888TmW/lxUiv+JSYIhHILQl/NvBHTxNhWN/tPAUU2cATvJiZp1e/d5tdX
         wJIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hj6PxG9Uu38xsSuh/hPwTGIxfZIdP7m3pLuGKjMI4Ig=;
        b=LKjh9Suj7CGMvskVOIGv8nHIK/sJybXl9n/N5Ui+J/9lBSJGkOHTJvoJ23pAFBOUIP
         OUh/nfETR+TjLAkQVYWCB3uPB3gfDrAoXugqU5VhiOCoihF27rpDFNbp/HuY3afJY5L7
         oE7f+pRjPCmCjmXds7md1mV2bMyIZ+q1DFEeYksgCWJk0H0evU9X/Pw0PjwTKNPa1ati
         /3DrJ4UrKItyK/ZQVWuAnoQqW11E2QkArG9LN7p3etoiQwQNPpmX/cYYZLlba2yRIMNn
         dFfU4myB8fn60XBZYvCyL5ayi4wX5i35pb/TnTV5HvxLpcIhlm/oqJ0bV8SdesvyZHeF
         DdkA==
X-Gm-Message-State: AOAM532WpmYiOD6OFhZLyx1buVSXAKMRtMq9eniswexw1mqles9Xm43X
        9tURWFJKrSI9NlFRdSXl5kYu
X-Google-Smtp-Source: ABdhPJySEgrWjFdxISwelgWe5aaaq9/MjvjjsiLJBt9wbvsLwYM8vvx3QL1cWls+noKMXLzqTlO/Pw==
X-Received: by 2002:a62:ea1a:0:b029:2ec:9146:30be with SMTP id t26-20020a62ea1a0000b02902ec914630bemr18700202pfh.29.1623617145141;
        Sun, 13 Jun 2021 13:45:45 -0700 (PDT)
Received: from localhost ([2405:6581:5360:1800:7285:c2ff:fec2:8f97])
        by smtp.gmail.com with ESMTPSA id iq15sm14651277pjb.53.2021.06.13.13.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 13:45:44 -0700 (PDT)
From:   Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
To:     michal.simek@xilinx.com, mturquette@baylibre.com, robh@kernel.org,
        sboyd@kernel.org
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
Subject: [PATCH v3] dt-bindings: rtc: zynqmp: convert bindings to YAML
Date:   Mon, 14 Jun 2021 05:45:32 +0900
Message-Id: <20210613204532.291512-1-iwamatsu@nigauri.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert Real Time Clock for Xilinx Zynq MPSoC SoC bindings documentation
to YAML schemas.
And this renamed the file to compatible string of DT.

Signed-off-by: Nobuhiro Iwamatsu <iwamatsu@nigauri.org>
---
v3: Fix description.
    Add $refs to calibration property.
    Add minimum, maximum and default to calibration property.
v2: Fix warning with DT_CHECKER_FLAGS=-m

 .../bindings/rtc/xlnx,zynqmp-rtc.yaml         | 65 +++++++++++++++++++
 .../devicetree/bindings/rtc/xlnx-rtc.txt      | 25 -------
 2 files changed, 65 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
 delete mode 100644 Documentation/devicetree/bindings/rtc/xlnx-rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
new file mode 100644
index 00000000000000..bdb72d3ddf2a93
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/xlnx,zynqmp-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Xilinx Zynq Ultrascale+ MPSoC Real Time Clock
+
+description:
+  RTC controller for the Xilinx Zynq MPSoC Real Time Clock.
+  The RTC controller has separate IRQ lines for seconds and alarm.
+
+maintainers:
+  - Michal Simek <michal.simek@xilinx.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: xlnx,zynqmp-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 2
+
+  interrupt-names:
+    items:
+      - const: alarm
+      - const: sec
+
+  calibration:
+    description: |
+      calibration value for 1 sec period which will
+      be programmed directly to calibration register.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x1
+    maximum: 0x1FFFFF
+    default: 0x198233
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      rtc: rtc@ffa60000 {
+        compatible = "xlnx,zynqmp-rtc";
+        reg = <0x0 0xffa60000 0x0 0x100>;
+        interrupt-parent = <&gic>;
+        interrupts = <0 26 4>, <0 27 4>;
+        interrupt-names = "alarm", "sec";
+        calibration = <0x198233>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/rtc/xlnx-rtc.txt b/Documentation/devicetree/bindings/rtc/xlnx-rtc.txt
deleted file mode 100644
index 0df6f016b1b771..00000000000000
--- a/Documentation/devicetree/bindings/rtc/xlnx-rtc.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-* Xilinx Zynq Ultrascale+ MPSoC Real Time Clock
-
-RTC controller for the Xilinx Zynq MPSoC Real Time Clock
-Separate IRQ lines for seconds and alarm
-
-Required properties:
-- compatible: Should be "xlnx,zynqmp-rtc"
-- reg: Physical base address of the controller and length
-       of memory mapped region.
-- interrupts: IRQ lines for the RTC.
-- interrupt-names: interrupt line names eg. "sec" "alarm"
-
-Optional:
-- calibration: calibration value for 1 sec period which will
-		be programmed directly to calibration register
-
-Example:
-rtc: rtc@ffa60000 {
-	compatible = "xlnx,zynqmp-rtc";
-	reg = <0x0 0xffa60000 0x100>;
-	interrupt-parent = <&gic>;
-	interrupts = <0 26 4>, <0 27 4>;
-	interrupt-names = "alarm", "sec";
-	calibration = <0x198233>;
-};
-- 
2.32.0

