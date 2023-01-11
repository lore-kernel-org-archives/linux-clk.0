Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A12C54EBE
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 06:05:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235539AbjAKGFC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 01:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235760AbjAKGEW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 01:04:22 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E61BCE25
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:11 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id d30so17024098lfv.8
        for <linux-clk@vger.kernel.org>; Tue, 10 Jan 2023 22:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Yy+eMAvWavBfxfek1Yv32EJTJXddeULEG32lfUcRIs=;
        b=tyO1UyaUUCtZDaezkOrW7vDk+QKbYTQOkkMXjFL4DPTrxx2QCZGtTqwyhx4K5eyLep
         SMrPF/u8TnP47es1fIMzEus+gjAsplIludE/u/iJE9q9Wp3atDszug2MiKknyF+D6Ojv
         Sq4jTVz55EXSwmH0YYIK54b60L8VqI6M8HmMI9bO9W77A7td53TWRGHcKobo+J8HIxdv
         ac4JBVQ/RMaeJieGgICqIu08nEwEavrz2sanT9jYlTf4L7T5bGXPIpu0S0BuTwXsjaOL
         Yt0+8Fnx3Wr3MuWZ1KU4Bhh16CAyeYGIWy2V5bqC/6ZhQpdEpvnlTkRsCNTnE+WFNLqN
         QRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Yy+eMAvWavBfxfek1Yv32EJTJXddeULEG32lfUcRIs=;
        b=J7kdeq5EqsTYqXcrUgiBppfHQJJ55Y4aPEGTt9QXpg8nH9rGfbWJwHjK1cF1gDom3R
         6O96RMYno96K3UpvVNBmSYBBAzxUjNF6h7SWJpU7JTenDcXpGj0AlIC4/LXvjAw/z539
         z8KUyr5aTUT8Khp845ldIJXe3Pua61r1YSNjsU+xy64t7xE/Kf1/5NDi/mnu62tAG4/2
         OqN/kkXxulc9qgT2bfwIHIckP6JJjJqfOwo22sJMdvfmDN/rMtvYquFeySNbR6jedQdN
         TY7NZttXBTu0nY+LEGrFWx7jpHPTmZVRq4ZKQnqAKHwLmLl+n5vAIPCGukWitiuQM1Dq
         vV7Q==
X-Gm-Message-State: AFqh2kq5tXSqmYhTef+B6pt0zz/OPxwjkA1rp3KMVcS2gxmsQZdhKwSC
        8tcB7ZFSiQaGktJObTmOUBeg/g==
X-Google-Smtp-Source: AMrXdXs/g+JbegX86WQmjWZX2YEMQWai5fzAHVfU/B/QiOkh/SQsxSEAuswZDcw9okL3yEIHPgYJaQ==
X-Received: by 2002:a05:6512:1111:b0:4cc:7e0e:8d5c with SMTP id l17-20020a056512111100b004cc7e0e8d5cmr4022515lfg.37.1673417050320;
        Tue, 10 Jan 2023 22:04:10 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id b7-20020a056512070700b004cb143f7391sm2524607lfs.258.2023.01.10.22.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 22:04:09 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 09/12] clk: qcom: mmcc-apq8084: move clock parent tables down
Date:   Wed, 11 Jan 2023 08:03:59 +0200
Message-Id: <20230111060402.1168726-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
References: <20230111060402.1168726-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move clock parent tables down, after the PLL declrataions, so that we
can use pll hw clock fields in the next commit.

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/mmcc-apq8084.c | 200 ++++++++++++++++----------------
 1 file changed, 100 insertions(+), 100 deletions(-)

diff --git a/drivers/clk/qcom/mmcc-apq8084.c b/drivers/clk/qcom/mmcc-apq8084.c
index 4acbcb43927f..fee7c767132d 100644
--- a/drivers/clk/qcom/mmcc-apq8084.c
+++ b/drivers/clk/qcom/mmcc-apq8084.c
@@ -40,6 +40,106 @@ enum {
 	P_MMSLEEP,
 };
 
+static struct clk_pll mmpll0 = {
+	.l_reg = 0x0004,
+	.m_reg = 0x0008,
+	.n_reg = 0x000c,
+	.config_reg = 0x0014,
+	.mode_reg = 0x0000,
+	.status_reg = 0x001c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll0",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap mmpll0_vote = {
+	.enable_reg = 0x0100,
+	.enable_mask = BIT(0),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmpll0_vote",
+		.parent_names = (const char *[]){ "mmpll0" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll mmpll1 = {
+	.l_reg = 0x0044,
+	.m_reg = 0x0048,
+	.n_reg = 0x004c,
+	.config_reg = 0x0050,
+	.mode_reg = 0x0040,
+	.status_reg = 0x005c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll1",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap mmpll1_vote = {
+	.enable_reg = 0x0100,
+	.enable_mask = BIT(1),
+	.hw.init = &(struct clk_init_data){
+		.name = "mmpll1_vote",
+		.parent_names = (const char *[]){ "mmpll1" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
+static struct clk_pll mmpll2 = {
+	.l_reg = 0x4104,
+	.m_reg = 0x4108,
+	.n_reg = 0x410c,
+	.config_reg = 0x4110,
+	.mode_reg = 0x4100,
+	.status_reg = 0x411c,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll2",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_pll mmpll3 = {
+	.l_reg = 0x0084,
+	.m_reg = 0x0088,
+	.n_reg = 0x008c,
+	.config_reg = 0x0090,
+	.mode_reg = 0x0080,
+	.status_reg = 0x009c,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll3",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_pll mmpll4 = {
+	.l_reg = 0x00a4,
+	.m_reg = 0x00a8,
+	.n_reg = 0x00ac,
+	.config_reg = 0x00b0,
+	.mode_reg = 0x0080,
+	.status_reg = 0x00bc,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "mmpll4",
+		.parent_names = (const char *[]){ "xo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
 static const struct parent_map mmcc_xo_mmpll0_mmpll1_gpll0_map[] = {
 	{ P_XO, 0 },
 	{ P_MMPLL0, 1 },
@@ -212,106 +312,6 @@ static const char * const mmcc_xo_mmpll0_1_4_gpll1_0_sleep[] = {
 	"sleep_clk_src",
 };
 
-static struct clk_pll mmpll0 = {
-	.l_reg = 0x0004,
-	.m_reg = 0x0008,
-	.n_reg = 0x000c,
-	.config_reg = 0x0014,
-	.mode_reg = 0x0000,
-	.status_reg = 0x001c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll0",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap mmpll0_vote = {
-	.enable_reg = 0x0100,
-	.enable_mask = BIT(0),
-	.hw.init = &(struct clk_init_data){
-		.name = "mmpll0_vote",
-		.parent_names = (const char *[]){ "mmpll0" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll mmpll1 = {
-	.l_reg = 0x0044,
-	.m_reg = 0x0048,
-	.n_reg = 0x004c,
-	.config_reg = 0x0050,
-	.mode_reg = 0x0040,
-	.status_reg = 0x005c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll1",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap mmpll1_vote = {
-	.enable_reg = 0x0100,
-	.enable_mask = BIT(1),
-	.hw.init = &(struct clk_init_data){
-		.name = "mmpll1_vote",
-		.parent_names = (const char *[]){ "mmpll1" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static struct clk_pll mmpll2 = {
-	.l_reg = 0x4104,
-	.m_reg = 0x4108,
-	.n_reg = 0x410c,
-	.config_reg = 0x4110,
-	.mode_reg = 0x4100,
-	.status_reg = 0x411c,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll2",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_pll mmpll3 = {
-	.l_reg = 0x0084,
-	.m_reg = 0x0088,
-	.n_reg = 0x008c,
-	.config_reg = 0x0090,
-	.mode_reg = 0x0080,
-	.status_reg = 0x009c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll3",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_pll mmpll4 = {
-	.l_reg = 0x00a4,
-	.m_reg = 0x00a8,
-	.n_reg = 0x00ac,
-	.config_reg = 0x00b0,
-	.mode_reg = 0x0080,
-	.status_reg = 0x00bc,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "mmpll4",
-		.parent_names = (const char *[]){ "xo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
 static struct clk_rcg2 mmss_ahb_clk_src = {
 	.cmd_rcgr = 0x5000,
 	.hid_width = 5,
-- 
2.39.0

