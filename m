Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C26FC4360C
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 02:22:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15E3164FA6
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 02:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhCMCVa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 21:21:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbhCMCUy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 21:20:54 -0500
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it [IPv6:2001:4b7a:2000:18::164])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B506C061761
        for <linux-clk@vger.kernel.org>; Fri, 12 Mar 2021 18:20:54 -0800 (PST)
Received: from localhost.localdomain (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 1261D1F88F;
        Sat, 13 Mar 2021 03:20:52 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] clk: qcom: gcc-msm8994: Remove the inexistent GDSC_PCIE
Date:   Sat, 13 Mar 2021 03:19:15 +0100
Message-Id: <20210313021919.435332-6-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This GDSC is not present on msm8994.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 962107b5f1af..e1e40982ebee 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -2493,14 +2493,6 @@ static struct clk_branch gcc_prng_ahb_clk = {
 	},
 };
 
-static struct gdsc pcie_gdsc = {
-		.gdscr = 0x1e18,
-		.pd = {
-			.name = "pcie",
-		},
-		.pwrsts = PWRSTS_OFF_ON,
-};
-
 static struct gdsc pcie_0_gdsc = {
 		.gdscr = 0x1ac4,
 		.pd = {
@@ -2690,7 +2682,8 @@ static struct clk_regmap *gcc_msm8994_clocks[] = {
 };
 
 static struct gdsc *gcc_msm8994_gdscs[] = {
-	[PCIE_GDSC] = &pcie_gdsc,
+	/* This GDSC does not exist, but ABI has to remain intact */
+	[PCIE_GDSC] = 0,
 	[PCIE_0_GDSC] = &pcie_0_gdsc,
 	[PCIE_1_GDSC] = &pcie_1_gdsc,
 	[USB30_GDSC] = &usb30_gdsc,
-- 
2.30.2

