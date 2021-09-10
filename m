Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 529D9C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 10 Sep 2021 00:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 404E761186
	for <linux-clk@archiver.kernel.org>; Fri, 10 Sep 2021 00:45:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242330AbhIJAqv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Sep 2021 20:46:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:48500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234129AbhIJAWz (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 Sep 2021 20:22:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3AF0360F6C;
        Fri, 10 Sep 2021 00:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631233305;
        bh=zUwheBrgiTwOErnoc8EJwk/XxzAdHk58Wtva3bRQ2a4=;
        h=From:To:Cc:Subject:Date:From;
        b=FGJHptyUWzMnG9ay86gtvN+e9VSyEx91bbAalKDKgNF+vWfJAmHsWyQelp0M5lKMf
         DNxx2fNTvX3bR73QBM7WspR3IaoR5n6lhe2qXf6dUTKziHYsWQvLJpbK9tWX3xiOZW
         EfmcQVuGGM+A7rpo+IU937lhSHHa4muTnM1wNJ41od9i4I6jR9qYaM4FaH5HfKB0ao
         FnfIlUH1YqixZY0yGjaHWjjczlq+QP0YeG0kZHTECRUUCtFVjm9nzOOWTAZ0GUYD5U
         e+wjBdWfR6GHn+pobtQAHOnDSIUP2bB8Ody5PApuaWS7pTvOzFXlJJnn5CCdjydFGn
         xE5v/Hdm9ETyg==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Jon Lin <jon.lin@rock-chips.com>,
        Elaine Zhang <zhangqing@rock-chips.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Sasha Levin <sashal@kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 01/37] clk: rockchip: rk3036: fix up the sclk_sfc parent error
Date:   Thu,  9 Sep 2021 20:21:06 -0400
Message-Id: <20210910002143.175731-1-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jon Lin <jon.lin@rock-chips.com>

[ Upstream commit 0be3df186f870cbde56b223c1ad7892109c9c440 ]

Choose the correct pll

Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Link: https://lore.kernel.org/r/20210713094456.23288-5-jon.lin@rock-chips.com
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/rockchip/clk-rk3036.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3036.c b/drivers/clk/rockchip/clk-rk3036.c
index 6a46f85ad837..1814be5ef574 100644
--- a/drivers/clk/rockchip/clk-rk3036.c
+++ b/drivers/clk/rockchip/clk-rk3036.c
@@ -120,6 +120,7 @@ PNAME(mux_pll_src_3plls_p)	= { "apll", "dpll", "gpll" };
 PNAME(mux_timer_p)		= { "xin24m", "pclk_peri_src" };
 
 PNAME(mux_pll_src_apll_dpll_gpll_usb480m_p)	= { "apll", "dpll", "gpll", "usb480m" };
+PNAME(mux_pll_src_dmyapll_dpll_gpll_xin24_p)   = { "dummy_apll", "dpll", "gpll", "xin24m" };
 
 PNAME(mux_mmc_src_p)	= { "apll", "dpll", "gpll", "xin24m" };
 PNAME(mux_i2s_pre_p)	= { "i2s_src", "i2s_frac", "ext_i2s", "xin12m" };
@@ -339,7 +340,7 @@ static struct rockchip_clk_branch rk3036_clk_branches[] __initdata = {
 			RK2928_CLKSEL_CON(16), 8, 2, MFLAGS, 10, 5, DFLAGS,
 			RK2928_CLKGATE_CON(10), 4, GFLAGS),
 
-	COMPOSITE(SCLK_SFC, "sclk_sfc", mux_pll_src_apll_dpll_gpll_usb480m_p, 0,
+	COMPOSITE(SCLK_SFC, "sclk_sfc", mux_pll_src_dmyapll_dpll_gpll_xin24_p, 0,
 			RK2928_CLKSEL_CON(16), 0, 2, MFLAGS, 2, 5, DFLAGS,
 			RK2928_CLKGATE_CON(10), 5, GFLAGS),
 
-- 
2.30.2

