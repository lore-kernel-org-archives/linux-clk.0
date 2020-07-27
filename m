Return-Path: <SRS0=c6El=BG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09680C433E4
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jul 2020 20:03:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB0B320786
	for <linux-clk@archiver.kernel.org>; Mon, 27 Jul 2020 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595880211;
	bh=mXVi6dNmeTTHEGhLpBn9kwB25pFNfvrXx1UPzS1ISEs=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=ewpnPm7b4qBQaiPx8nHBMsEpd0wwxdlmfI80wna7M7HHLNlSRVTmPOzPTvr5Gms42
	 fHEkOQTKbpn8Mk07N94pcoXLMygNicT9EErO5F6eswrHH0h1+SUqns22YqXz4VbMfd
	 ja5Y30BAn9DOQh4GjpyC7QzudVF+hmxCkd44IRaM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgG0UDb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Jul 2020 16:03:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:45958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726451AbgG0UDa (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 27 Jul 2020 16:03:30 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 64C162072E;
        Mon, 27 Jul 2020 20:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595880210;
        bh=mXVi6dNmeTTHEGhLpBn9kwB25pFNfvrXx1UPzS1ISEs=;
        h=Date:From:To:Cc:Subject:From;
        b=u5zsRUdq8hH6l+EscwKa4buoH5QG+mDT1k8i/sGMnD7kku/kLDrEXtG6bY8kaKuK0
         5qtsMZ/zdjsmrPvu5ldzw5E4+62aa50oPpaun70v/58lftuGVWBgDuZRto8+1DCivB
         j+0xpCAIvPKLDfeWaCgdy+P+heTw9N9yYNtGc2L0=
Date:   Mon, 27 Jul 2020 15:09:22 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: [PATCH][next] clk: imx: Use fallthrough pseudo-keyword
Message-ID: <20200727200922.GA2326@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Replace the existing /* fall through */ comments and its variants with
the new pseudo-keyword macro fallthrough[1].

[1] https://www.kernel.org/doc/html/v5.7/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/clk/imx/clk-pllv3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
index a7db93030e02..b20cdea3e9cc 100644
--- a/drivers/clk/imx/clk-pllv3.c
+++ b/drivers/clk/imx/clk-pllv3.c
@@ -433,7 +433,7 @@ struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 		break;
 	case IMX_PLLV3_USB_VF610:
 		pll->div_shift = 1;
-		/* fall through */
+		fallthrough;
 	case IMX_PLLV3_USB:
 		ops = &clk_pllv3_ops;
 		pll->powerup_set = true;
@@ -441,7 +441,7 @@ struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
 	case IMX_PLLV3_AV_IMX7:
 		pll->num_offset = PLL_IMX7_NUM_OFFSET;
 		pll->denom_offset = PLL_IMX7_DENOM_OFFSET;
-		/* fall through */
+		fallthrough;
 	case IMX_PLLV3_AV:
 		ops = &clk_pllv3_av_ops;
 		break;
-- 
2.27.0

