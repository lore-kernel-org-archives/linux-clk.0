Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71982C4360F
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 17:25:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4E73C206DF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 17:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729759AbfCLRZx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 13:25:53 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:58529 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729876AbfCLRZw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Mar 2019 13:25:52 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1h3l9v-0006sc-UQ; Tue, 12 Mar 2019 18:25:47 +0100
Date:   Tue, 12 Mar 2019 18:25:46 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Subject: Re: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Message-ID: <20190312182546.24e46c5c@litschi.hi.pengutronix.de>
In-Reply-To: <155240936160.20095.7716704029189456788@swboyd.mtv.corp.google.com>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
        <20190312110016.29174-2-m.tretter@pengutronix.de>
        <155240936160.20095.7716704029189456788@swboyd.mtv.corp.google.com>
Organization: Pengutronix
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:feaa:14ff:fe6a:8db5
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 12 Mar 2019 09:49:21 -0700, Stephen Boyd wrote:
> Quoting Michael Tretter (2019-03-12 04:00:12)
> > CLK_FRAC is not set in the divider->flags, but in the hw->flags.
> > 
> > The firmware sets CLK_FRAC for fractional clocks in the clkflag field.
> > When registering the devider, these clkflags are copied to hw->flags.
> > 
> > Moreover, divider->flags field is a u8 type, but CLK_FRAG is BIT(13). So
> > this check would never work.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/clk/zynqmp/divider.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
> > index a371c66e72ef..fc70950c1e24 100644
> > --- a/drivers/clk/zynqmp/divider.c
> > +++ b/drivers/clk/zynqmp/divider.c
> > @@ -117,7 +117,7 @@ static long zynqmp_clk_divider_round_rate(struct clk_hw *hw,
> >         bestdiv = zynqmp_divider_get_val(*prate, rate);
> >  
> >         if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
> > -           (divider->flags & CLK_FRAC))
> > +           (clk_hw_get_flags(hw) & CLK_FRAC))  
> 
> CLK_FRAC shouldn't be set in the struct clk_hw::core::flags field. It's
> not a clk framework flag so it shouldn't go there. Please fix the user
> of this flag to place the CLK_FRAC flag somewhere else. Even adding it
> into divider::flags is not a good idea because that numberspace is for
> dividers, and this flag seems to be zynqmp driver specific, so maybe
> just add a bool to the zynqmp_clk_divider?
> 

Thanks. The driver sets the clk_hw::core::flags based on a response
from the ATF and this response includes this flag with other clk
frameworks flags. I can test for the flag when registering the clock
and set another flag or a bool for the zynqmp_clk_divider and will do
so in v2.

However, this merely sounds like a workaround for an issue in the ATF,
which should not define and use this flag in the first place. 

Michael
