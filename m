Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 295E9C4167D
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbiAVJSS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:18:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbiAVJSE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:04 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8DA9C061751
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:02 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so10759561pju.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CMFXap+xL0bvLvySfgNMrXOP9tSLXVuWtG0WsgxxBN8=;
        b=no9YI2kI8gyzTudRYKHgPiFbPAcXOXr00kj1lm3Q/qLeY4IIWESiil9gsKxq18DvLG
         mGuKrkF7ZZyQQOddq9+HibOon3iYZ7aJFs12iYxPjSIDscNDS/Kt1h0okxcmKDQO8nuU
         e4W6Hh7ISgKoKsXRsZBXhN2rOJofin6Xvf5pU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CMFXap+xL0bvLvySfgNMrXOP9tSLXVuWtG0WsgxxBN8=;
        b=lSj8Bgs7v1OGSXMAZ1Z3J8+VSbHC/9ds3DwnCXwEPnNust4mPSAGRL4gz5AzRJVX5D
         LbPZVzvqRb7flgw1ROM3qJvlquHhpwY5pvOuMn4mdH54gkHjgyQgVYC6PH8rqu0hACUy
         5EYg+OnAO0HV2GVRvAInEvlQXyHs07/Y+umdOMn+L7fZgNbfsnTQZ6loK8nd3Fo49atR
         KvSizS+pAK4E0x1LPPJoIxDh8LUJICFQHzBNwJ+bqRwp0/WUOk8VmZUgbtSOYDJaSCG6
         q8UVHMktRp+OOOBfZ68qqZ3uJJnasMldwKJUYV49VWPH/747Pz2mNEzwtgLc/mGI7fkG
         ar5A==
X-Gm-Message-State: AOAM533jgIlTE8hFoT7cqPU0DZ3uI2djtB4AJ56jRUwAx7whROj4/nMO
        6Ne+0vftJZhk9UT+yqlF/48O4Q==
X-Google-Smtp-Source: ABdhPJxN30OUYMrT52RzBfbw6qmJzTZhPQfO212jPVtLlFlXIYBizp9DWGFMnLERH3nnKeEUo3eQbw==
X-Received: by 2002:a17:902:dacf:b0:14b:2225:2f06 with SMTP id q15-20020a170902dacf00b0014b22252f06mr4851994plx.123.1642843082396;
        Sat, 22 Jan 2022 01:18:02 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:01 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/31] clk: mediatek: cpumux: Clean up included headers
Date:   Sat, 22 Jan 2022 17:17:08 +0800
Message-Id: <20220122091731.283592-9-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some headers with the declaration of functions and structures aren't
directly included. Explicitly include them so that future changes to
other headers would not result in an unexpected build break.

On the header side, add forward declarations for any data structures
whose pointers are used in function signatures. No headers are
required.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-cpumux.c | 3 +++
 drivers/clk/mediatek/clk-cpumux.h | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 344c6399b22f..658aee789f44 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -5,8 +5,11 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index a538f2bbef0d..b07e89f7c283 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,6 +7,10 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
+struct clk_onecell_data;
+struct device_node;
+struct mtk_composite;
+
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.rc0.227.g00780c9af4-goog

