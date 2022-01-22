Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72416C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbiAVJST (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:18:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234078AbiAVJSH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:18:07 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42993C061401
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:07 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id i65so11049116pfc.9
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=14oekTz2jUCC4Rr83R46NSrxudxWdrVi94PXUiSTUWo=;
        b=GeAKiZ2qXHpjbTDaTxRsRAPhrwtnHAA+bWWAfvB5SGpNEdh8lhBHUGNYuoupKevK1T
         Y1DokCz7jgKK/gFoPLRlk56KWjfEhKayjq8b46VW1cPzJgdVxvR88PhQMdqcXmxMrtYG
         msQvy9arKcOZ9bj1HBHL7oTz0Q0jt8ncHRvoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=14oekTz2jUCC4Rr83R46NSrxudxWdrVi94PXUiSTUWo=;
        b=qg/rjR9+XHtzHFHIyEkHJP8ie8QAH1FPQRV/rASpPjltC+x+QMGGtKLqQoG5+Ex2sJ
         1I+Lw42L6saQDEhFVQh89fJt++T52l5A/g9/83nvG+moU14nSsY3KeK7culdpU6wmUgO
         PEiI0GWSnLug7vSa0bC6udBA8bVeOwtuIwEm6c5ozXGQEhG8ltQhg069mjXcyVckfAEQ
         JeZK8WscMpg9yqOsxnc0alaOjaGWfuvkQPd7pT/Tk6UUe427DvIzrFtQsu/aMw9jaNQs
         UfSrFwLW3kpl6f7FtHJlvye2YaIqJZS8qFhA2qHZohVUcCqjdpUlS3E2wEi3Zuki9C5k
         1uVw==
X-Gm-Message-State: AOAM530gA6gn1T98BG1XritbKSiLPeT5KRCcbU//O9WL5kllL1PnzQQL
        6nZjwvsC6tlnCC+rQNMCEnrGhQ==
X-Google-Smtp-Source: ABdhPJxBLmizlDghIjkDDcRjYFNdvmbFT8l691jjnPT3Ies6TSVELhgwbCd9IWZYQ6kTQCL8f7D04Q==
X-Received: by 2002:a63:6905:: with SMTP id e5mr5462412pgc.543.1642843086828;
        Sat, 22 Jan 2022 01:18:06 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:18:06 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/31] clk: mediatek: mux: Internalize struct mtk_clk_mux
Date:   Sat, 22 Jan 2022 17:17:10 +0800
Message-Id: <20220122091731.283592-11-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
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
2.35.0.rc0.227.g00780c9af4-goog

