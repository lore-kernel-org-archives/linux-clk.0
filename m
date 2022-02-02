Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D947C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344503AbiBBNuB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:50:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344507AbiBBNtx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:49:53 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE25C061741
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:49:52 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id c9so18257208plg.11
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RrfW8Hvna1qE6lZZCejwLQWPkb90Uz2sIj+oZ4VQ2w0=;
        b=eAVTevsFRW5AshLLU6rlWfH8qccGjQxZFQ+bd1of7avCkX7/yZX5r9fzXx+7vVQOfn
         X4fidgXCTtUrs4NCMzIJWKKvOZ1lXZtoN1++lfoz3azn5qYssjtY0YS9QTKwtdaF2rTS
         hZzA6LH1AuERdElBEbB/Pzl59dRlCgQjTMRVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RrfW8Hvna1qE6lZZCejwLQWPkb90Uz2sIj+oZ4VQ2w0=;
        b=mQelgci4mCLiXKX+hs8mxhK3H/hbjp8T32xLwltXI1tF7FW98LGpwgA1bEXB8LmxHt
         xwN3FdeB0US90YtJHLAfy4o5TPA/lex7az2k1jFV/TF0k5WT9N0A7kgGDFP/x8esQ1rs
         OfrvHMMlUXLVm0YV0V8AuLEwuNpad2MVlEY0bDETkt4F3qf/rBq3pH7mvsOl+UFmO9ho
         /wgTRGUcfQsOD01+9/m7vJDZpKIH1iJ1RfxrIlWguzSRLJhJVMkP1RoUK5FwLW/88tMx
         PYksxdNVS6EGeeLQfPa00WQvo+zMVM8AeWTpNC+wrMH2Ien6mSQ0jEOkG6DsbGuOGi5Z
         phMA==
X-Gm-Message-State: AOAM532MHpuFbjiNkvYJzUy/ME4wzTC6t2EPOBKt9sHlHx9q7j6QqAPL
        DmHaH3IwWFo7rJ/p7xAezWIAhw==
X-Google-Smtp-Source: ABdhPJyhaR40431uojvn+aN27kxAQL0PWlBqTRA9tg58qSu/BSHP+Xmo8SPpTCFupcg0zxUxemhY9A==
X-Received: by 2002:a17:902:ab04:: with SMTP id ik4mr30206215plb.23.1643809792536;
        Wed, 02 Feb 2022 05:49:52 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:49:52 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/31] clk: mediatek: cpumux: Internalize struct mtk_clk_cpumux
Date:   Wed,  2 Feb 2022 21:48:10 +0800
Message-Id: <20220202134834.690675-8-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

struct mtk_clk_cpumux is an implementation detail of the cpumux clk
type, and is not used outside of the implementation.

Internalize the definition to minimize leakage of details and shrink
the header file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-cpumux.c | 8 ++++++++
 drivers/clk/mediatek/clk-cpumux.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 99a819e3673f..344c6399b22f 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -12,6 +12,14 @@
 #include "clk-mtk.h"
 #include "clk-cpumux.h"
 
+struct mtk_clk_cpumux {
+	struct clk_hw	hw;
+	struct regmap	*regmap;
+	u32		reg;
+	u32		mask;
+	u8		shift;
+};
+
 static inline struct mtk_clk_cpumux *to_mtk_clk_cpumux(struct clk_hw *_hw)
 {
 	return container_of(_hw, struct mtk_clk_cpumux, hw);
diff --git a/drivers/clk/mediatek/clk-cpumux.h b/drivers/clk/mediatek/clk-cpumux.h
index fda7770fd803..a538f2bbef0d 100644
--- a/drivers/clk/mediatek/clk-cpumux.h
+++ b/drivers/clk/mediatek/clk-cpumux.h
@@ -7,14 +7,6 @@
 #ifndef __DRV_CLK_CPUMUX_H
 #define __DRV_CLK_CPUMUX_H
 
-struct mtk_clk_cpumux {
-	struct clk_hw	hw;
-	struct regmap	*regmap;
-	u32		reg;
-	u32		mask;
-	u8		shift;
-};
-
 int mtk_clk_register_cpumuxes(struct device_node *node,
 			      const struct mtk_composite *clks, int num,
 			      struct clk_onecell_data *clk_data);
-- 
2.35.0.rc2.247.g8bbb082509-goog

