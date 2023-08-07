Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A64AEB64DD
	for <linux-clk@archiver.kernel.org>; Mon,  7 Aug 2023 07:45:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjHGHpp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Aug 2023 03:45:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229491AbjHGHpn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Aug 2023 03:45:43 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EE14B5
        for <linux-clk@vger.kernel.org>; Mon,  7 Aug 2023 00:45:42 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qSuvq-0003cW-Vr; Mon, 07 Aug 2023 09:45:38 +0200
Received: from mfe by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1qSuvp-0007f1-Tg; Mon, 07 Aug 2023 09:45:37 +0200
Date:   Mon, 7 Aug 2023 09:45:37 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     Adam Ford <aford173@gmail.com>
Cc:     adrian.alonso@nxp.com, rasmus.villemoes@prevas.dk,
        bli@bang-olufsen.dk, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, abelvesa@kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: align pdiv with reference manual
Message-ID: <20230807074537.dwlbiri3cc3knm3e@pengutronix.de>
References: <CAHCN7x+fs7k0y8Sps+0N7NUPVto8UhZD9E8DbVEuDRPv6bdDMg@mail.gmail.com>
 <20230714134938.2124861-1-m.felsch@pengutronix.de>
 <CAHCN7xKmGxtvE83nhZGVtqFaQNT+G4JGPOoiBSzqDVu1kBK5Rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xKmGxtvE83nhZGVtqFaQNT+G4JGPOoiBSzqDVu1kBK5Rg@mail.gmail.com>
User-Agent: NeoMutt/20180716
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-08-06, Adam Ford wrote:
> On Fri, Jul 14, 2023 at 8:49 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > The PLL14xx hardware can be found on i.MX8M{M,N,P} SoCs and always come
> > with a 6-bit pre-divider. Neither the reference manuals nor the
> > datasheets of these SoCs do mention any restrictions. Furthermore the
> > current code doesn't respect the restrictions from the comment too.
> >
> > Therefore drop the restriction and align the max pre-divider (pdiv)
> > value to 63 to get more accurate frequencies.
> >
> 
> Should this get a fixes tag since it appears to fix a bug?

Good question, I don't see it as a bug instead it has limited support.
Ahmad, prepared a bugfix since he found out that a value comming from
the pre defined pll-table is not valid. His bugfix need this patch to be
able to calc the correct value, so I think add a fixes tag would be
okay to get his bugfix backported as well.

> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> > Hi Adam,
> >
> > here is the patch I made for setting the exact video-pll settings.
> >
> > Regards,
> >   Marco
> >
> >
> >  drivers/clk/imx/clk-pll14xx.c | 11 +++++------
> >  1 file changed, 5 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> > index 7150c59bbfc95..dc6bc21dff41f 100644
> > --- a/drivers/clk/imx/clk-pll14xx.c
> > +++ b/drivers/clk/imx/clk-pll14xx.c
> > @@ -139,11 +139,10 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
> >         /*
> >          * Fractional PLL constrains:
> >          *
> > -        * a) 6MHz <= prate <= 25MHz
> > -        * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
> > -        * c) 64 <= m <= 1023
> > -        * d) 0 <= s <= 6
> > -        * e) -32768 <= k <= 32767
> > +        * a) 1 <= p <= 63
> > +        * b) 64 <= m <= 1023
> > +        * c) 0 <= s <= 6
> > +        * d) -32768 <= k <= 32767
> >          *
> >          * fvco = (m * 65536 + k) * prate / (p * 65536)
> >          */
> > @@ -186,7 +185,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
> >         }
> >
> >         /* Finally calculate best values */
> > -       for (pdiv = 1; pdiv <= 7; pdiv++) {
> > +       for (pdiv = 1; pdiv <= 63; pdiv++) {
> >                 for (sdiv = 0; sdiv <= 6; sdiv++) {
> >                         /* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
> >                         mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
> > --
> > 2.39.2
> >
> 
