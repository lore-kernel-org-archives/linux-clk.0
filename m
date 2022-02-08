Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3530EC43219
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243166AbiBHNQY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358343AbiBHMlU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:20 -0500
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4FF9C03FECA
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:19 -0800 (PST)
Received: by mail-pf1-x429.google.com with SMTP id y5so17714302pfe.4
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VHqh/ijWzTkcfpqZcH5Nz4N1ISUlPyaJ60Q4OawbBT8=;
        b=VnE41xebylDSIYGhpkKNh6ZSVZj7DTmMZVRnyN0MXW4J5q0SI5huCttg3YkTT/ADYt
         3DheENGasIAUHE7ketk881llrCYZtC31y558+C3G/eh93+rEmIPR374s5tVphnYIuS50
         EcGL+mY2csHY5WHy0gsEFrhBXtCv3+HUfvyEI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VHqh/ijWzTkcfpqZcH5Nz4N1ISUlPyaJ60Q4OawbBT8=;
        b=eu3zb/gg1jLb0T7Eqh/jTRwsjKI8OdlJ+aC9MJnxD+Jh5ddTMI2lI9nZQNim61l6+O
         YkPnaT5Y+++AdzLXK74GZIb0u4bNFTWhwnWphjNllqCA9yE+d6USrERIVTN3+N8hYmcr
         F6V7SPqn2onL8Eq+oZuxIY75ufK9s1OiijIC2DQ3x69jwjzM0jEwTNz8HGFgvfIhQOMO
         UoAfN5rhajE/286nypF2QWPm+DmChkXmfvTW6+sTH+i6hJ6xeD6etlxqvH0ZhDPQvFnO
         8S+zSrSclfKfFVJ+RtSujtDMaiV7cy6X8WWb2+/moH/vqEurP5XQaM9wv6YuNxsFj0S5
         Lqvw==
X-Gm-Message-State: AOAM532lAvXy8UuHL/uWLmYXt6FVm4lKsD14sxNY5Ei5KTmzoxY6lER2
        cUI8z4w+7oVeEgJReLvnZRshYQ==
X-Google-Smtp-Source: ABdhPJzo0Dp/SCBcUkYHyRIcTeVZXRqv8ziFNxicZ9SLxGT7dPNBKPsfl76t0sK8wZgzQsmDxW8paw==
X-Received: by 2002:a65:4b82:: with SMTP id t2mr3342176pgq.607.1644324079445;
        Tue, 08 Feb 2022 04:41:19 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:19 -0800 (PST)
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
Subject: [PATCH v3 14/31] clk: mediatek: pll: Clean up included headers
Date:   Tue,  8 Feb 2022 20:40:17 +0800
Message-Id: <20220208124034.414635-15-wenst@chromium.org>
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

Also, copy the MHZ macro from clk-mtk.h, and drop clk-mtk.h from the
included headers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index b54e33b75d4e..8439d37e354d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -4,17 +4,19 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
+#include <linux/clk-provider.h>
+#include <linux/container_of.h>
+#include <linux/delay.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of_address.h>
 #include <linux/slab.h>
-#include <linux/clkdev.h>
-#include <linux/delay.h>
 
-#include "clk-mtk.h"
 #include "clk-pll.h"
 
+#define MHZ			(1000 * 1000)
+
 #define REG_CON0		0
 #define REG_CON1		4
 
-- 
2.35.0.263.gb82422642f-goog

