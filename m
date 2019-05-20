Return-Path: <SRS0=g6IF=TU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A40C04AAF
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 08:06:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 883BA20856
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 08:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558339605;
	bh=Vd08FCiJI+QbVnWzLa/OEl9cbJxIK9Y8UolCugmpFJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=H2UfT/zMdpB1lAWKDX5ed7STGyc74UDTRox6f1etwEeR7b+9ylXl3VnqfzydJRMjK
	 +HW6C8viJilXYDCmH7FrT75Sj0fG99FAnh+klL0jxefhX4IR2gfe0XvfmLWLluBBGX
	 /knKIloJdqimrikF2xNed5fYWvoKt8G150u8oO44=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726186AbfETIGl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 May 2019 04:06:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:36614 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730867AbfETIFi (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 04:05:38 -0400
Received: from wens.tw (mirror2.csie.ntu.edu.tw [140.112.30.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C501216B7;
        Mon, 20 May 2019 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558339537;
        bh=Vd08FCiJI+QbVnWzLa/OEl9cbJxIK9Y8UolCugmpFJ8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m13RRTzmr3b/Z/1KbobT1RqzRVG5hXxXS24FL4i60Hv/VTB6Z3SSRHIfEaUOaMZU6
         5uMlV5kF7zWGTIb7SJf/+6lOfbeBKnz2IkpFURbPFQG41ATaVdAiZThz13u5Tjjho4
         XfAlbnuY3Z/sAFoZVkMCGkoMVctgaNbr0ibpp5lU=
Received: by wens.tw (Postfix, from userid 1000)
        id 8940B64A9B; Mon, 20 May 2019 16:05:32 +0800 (CST)
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/25] clk: sunxi-ng: a10: Use local parent references for CLK_FIXED_FACTOR
Date:   Mon, 20 May 2019 16:04:06 +0800
Message-Id: <20190520080421.12575-11-wens@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190520080421.12575-1-wens@kernel.org>
References: <20190520080421.12575-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Chen-Yu Tsai <wens@csie.org>

With the new clk parenting code and CLK_FIXED_FACTOR_{HW,FW_NAME}
macros, we can reference parents locally via pointers to struct clk_hw
or DT clock-names.

Convert existing CLK_FIXED_FACTOR definitions to either the _HW or
_FW_NAME variant based on whether the parent clock is internal or
external to the CCU.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 drivers/clk/sunxi-ng/ccu-sun4i-a10.c | 39 ++++++++++++++++++----------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
index 2bbfb3343311..59def849db08 100644
--- a/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
+++ b/drivers/clk/sunxi-ng/ccu-sun4i-a10.c
@@ -168,8 +168,9 @@ static struct ccu_nk pll_periph_base_clk = {
 	},
 };
 
-static CLK_FIXED_FACTOR(pll_periph_clk, "pll-periph", "pll-periph-base",
-			2, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HW(pll_periph_clk, "pll-periph",
+			   &pll_periph_base_clk.common.hw,
+			   2, 1, CLK_SET_RATE_PARENT);
 
 /* Not documented on A10 */
 static struct ccu_div pll_periph_sata_clk = {
@@ -1036,19 +1037,29 @@ static struct ccu_common *sun4i_sun7i_ccu_clks[] = {
 	&out_b_clk.common
 };
 
+static const struct clk_hw *clk_parent_pll_audio[] = {
+	&pll_audio_base_clk.common.hw
+};
+
 /* Post-divider for pll-audio is hardcoded to 1 */
-static CLK_FIXED_FACTOR(pll_audio_clk, "pll-audio",
-			"pll-audio-base", 1, 1, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_audio_2x_clk, "pll-audio-2x",
-			"pll-audio-base", 2, 1, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_audio_4x_clk, "pll-audio-4x",
-			"pll-audio-base", 1, 1, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_audio_8x_clk, "pll-audio-8x",
-			"pll-audio-base", 1, 2, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_video0_2x_clk, "pll-video0-2x",
-			"pll-video0", 1, 2, CLK_SET_RATE_PARENT);
-static CLK_FIXED_FACTOR(pll_video1_2x_clk, "pll-video1-2x",
-			"pll-video1", 1, 2, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_audio_clk, "pll-audio",
+			    clk_parent_pll_audio,
+			    1, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
+			    clk_parent_pll_audio,
+			    2, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
+			    clk_parent_pll_audio,
+			    1, 1, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HWS(pll_audio_8x_clk, "pll-audio-8x",
+			    clk_parent_pll_audio,
+			    1, 2, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HW(pll_video0_2x_clk, "pll-video0-2x",
+			   &pll_video0_clk.common.hw,
+			   1, 2, CLK_SET_RATE_PARENT);
+static CLK_FIXED_FACTOR_HW(pll_video1_2x_clk, "pll-video1-2x",
+			   &pll_video1_clk.common.hw,
+			   1, 2, CLK_SET_RATE_PARENT);
 
 
 static struct clk_hw_onecell_data sun4i_a10_hw_clks = {
-- 
2.20.1

