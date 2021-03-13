Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EEB9C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 02:22:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D91E164FB9
	for <linux-clk@archiver.kernel.org>; Sat, 13 Mar 2021 02:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbhCMCV2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Mar 2021 21:21:28 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:38447 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232487AbhCMCUu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Mar 2021 21:20:50 -0500
Received: from localhost.localdomain (abac242.neoplus.adsl.tpnet.pl [83.6.166.242])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 2502E1FA69;
        Sat, 13 Mar 2021 03:20:48 +0100 (CET)
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
Subject: [PATCH 3/9] clk: qcom: gcc-msm8994: Fix up SPI QUP clocks
Date:   Sat, 13 Mar 2021 03:19:12 +0100
Message-Id: <20210313021919.435332-3-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210313021919.435332-1-konrad.dybcio@somainline.org>
References: <20210313021919.435332-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fix up SPI QUP freq tables to account for the fact
that not every QUP can run at the same set of frequencies.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 118 +++++++++++++++++++++++++++++----
 1 file changed, 105 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 69241651b171..0ebc827f0f05 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -171,7 +171,7 @@ static struct clk_rcg2 blsp1_qup1_i2c_apps_clk_src = {
 	},
 };
 
-static struct freq_tbl ftbl_blspqup_spi_apps_clk_src[] = {
+static struct freq_tbl ftbl_blsp1_qup1_spi_apps_clk_src[] = {
 	F(960000, P_XO, 10, 1, 2),
 	F(4800000, P_XO, 4, 0, 0),
 	F(9600000, P_XO, 2, 0, 0),
@@ -189,7 +189,7 @@ static struct clk_rcg2 blsp1_qup1_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup1_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -211,12 +211,25 @@ static struct clk_rcg2 blsp1_qup2_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup2_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(46150000, P_GPLL0, 13, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup2_spi_apps_clk_src = {
 	.cmd_rcgr = 0x06cc,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup2_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup2_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -238,12 +251,25 @@ static struct clk_rcg2 blsp1_qup3_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup3_4_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(44440000, P_GPLL0, 13.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup3_spi_apps_clk_src = {
 	.cmd_rcgr = 0x074c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup3_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -270,7 +296,7 @@ static struct clk_rcg2 blsp1_qup4_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup4_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -292,12 +318,25 @@ static struct clk_rcg2 blsp1_qup5_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup5_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(40000000, P_GPLL0, 15, 0, 0),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup5_spi_apps_clk_src = {
 	.cmd_rcgr = 0x084c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup5_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup5_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -319,12 +358,25 @@ static struct clk_rcg2 blsp1_qup6_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp1_qup6_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(27906976, P_GPLL0, 1, 2, 43),
+	F(41380000, P_GPLL0, 15, 0, 0),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp1_qup6_spi_apps_clk_src = {
 	.cmd_rcgr = 0x08cc,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp1_qup6_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp1_qup6_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -449,12 +501,25 @@ static struct clk_rcg2 blsp2_qup1_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp2_qup1_2_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(44440000, P_GPLL0, 13.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp2_qup1_spi_apps_clk_src = {
 	.cmd_rcgr = 0x098c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup1_2_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup1_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -481,7 +546,7 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup1_2_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup2_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -490,6 +555,19 @@ static struct clk_rcg2 blsp2_qup2_spi_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp2_qup3_4_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(42860000, P_GPLL0, 14, 0, 0),
+	F(48000000, P_GPLL0, 12.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp2_qup3_i2c_apps_clk_src = {
 	.cmd_rcgr = 0x0aa0,
 	.hid_width = 5,
@@ -508,7 +586,7 @@ static struct clk_rcg2 blsp2_qup3_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup3_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -535,7 +613,7 @@ static struct clk_rcg2 blsp2_qup4_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup3_4_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup4_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -562,7 +640,8 @@ static struct clk_rcg2 blsp2_qup5_spi_apps_clk_src = {
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	/* BLSP1 QUP1 and BLSP2 QUP5 use the same freqs */
+	.freq_tbl = ftbl_blsp1_qup1_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup5_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
@@ -584,12 +663,25 @@ static struct clk_rcg2 blsp2_qup6_i2c_apps_clk_src = {
 	},
 };
 
+static struct freq_tbl ftbl_blsp2_qup6_spi_apps_clk_src[] = {
+	F(960000, P_XO, 10, 1, 2),
+	F(4800000, P_XO, 4, 0, 0),
+	F(9600000, P_XO, 2, 0, 0),
+	F(15000000, P_GPLL0, 10, 1, 4),
+	F(19200000, P_XO, 1, 0, 0),
+	F(24000000, P_GPLL0, 12.5, 1, 2),
+	F(25000000, P_GPLL0, 12, 1, 2),
+	F(44440000, P_GPLL0, 13.5, 0, 0),
+	F(48000000, P_GPLL0, 12.5, 0, 0),
+	{ }
+};
+
 static struct clk_rcg2 blsp2_qup6_spi_apps_clk_src = {
 	.cmd_rcgr = 0x0c0c,
 	.mnd_width = 8,
 	.hid_width = 5,
 	.parent_map = gcc_xo_gpll0_map,
-	.freq_tbl = ftbl_blspqup_spi_apps_clk_src,
+	.freq_tbl = ftbl_blsp2_qup6_spi_apps_clk_src,
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "blsp2_qup6_spi_apps_clk_src",
 		.parent_data = gcc_xo_gpll0,
-- 
2.30.2

