Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325F0C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:49:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344464AbiBBNts (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:49:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344474AbiBBNtr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:49:47 -0500
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E83C3C061741
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:49:44 -0800 (PST)
Received: by mail-pg1-x52f.google.com with SMTP id e16so18362383pgn.4
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MyQRwL6DQLrE4xYNw8mcC0XQoGB02nn/7BR8gOXw12k=;
        b=NK4YiiG50hLCWW7qrayFHDYOcnbrImJU+goMnLjQsBS0f/CxfUGlpHC4pVOWiKG3fN
         rSRcfrqrLj7IqMGTuyIgDwVddgHV70pVyPfC5bvgF3zu7I+0lI8jMhUZtU8YY1kKicvG
         HTr7ZcyBbY3OePwWetp1EXwJPg+7X3uzvMl30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MyQRwL6DQLrE4xYNw8mcC0XQoGB02nn/7BR8gOXw12k=;
        b=ynLlJ84bG6AD0Mhg3pq4XJob0J3jHv+gbcdp92xacAjxVJf3WNM5Odt5UYYzCFDmxJ
         3V4I9e2f32b8PbAwbfYBFipfwezs9Qzk/iNmZa6trEW/i/TKwH+vh1E9Lk8dkn/ET5m7
         aRFsUQjLNSskOLHOOQPYaqaRkp05WiVmxqCNZPN/QyHWx8Q3F1sKZ3PmyL8wReJFDA6u
         olDr9kkFQMmKoxgAsc8p8BW9GVgfJ4r3FNvZ7ZsitAy3FizpRYA7PaRkx4WzH2TfbpMu
         MBjrsxHTmoBxjDIOcAFzwgRXjSlBdXRXmQ1KcKsefHHNd5Kgn7vktY8WmdtlqS5ZhCOO
         6LoA==
X-Gm-Message-State: AOAM530D8XhPbVvj40p7AFmT9qaROqQipUYCDDFyGy/prO7vvTkmzqR2
        GKpEgzou6E8rKDa7B3/2S+YII+lKXnJd5g==
X-Google-Smtp-Source: ABdhPJxChN04B73w38gJYqKkMrX28K/rq+/lHQmKeoCJv2N1BvoTeTJonWoE6d0/86Dq5UJT8ZgveQ==
X-Received: by 2002:aa7:9498:: with SMTP id z24mr29581913pfk.80.1643809784501;
        Wed, 02 Feb 2022 05:49:44 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:49:44 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/31] clk: mediatek: gate: Internalize clk implementation
Date:   Wed,  2 Feb 2022 21:48:06 +0800
Message-Id: <20220202134834.690675-4-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

struct mtk_clk_gate and mtk_clk_register_gate() are not used outside of
the gate clk library. Only the API that handles a list of clks is used
by the individual platform clk drivers.

Internalize the parts that aren't used outside of the implementation.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-gate.c | 35 ++++++++++++++++++++++-----------
 drivers/clk/mediatek/clk-gate.h | 31 ++---------------------------
 2 files changed, 25 insertions(+), 41 deletions(-)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 54921768bfba..e51cfd8c653c 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -11,11 +11,28 @@
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/clkdev.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 
 #include "clk-gate.h"
 
+struct mtk_clk_gate {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	int		set_ofs;
+	int		clr_ofs;
+	int		sta_ofs;
+	u8		bit;
+};
+
+static inline struct mtk_clk_gate *to_mtk_clk_gate(struct clk_hw *hw)
+{
+	return container_of(hw, struct mtk_clk_gate, hw);
+}
+
 static u32 mtk_get_clockgating(struct clk_hw *hw)
 {
 	struct mtk_clk_gate *cg = to_mtk_clk_gate(hw);
@@ -140,17 +157,12 @@ const struct clk_ops mtk_clk_gate_ops_no_setclr_inv = {
 };
 EXPORT_SYMBOL_GPL(mtk_clk_gate_ops_no_setclr_inv);
 
-struct clk *mtk_clk_register_gate(
-		const char *name,
-		const char *parent_name,
-		struct regmap *regmap,
-		int set_ofs,
-		int clr_ofs,
-		int sta_ofs,
-		u8 bit,
-		const struct clk_ops *ops,
-		unsigned long flags,
-		struct device *dev)
+static struct clk *mtk_clk_register_gate(const char *name,
+					 const char *parent_name,
+					 struct regmap *regmap, int set_ofs,
+					 int clr_ofs, int sta_ofs, u8 bit,
+					 const struct clk_ops *ops,
+					 unsigned long flags, struct device *dev)
 {
 	struct mtk_clk_gate *cg;
 	struct clk *clk;
@@ -180,7 +192,6 @@ struct clk *mtk_clk_register_gate(
 
 	return clk;
 }
-EXPORT_SYMBOL_GPL(mtk_clk_register_gate);
 
 int mtk_clk_register_gates_with_dev(struct device_node *node,
 				    const struct mtk_gate *clks, int num,
diff --git a/drivers/clk/mediatek/clk-gate.h b/drivers/clk/mediatek/clk-gate.h
index 432b571d23b3..3d75521ba20c 100644
--- a/drivers/clk/mediatek/clk-gate.h
+++ b/drivers/clk/mediatek/clk-gate.h
@@ -7,42 +7,15 @@
 #ifndef __DRV_CLK_GATE_H
 #define __DRV_CLK_GATE_H
 
-#include <linux/regmap.h>
 #include <linux/clk-provider.h>
-
-struct clk;
-
-struct mtk_clk_gate {
-	struct clk_hw	hw;
-	struct regmap	*regmap;
-	int		set_ofs;
-	int		clr_ofs;
-	int		sta_ofs;
-	u8		bit;
-};
-
-static inline struct mtk_clk_gate *to_mtk_clk_gate(struct clk_hw *hw)
-{
-	return container_of(hw, struct mtk_clk_gate, hw);
-}
+#include <linux/device.h>
+#include <linux/of.h>
 
 extern const struct clk_ops mtk_clk_gate_ops_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_setclr_inv;
 extern const struct clk_ops mtk_clk_gate_ops_no_setclr;
 extern const struct clk_ops mtk_clk_gate_ops_no_setclr_inv;
 
-struct clk *mtk_clk_register_gate(
-		const char *name,
-		const char *parent_name,
-		struct regmap *regmap,
-		int set_ofs,
-		int clr_ofs,
-		int sta_ofs,
-		u8 bit,
-		const struct clk_ops *ops,
-		unsigned long flags,
-		struct device *dev);
-
 struct mtk_gate_regs {
 	u32 sta_ofs;
 	u32 clr_ofs;
-- 
2.35.0.rc2.247.g8bbb082509-goog

