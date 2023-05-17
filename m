Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50872C7EE23
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 16:41:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbjEQQlE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 12:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjEQQk5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 12:40:57 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850C3AD07
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:40:54 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ac78bb48eeso9823961fa.1
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 09:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684341653; x=1686933653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21Y/lONTQ0Y2HJDUDOGXrhNqNSuoVcf6wbWYKvgA/OQ=;
        b=J1B+L6gNHaU6nGktyrY/YToDXewhaQgSXVvC7YvCBYQ6Fp7264VtEPg8bw53rJauzu
         n0xg6nm6Z4R5vECW9739UEeKLssy2ZJRBY36Ro3mk5tSZIPh4h9/Vn7c03KGHDI67s4m
         jsRcsr4lO2WfxLG0/QOsfc4qVIW5piELU+9+bLC6cc7rQLB6xe3Swfbh2njS99buwy76
         fwdj5w3GE/VdlvHVmGZK7K+fRzqn/5q0b0F8G6LlCELohN2v6jdYu6uXKKsgi//p/Fft
         ywvpJsGYJVz14iE+qJeV3Dx96gYmStx8Y2UnSgcMqUhTe+jTP0QPq+LaKdnz3fPYn7Rj
         IIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684341653; x=1686933653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21Y/lONTQ0Y2HJDUDOGXrhNqNSuoVcf6wbWYKvgA/OQ=;
        b=cbgjRmsVP98c9F5uzWnWfMmEgo/M2o899d6n5NGs432G6umWJoZ4iclXRrnZus+KVb
         LRt18XOZfRl95jaP52SjPrnxttao/B220pcsoTXlDsABFyvA0rGZ3Qi5bwgrtCiYosPA
         J8HbepGyo9pS5f0g1U8gIUqO9+kkzzhuXDphUxGVG8nsMds+DRPT0WNBimWVDa5lan9Z
         lpE7Ya0t3fN5srbAIjC1A3lIG34flVywvtHf4wlfCfum+DvZXEGhRCqs7seb76GgiG9q
         bTqpkFGW5YKi0s6Qg76pMsT6M33g5buClBGN6kfr2Kvk/UvSTRwvLZIgJUBZjI0x1aEO
         y6Qw==
X-Gm-Message-State: AC+VfDzsQAKrnTB0V6+BxjlT7uI4JAn28ea6XzG/ed/S18VpQDzX31D7
        GrwEUhNjRyE2HlcYV8u44pZFNQ==
X-Google-Smtp-Source: ACHHUZ6jl0ZO6U+g6qi3Wh5TRY2RPbsC/TK3JUt5l+rKlWFr+mha78+Lz02TKSs+WbG0JdGVOdt5zQ==
X-Received: by 2002:a2e:b61c:0:b0:2a8:bce4:c70f with SMTP id r28-20020a2eb61c000000b002a8bce4c70fmr8930854ljn.26.1684341652892;
        Wed, 17 May 2023 09:40:52 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
        by smtp.gmail.com with ESMTPSA id 9-20020a05651c040900b002a8c271de33sm1919259lja.67.2023.05.17.09.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 09:40:52 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Wed, 17 May 2023 18:40:40 +0200
Subject: [PATCH 3/4] clk: qcom: gcc-sm8450: Enable hw_clk_ctrl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-waipio-gpucc-v1-3-4f40e282af1d@linaro.org>
References: <20230517-topic-waipio-gpucc-v1-0-4f40e282af1d@linaro.org>
In-Reply-To: <20230517-topic-waipio-gpucc-v1-0-4f40e282af1d@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684341644; l=11592;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=K573iqNmTIG1+Cr4UymMlBHDghHI13Rxxj/QpZgKwns=;
 b=zV1RCfGohyZMqJiPSNMBrn3K1JRo3JMBZE5ozowv1KXHkA/jag4BfLUjvAcj71TNcV9wkr/sL
 vDmOa6I8vBACnUCVl7B1VSMU+KrxYYAtNrlJaiobvE/saE6FCx8G6LV
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enable hardware clock control on all RCGs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/clk/qcom/gcc-sm8450.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index 84764cc3db4f..75635d40a12d 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -334,6 +334,7 @@ static struct clk_rcg2 gcc_gp1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_1,
 	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp1_clk_src",
 		.parent_data = gcc_parent_data_1,
@@ -349,6 +350,7 @@ static struct clk_rcg2 gcc_gp2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_1,
 	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp2_clk_src",
 		.parent_data = gcc_parent_data_1,
@@ -364,6 +366,7 @@ static struct clk_rcg2 gcc_gp3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_1,
 	.freq_tbl = ftbl_gcc_gp1_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_gp3_clk_src",
 		.parent_data = gcc_parent_data_1,
@@ -384,6 +387,7 @@ static struct clk_rcg2 gcc_pcie_0_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_2,
 	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_0_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
@@ -405,6 +409,7 @@ static struct clk_rcg2 gcc_pcie_0_phy_rchng_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_pcie_0_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_0_phy_rchng_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -420,6 +425,7 @@ static struct clk_rcg2 gcc_pcie_1_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_2,
 	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_1_aux_clk_src",
 		.parent_data = gcc_parent_data_2,
@@ -435,6 +441,7 @@ static struct clk_rcg2 gcc_pcie_1_phy_rchng_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_pcie_0_phy_rchng_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pcie_1_phy_rchng_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -455,6 +462,7 @@ static struct clk_rcg2 gcc_pdm2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_pdm2_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_pdm2_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -493,6 +501,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s0_clk_src_init,
 };
 
@@ -510,6 +519,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s1_clk_src_init,
 };
 
@@ -527,6 +537,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s2_clk_src_init,
 };
 
@@ -544,6 +555,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s3_clk_src_init,
 };
 
@@ -561,6 +573,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s4_clk_src_init,
 };
 
@@ -590,6 +603,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s5_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s5_clk_src_init,
 };
 
@@ -607,6 +621,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s6_clk_src_init,
 };
 
@@ -624,6 +639,7 @@ static struct clk_rcg2 gcc_qupv3_wrap0_s7_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap0_s7_clk_src_init,
 };
 
@@ -660,6 +676,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap1_s0_clk_src_init,
 };
 
@@ -677,6 +694,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap1_s1_clk_src_init,
 };
 
@@ -694,6 +712,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap1_s2_clk_src_init,
 };
 
@@ -711,6 +730,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap1_s3_clk_src_init,
 };
 
@@ -728,6 +748,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap1_s4_clk_src_init,
 };
 
@@ -745,6 +766,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap1_s5_clk_src_init,
 };
 
@@ -762,6 +784,7 @@ static struct clk_rcg2 gcc_qupv3_wrap1_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap1_s6_clk_src_init,
 };
 
@@ -779,6 +802,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s0_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap2_s0_clk_src_init,
 };
 
@@ -796,6 +820,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s1_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap1_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap2_s1_clk_src_init,
 };
 
@@ -813,6 +838,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s2_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap2_s2_clk_src_init,
 };
 
@@ -830,6 +856,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s3_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap2_s3_clk_src_init,
 };
 
@@ -847,6 +874,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s4_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap2_s4_clk_src_init,
 };
 
@@ -864,6 +892,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s5_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap2_s5_clk_src_init,
 };
 
@@ -881,6 +910,7 @@ static struct clk_rcg2 gcc_qupv3_wrap2_s6_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_qupv3_wrap0_s0_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &gcc_qupv3_wrap2_s6_clk_src_init,
 };
 
@@ -899,6 +929,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_7,
 	.freq_tbl = ftbl_gcc_sdcc2_apps_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc2_apps_clk_src",
 		.parent_data = gcc_parent_data_7,
@@ -921,6 +952,7 @@ static struct clk_rcg2 gcc_sdcc4_apps_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_sdcc4_apps_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_sdcc4_apps_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -944,6 +976,7 @@ static struct clk_rcg2 gcc_ufs_phy_axi_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_ufs_phy_axi_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_axi_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -966,6 +999,7 @@ static struct clk_rcg2 gcc_ufs_phy_ice_core_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_ice_core_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -987,6 +1021,7 @@ static struct clk_rcg2 gcc_ufs_phy_phy_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_3,
 	.freq_tbl = ftbl_gcc_ufs_phy_phy_aux_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_3,
@@ -1002,6 +1037,7 @@ static struct clk_rcg2 gcc_ufs_phy_unipro_core_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_ufs_phy_ice_core_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_ufs_phy_unipro_core_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -1025,6 +1061,7 @@ static struct clk_rcg2 gcc_usb30_prim_master_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_usb30_prim_master_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_master_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -1040,6 +1077,7 @@ static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_0,
 	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb30_prim_mock_utmi_clk_src",
 		.parent_data = gcc_parent_data_0,
@@ -1055,6 +1093,7 @@ static struct clk_rcg2 gcc_usb3_prim_phy_aux_clk_src = {
 	.hid_width = 5,
 	.parent_map = gcc_parent_map_2,
 	.freq_tbl = ftbl_gcc_pcie_0_aux_clk_src,
+	.hw_clk_ctrl = true,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gcc_usb3_prim_phy_aux_clk_src",
 		.parent_data = gcc_parent_data_2,

-- 
2.40.1

