Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96D2C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:17:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343710AbiBHNRA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:17:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358137AbiBHMlA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:00 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A169C03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:00 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id m7so16086877pjk.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rg7A4+9l27NSY42Qe+sFkyiXBBTKwVjr3yLAs4KlFxg=;
        b=mlwzzpOJIyTPenSMBs+vzWOWF4s11a2iKpFwkjBFPNJ2wIbzWSCm8BTUlwqJX+N1Cu
         DAaDL0V7f8HlDhF8CB7YxNR7wAJCaLZbAsPEdi1EBt+rrzIFaTDaUeoFbcQryratNDJV
         YBaoXUES6ZVTjN7uqH5rf2Bc0DEByC092aAME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rg7A4+9l27NSY42Qe+sFkyiXBBTKwVjr3yLAs4KlFxg=;
        b=1VxMtstQBCUJiSkk0s16HDYGI3AN9VzL0fIGDrbD0aMtB9ot//kePras2G5xJVJEDf
         +Enyuvr4R/D3jwg9L9CdR6l3tCu6LmzAVfjKkzP7XT5v1vZelXL5VMG45UVsXq/9vip0
         q0Kh21ipOrH8g8ws8KWqlFQDMNkE8OZHYPlBFD/mExe4RVijtyQRYZCWlZ4k72MEA5B0
         WfTliU0ykO5LV9ZZwFjTB32O8zNvuGlgfxpFe2O3vTYMkKvqmfPoUZRDc1YSaq8I2r4j
         dMNWzyNkG0B5EVhZPezA6SgCH0KPbOAr5mCSorUmraNiHShE7psQSxcZWyLON/iyLlUj
         6+4A==
X-Gm-Message-State: AOAM532dB/4JoqPCmkkrerP8vvwAo9AJuWMyw9NtjwANhMHjh9xcarlC
        g4ZqAeQgjN2qnHydhdWDQibJyQ==
X-Google-Smtp-Source: ABdhPJwyIYewICHmp67Gv493qjDoHahQ0wtK5N12U7VeDgZpqQE8uKBp4aXA9WxD/jUC6YVuudwbvQ==
X-Received: by 2002:a17:90a:7a82:: with SMTP id q2mr1183088pjf.40.1644324059938;
        Tue, 08 Feb 2022 04:40:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:40:59 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/31] clk: mediatek: gate: Clean up included headers
Date:   Tue,  8 Feb 2022 20:40:08 +0800
Message-Id: <20220208124034.414635-6-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.35.0.263.gb82422642f-goog

