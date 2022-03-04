Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD88AC433F5
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 12:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230038AbiCDMo4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 07:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbiCDMo4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 07:44:56 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A60D157208
        for <linux-clk@vger.kernel.org>; Fri,  4 Mar 2022 04:44:08 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nQ7Hy-0001ko-SO; Fri, 04 Mar 2022 13:44:06 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1nQ7Hx-0000k8-T4; Fri, 04 Mar 2022 13:44:05 +0100
Date:   Fri, 4 Mar 2022 13:44:05 +0100
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
Subject: Re: [PATCH v2 8/8] clk: imx: pll14xx: Support dynamic rates
Message-ID: <20220304124405.GK22780@pengutronix.de>
References: <20220225082937.2746176-1-s.hauer@pengutronix.de>
 <20220225082937.2746176-9-s.hauer@pengutronix.de>
 <Yhjj8o3vEQy0qysO@abelvesa>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yhjj8o3vEQy0qysO@abelvesa>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:40:47 up 83 days, 19:26, 80 users,  load average: 0.13, 0.14,
 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Feb 25, 2022 at 04:13:06PM +0200, Abel Vesa wrote:
> On 22-02-25 09:29:37, Sascha Hauer wrote:
> > The pll1443x PLL so far only supports rates from a rate table passed
> > during initialization. Calculating PLL settings dynamically helps audio
> > applications to get their desired rates, so support for this is added
> > in this patch.
> > +	const struct imx_pll14xx_rate_table *tt;
> > +
> > +	/*
> > +	 * Fractional PLL constrains:
> > +	 *
> > +	 * a) 6MHz <= prate <= 25MHz
> > +	 * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
> > +	 * c) 64 <= m <= 1023
> > +	 * d) 0 <= s <= 6
> > +	 * e) -32768 <= k <= 32767
> > +	 *
> > +	 * fvco = (m * 65536 + k) * prate / (p * 65536)
> > +	 */
> > +
> > +	pll_div_ctl0 = readl_relaxed(pll->base + DIV_CTL0);
> > +	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
> > +	pdiv = FIELD_GET(PDIV_MASK, pll_div_ctl0);
> > +	sdiv = FIELD_GET(SDIV_MASK, pll_div_ctl0);
> > +	pll_div_ctl1 = readl_relaxed(pll->base + DIV_CTL1);
> > +
> > +	/* First see if we can get the desired rate by only adjusting kdiv (glitch free) */
> > +	rate_min = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MIN, prate);
> > +	rate_max = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, KDIV_MAX, prate);
> > +
> > +	if (rate >= rate_min && rate <= rate_max) {
> > +		kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
> > +		pr_debug("%s: in=%ld, want=%ld Only adjust kdiv %ld -> %d\n",
> > +			 clk_hw_get_name(&pll->hw), prate, rate,
> > +			 FIELD_GET(KDIV_MASK, pll_div_ctl1), kdiv);
> > +		fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
> > +		t->rate = (unsigned int)fvco;
> > +		t->mdiv = mdiv;
> > +		t->pdiv = pdiv;
> > +		t->sdiv = sdiv;
> > +		t->kdiv = kdiv;
> > +		return;
> > +	}
> > +
> > +	/* Then try if we can get the desired rate from one of the static entries */
> > +	tt = imx_get_pll_settings(pll, rate);
> 
> Shouldn't we try this one first? Maybe we don't need to compute kdiv at
> all.

Sorry, missed that part of your mail.

The intention was to try the glitchfree path first so that we switch
glitchfree when possible. For most cases the order doesn't make a
difference, I think we can change it if you like.

There's one case in which we end up with a glitch where we could do a
glitchfree switch: We come from some rate to a rate which is nearly but
not exactly the rate from one of the table entries. From there we then
switch to the exact rate from the table entry. The algorithm below will
find other values than the ones in the table entries, so the PLL
switches to the same output frequency with completely different values.

I don't know if anyone ever hits this and then if he has a problem with
the PLL being restartet, so yes, we can change the order.

Sascha

> 
> > +	if (tt) {
> > +		pr_debug("%s: in=%ld, want=%ld, Using PLL setting from table\n",
> > +			 clk_hw_get_name(&pll->hw), prate, rate);
> > +		t->rate = tt->rate;
> > +		t->mdiv = tt->mdiv;
> > +		t->pdiv = tt->pdiv;
> > +		t->sdiv = tt->sdiv;
> > +		t->kdiv = tt->kdiv;
> > +		return;
> > +	}
> > +
> > +	/* Finally calculate best values */
> > +	for (pdiv = 1; pdiv <= 7; pdiv++) {
> > +		for (sdiv = 0; sdiv <= 6; sdiv++) {
> > +			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
> > +			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
> > +			mdiv = clamp(mdiv, 64, 1023);
> > +
> > +			kdiv = pll1443x_calc_kdiv(mdiv, pdiv, sdiv, rate, prate);
> > +			fvco = pll14xx_calc_rate(pll, mdiv, pdiv, sdiv, kdiv, prate);
> > +
> > +			/* best match */
> > +			dist = abs((long)rate - (long)fvco);
> > +			if (dist < best) {
> > +				best = dist;
> > +				t->rate = (unsigned int)fvco;
> > +				t->mdiv = mdiv;
> > +				t->pdiv = pdiv;
> > +				t->sdiv = sdiv;
> > +				t->kdiv = kdiv;
> > +
> > +				if (!dist)
> > +					goto found;
> > +			}
> > +		}
> > +	}

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
