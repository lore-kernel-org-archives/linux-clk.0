Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D295C63797
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239316AbjAKTUd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:20:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbjAKTUS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:20:18 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03361705F
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:16 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id f21so12639567ljc.7
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9TfgZ8Zdbv763+42Ud+oVMz+eIqSvcSMEMLtjMi/xo=;
        b=jwhsObXKo/coHvJbhxPTaewQmc6+ONipv8wkxiF8ZPty8mKsLdFPSRs2hDqg9y5ho6
         eZPN1Ma04rm8HFkKY9aZtZHMU6YyVPcUabzD+QWPV9H+XtK1kGPca1aHXEdC5mKWBrND
         RBEnwxzFTpA1CZaoE6MoECEzqoWmpdm5B59rqtPG6ZJzeWl1rQBg1/f6Z/kM7GWcOIVz
         jwGsLj23Qu+R4Ur+hcp7fcoe5NtX/Tnxjqzy3AuSnaJ6nMdCbmLDNkJEXl41pIkPIG6B
         8bARiB9bp4ubBCy7rfhNEyANBSbPoZQ9hP9TM1OrXApVF2+RvfhmQdpOt3O1hR7yC4nc
         qTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9TfgZ8Zdbv763+42Ud+oVMz+eIqSvcSMEMLtjMi/xo=;
        b=f31GSyk+3Nzndnezeoi/ZQ/9T6tnPNHtRNYOD0/uWzr9Tm9kNsVotWtqvODdfOnnyL
         Vngr8lkwCk7wDbUmy6JplignDf3wEpTrHjuascV3Jq4zrEuz7zexj3hDIKEwxMB+DO6Q
         /7VCv0HTIWJbFyTS2AXJo89znaQ16ntovxkE1LDB2YRXD4KOQQqibQ5sIyIzGEKdGbpv
         xGy4zIKI+EaS9Wcdq/AKc+JYBNx1IDYfwTgMMF1/4B21QYBcb0l2Jkk+MyiQnKmEMMgu
         xFxHuOMxeuc6+ZLBuoH///n4nu1noi6v15uim1UoV15/oRGIpKyzHYDW1lqtdWfptNwh
         gkAA==
X-Gm-Message-State: AFqh2krWNgDjHT6jKojUISFmcdxwP0PFG+wLE94xh0h0lt51pruSeyIV
        2JCibobW8jkblJ9T2+o17BW+zg==
X-Google-Smtp-Source: AMrXdXtO8D6A2JvEf+Igc3GNYE2NSOngNjMbK5U2NDeOvtWW+cgtXAWNdkq64PLfHe2/XE8lSO+8aA==
X-Received: by 2002:a2e:9206:0:b0:27f:e50b:9e35 with SMTP id k6-20020a2e9206000000b0027fe50b9e35mr10609099ljg.52.1673464815027;
        Wed, 11 Jan 2023 11:20:15 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id bj36-20020a2eaaa4000000b0027ff2fabcb5sm1807787ljb.104.2023.01.11.11.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:20:14 -0800 (PST)
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
Subject: [PATCH 11/13] clk: qcom: cpu-8996: fix PLL clock ops
Date:   Wed, 11 Jan 2023 22:20:02 +0300
Message-Id: <20230111192004.2509750-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
References: <20230111192004.2509750-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch CPU PLLs to use clk_alpha_pll_hwfsm_ops, it seems to suit
better.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-cpu-8996.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/clk-cpu-8996.c b/drivers/clk/qcom/clk-cpu-8996.c
index 1c00eb629b61..b53cddc4bca3 100644
--- a/drivers/clk/qcom/clk-cpu-8996.c
+++ b/drivers/clk/qcom/clk-cpu-8996.c
@@ -128,7 +128,7 @@ static struct clk_alpha_pll pwrcl_pll = {
 		.name = "pwrcl_pll",
 		.parent_data = pll_parent,
 		.num_parents = ARRAY_SIZE(pll_parent),
-		.ops = &clk_alpha_pll_huayra_ops,
+		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
 
@@ -140,7 +140,7 @@ static struct clk_alpha_pll perfcl_pll = {
 		.name = "perfcl_pll",
 		.parent_data = pll_parent,
 		.num_parents = ARRAY_SIZE(pll_parent),
-		.ops = &clk_alpha_pll_huayra_ops,
+		.ops = &clk_alpha_pll_hwfsm_ops,
 	},
 };
 
-- 
2.30.2

