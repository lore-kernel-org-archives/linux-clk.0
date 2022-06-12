Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2243CCA473
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jun 2022 19:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234292AbiFLTbR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jun 2022 15:31:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234859AbiFLTaL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2022 15:30:11 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5710441FBA
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id 31so2169250pgv.11
        for <linux-clk@vger.kernel.org>; Sun, 12 Jun 2022 12:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6f5v9QT7TO75MGEEWVmKFZOsmIXiC+OF2A6uAgjGVTM=;
        b=LmGKF9potBjMBdwlWKMmQHLpRX6NX7+tD1NROe86Rmz0ksnW5uI95Uuo7KOuU6HCpn
         rsC6OkFelUaJHbjxo45jrqtRi9r/ciz+LmSRM0qYIutrFqpMz0JcZQmJWDfw50JsDATk
         lShlhzBSws2h1/nX8Pbv4WzgthOPVXHMFfFEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6f5v9QT7TO75MGEEWVmKFZOsmIXiC+OF2A6uAgjGVTM=;
        b=bNE34uWusniiqX5v9lmykoUA0vGrKQMla7PzGUbTlQUbRbFQXmtf2CycUREchJqTDO
         XGl0ZMX1iCjVzme22zDp9J3AxMVktFyuZk1VuBMVgh5SPm/UQkxNQ6UWz7SNeMIOPTKy
         VK6YR8Q+QcbZdPbNb60wJwEwuIiFyXS6XuRNEscmWQIXM0xY6a6wi9wFM2PP2EGEwDxE
         /pFUIhW7/GLGYd6VuOBeM6zzKXydljxmNV7brxbmGmgbOLZGGdM3pAb0Ma7SZuL3dEHG
         U8k6qGk5RIPBdh5KfAIT2bdCA7brRZDuAnhRVI6c7dd9eeFn0zbMij4mRRPsfGa5f0or
         gNww==
X-Gm-Message-State: AOAM532GX7I/GUOiqy6zl7dK5O8XEzkqECO01ztTI0qbr1obyBJW+FbB
        M/+3LR1aR+q7qiXCTpKY2Dbl8A==
X-Google-Smtp-Source: ABdhPJzydZYIARFwuUW8aZTq/RGOYPOqzwza5QZkNaYquUm6nEMcF3DWMK55ZeWxj2sC4c/I8wKxLA==
X-Received: by 2002:a63:89c1:0:b0:3fc:5fd2:54e4 with SMTP id v184-20020a6389c1000000b003fc5fd254e4mr50006574pgd.344.1655062209676;
        Sun, 12 Jun 2022 12:30:09 -0700 (PDT)
Received: from localhost.localdomain ([50.45.132.243])
        by smtp.gmail.com with ESMTPSA id i62-20020a628741000000b0050dc76281bdsm3603607pfe.151.2022.06.12.12.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 12:30:09 -0700 (PDT)
From:   Doug Brown <doug@schmorgal.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Doug Brown <doug@schmorgal.com>
Subject: [PATCH 01/12] clk: mmp: pxa168: add additional register defines
Date:   Sun, 12 Jun 2022 12:29:26 -0700
Message-Id: <20220612192937.162952-2-doug@schmorgal.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220612192937.162952-1-doug@schmorgal.com>
References: <20220612192937.162952-1-doug@schmorgal.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation for adding additional peripherals over time, this commit
adds a bunch of extra APBC_* defines based on information from the
datasheet. It also reorganizes the list of defines to be ordered
sequentially by address (grouped by type).

Signed-off-by: Doug Brown <doug@schmorgal.com>
---
 drivers/clk/mmp/clk-of-pxa168.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa168.c b/drivers/clk/mmp/clk-of-pxa168.c
index f110c02e83cb..c975a45f9bb6 100644
--- a/drivers/clk/mmp/clk-of-pxa168.c
+++ b/drivers/clk/mmp/clk-of-pxa168.c
@@ -22,9 +22,6 @@
 #include "clk.h"
 #include "reset.h"
 
-#define APBC_RTC	0x28
-#define APBC_TWSI0	0x2c
-#define APBC_KPC	0x30
 #define APBC_UART0	0x0
 #define APBC_UART1	0x4
 #define APBC_GPIO	0x8
@@ -32,20 +29,40 @@
 #define APBC_PWM1	0x10
 #define APBC_PWM2	0x14
 #define APBC_PWM3	0x18
+#define APBC_RTC	0x28
+#define APBC_TWSI0	0x2c
+#define APBC_KPC	0x30
 #define APBC_TIMER	0x34
+#define APBC_AIB	0x3c
+#define APBC_SW_JTAG	0x40
+#define APBC_ONEWIRE	0x48
+#define APBC_TWSI1	0x6c
+#define APBC_UART2	0x70
+#define APBC_AC97	0x84
 #define APBC_SSP0	0x81c
 #define APBC_SSP1	0x820
 #define APBC_SSP2	0x84c
 #define APBC_SSP3	0x858
 #define APBC_SSP4	0x85c
-#define APBC_TWSI1	0x6c
-#define APBC_UART2	0x70
+#define APMU_DISP0	0x4c
+#define APMU_CCIC0	0x50
 #define APMU_SDH0	0x54
 #define APMU_SDH1	0x58
 #define APMU_USB	0x5c
-#define APMU_DISP0	0x4c
-#define APMU_CCIC0	0x50
 #define APMU_DFC	0x60
+#define APMU_DMA	0x64
+#define APMU_BUS	0x6c
+#define APMU_GC		0xcc
+#define APMU_SMC	0xd4
+#define APMU_XD		0xdc
+#define APMU_SDH2	0xe0
+#define APMU_SDH3	0xe4
+#define APMU_CF		0xf0
+#define APMU_MSP	0xf4
+#define APMU_CMU	0xf8
+#define APMU_FE		0xfc
+#define APMU_PCIE	0x100
+#define APMU_EPD	0x104
 #define MPMU_UART_PLL	0x14
 
 struct pxa168_clk_unit {
-- 
2.25.1

