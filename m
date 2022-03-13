Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66930C433FE
	for <linux-clk@archiver.kernel.org>; Sun, 13 Mar 2022 23:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235674AbiCMXck (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Mar 2022 19:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235671AbiCMXcj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Mar 2022 19:32:39 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51C139FF7
        for <linux-clk@vger.kernel.org>; Sun, 13 Mar 2022 16:31:30 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id l20so24178175lfg.12
        for <linux-clk@vger.kernel.org>; Sun, 13 Mar 2022 16:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2RZReJpJ2jgwoZl2JXrTpWA6xmRBqRPwQO+M+cOYDw=;
        b=Inni7TzGS5a8Eb/1QxF1L7l0qymA3xqTfSP4DT97AmvRws+1eSHOMq08TSRlK24qxW
         9lr1STjDb0pak8c79ZuRmCdsmFP1ecb5os4mpC2sEaJf4j2tFCANPC7bJnx2ZqK+xk/J
         4bQHj9+lPVaZDFOSy/L5Id6DbP7T6h+D6SByxiz2zBD2CotRkoTpgMISZg1uOdpJWbHA
         6ucPUioc1sb4OXNsztIVRCppbIuAEYNlnRWH2QPNp+zzzzs19sSQSc4Aag0pyHUtEdBM
         7Z5+2bEYvx+MUm2wZjzdI2UjFxNvwCu48hk60oAtzfr1eJzRP/sW8R3oAwkfm/dryWvq
         +hfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o2RZReJpJ2jgwoZl2JXrTpWA6xmRBqRPwQO+M+cOYDw=;
        b=qN226eP1ClfIBKGKvmAPCIHhp1rO9s/J4fTrwfslktXEiEfXyCpY3yGOjmsQ8rU23U
         GxZKq9/OBMcyo+2WWE1GiphugrTjPQNn2+tnwQrU73bSYrc6YuCwa5jK8cMVkiK0EWVQ
         dXXsrAWTv1TxjhSv9byKWWONTOJYzLJRXZAyKUJS5jju4MTLiGtIVrjdT+OyzN2Ragfa
         Zu5fGO7EsW9tgbLlNapmYkpfM8jjnya++rLHDGrqvFnNEOi8ap02pzlcyX86ByXT1ftZ
         uoVb0Vdlkiabfc/8+YihLPst79dOXKsXKxj6hRN8tIDFRzPv7nMFbgbDTYxIaGnla6hI
         BHVw==
X-Gm-Message-State: AOAM530MLr66u1mGNsJQinrDZDoIJOJnafiMMc7VOT9B02wbZ+xWKgl7
        Cc50oyI4PZyVqtX3cNyjXlr+SQ==
X-Google-Smtp-Source: ABdhPJxxMTuacDPD/hh3Hys/xhuumTmUZfWcHGQdtVdgT//yJlj0wEraS8j6JKjOfmYlkbE/f7cNRw==
X-Received: by 2002:a05:6512:a8f:b0:448:1f28:c8d8 with SMTP id m15-20020a0565120a8f00b004481f28c8d8mr12272007lfu.525.1647214288593;
        Sun, 13 Mar 2022 16:31:28 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id i16-20020a2e5410000000b0024647722a4asm3496408ljb.29.2022.03.13.16.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 16:31:28 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clock: u8500: Add clkout clock bindings
Date:   Mon, 14 Mar 2022 00:29:25 +0100
Message-Id: <20220313232926.1004842-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
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
 .../bindings/clock/stericsson,u8500-clks.yaml   | 16 ++++++++++++++++
 include/dt-bindings/clock/ste-db8500-clkout.h   | 17 +++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 include/dt-bindings/clock/ste-db8500-clkout.h

diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
index 9bc95a308477..afd049be948a 100644
--- a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
+++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
@@ -109,6 +109,22 @@ properties:
 
     additionalProperties: false
 
+  clkout-clock:
+    description: A subnode with three clock cells for externally routed clocks,
+      output clocks. These are two PRCMU-internal clocks that can be divided and
+      muxed out on the pads of the DB8500 SoC. The first cell indicates which
+      output clock we are using, possible values are 0 (CLKOUT1) and 1 (CLKOUT2).
+      The second cell indicates which clock we want to use as source, possible
+      values are 0 thru 7, see the defines for the different source clocks.
+      The third cell is a divider, legal values are 1 thru 63.
+    type: object
+
+    properties:
+      '#clock-cells':
+        const: 3
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
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

