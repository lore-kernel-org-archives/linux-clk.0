Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78263C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344474AbiBBNuB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344510AbiBBNtz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:49:55 -0500
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA995C06173B
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:49:54 -0800 (PST)
Received: by mail-pg1-x529.google.com with SMTP id e16so18362787pgn.4
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FrZ/0MdvYKx4iaQqido6RE0SQZOpyPkZyyEsJWJ6uvQ=;
        b=kr16j1M0ul8lOBTGXLrQNyQAn0031+sSYig0cCR7kjq/VDai6jwZxUPCannWakW7ov
         t6eL4uUJmLgO2yfgvEwb8IVL01LHyy6huvnflt/lirwoirOJb6TT6YYCKkTo8SDSFA3G
         B8xh+k350+mauwcTQQcRRUHrq0wnUKHmsd0Io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FrZ/0MdvYKx4iaQqido6RE0SQZOpyPkZyyEsJWJ6uvQ=;
        b=Mvae1G39qOvbHMx51iKdToERM2Gj823akvMg5h/EYnhGv25TSKvCSa7P1YwS/rd4L7
         XZmZbaafd3CrhEAtrX44JPLboDM7y+8uuwKWoEkwttbJSRzIgP8gKwhn+tw0AQRIGU6q
         gv/0S3Nuc/4Rj/7TPC6JQ0dceS6d/fBdgqZ/V7BpMlKPGF9LhlfaWTVjzQy2pVdc7Qre
         hbQA06ChR44mYHM6YWKbDAKELogl6/8SXnOhfsTNlZQvOvimf11+LsFydmeDBI3DfPrA
         mKh0QlDAMbxurfqQWKdTVXl59wKyEu9En2/BFSZTDM+i6pYxtsQ0Ei069DHZwyckPVCd
         lhWw==
X-Gm-Message-State: AOAM533nIUIKkT31OcG2bCD07g9GPuUSGEiMJoOPzQrj8f7hXXNyVGBp
        KGAh7Jn3mNrEcwBKXY6RtqmpfQ==
X-Google-Smtp-Source: ABdhPJz6RliNQTrYa3nwSg3QqKgNI7uqG/4+XpmghPiK9Jj3ex4tFYMUF5mHVSMN/zT1r/+Ay6SMtg==
X-Received: by 2002:a05:6a00:238b:: with SMTP id f11mr1606430pfc.73.1643809794541;
        Wed, 02 Feb 2022 05:49:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:49:54 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 08/31] clk: mediatek: cpumux: Clean up included headers
Date:   Wed,  2 Feb 2022 21:48:11 +0800
Message-Id: <20220202134834.690675-9-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
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
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
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
2.35.0.rc2.247.g8bbb082509-goog

