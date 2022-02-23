Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DC34C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 23 Feb 2022 11:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237743AbiBWLrQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Feb 2022 06:47:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236781AbiBWLrQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Feb 2022 06:47:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B4621130
        for <linux-clk@vger.kernel.org>; Wed, 23 Feb 2022 03:46:46 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nMq6W-0003Xj-Va; Wed, 23 Feb 2022 12:46:44 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nMq6V-0000UM-FI; Wed, 23 Feb 2022 12:46:43 +0100
Date:   Wed, 23 Feb 2022 12:46:43 +0100
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Adrian Alonso <adrian.alonso@nxp.com>,
        Mads Bligaard Nielsen <bli@bang-olufsen.dk>
Subject: Re: [PATCH 2/8] clk: imx: pll14xx: Fix masking
Message-ID: <20220223114643.GP9136@pengutronix.de>
References: <20220223075601.3652543-1-s.hauer@pengutronix.de>
 <20220223075601.3652543-3-s.hauer@pengutronix.de>
 <YhYa/TWsd9C4ebtX@abelvesa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YhYa/TWsd9C4ebtX@abelvesa>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:45:11 up 74 days, 20:30, 91 users,  load average: 0.11, 0.16,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 23, 2022 at 01:31:09PM +0200, Abel Vesa wrote:
> On 22-02-23 08:55:55, Sascha Hauer wrote:
> > The code tries to mask the bits in SDIV_MASK from 'tmp'. SDIV_MASK
> > already contains the shifted value, so shifting it again is wrong.
> > 
> > Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> 
> Do we need some fixes tag, maybe?

Not really. I just realized that SDIV_SHIFT is 0, so this is really only
a cosmetic change.

Sascha

> 
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>
> 
> > ---
> >  drivers/clk/imx/clk-pll14xx.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> > index cae64d750672e..b295d8a049009 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
> > @@ -195,7 +195,7 @@ static int clk_pll1416x_set_rate(struct clk_hw *hw, unsigned long drate,
> >  	tmp = readl_relaxed(pll->base + DIV_CTL0);
> >  
> >  	if (!clk_pll14xx_mp_change(rate, tmp)) {
> > -		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
> > +		tmp &= ~SDIV_MASK;
> >  		tmp |= rate->sdiv << SDIV_SHIFT;
> >  		writel_relaxed(tmp, pll->base + DIV_CTL0);
> >  
> > @@ -261,7 +261,7 @@ static int clk_pll1443x_set_rate(struct clk_hw *hw, unsigned long drate,
> >  	tmp = readl_relaxed(pll->base + DIV_CTL0);
> >  
> >  	if (!clk_pll14xx_mp_change(rate, tmp)) {
> > -		tmp &= ~(SDIV_MASK) << SDIV_SHIFT;
> > +		tmp &= ~SDIV_MASK;
> >  		tmp |= rate->sdiv << SDIV_SHIFT;
> >  		writel_relaxed(tmp, pll->base + DIV_CTL0);
> >  
> > -- 
> > 2.30.2
> >
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
