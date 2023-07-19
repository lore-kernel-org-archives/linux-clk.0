Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACB0EB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 08:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjGSIUk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 04:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbjGSIUk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 04:20:40 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 906D21B9
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 01:20:38 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b852785a65so3955615ad.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 01:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689754838; x=1690359638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvrNL5UWN6mNIbASEilDPVqVt7thD2eE3OsIzkYxI7I=;
        b=XI5s7DfLx3eSW5nL/LUsnrEXaPE/ooxI80C4QxzkEbkWYXnfLe+BHbuhImCqOSdriQ
         l6sMdg6HHdXgBERGHW0r4bHAwFdW+0rorUhjDL4g/MZykIlIwC1YqT1FKfvu8ikADeu9
         wWPzW1bc1Hc6C0PdO2cgAqAD3923Be4yRw8w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689754838; x=1690359638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvrNL5UWN6mNIbASEilDPVqVt7thD2eE3OsIzkYxI7I=;
        b=XDRp0bY0LYHiZjGq9J7WEOzSi+DtD407W/V56cv0LsFRi5MuAP6U8LbBtwOZcGI/RQ
         u6G3Pi/RVPY11OCpWUPrRdDNI0tVnSgg/VI5pdE6nesl57cJIBV5W1iCtJA+7BJxXjJO
         H9G8gixuCfM1yVraatAi0j+S4tMxodVinTvhWa+RDiViTT5qqEFlanV38i0mLUBtx5/9
         M0JIlGej0QJz4j1ltzhbTdhRzIXpbqMyJJIB4WqWJ3muzCGyJ2cmWBeOb1BKe9AEScko
         AhBQybx2DmdbYNBVNHsGdDznK8zcE/andW+6mHCCW4i0Kny9um8bP+29Hp54yuIxpRIP
         eaCg==
X-Gm-Message-State: ABy/qLbY36fP+NHzHp3qCHyeID2RLTDzVCbLxHh7pviUy/reH9Ut3vtH
        NQq5dYgOHxc+Q9FfnQkmQoLo8g==
X-Google-Smtp-Source: APBJJlHFenf1UttaPqhLjqQ7fRZRs8ORExfgZNfRzEnJjPWhWfu4jtYvVXQo0efwFW/ayI/HdfSWkw==
X-Received: by 2002:a17:902:a515:b0:1b5:674d:2aa5 with SMTP id s21-20020a170902a51500b001b5674d2aa5mr1742930plq.13.1689754838004;
        Wed, 19 Jul 2023 01:20:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:dc1f:4359:d310:3643])
        by smtp.gmail.com with ESMTPSA id 17-20020a170902c11100b001b9d8688956sm3256110pli.144.2023.07.19.01.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 01:20:37 -0700 (PDT)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH] clk: mediatek: Check if clock ID is larger than clk_hw_onecell_data size
Date:   Wed, 19 Jul 2023 16:20:32 +0800
Message-ID: <20230719082033.1229277-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MediaTek clock driver library's simple-probe mechanism allocates
clk_hw_onecell_data based on how many clocks are defined. If there's a
mismatch between that and the actual number of clocks defined in the DT
binding, such that a clock ID exceeds the number, then an out-of-bounds
write will occur. This silently corrupts memory, maybe causing a crash
later on that seems unrelated. KASAN can detect this if turned on.

To avoid getting into said scenario, check if the to be registered
clock's ID will fit in the allocated clk_hw_onecell_data. If not, put
out a big warning and skip the clock.

One could argue that the proper fix is to let the drivers specify the
number of clocks (based on a DT binding macro) instead. However even
the DT binding macro could be wrong. And having code to catch errors
and give out warnings is better than having silent corruption.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This one is less urgent.

Angelo, do you think we should add a field to struct mtk_clk_desc and
assign CLK_XXX_NR_CLK to it?

 drivers/clk/mediatek/clk-gate.c | 11 +++++++++
 drivers/clk/mediatek/clk-mtk.c  | 43 +++++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 67d9e741c5e7..bb7c536ef60f 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -222,6 +222,11 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 	for (i = 0; i < num; i++) {
 		const struct mtk_gate *gate = &clks[i];
 
+		if (WARN(gate->id >= clk_data->num,
+			 "%pOF: gateclock ID (%d)larger than expected (%d)\n",
+			 node, gate->id, clk_data->num))
+			continue;
+
 		if (!IS_ERR_OR_NULL(clk_data->hws[gate->id])) {
 			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
 				node, gate->id);
@@ -251,6 +256,9 @@ int mtk_clk_register_gates(struct device *dev, struct device_node *node,
 	while (--i >= 0) {
 		const struct mtk_gate *gate = &clks[i];
 
+		if (gate->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[gate->id]))
 			continue;
 
@@ -273,6 +281,9 @@ void mtk_clk_unregister_gates(const struct mtk_gate *clks, int num,
 	for (i = num; i > 0; i--) {
 		const struct mtk_gate *gate = &clks[i - 1];
 
+		if (gate->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[gate->id]))
 			continue;
 
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 2e55368dc4d8..09d50a15db77 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -94,6 +94,10 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_clk *rc = &clks[i];
 
+		if (WARN(rc->id >= clk_data->num,
+			 "Fixed clock ID (%d) larger than expected (%d)\n", rc->id, clk_data->num))
+			continue;
+
 		if (!IS_ERR_OR_NULL(clk_data->hws[rc->id])) {
 			pr_warn("Trying to register duplicate clock ID: %d\n", rc->id);
 			continue;
@@ -117,6 +121,9 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 	while (--i >= 0) {
 		const struct mtk_fixed_clk *rc = &clks[i];
 
+		if (rc->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
 			continue;
 
@@ -139,6 +146,9 @@ void mtk_clk_unregister_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 	for (i = num; i > 0; i--) {
 		const struct mtk_fixed_clk *rc = &clks[i - 1];
 
+		if (rc->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[rc->id]))
 			continue;
 
@@ -160,6 +170,11 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_factor *ff = &clks[i];
 
+		if (WARN(ff->id >= clk_data->num,
+			 "Fixed factor clock ID (%d) larger than expected (%d)\n",
+			 ff->id, clk_data->num))
+			continue;
+
 		if (!IS_ERR_OR_NULL(clk_data->hws[ff->id])) {
 			pr_warn("Trying to register duplicate clock ID: %d\n", ff->id);
 			continue;
@@ -183,6 +198,9 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
 	while (--i >= 0) {
 		const struct mtk_fixed_factor *ff = &clks[i];
 
+		if (ff->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
 			continue;
 
@@ -205,6 +223,9 @@ void mtk_clk_unregister_factors(const struct mtk_fixed_factor *clks, int num,
 	for (i = num; i > 0; i--) {
 		const struct mtk_fixed_factor *ff = &clks[i - 1];
 
+		if (ff->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[ff->id]))
 			continue;
 
@@ -339,6 +360,11 @@ int mtk_clk_register_composites(struct device *dev,
 	for (i = 0; i < num; i++) {
 		const struct mtk_composite *mc = &mcs[i];
 
+		if (WARN(mc->id >= clk_data->num,
+			 "Composite clock ID (%d) larger than expected (%d)\n",
+			 mc->id, clk_data->num))
+			continue;
+
 		if (!IS_ERR_OR_NULL(clk_data->hws[mc->id])) {
 			pr_warn("Trying to register duplicate clock ID: %d\n",
 				mc->id);
@@ -362,6 +388,9 @@ int mtk_clk_register_composites(struct device *dev,
 	while (--i >= 0) {
 		const struct mtk_composite *mc = &mcs[i];
 
+		if (mc->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[mcs->id]))
 			continue;
 
@@ -384,6 +413,9 @@ void mtk_clk_unregister_composites(const struct mtk_composite *mcs, int num,
 	for (i = num; i > 0; i--) {
 		const struct mtk_composite *mc = &mcs[i - 1];
 
+		if (mc->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[mc->id]))
 			continue;
 
@@ -407,6 +439,11 @@ int mtk_clk_register_dividers(struct device *dev,
 	for (i = 0; i <  num; i++) {
 		const struct mtk_clk_divider *mcd = &mcds[i];
 
+		if (WARN(mcd->id >= clk_data->num,
+			 "Divider clock ID (%d) larger than expected (%d)\n",
+			 mcd->id, clk_data->num))
+			continue;
+
 		if (!IS_ERR_OR_NULL(clk_data->hws[mcd->id])) {
 			pr_warn("Trying to register duplicate clock ID: %d\n",
 				mcd->id);
@@ -432,6 +469,9 @@ int mtk_clk_register_dividers(struct device *dev,
 	while (--i >= 0) {
 		const struct mtk_clk_divider *mcd = &mcds[i];
 
+		if (mcd->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
 			continue;
 
@@ -454,6 +494,9 @@ void mtk_clk_unregister_dividers(const struct mtk_clk_divider *mcds, int num,
 	for (i = num; i > 0; i--) {
 		const struct mtk_clk_divider *mcd = &mcds[i - 1];
 
+		if (mcd->id >= clk_data->num)
+			continue;
+
 		if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
 			continue;
 
-- 
2.41.0.455.g037347b96a-goog

