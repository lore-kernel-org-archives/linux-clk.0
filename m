Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18239C433E9
	for <linux-clk@archiver.kernel.org>; Sat, 20 Feb 2021 15:58:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E246764ED7
	for <linux-clk@archiver.kernel.org>; Sat, 20 Feb 2021 15:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhBTP6R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 20 Feb 2021 10:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbhBTP6O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 20 Feb 2021 10:58:14 -0500
Received: from relay04.th.seeweb.it (relay04.th.seeweb.it [IPv6:2001:4b7a:2000:18::165])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E23A3C061797
        for <linux-clk@vger.kernel.org>; Sat, 20 Feb 2021 07:56:39 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id DA5301F613;
        Sat, 20 Feb 2021 16:56:36 +0100 (CET)
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
Subject: [PATCH 4/6] clk: qcom: gcc-sdm660: Remove gds_hw_ctrl from GDSCs
Date:   Sat, 20 Feb 2021 16:56:15 +0100
Message-Id: <20210220155618.176559-4-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210220155618.176559-1-konrad.dybcio@somainline.org>
References: <20210220155618.176559-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

These GDSCs do not support HW control, so remove the property.

Fixes: f2a76a2955c0 ("clk: qcom: Add Global Clock controller (GCC) driver for SDM660")
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-sdm660.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm660.c b/drivers/clk/qcom/gcc-sdm660.c
index 05664d6b612a..bc8dfcd6d629 100644
--- a/drivers/clk/qcom/gcc-sdm660.c
+++ b/drivers/clk/qcom/gcc-sdm660.c
@@ -2362,7 +2362,6 @@ static struct clk_branch hlos2_vote_turing_adsp_smmu_clk = {
 
 static struct gdsc ufs_gdsc = {
 	.gdscr = 0x75004,
-	.gds_hw_ctrl = 0x0,
 	.pd = {
 		.name = "ufs_gdsc",
 	},
@@ -2372,7 +2371,6 @@ static struct gdsc ufs_gdsc = {
 
 static struct gdsc usb_30_gdsc = {
 	.gdscr = 0xf004,
-	.gds_hw_ctrl = 0x0,
 	.pd = {
 		.name = "usb_30_gdsc",
 	},
@@ -2382,7 +2380,6 @@ static struct gdsc usb_30_gdsc = {
 
 static struct gdsc pcie_0_gdsc = {
 	.gdscr = 0x6b004,
-	.gds_hw_ctrl = 0x0,
 	.pd = {
 		.name = "pcie_0_gdsc",
 	},
-- 
2.30.1

