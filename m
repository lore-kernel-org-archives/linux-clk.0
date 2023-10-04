Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EFEE8FDC3
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 00:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239076AbjJDAbe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Oct 2023 20:31:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239228AbjJDAbd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Oct 2023 20:31:33 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 027AAA9
        for <linux-clk@vger.kernel.org>; Tue,  3 Oct 2023 17:31:30 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4066692ad35so15017685e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Oct 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696379488; x=1696984288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLl0HwSpebHQPe1HZIMtv8j9E/LK6fVYcwfGDJYdmX8=;
        b=kw3HLBqWKvrAs6IYP2qx3IgcVgn52FNA1LpzanjIptz9x1zKHZrPdlVZdT+e3M9JMR
         J7IThKbZntaz+LO8WZxOcYNURStxpfZ4el14h5t40UQM9GkHvYUAcuL2nVIVuGQRAFwE
         n003Lo9rhZlaNxKC8OrSkQZVnjFL7a6XIXldStiLUOZrtYsZuGBgX06nHhB4WgF1uMl3
         cw3VSujifEE0AOEeb693iuCOwup8k5GEBlyJRUEddKE2Ho+fwuBq9b0KtyMo3eZf5b6d
         KpG5ZCQ4sjAI28p72sDv43WMURL9kq0i7+vt65sihMs6fFnQ3JSpcJK7XPHzNm26nAyQ
         XP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696379488; x=1696984288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aLl0HwSpebHQPe1HZIMtv8j9E/LK6fVYcwfGDJYdmX8=;
        b=iI3a/o2j0x1AElKSkXqtEEgLViTbfrSvzE+9boJ8/tHQ/cXm9uLgEpPJmfCyRR/tNx
         EUFXQ6PdXRVpLieUfHpz/sJw8ebCDTPSTAYZJv6iimjHeLpAXV1mfh3fDl7cP4aoSGNj
         qzH07wZhIuN1fWbIw4sXKoVZI8yvodXQT+JHKL2f6ktSfMPXH2ruiq7zkUHl+/LX1WIu
         fFEPdYtC5Vw/15LYEx9B/DkKLcQ0e8fLC/BgtNbK03ko5sthcZ7C7/S8WgrFZt0N9xXR
         9uuXpGdmaVtMB3PiVa0ud28b1bV9pKrdtX7AdIBVfqP2mPvQoaSKrR2VfwLivV0JfSU7
         LUhg==
X-Gm-Message-State: AOJu0Ywqz1oSpzHB2u7DH8ck4jHfYjiD1XzHDbSAKG/YnhSUdH4DVskE
        ZVHw43tncI+muuL+9b8EKkleCQ==
X-Google-Smtp-Source: AGHT+IGd0wiDCW72fyJSci0cDwyaeDLNNsCxDImCmLd2d9uiLe8TptjX5U3tzlSjXQIbCu490pQpww==
X-Received: by 2002:a7b:cb8c:0:b0:405:3f19:fc49 with SMTP id m12-20020a7bcb8c000000b004053f19fc49mr935957wmi.34.1696379488521;
        Tue, 03 Oct 2023 17:31:28 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u15-20020a056512094f00b005056e8bebb8sm366937lft.124.2023.10.03.17.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 17:31:28 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>
Subject: [RFC PATCH 2/2] clk: qcom: dispcc-sm8250: switch to clk_rcg2_parked_ops
Date:   Wed,  4 Oct 2023 03:31:25 +0300
Message-Id: <20231004003125.2289613-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch MDP, AHB and ROT clocks to the clk_rcg2_parked_ops so that the
CCF can properly determine if the clock is enabled or disabled.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/dispcc-sm8250.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm8250.c b/drivers/clk/qcom/dispcc-sm8250.c
index e17bb8b543b5..229d32aee431 100644
--- a/drivers/clk/qcom/dispcc-sm8250.c
+++ b/drivers/clk/qcom/dispcc-sm8250.c
@@ -144,12 +144,10 @@ static const struct clk_parent_data disp_cc_parent_data_2[] = {
 };
 
 static const struct parent_map disp_cc_parent_map_3[] = {
-	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_3[] = {
-	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll1.clkr.hw },
 };
 
@@ -166,13 +164,11 @@ static const struct clk_parent_data disp_cc_parent_data_4[] = {
 };
 
 static const struct parent_map disp_cc_parent_map_5[] = {
-	{ P_BI_TCXO, 0 },
 	{ P_DISP_CC_PLL0_OUT_MAIN, 1 },
 	{ P_DISP_CC_PLL1_OUT_MAIN, 4 },
 };
 
 static const struct clk_parent_data disp_cc_parent_data_5[] = {
-	{ .fw_name = "bi_tcxo" },
 	{ .hw = &disp_cc_pll0.clkr.hw },
 	{ .hw = &disp_cc_pll1.clkr.hw },
 };
@@ -219,7 +215,7 @@ static struct clk_rcg2 disp_cc_mdss_ahb_clk_src = {
 		.parent_data = disp_cc_parent_data_3,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_3),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -565,7 +561,7 @@ static struct clk_rcg2 disp_cc_mdss_mdp_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
@@ -617,7 +613,7 @@ static struct clk_rcg2 disp_cc_mdss_rot_clk_src = {
 		.parent_data = disp_cc_parent_data_5,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_5),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_shared_ops,
+		.ops = &clk_rcg2_parked_ops,
 	},
 };
 
-- 
2.39.2

