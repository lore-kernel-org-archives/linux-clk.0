Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4350C4321E
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344484AbiBBNtu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:49:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344474AbiBBNtt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:49:49 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D948BC06173B
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:49:48 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id p125so18355501pga.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MnC5wd+W1Uub0jyBTii0bw1jKUM0SD+MmltxaETPxmI=;
        b=ifkWBdljLlCdQrsnHb2AaA0xiVXH5i/9qcSv1GL6LW/PoUV26HY1RZyR5xcnjsOr+z
         uhIw6zBd7oLaRiZv9+E5Nf7YQ9SgfnPGAFRR4NBLw3veNFLU0UCkMO55TcQkWkEoldYV
         0nhn7rMWunukBQmGpuPAbvZXiLDhoeuy/Ko8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MnC5wd+W1Uub0jyBTii0bw1jKUM0SD+MmltxaETPxmI=;
        b=yBJRwaMC9ff6WexjdZ3QutY2xu7xq08kDng8Nbak9GDGHP73u3Iqwk30wdVFxMfRLX
         W/gydDY4+wGUEb7agZPfnDz7y3KTKs+sx+zzCNYXy/iABT1Rij0FVdjqmhL5FZBftlV+
         ZiNFKjUMXlaadzrPg5C/uDvcilPxxF3+trfF5/rpLe7p0rKD4i6owCV8Kd6fEvq4jxqg
         npZ2vJc0VbR425JkN1XxCWOdF9TRxi2xLr5absHv/ulQcPQG/dFpmNX/Iag+nVHwRduA
         wHNBzAhQXNiumNlTenBqcodd/0jCFGbHnvdFCMmfNF6yhYIZrarV8+2OcM8s96Uc6YUR
         AK2A==
X-Gm-Message-State: AOAM533H/Q2V0N6SwE4a5ejc6FQcqxba0HAEd9iRZbLDUkIjrMOjvZIJ
        LNTUVUyV3X2w2/aVcZ+gCtFQVA==
X-Google-Smtp-Source: ABdhPJyE1fU1DE0Y18OMUQ3BYgMoazVLDzDLvc5zUeGVpD74dfmN2S3rdVUMXCpYNy7oMRTOlZT5Ow==
X-Received: by 2002:a65:400a:: with SMTP id f10mr24302297pgp.161.1643809788467;
        Wed, 02 Feb 2022 05:49:48 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:49:48 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/31] clk: mediatek: gate: Clean up included headers
Date:   Wed,  2 Feb 2022 21:48:08 +0800
Message-Id: <20220202134834.690675-6-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-gate.c | 11 +++--------
 drivers/clk/mediatek/clk-gate.h | 10 +++++++---
 2 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index ed1ad5535d41..e8881ae1489a 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -4,18 +4,13 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-
-#include <linux/io.h>
-#include <linux/slab.h>
-#include <linux/delay.h>
-#include <linux/clkdev.h>
 #include <linux/clk-provider.h>
-#include <linux/container_of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/printk.h>
 #include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/types.h>
 
 #include "clk-gate.h"
 
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 344adffb6578..6b5738826a22 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -7,9 +7,13 @@
 #ifndef __DRV_CLK_GATE_H
 #define __DRV_CLK_GATE_H
 
-#include <linux/clk-provider.h>
-#include <linux/device.h>
-#include <linux/of.h>
+#include <linux/types.h>
+
+struct clk;
+struct clk_onecell_data;
+struct clk_ops;
+struct device;
+struct device_node;
 
 extern const struct clk_ops mtk_clk_gate_ops_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
-- 
2.35.0.rc2.247.g8bbb082509-goog

