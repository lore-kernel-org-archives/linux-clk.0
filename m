Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD447C43332
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 05:26:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7D2864FF6
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 05:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232354AbhCJF0T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Mar 2021 00:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbhCJF0D (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Mar 2021 00:26:03 -0500
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33053C061762
        for <linux-clk@vger.kernel.org>; Tue,  9 Mar 2021 21:26:03 -0800 (PST)
Received: by mail-pl1-x636.google.com with SMTP id d23so4691502plq.2
        for <linux-clk@vger.kernel.org>; Tue, 09 Mar 2021 21:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MyRCvPaVcQpraU+Ca0FoAU2tyJOU/YwufLj6r26LxEI=;
        b=D6lyYhKUOzYxKJP9wW1OlrsACoqZ0od54Zu2hf1RH5ThM8X+8haQ322vVyG0VgGYG8
         a3OvxE2iPvBMOand9IusfG8625ACzjFrUixK3WHIif4P951pozwIY85ijfSiSPPjkPmq
         hJqSd/n8HdGW68p3z0QW0LUgDbDlrte3gxd3M/NWvUhDJVQ2KPSaCDFaws6YNWUxg0rY
         tagg1+7vwkHCLiZ6weBdJhTmhavbvgLhu2TCKMLZeNGHa2o6aXHlczxFoVAjgYoUveKv
         mkVBqmB+ffwF6l49jMrZmLQbuEP++cdfYQtCBkosOQHoqdGBnNc3uDaqwXOs4z73XnLQ
         nQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MyRCvPaVcQpraU+Ca0FoAU2tyJOU/YwufLj6r26LxEI=;
        b=DZL7getxXKwZ7r36NM4+fId4PWpQD39C7NFX/u6pHTOrtL6/W0PizqgMJ/Z8USyRmk
         OXIVimL+kBgrqy82y0qt84kW0k29nTc4zG5X0b+wei8Iq29FILSkFeH3M2RmtmWrWCgW
         ee0RebnIeBfsjsPfmX4MAaKUQftRugXRla83HbyYOemJne+BPPdcaLOSlbB1AKtpCB9E
         4YKwmqFPLv0l+L0h+2/hf0Xi1YyNSN7L+IiU7yvVb3FOFhEp3pVUgI4kSdlG4rGGx0tZ
         GHW/BmuCLWjni9cC2u5mKoMILRVqBJL7QZMQ1jZMnVXqJprb5goBpg7MFaqjwb1li1gk
         xJVw==
X-Gm-Message-State: AOAM530tDO0Il9sa1Yo5R0hzpo5n51NJgkQDCxvNWiBKsm6xOhF+t1JG
        DdWmSDpRuTv5HQZELi/+RQc8yA==
X-Google-Smtp-Source: ABdhPJz3/IVhZZduaRV272ANjvrN6PpFXwgaoJQOGccIirWhB2t2MT3WW+JVnlbUGlhy+GyZuy3QzA==
X-Received: by 2002:a17:90a:987:: with SMTP id 7mr1729387pjo.97.1615353962846;
        Tue, 09 Mar 2021 21:26:02 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:9f4:a436:21bd:7573:25c0:73a0])
        by smtp.gmail.com with ESMTPSA id g7sm13915224pgb.10.2021.03.09.21.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 21:26:02 -0800 (PST)
From:   Bhupesh Sharma <bhupesh.sharma@linaro.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     bhupesh.sharma@linaro.org, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bhupesh.linux@gmail.com
Subject: [PATCH 6/8] clk: qcom: Add gcc clocks for crypto block on sm8250
Date:   Wed, 10 Mar 2021 10:55:01 +0530
Message-Id: <20210310052503.3618486-7-bhupesh.sharma@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
References: <20210310052503.3618486-1-bhupesh.sharma@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch adds the global clock controller (gcc) clocks required
by the sm8250 crypto block to function, namely: GCC_CE1_AHB_CLK,
GCC_CE1_AXI_CLK and GCC_CE1_CLK.

Cc: Vinod Koul <vkoul@kernel.org>
Cc: Thara Gopinath <thara.gopinath@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: David S. Miller <davem@davemloft.net>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org
Cc: linux-crypto@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: bhupesh.linux@gmail.com
Signed-off-by: Bhupesh Sharma <bhupesh.sharma@linaro.org>
---
 drivers/clk/qcom/gcc-sm8250.c | 44 +++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index ab594a0f0c40..0df5ac346c93 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -1198,6 +1198,47 @@ static struct clk_branch gcc_camera_xo_clk = {
 	},
 };
 
+static struct clk_branch gcc_ce1_ahb_clk = {
+	.halt_reg = 0x4100c,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x4100c,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(3),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_ahb_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_axi_clk = {
+	.halt_reg = 0x41008,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(4),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_ce1_clk = {
+	.halt_reg = 0x41004,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x52004,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_ce1_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct clk_branch gcc_cfg_noc_usb3_prim_axi_clk = {
 	.halt_reg = 0xf07c,
 	.halt_check = BRANCH_HALT_VOTED,
@@ -3325,6 +3366,9 @@ static struct clk_regmap *gcc_sm8250_clocks[] = {
 	[GCC_CAMERA_HF_AXI_CLK] = &gcc_camera_hf_axi_clk.clkr,
 	[GCC_CAMERA_SF_AXI_CLK] = &gcc_camera_sf_axi_clk.clkr,
 	[GCC_CAMERA_XO_CLK] = &gcc_camera_xo_clk.clkr,
+	[GCC_CE1_AHB_CLK] = &gcc_ce1_ahb_clk.clkr,
+	[GCC_CE1_AXI_CLK] = &gcc_ce1_axi_clk.clkr,
+	[GCC_CE1_CLK] = &gcc_ce1_clk.clkr,
 	[GCC_CFG_NOC_USB3_PRIM_AXI_CLK] = &gcc_cfg_noc_usb3_prim_axi_clk.clkr,
 	[GCC_CFG_NOC_USB3_SEC_AXI_CLK] = &gcc_cfg_noc_usb3_sec_axi_clk.clkr,
 	[GCC_CPUSS_AHB_CLK] = &gcc_cpuss_ahb_clk.clkr,
-- 
2.29.2

