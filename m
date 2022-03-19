Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11411C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Mar 2022 23:00:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244329AbiCSXCO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Mar 2022 19:02:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244328AbiCSXCN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Mar 2022 19:02:13 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DE1E1A9C84
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:51 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q14so2300357ljc.12
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AARNq9b7uefyRLB+o0FCtvKm0ndHX8dczFClr8d1mZ4=;
        b=YvNJxUQ5cpSBlQtASLuPapLHgjOBLqF+sgKIco+gnHVv1+sFEpgf+vb6rHTNDoqyQp
         eU5Qh9XU2vCAIngqift6/WY1V14YxDCHujDe/gcDDQGhoFrjsD6AtSGUs4Mc/9F7fra8
         VKouTrUIwvGgV5FFkfMqO9nL6F+tPu/SX9p8P/UQlUM3A9lTpv8rV0CeDfA8E916WGpT
         mqq5BoCwC9odrzEJ6aY2GnEfkmA0P3jq9wDTdOSu0ZXSQckoP2E1H0jA74juXEdDyTih
         kBAF+DjGTUQb9NYS31PPcuB+DnouAGP/O3X7nQoV93Urf12CDbnHnBChyMPr9F4n9nnR
         E/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AARNq9b7uefyRLB+o0FCtvKm0ndHX8dczFClr8d1mZ4=;
        b=N/Q1kK2TeZ8BZl+ldznw+xrO011tVu1YBMTIAKYMFvzw9eLWL4iHElBWSo6HJXJTE3
         BZXEeaAZtT/fTJKRUbSimU9npMaJ0DNi3qvat2H1zMOWnz0qqm3y7nFmZc45h+aG23eR
         04K7mHKZmh1st765akmAHqc04/GfqzBZuS46dxOfVX1pdZNVlRrstnqd+TL9xJOUxeJd
         dkgiuYo9SKQVd/QuCh4v3hfCgdRjpIiD4oQ0QhnOKaSbx+Ahk1Wl/m5t8mPbMnx6VAa4
         DrImtudz7Eewf5d8JMnyS1fj1ICFSjfUFjlrJRoIKhUsYtQ2VV0ViSljiA+16ux5W79L
         7MSA==
X-Gm-Message-State: AOAM5318SM0ZRXc9o0LVG7USw3XEn0q43tMbFwR7lljtU+rXaSsnEGOv
        scuAeA/tTNXr4ZX782M35CoLzQ==
X-Google-Smtp-Source: ABdhPJxVwGt92K1FWdvMNBQUZFJD2nUjowak37iXB4/zQ91QZocrPLuaaB6GVfBNRVfaftmwb72A4g==
X-Received: by 2002:a05:651c:1a24:b0:249:80b9:626a with SMTP id by36-20020a05651c1a2400b0024980b9626amr727357ljb.130.1647730849664;
        Sat, 19 Mar 2022 16:00:49 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z5-20020a196505000000b0044a12b953f9sm581520lfb.45.2022.03.19.16.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 16:00:49 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/5 v2] dt-bindings: clock: u8500: Add clkout clock bindings
Date:   Sat, 19 Mar 2022 23:51:52 +0100
Message-Id: <20220319225156.1451636-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319225156.1451636-1-linus.walleij@linaro.org>
References: <20220319225156.1451636-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds device tree bindings for the externally routed clocks
CLKOUT1 and CLKOUT2 clocks found in the DB8500.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Push the description of the clock-cells down under the clock-cells
  subnode.
- Add an example, as this was missing and requested.
---
 .../bindings/clock/stericsson,u8500-clks.yaml | 57 +++++++++++++++++++
 include/dt-bindings/clock/ste-db8500-clkout.h | 17 ++++++
 2 files changed, 74 insertions(+)
 create mode 100644 include/dt-bindings/clock/ste-db8500-clkout.h

diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
index 9bc95a308477..2150307219a0 100644
--- a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
+++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
@@ -109,6 +109,25 @@ properties:
 
     additionalProperties: false
 
+  clkout-clock:
+    description: A subnode with three clock cells for externally routed clocks,
+      output clocks. These are two PRCMU-internal clocks that can be divided and
+      muxed out on the pads of the DB8500 SoC.
+    type: object
+
+    properties:
+      '#clock-cells':
+        description:
+          The first cell indicates which output clock we are using,
+          possible values are 0 (CLKOUT1) and 1 (CLKOUT2).
+          The second cell indicates which clock we want to use as source,
+          possible values are 0 thru 7, see the defines for the different
+          source clocks.
+          The third cell is a divider, legal values are 1 thru 63.
+        const: 3
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
@@ -119,3 +138,41 @@ required:
   - smp-twd-clock
 
 additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/ste-db8500-clkout.h>
+    clocks@8012 {
+      compatible = "stericsson,u8500-clks";
+      reg = <0x8012f000 0x1000>, <0x8011f000 0x1000>,
+            <0x8000f000 0x1000>, <0xa03ff000 0x1000>,
+            <0xa03cf000 0x1000>;
+
+      prcmu_clk: prcmu-clock {
+        #clock-cells = <1>;
+      };
+
+      prcc_pclk: prcc-periph-clock {
+        #clock-cells = <2>;
+      };
+
+      prcc_kclk: prcc-kernel-clock {
+        #clock-cells = <2>;
+      };
+
+      prcc_reset: prcc-reset-controller {
+        #reset-cells = <2>;
+      };
+
+      rtc_clk: rtc32k-clock {
+        #clock-cells = <0>;
+      };
+
+      smp_twd_clk: smp-twd-clock {
+        #clock-cells = <0>;
+      };
+
+      clkout_clk: clkout-clock {
+        #clock-cells = <3>;
+      };
+    };
diff --git a/include/dt-bindings/clock/ste-db8500-clkout.h b/include/dt-bindings/clock/ste-db8500-clkout.h
new file mode 100644
index 000000000000..ca07cb2bd1bc
--- /dev/null
+++ b/include/dt-bindings/clock/ste-db8500-clkout.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __STE_CLK_DB8500_CLKOUT_H__
+#define __STE_CLK_DB8500_CLKOUT_H__
+
+#define DB8500_CLKOUT_1			0
+#define DB8500_CLKOUT_2			1
+
+#define DB8500_CLKOUT_SRC_CLK38M	0
+#define DB8500_CLKOUT_SRC_ACLK		1
+#define DB8500_CLKOUT_SRC_SYSCLK	2
+#define DB8500_CLKOUT_SRC_LCDCLK	3
+#define DB8500_CLKOUT_SRC_SDMMCCLK	4
+#define DB8500_CLKOUT_SRC_TVCLK		5
+#define DB8500_CLKOUT_SRC_TIMCLK	6
+#define DB8500_CLKOUT_SRC_CLK009	7
+
+#endif
-- 
2.35.1

