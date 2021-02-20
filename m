Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A296C433E0
	for <linux-clk@archiver.kernel.org>; Sat, 20 Feb 2021 15:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E710964ED7
	for <linux-clk@archiver.kernel.org>; Sat, 20 Feb 2021 15:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhBTP6j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 20 Feb 2021 10:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230001AbhBTP6a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 20 Feb 2021 10:58:30 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89D98C06121D
        for <linux-clk@vger.kernel.org>; Sat, 20 Feb 2021 07:57:16 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id C05381F5FA;
        Sat, 20 Feb 2021 16:56:31 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Craig Tatlor <ctatlor97@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/6] clk: qcom: gcc-sdm660: Fix hmss_gpll0_clk_src parent_map
Date:   Sat, 20 Feb 2021 16:56:12 +0100
Message-Id: <20210220155618.176559-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The correct one is gcc_parent_map_xo_gpll0.

Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 6394257ca8c0..597800ce1bdf 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -626,12 +626,12 @@ static struct clk_rcg2 hmss_gpll0_clk_src = {
 	.cmd_rcgr = 0x4805c,
 	.mnd_width = 0,
 	.hid_width = 5,
-	.parent_map = gcc_parent_map_xo_gpll0_gpll0_early_div,
+	.parent_map = gcc_parent_map_xo_gpll0,
 	.freq_tbl = ftbl_hmss_gpll0_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "hmss_gpll0_clk_src",
-		.parent_names = gcc_parent_names_xo_gpll0_gpll0_early_div,
-		.num_parents = 3,
+		.parent_names = gcc_parent_names_xo_gpll0,
+		.num_parents = 2,
 		.ops = &clk_rcg2_ops,
 	},
 };
-- 
2.30.1

