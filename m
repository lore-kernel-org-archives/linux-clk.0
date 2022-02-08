Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAC4C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:16:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240941AbiBHNQr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:16:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358182AbiBHMlL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:11 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14426C03FEC0
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:11 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id d187so18623396pfa.10
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QqCKqTMNdoAp7+sGE2nBPkF6G+PqsK55lVYsLHkGo/c=;
        b=ldnpoFu3DD5eloRyku85uykx5dM7xP/9mliT08SVLlpMajfgHSGH62rCzJ7c2wiNU9
         tLL99iJhWybm+mEdugFj5TJyCm7plg0oChYxRHmaGsrtcDKb/ToB6sgRmlJ5IYoL4AiX
         +T3px2SJjDdQxkj9GahSUkyDg6YawanCTC39Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QqCKqTMNdoAp7+sGE2nBPkF6G+PqsK55lVYsLHkGo/c=;
        b=athiFX6Sc3KOqJfzQVtwqdpGJDmz2Kg3ntwpg9+aAqbuZwOdBiWgGomL8qnNjL57TW
         5SbKSBkMA/b94j/679SsdTvi3ueMRvJJCvSu6ZhVLY4r6JnitMHW4/FUhSb2pqT7MkKd
         WYu7SxShJCsWCNavk7JcdBdcxqg1fBS4RgW69HA7UOmB0VtKTFJti9EMetSjxLRMed4n
         P2r6G5+o/q9x8L1DW1Q+2DHWUYqENYqhAvxlLOzWQYfC3AgCaS+5Sxec57Pk2AECWEwr
         yaTxndhgod8Q7gbJGT79mmFaDGQL9JZtYqGBcVw0IGfvDyDbOdnW3iwdWG5aoYL3ygmw
         N5Jg==
X-Gm-Message-State: AOAM531mZxuq8NvofucgURwHAArOkXgDT9J4HaLZYzvxmOEn67KHNsA1
        f+7Vy6Z4nNGZIPHywHk6N/pKeA==
X-Google-Smtp-Source: ABdhPJxWcJrY0ZpPqfzhQI+lhqCGqXjIUU+JarLsOFyR0SfIZyB4euS/X0UN+worLnBp2w2IQ1isSg==
X-Received: by 2002:a05:6a00:2283:: with SMTP id f3mr4248506pfe.24.1644324070536;
        Tue, 08 Feb 2022 04:41:10 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:10 -0800 (PST)
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
Subject: [PATCH v3 10/31] clk: mediatek: mux: Internalize struct mtk_clk_mux
Date:   Tue,  8 Feb 2022 20:40:13 +0800
Message-Id: <20220208124034.414635-11-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

struct mtk_clk_mux is an implementation detail of the mux clk type,
and is not used outside of the implementation.

Internalize the definition to minimize leakage of details and shrink
the header file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mux.c | 8 ++++++++
 drivers/clk/mediatek/clk-mux.h | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 6f0c22a699c3..2d4d8dc0120a 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -13,6 +13,14 @@
 #include "clk-mtk.h"
 #include "clk-mux.h"
 
+struct mtk_clk_mux {
+	struct clk_hw hw;
+	struct regmap *regmap;
+	const struct mtk_mux *data;
+	spinlock_t *lock;
+	bool reparent;
+};
+
 static inline struct mtk_clk_mux *to_mtk_clk_mux(struct clk_hw *hw)
 {
 	return container_of(hw, struct mtk_clk_mux, hw);
diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index cb2ac4f04c58..38a2b6014b08 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -9,14 +9,6 @@
 
 #include <linux/clk-provider.h>
 
-struct mtk_clk_mux {
-	struct clk_hw hw;
-	struct regmap *regmap;
-	const struct mtk_mux *data;
-	spinlock_t *lock;
-	bool reparent;
-};
-
 struct mtk_mux {
 	int id;
 	const char *name;
-- 
2.35.0.263.gb82422642f-goog

