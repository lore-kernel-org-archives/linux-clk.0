Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13B7C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 17 Feb 2022 11:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239813AbiBQLf1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Feb 2022 06:35:27 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239810AbiBQLf0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Feb 2022 06:35:26 -0500
Received: from mxd2.seznam.cz (mxd2.seznam.cz [IPv6:2a02:598:2::210])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BB9B2AA3A5
        for <linux-clk@vger.kernel.org>; Thu, 17 Feb 2022 03:35:12 -0800 (PST)
Received: from email.seznam.cz
        by email-smtpc26b.ng.seznam.cz (email-smtpc26b.ng.seznam.cz [10.23.18.37])
        id 43a409c818aa5da1420dc596;
        Thu, 17 Feb 2022 12:35:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seznam.cz; s=beta;
        t=1645097710; bh=s0Sl0vV8bxTas7cVGdxupTDuDRfDCRZkk+zmIdoJFCE=;
        h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:
         References:MIME-Version:Content-Transfer-Encoding:X-szn-frgn:
         X-szn-frgc;
        b=DrgfA+ARB219SasfJ1O0GRXc59I55umaQiBelMKySqYDTjTsj4ltnsAkHhiyiPR+W
         JJDM+sbSiOp2sYNtYkBfytJcYmBDFdyiuxOtMzBoI5UlkF+QqP5xmKB7Dyn75+6Lzk
         N8AI13zxEPSJ0EYaBYJezGIdE+uOyljWIYzZB3wI=
Received: from localhost.localdomain (ip-111-27.static.ccinternet.cz [147.161.27.111])
        by email-relay20.ng.seznam.cz (Seznam SMTPD 1.3.136) with ESMTP;
        Thu, 17 Feb 2022 12:32:31 +0100 (CET)  
From:   michael.srba@seznam.cz
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Saravana Kannan <saravanak@google.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Michael Srba <Michael.Srba@seznam.cz>
Subject: [PATCH v6 2/5] clk: qcom: gcc-msm8998: add SSC-related clocks
Date:   Thu, 17 Feb 2022 12:30:01 +0100
Message-Id: <20220217113004.22757-2-michael.srba@seznam.cz>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220217113004.22757-1-michael.srba@seznam.cz>
References: <20220217113004.22757-1-michael.srba@seznam.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-szn-frgn: <bc6f6abc-165a-45a4-8472-b4fe70474670>
X-szn-frgc: <0>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Michael Srba <Michael.Srba@seznam.cz>

This patch adds four clocks which need to be manipulated in order to
initialize the AHB bus which exposes the SCC block in the global address
space.

If a device is known to be configured such that writing to these
registers from Linux is not permitted, the 'protected-clocks'
device tree property must be used to denote that fact.

Signed-off-by: Michael Srba <Michael.Srba@seznam.cz>
---
 CHANGES:
 - v2: none
 - v3: none
 - v4: reword the commit message
 - v5: none
 - v6: none
---
 drivers/clk/qcom/gcc-msm8998.c | 56 ++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/clk/qcom/gcc-msm8998.c b/drivers/clk/qcom/gcc-msm8998.c
index 407e2c5caea4..2d14c3d672fc 100644
--- a/drivers/clk/qcom/gcc-msm8998.c
+++ b/drivers/clk/qcom/gcc-msm8998.c
@@ -2833,6 +2833,58 @@ static struct clk_branch gcc_rx1_usb2_clkref_clk = {
 	},
 };
 
+static struct clk_branch gcc_im_sleep_clk = {
+	.halt_reg = 0x4300C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4300C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gcc_im_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch aggre2_snoc_north_axi_clk = {
+	.halt_reg = 0x83010,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x83010,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "aggre2_snoc_north_axi_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ssc_xo_clk = {
+	.halt_reg = 0x63018,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x63018,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "ssc_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch ssc_cnoc_ahbs_clk = {
+	.halt_reg = 0x6300C,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6300C,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "ssc_cnoc_ahbs_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
 static struct gdsc pcie_0_gdsc = {
 	.gdscr = 0x6b004,
 	.gds_hw_ctrl = 0x0,
@@ -3036,6 +3088,10 @@ static struct clk_regmap *gcc_msm8998_clocks[] = {
 	[GCC_MSS_MNOC_BIMC_AXI_CLK] = &gcc_mss_mnoc_bimc_axi_clk.clkr,
 	[GCC_MMSS_GPLL0_CLK] = &gcc_mmss_gpll0_clk.clkr,
 	[HMSS_GPLL0_CLK_SRC] = &hmss_gpll0_clk_src.clkr,
+	[GCC_IM_SLEEP] = &gcc_im_sleep_clk.clkr,
+	[AGGRE2_SNOC_NORTH_AXI] = &aggre2_snoc_north_axi_clk.clkr,
+	[SSC_XO] = &ssc_xo_clk.clkr,
+	[SSC_CNOC_AHBS_CLK] = &ssc_cnoc_ahbs_clk.clkr,
 };
 
 static struct gdsc *gcc_msm8998_gdscs[] = {
-- 
2.34.1

