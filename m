Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8D31C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:19:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234422AbiAVJTa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233300AbiAVJSn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:43 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EA6AC061765
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:29 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id p125so10272525pga.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y7ikYR2DO0KTQJWDZKewH0oM7Rmj3LYjnAGwR2+oJK8=;
        b=MK5yUJ0QuCGEKf3Fc/Pxxv6kVp2sCxxGWLo2+2smGGBR2K/o7OHOjjJgu2n+G57HdW
         eAjYKu6r69okMTLnUNRSORWTYe+o4pIcmJH6zpYeOFj361NZkjOI+OknPUS5cKY/PrsO
         D/j75AnvdU5gV234xvjW9KODPrnuFljn+y8n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y7ikYR2DO0KTQJWDZKewH0oM7Rmj3LYjnAGwR2+oJK8=;
        b=siZSmxpayRyCvDit0rili9YfOckN1TrZshKErx9IXv2I5daw13UCQNMNCQnIzja0/y
         po9Qi4WjiVMH5PJyofTlJ7POQGUg8sm1Hda/1OtJPOkPPsuG2n4o84LlgGODRiNYTs2M
         XkcReOgWeX0qN+BGwrlkD04iNb9Z27Bv8+pHR2ySrsWvkka8kxGOOtD5DLuD5APmn6Y5
         ZXUyC8qAI/xGJArmDRLvAO3hXi8kwPp9b//yVSnRv0wdC/0BnJocy9ORUZglyENG2DL0
         ZBKRR49SOhTzfYjQnGSVtzhcfNrAHavwsXBTdh9G2lwq5bNfrPA8R+jnug8/uP7vu60X
         dcJw==
X-Gm-Message-State: AOAM5313tcqfMpNnOyzsQzLOv4PjMCbq5zwHEPHcZSRXGTw6l5S6o2zU
        ghQtt2owLDO4NXk9/IuUEYodYQ==
X-Google-Smtp-Source: ABdhPJzqwpvGnrOLvq1Wc8tRhNv6bldrv9fnylHIYcV+GIPyjQgEr0P19blEPg/NwRaCCyKvYFaDxw==
X-Received: by 2002:a63:b204:: with SMTP id x4mr5614276pge.224.1642843109114;
        Sat, 22 Jan 2022 01:18:29 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:28 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 20/31] clk: mediatek: mtk: Clean up included headers
Date:   Sat, 22 Jan 2022 17:17:20 +0800
Message-Id: <20220122091731.283592-21-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some included headers aren't actually used anywhere, while other headers
with the declaration of functions and structures aren't directly
included.

Get rid of the unused ones, and add the ones that should be included
directly.

On the header side, replace headers that are included purely for data
structure definitions with forward declarations. This decreases the
amount of preprocessing and compilation effort required for each
inclusion.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 13 ++++++-------
 drivers/clk/mediatek/clk-mtk.h | 12 ++++++------
 2 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index cd76e1d80242..d2c50186cceb 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -4,17 +4,16 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/bitops.h>
+#include <linux/clk-provider.h>
 #include <linux/err.h>
 #include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/clkdev.h>
-#include <linux/module.h>
 #include <linux/mfd/syscon.h>
-#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "clk-mtk.h"
 #include "clk-gate.h"
diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index 4fa658f5d934..7f902581a115 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -7,19 +7,19 @@
 #ifndef __DRV_CLK_MTK_H
 #define __DRV_CLK_MTK_H
 
-#include <linux/regmap.h>
-#include <linux/bitops.h>
 #include <linux/clk-provider.h>
-#include <linux/platform_device.h>
-
-struct clk;
-struct clk_onecell_data;
+#include <linux/io.h>
+#include <linux/kernel.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
 
 #define MAX_MUX_GATE_BIT	31
 #define INVALID_MUX_GATE_BIT	(MAX_MUX_GATE_BIT + 1)
 
 #define MHZ (1000 * 1000)
 
+struct platform_device;
+
 struct mtk_fixed_clk {
 	int id;
 	const char *name;
-- 
2.35.0.rc0.227.g00780c9af4-goog

