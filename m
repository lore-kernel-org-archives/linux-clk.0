Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C00BC4338F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jul 2021 09:53:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 77F2C60F9C
	for <linux-clk@archiver.kernel.org>; Wed, 28 Jul 2021 09:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233734AbhG1Jx7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Jul 2021 05:53:59 -0400
Received: from gloria.sntech.de ([185.11.138.130]:48604 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232014AbhG1Jx7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Jul 2021 05:53:59 -0400
Received: from [95.90.166.74] (helo=diego.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1m8gGB-0004qG-7D; Wed, 28 Jul 2021 11:53:55 +0200
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Yunhao Tian <t123yh@outlook.com>, Stephen Boyd <sboyd@kernel.org>
Cc:     t123yh.xyz@gmail.com, Yunhao Tian <t123yh@outlook.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: rk3308: make ddrphy4x clock critical
Date:   Wed, 28 Jul 2021 11:53:54 +0200
Message-ID: <2634451.ElGaqSPkdT@diego>
In-Reply-To: <162734809017.2368309.7901135942001140161@swboyd.mtv.corp.google.com>
References: <BYAPR20MB24886765F888A9705CBEB70789E39@BYAPR20MB2488.namprd20.prod.outlook.com> <162734809017.2368309.7901135942001140161@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Am Dienstag, 27. Juli 2021, 03:08:10 CEST schrieb Stephen Boyd:
> Quoting Yunhao Tian (2021-07-21 05:48:16)
> > Currently, no driver support for DDR memory controller (DMC) is present,
> > as a result, no driver is explicitly consuming the ddrphy clock. This means
> > that VPLL1 (parent of ddr clock) will be shutdown if we enable
> > and then disable any child clock of VPLL1 (e.g. SCLK_I2S0_8CH_TX).
> > If VPLL1 is disabled, the whole system will freeze, because the DDR
> > controller will lose its clock. So, it's necessary to prevent VPLL1 from
> > shutting down, by marking the ddrphy4x CLK_IS_CRITICAL.
> > 
> > This bug was discovered when I was porting rockchip_i2s_tdm driver to
> > mainline kernel from Rockchip 4.4 kernel. I guess that other Rockchip
> > SoCs without DMC driver may need the same patch. If this applies to
> > other devices, please let us know.
> > 
> > Signed-off-by: Yunhao Tian <t123yh@outlook.com>
> > ---
> >  drivers/clk/rockchip/clk-rk3308.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/rockchip/clk-rk3308.c b/drivers/clk/rockchip/clk-rk3308.c
> > index 2c3bd0c749f2..6be077166330 100644
> > --- a/drivers/clk/rockchip/clk-rk3308.c
> > +++ b/drivers/clk/rockchip/clk-rk3308.c
> > @@ -564,7 +564,7 @@ static struct rockchip_clk_branch rk3308_clk_branches[] __initdata = {
> >         COMPOSITE(SCLK_DDRCLK, "clk_ddrphy4x_src", mux_dpll_vpll0_vpll1_p, CLK_IGNORE_UNUSED,
> >                         RK3308_CLKSEL_CON(1), 6, 2, MFLAGS, 0, 3, DFLAGS,
> >                         RK3308_CLKGATE_CON(0), 10, GFLAGS),
> > -       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUSED,
> > +       GATE(0, "clk_ddrphy4x", "clk_ddrphy4x_src", CLK_IGNORE_UNUSED | CLK_IS_CRITICAL,
> 
> Is it not enabled by default?

All gates are enabled by default, but this gate shares a common parent
tree down to a pll, so if another leaf-user is disabling their part, this
untracked clock would get disabled as well.

On that note, I remember a sort of CLK_HANDOFF was planned way back
in the past, meaning clock is critical until a driver picks it up, after this the
driver is responsible for it. Did that get any momentum?

Heiko




