Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE37E8FDC7
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 01:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239384AbjJDBXR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Oct 2023 21:23:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239461AbjJDBXR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Oct 2023 21:23:17 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C63AF
        for <linux-clk@vger.kernel.org>; Tue,  3 Oct 2023 18:23:13 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5041335fb9cso1777687e87.0
        for <linux-clk@vger.kernel.org>; Tue, 03 Oct 2023 18:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696382592; x=1696987392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldmiZ1B4qHPIROttBws4cHozTCwfz++/pPdWBPL50Rc=;
        b=A5hVZN+wVRISliPJxy1pcX5zAKvQlXNIMRlxGn+jBrXwuCXROv+V3DhfDSJ2sEuNZb
         /wE7mqRHeDCAyXpBVYnV8qUtk8zwhFg7sbrIUEITof1tIKrD5hwj7I5MoTbW2oabb7mp
         hQHkM1i/ujjcB3jG14oIWbF7cxpZE2m+eGi6pd0qMfoP75t7FNhROyMcn5lYpfRxyFiT
         N3ugBog88HWhrQcIiIaIZMUcNEg4k9qDJCzL2LpXBm6EUkgZrsLar8goc9ReVTXBhU3V
         SNu9uOSEnjjvB1pojCnnffZkO26iexN4qtR6bsHQldow6sju/ip+ybr4/5kBcEkCQIRx
         2rjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696382592; x=1696987392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldmiZ1B4qHPIROttBws4cHozTCwfz++/pPdWBPL50Rc=;
        b=kshCs/mcmqZFgNDdWM92Ka/x3J6l+Nf4XVFpKblS1yS1o0rohhYTPDN64yU3jjlhdo
         sa9i6tuNddkUL2/Ni4c2+QhYT2VhogsRE/RaeejBnhxtAkshRSuUsP3wgCI0SXEUS+AZ
         dKds7fPioGqbgnTnqaOqbLO1v1xlubI0IUZ/j93orXgx80ADyBc8n4Ti4kcYkF+qbMNE
         a0pI23YUtghTWoT7oHUMTJM/I/CplJPSwrXnw8uACOZ9bTSM+ynB67NRQkuDuw81NTWZ
         X52BTdKKf1RCK19F6WNl4127rNlbgfzPfWopDEwDgF1gDuZ8sQVt5j1SXViPBu88YMEW
         835A==
X-Gm-Message-State: AOJu0Yyiw1pgd9A3R84HluQX9BNJUpdqhRlCHQl9MdO700d3eO2qJ/cS
        IWkQpikNGibF4ljNiaeBPwO/2w==
X-Google-Smtp-Source: AGHT+IGq1fOheH3WXU9w2brGMWHS03IgADRAs2ftF5RfTuLcwqrZPPdR/N0ePl7HynNJPx0gqNcUOA==
X-Received: by 2002:a05:6512:48d6:b0:500:9734:545a with SMTP id er22-20020a05651248d600b005009734545amr741883lfb.5.1696382591910;
        Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w17-20020ac24431000000b004fdbb36a677sm381979lfl.288.2023.10.03.18.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 18:23:11 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH v2 2/3] clk: qcom: implement RCG2 'parked' clock support
Date:   Wed,  4 Oct 2023 04:23:07 +0300
Message-Id: <20231004012308.2305273-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
References: <20231004012308.2305273-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk_rcg2_shared_ops implements support for the case of the RCG which
must not be completely turned off. However its design has one major
drawback: it doesn't allow us to properly implement the is_enabled
callback, which causes different kinds of misbehaviour from the CCF.

Follow the idea behind clk_regmap_phy_mux_ops and implement the new
clk_rcg2_parked_ops. It also targets the clocks which must not be fully
switched off (and shared most of the implementation with
clk_rcg2_shared_ops). The major difference is that it requires that the
parent map doesn't conain the safe (parked) clock source. Instead if the
CFG_REG register points to the safe source, the clock is considered to
be disabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-rcg.h  |  1 +
 drivers/clk/qcom/clk-rcg2.c | 56 +++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
index e6d84c8c7989..9fbbf1251564 100644
--- a/drivers/clk/qcom/clk-rcg.h
+++ b/drivers/clk/qcom/clk-rcg.h
@@ -176,6 +176,7 @@ extern const struct clk_ops clk_byte2_ops;
 extern const struct clk_ops clk_pixel_ops;
 extern const struct clk_ops clk_gfx3d_ops;
 extern const struct clk_ops clk_rcg2_shared_ops;
+extern const struct clk_ops clk_rcg2_parked_ops;
 extern const struct clk_ops clk_dp_ops;
 
 struct clk_rcg_dfs_data {
diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
index 5183c74b074f..fc75e2bc2d70 100644
--- a/drivers/clk/qcom/clk-rcg2.c
+++ b/drivers/clk/qcom/clk-rcg2.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/bitops.h>
+#include <linux/bitfield.h>
 #include <linux/err.h>
 #include <linux/bug.h>
 #include <linux/export.h>
@@ -1150,6 +1151,61 @@ const struct clk_ops clk_rcg2_shared_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_rcg2_shared_ops);
 
+static int clk_rcg2_parked_is_enabled(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	u32 cmd, cfg;
+	int ret;
+
+	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CMD_REG, &cmd);
+	if (ret)
+		return ret;
+
+	if ((cmd & CMD_ROOT_EN) == 0)
+		return false;
+
+	ret = regmap_read(rcg->clkr.regmap, rcg->cmd_rcgr + CFG_REG, &cfg);
+	if (ret)
+		return ret;
+
+	return FIELD_GET(CFG_SRC_SEL_MASK, cfg) != rcg->safe_src_index;
+}
+
+static int clk_rcg2_parked_init(struct clk_hw *hw)
+{
+	struct clk_rcg2 *rcg = to_clk_rcg2(hw);
+	const struct freq_tbl *f = rcg->freq_tbl;
+
+	regmap_read(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg), &rcg->parked_cfg);
+
+	if (FIELD_GET(CFG_SRC_SEL_MASK, rcg->parked_cfg) != rcg->safe_src_index)
+		return 0;
+
+	if (WARN_ON(!f) ||
+	    WARN_ON(qcom_find_src_cfg(hw, rcg->parent_map, f->src) == rcg->safe_src_index))
+		return -EINVAL;
+
+	return __clk_rcg2_configure(rcg, f, &rcg->parked_cfg);
+}
+
+/*
+ * Unlike clk_rcg2_shared_ops, the safe_src_index aka XO must NOT be present in
+ * parent_map. This allows us to implement proper is_enabled callback.
+ */
+const struct clk_ops clk_rcg2_parked_ops = {
+	.init = clk_rcg2_parked_init,
+	.is_enabled = clk_rcg2_parked_is_enabled,
+	.enable = clk_rcg2_shared_enable,
+	.disable = clk_rcg2_shared_disable,
+	.get_parent = clk_rcg2_shared_get_parent,
+	.set_parent = clk_rcg2_shared_set_parent,
+	.recalc_rate = clk_rcg2_shared_recalc_rate,
+	.determine_rate = clk_rcg2_determine_rate,
+	.set_rate = clk_rcg2_shared_set_rate,
+	.set_rate_and_parent = clk_rcg2_shared_set_rate_and_parent,
+};
+EXPORT_SYMBOL_GPL(clk_rcg2_parked_ops);
+
 /* Common APIs to be used for DFS based RCGR */
 static void clk_rcg2_dfs_populate_freq(struct clk_hw *hw, unsigned int l,
 				       struct freq_tbl *f)
-- 
2.39.2

