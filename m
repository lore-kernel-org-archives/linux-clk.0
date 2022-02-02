Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7117FC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238446AbiBBNuT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:50:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344552AbiBBNuB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:01 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CFCC061755
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:49:58 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id i65so18829935pfc.9
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=koVwH4W47ZnmdMQC+i7F7tu84t6ApcfQpNxUmrQL9bs=;
        b=EUM4BcWxvZOnU+GfCT/HmA+o6iiYZ40xeNYZXdyjB43nQld9ZRzxpOBZJN3lPU1dkh
         nNfqSuXf5AQE4HSoKTJJowRfXBPTAHMVVa4V+AwB2qZoP1hvwei1qItoMr/uwbVyENfO
         R/SOqvzD2gT1TnOw+QeTbgU2hZ08ncFdINjaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=koVwH4W47ZnmdMQC+i7F7tu84t6ApcfQpNxUmrQL9bs=;
        b=UNTnT7tfqdhzXM69tSN4NaYDRnVoXzesRyAVu4VCooZsE8fzLb+MWIU5BfrPxmVQxX
         2lh/X4IKv7ZGMM20q9TMAN3JClOXLaRNYP1+TaGN8gLmxppZ3+R7/9Z6Bh+gQAaYPUnD
         uO35nWJ+PUNCjN0DqSDdA3bXf0RREaa7Ko/IZzn0RXIeDrefTd6NHM1KSxGOFzSt/oI+
         ujkV9ijlAfcxovXAAxc8vRbhw17c7zHtOnhTCA3YzrA8jGaTOpwKUmfhR/NE7+d04qg2
         428k4+aS/vRXbP/WS0xMj436bkrsIAcJfAx0t086//ViBimK0EgL9yAAr8+B7tI+MVSy
         KHxg==
X-Gm-Message-State: AOAM531XQ54Mw1syBeNjXSWkHizHcmWDN3S66ETYaB8TW7BFbseD0gFF
        LgarkHDFbl3vRF9iqEU/4HiLzw==
X-Google-Smtp-Source: ABdhPJxTnVZoIVxU07+X5AzoQO2ik1+O5errakn66KV31/A9bAV8mo0hGkeH+5Qokg4S8y6zDVCYZQ==
X-Received: by 2002:a05:6a00:841:: with SMTP id q1mr8267625pfk.21.1643809798495;
        Wed, 02 Feb 2022 05:49:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:49:58 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 10/31] clk: mediatek: mux: Internalize struct mtk_clk_mux
Date:   Wed,  2 Feb 2022 21:48:13 +0800
Message-Id: <20220202134834.690675-11-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
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
2.35.0.rc2.247.g8bbb082509-goog

