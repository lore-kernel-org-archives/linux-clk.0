Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10F93C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 14 Apr 2022 22:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346956AbiDNWXQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Apr 2022 18:23:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbiDNWXP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2022 18:23:15 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DFCB6E56
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x17so11394020lfa.10
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vcgSbNvaHRRfttnUp0w6vE44Y97i5rBw7lAz8clVxQE=;
        b=LKZuFHf/FU09drKt6y76l9fsIJ+xR9zA+f6WmQy8TjDT36YZf1JZL3ysyIjzkLs6GU
         f7mQl/9gp9agwEa6KhpqNE6swOpq6eeyI4bDYH8IpUVDbLNdOTYOUU402Zv5rKNPrRK+
         gL8VJXh7lek44thDh/1QsAJx5eV1o6av/50SnaJ1GPFG9aG5txSQ2rkMlUQdKp3/jWXJ
         e6ZkSjho+Xf8RRNbIjEanjCuJdP865TdnrY7pG2Yew6XQdgXuTOlIOMrx+JbfLd/gCiE
         XwWyyGysE3mCb+aE3ELboiKY+qJtmIofMFaYd1b3j+wpmex30GdkIwvrcPDvXka1khRw
         s4GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vcgSbNvaHRRfttnUp0w6vE44Y97i5rBw7lAz8clVxQE=;
        b=Exyos03gta/9aquh6y5ZwJtNCJEZDp+1JlfphkOMXHtXkvErp9AUUrMpETawL4CfKa
         yiJBpPuofStExSups4VmDyKyq1ppJdY9Zcy7YbnUI5+fGUD3Q6EnSryPau3GX20tFY/w
         mRaZqMva3TuiVqu6cMhUBx08gKuhBQrP+UvOdPEvW2Kgg4cYMjSAsyCGjpokH9y87TUp
         dEbWe0GXHCkkoiltQFGOhfsW/fuWrQrnvUhF95G9JqjDSnwkt0ATSAXsnxqySAWh+r2f
         d/hpOE7bfQK9Im5MPaAjZLTOM1/rSmNUcQ30w4i+TSTHWqIfL1S1rMBAp64HpOioU75N
         N1FA==
X-Gm-Message-State: AOAM5312ad7r7+QU7OnEYhM1C/9ztAzJuOAqUXvNUUyjqZL6W8E1jyD4
        zNwaiHhUoaO2qOMAPm86Xpn0vg==
X-Google-Smtp-Source: ABdhPJzxXsrg1cm1SzZruk4CmsiWdY1s6C8z/MaOzITjlvuFUwJ+OT0+UPcEAsSZ+9lIrViTieB7VQ==
X-Received: by 2002:a05:6512:3b0f:b0:46b:b8cd:951e with SMTP id f15-20020a0565123b0f00b0046bb8cd951emr3143100lfv.584.1649974847255;
        Thu, 14 Apr 2022 15:20:47 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512029200b0046b9ba1c0edsm125169lfp.224.2022.04.14.15.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 15:20:46 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 1/5 v3] dt-bindings: clock: u8500: Add clkout clock bindings
Date:   Fri, 15 Apr 2022 00:17:47 +0200
Message-Id: <20220414221751.323525-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414221751.323525-1-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds device tree bindings for the externally routed clocks
CLKOUT1 and CLKOUT2 clocks found in the DB8500.

Cc: devicetree@vger.kernel.org
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Pick up Ulf's ACK.
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

