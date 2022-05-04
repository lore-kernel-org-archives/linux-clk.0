Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80370C4321E
	for <linux-clk@archiver.kernel.org>; Wed,  4 May 2022 16:38:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236727AbiEDQmT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 May 2022 12:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243438AbiEDQmT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 12:42:19 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918BA37BFA
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 09:38:42 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id a14-20020a7bc1ce000000b00393fb52a386so3575561wmj.1
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 09:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=38ClWEkxwOkXXNm+XYK/eFquNVqFN0ERCueF4DUI9W0=;
        b=rXhYjCmjf9bhnUdJNozUrqQTYnR4R2fQno55E4cZ+53s1nH0nJaIKPb3zYa44gijnq
         QriH4xru9Y652IlHoMXQ5qO52z0mvsq9CL9zCpzZS8l6NXtRFyQbFgQ4OZ1HrRSm6HCz
         fLZxf/bBJjF6KD3TNXtCNYhX/3ywc5QQwHzKywJ4riHEpEPtoI/OMWfkpG/GykFS9WXn
         7n+n0+cYaB1O3VEgeOUIwIQb0jgnSAFPqBhFl+20PT99+ir//AZ9QxFOynW5JA9/Qn1f
         aSqvjWwMz7Pbdma9+rv292sTpfI6CmkMGNrXdBKucNdjVQeq82Bwz7Bz37RvuW75bo34
         Bpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=38ClWEkxwOkXXNm+XYK/eFquNVqFN0ERCueF4DUI9W0=;
        b=BM19rOl7JEpfcqcqe2MpeYcXBbKqezRMHxVfWoff6J5+/70RteS2mzLYbQazJAQote
         H9bOl59fNl4nPV8W7skaY4KFyyL6XWNiyNE+yGj1SaYu/bR777/1qzLP9gaRI+S71qXT
         eQiUC1+NTrdDFSkyGGairK0Zpanku/Z/fT7lPQgfjpY0vzEbYhlRAMTw27v5z8qLWfWQ
         Y/Puh6NVK0CCAd9b7rvkJJtnIgHz3ANdI7PX7T0TfRcmqsdXPgOqsFFHwDoWVIThd6UA
         o2HiqaEA6+2YklIbUTvYH6WmBxUG1cTkoi1o+yD7EWWhF00UTJ7vmpdJRbwl7QIHf1rG
         uwsQ==
X-Gm-Message-State: AOAM533Q3fTJu0rrpHfM80eQgUeWAstGWDniFCi0hbI7RrJ1hrEIXOfG
        mAE1rwoql9cFcVIcXEW3JfNxQw==
X-Google-Smtp-Source: ABdhPJzsT6sR1T0E6s0s01EryMt2r91p3wfvrzVRSwtjSqrHfVkFznXo4sK66I+uTUGhOokWM1eJEQ==
X-Received: by 2002:a05:600c:3ca3:b0:392:990b:af11 with SMTP id bg35-20020a05600c3ca300b00392990baf11mr204832wmb.173.1651682321181;
        Wed, 04 May 2022 09:38:41 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r20-20020adfa154000000b0020c5253d8c7sm11671706wrr.19.2022.05.04.09.38.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 09:38:40 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org
Subject: [PATCH 3/4] clk: qcom: add gcc-msm8939: Add missing system_mm_noc_bfdcd_clk_src
Date:   Wed,  4 May 2022 17:38:34 +0100
Message-Id: <20220504163835.40130-4-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
References: <20220504163835.40130-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The msm8939 has an additional higher operating point for the multi-media
peripherals. The higher throughput MM componets operate off of the
system-mm noc not the system noc.

system_mm_noc_bfdcd_clk_src is the source clock for the higher frequency
capable system noc mm.

Maximum frequency for the MM SNOC is 400 MHz.

Fixes: 1664014e4679 ("clk: qcom: gcc-msm8939: Add MSM8939 Generic Clock Controller")
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/clk/qcom/gcc-msm8939.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8939.c b/drivers/clk/qcom/gcc-msm8939.c
index 49e4bb87c46a..f27e19035c4f 100644
--- a/drivers/clk/qcom/gcc-msm8939.c
+++ b/drivers/clk/qcom/gcc-msm8939.c
@@ -646,6 +646,18 @@ static struct clk_rcg2 bimc_ddr_clk_src = {
 	},
 };
 
+static struct clk_rcg2 system_mm_noc_bfdcd_clk_src = {
+	.cmd_rcgr = 0x2600c,
+	.hid_width = 5,
+	.parent_map = gcc_xo_gpll0_gpll6a_map,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "system_mm_noc_bfdcd_clk_src",
+		.parent_data = gcc_xo_gpll0_gpll6a_parent_data,
+		.num_parents = 3,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
 static const struct freq_tbl ftbl_gcc_camss_ahb_clk[] = {
 	F(40000000, P_GPLL0, 10, 1, 2),
 	F(80000000, P_GPLL0, 10, 0, 0),
@@ -3625,6 +3637,7 @@ static struct clk_regmap *gcc_msm8939_clocks[] = {
 	[GPLL2_VOTE] = &gpll2_vote,
 	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[SYSTEM_NOC_BFDCD_CLK_SRC] = &system_noc_bfdcd_clk_src.clkr,
+	[SYSTEM_MM_NOC_BFDCD_CLK_SRC] = &system_mm_noc_bfdcd_clk_src.clkr,
 	[CAMSS_AHB_CLK_SRC] = &camss_ahb_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[CSI0_CLK_SRC] = &csi0_clk_src.clkr,
-- 
2.35.1

