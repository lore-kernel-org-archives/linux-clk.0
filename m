Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD906C433FE
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244533AbiBHNQW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358248AbiBHMlN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:13 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267BEC03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:13 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id r19so2894996pfh.6
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1TZM8PREBca7FhBIqkK5TTjacax9psRQ+lcxgoGzOac=;
        b=IZq5kTRtSIhS2WplXP6OWmMM9gugZL0etNS2hOiiAKeUTokmQNLVM3QCZUd+xo6w1b
         vRhhg+kgnMMqqvJQ3MJg3SeG7GhOho2JnIxPw15s1+uVDvVltw9+xVruBsV1ATn3GY8M
         8TFoRv3HgNjLs4CFru8cGPXiRQzotHrFeftDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1TZM8PREBca7FhBIqkK5TTjacax9psRQ+lcxgoGzOac=;
        b=jStrUXHLTMUhKT1KnSQW0S5ltU8OHnQH7XCXKN7x+TCOoISh+/x+AueTlBmZ96ilgm
         aIy4B5Wy8YO+bqISrnvfV3D07259RV49+Ctp+ySVR2OEc3HARABQB1W7zzVC6m1GKvLV
         ZhFD1XNcTr+UFct5t24SUmB20s5hdhYeoCCVOhYZ+ymBD3uRFU39s9QADhc+JFRIA6Q2
         LVLQM+cHEVnt+jEn4IflcJ/dB5yjou4MvnL4L2jme6rXKqJaJOtARqjA92+9GguVGoSp
         rMnRIT1m26gCnk7jbkR7RCWNzLP+1yfPUUbpxw4rNVKg/EMJWUxjLzcr7dbPQbXaTlsI
         IqgQ==
X-Gm-Message-State: AOAM531SavPuSy2gd6X9L1KCL8i7miCC1xZF09OeJaFi3BJwV7KFUUQO
        grsYrs8mIM0cPFTzISGq+6Jv5Q==
X-Google-Smtp-Source: ABdhPJzGbRmwB7Ijypv5ad/Be1a0AHal20/jqqhu5PrT8YWb6VHkulJZxUxHpXwmHTgsZ58Jrbt7Ow==
X-Received: by 2002:aa7:94a9:: with SMTP id a9mr4258241pfl.78.1644324072723;
        Tue, 08 Feb 2022 04:41:12 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:12 -0800 (PST)
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
Subject: [PATCH v3 11/31] clk: mediatek: mux: Clean up included headers
Date:   Tue,  8 Feb 2022 20:40:14 +0800
Message-Id: <20220208124034.414635-12-wenst@chromium.org>
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
 drivers/clk/mediatek/clk-mux.c | 11 +++++++----
 drivers/clk/mediatek/clk-mux.h |  8 +++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 2d4d8dc0120a..01af6a52711a 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -4,13 +4,16 @@
  * Author: Owen Chen <owen.chen@mediatek.com>
  */
 
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/slab.h>
+#include <linux/clk-provider.h>
+#include <linux/compiler_types.h>
+#include <linux/container_of.h>
+#include <linux/err.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spinlock.h>
+#include <linux/slab.h>
 
-#include "clk-mtk.h"
 #include "clk-mux.h"
 
 struct mtk_clk_mux {
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 38a2b6014b08..903a3c937959 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -7,7 +7,13 @@
 #ifndef __DRV_CLK_MTK_MUX_H
 #define __DRV_CLK_MTK_MUX_H
 
-#include <linux/clk-provider.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+struct clk;
+struct clk_onecell_data;
+struct clk_ops;
+struct device_node;
 
 struct mtk_mux {
 	int id;
-- 
2.35.0.263.gb82422642f-goog

