Return-Path: <SRS0=gal5=RW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BC6FC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:19:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEDB520828
	for <linux-clk@archiver.kernel.org>; Tue, 19 Mar 2019 10:19:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfCSKTM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Mar 2019 06:19:12 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:35185 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726573AbfCSKTM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Mar 2019 06:19:12 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1h6Bps-0005UV-El; Tue, 19 Mar 2019 11:19:08 +0100
Date:   Tue, 19 Mar 2019 11:19:07 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Jolly Shah <JOLLYS@xilinx.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michals@xilinx.com>
Subject: Re: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
Message-ID: <20190319111907.753f7820@litschi.hi.pengutronix.de>
In-Reply-To: <BYAPR02MB59921A729FAD12C5B4143D09B8400@BYAPR02MB5992.namprd02.prod.outlook.com>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
        <20190312110016.29174-2-m.tretter@pengutronix.de>
        <155240936160.20095.7716704029189456788@swboyd.mtv.corp.google.com>
        <20190312182546.24e46c5c@litschi.hi.pengutronix.de>
        <155249424471.20095.16028115604342624987@swboyd.mtv.corp.google.com>
        <20190314093836.6a70abc7@litschi.hi.pengutronix.de>
        <BYAPR02MB59921A729FAD12C5B4143D09B8400@BYAPR02MB5992.namprd02.prod.outlook.com>
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

On Tue, 19 Mar 2019 00:56:31 +0000, Jolly Shah wrote:
> > -----Original Message-----
> > From: Michael Tretter <m.tretter@pengutronix.de>
> > Sent: Thursday, March 14, 2019 1:39 AM
> > To: Stephen Boyd <sboyd@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org;
> > kernel@pengutronix.de; Michael Turquette <mturquette@baylibre.com>;
> > Michal Simek <michals@xilinx.com>; Jolly Shah <JOLLYS@xilinx.com>
> > Subject: Re: [PATCH 1/5] clk: zynqmp: fix check for fractional clock
> > 
> > On Wed, 13 Mar 2019 09:24:04 -0700, Stephen Boyd wrote:  
> > > Quoting Michael Tretter (2019-03-12 10:25:46)  
> > > > On Tue, 12 Mar 2019 09:49:21 -0700, Stephen Boyd wrote:  
> > > > > Quoting Michael Tretter (2019-03-12 04:00:12)  
> > > > > > CLK_FRAC is not set in the divider->flags, but in the hw->flags.
> > > > > >
> > > > > > The firmware sets CLK_FRAC for fractional clocks in the clkflag field.
> > > > > > When registering the devider, these clkflags are copied to hw->flags.
> > > > > >
> > > > > > Moreover, divider->flags field is a u8 type, but CLK_FRAG is BIT(13). So
> > > > > > this check would never work.
> > > > > >
> > > > > > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > > > > > ---
> > > > > >  drivers/clk/zynqmp/divider.c | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
> > > > > > index a371c66e72ef..fc70950c1e24 100644
> > > > > > --- a/drivers/clk/zynqmp/divider.c
> > > > > > +++ b/drivers/clk/zynqmp/divider.c
> > > > > > @@ -117,7 +117,7 @@ static long  
> > zynqmp_clk_divider_round_rate(struct clk_hw *hw,  
> > > > > >         bestdiv = zynqmp_divider_get_val(*prate, rate);
> > > > > >
> > > > > >         if ((clk_hw_get_flags(hw) & CLK_SET_RATE_PARENT) &&
> > > > > > -           (divider->flags & CLK_FRAC))
> > > > > > +           (clk_hw_get_flags(hw) & CLK_FRAC))  
> > > > >
> > > > > CLK_FRAC shouldn't be set in the struct clk_hw::core::flags field. It's
> > > > > not a clk framework flag so it shouldn't go there. Please fix the user
> > > > > of this flag to place the CLK_FRAC flag somewhere else. Even adding it
> > > > > into divider::flags is not a good idea because that numberspace is for
> > > > > dividers, and this flag seems to be zynqmp driver specific, so maybe
> > > > > just add a bool to the zynqmp_clk_divider?
> > > > >  
> > > >
> > > > Thanks. The driver sets the clk_hw::core::flags based on a response
> > > > from the ATF and this response includes this flag with other clk
> > > > frameworks flags. I can test for the flag when registering the clock
> > > > and set another flag or a bool for the zynqmp_clk_divider and will do
> > > > so in v2.  
> > >
> > > Cool. Thanks!
> > >  
> > > >
> > > > However, this merely sounds like a workaround for an issue in the ATF,
> > > > which should not define and use this flag in the first place.
> > > >  
> > >
> > > What is ATF doing with these flags? Hopefully ATF and the Linux kernel
> > > aren't using the same numberspace to describe these things. For example,
> > > I would be concerned if ATF was looking at the CLK_SET_RATE_PARENT flag
> > > and passing that value from firmware to the kernel, blindly assuming
> > > that the kernel wouldn't change those numbers to be something else.
> > > Obviously that type of kernel change would be invasive but it's not an
> > > ABI that we've ever published so we're free to do these sorts of things.  
> > 
> > You mean that the ATF defines macros like
> > 
> > 	#define CLK_SET_RATE_GATE       BIT(0) /* must be gated across rate
> > change */
> > 	#define CLK_SET_PARENT_GATE     BIT(1) /* must be gated across re-
> > parent */
> > 	#define CLK_SET_RATE_PARENT     BIT(2) /* propagate rate change up
> > one level */
> > 
> > in plat/xilinx/zynqmp/pm_service/pm_api_clock.h, sets the flags in the
> > response to the Linux driver, and the Linux driver copies the flags
> > that it got from the ATF to clk_hw::core::flags like
> > 
> > 	init.flags = nodes->flag;
> > 
> > where nodes is the response from the ATF? That's exactly what is happening.
> > 
> > So instead of only translating CLK_FRAC, the driver should actually
> > translate all flags in the ATF response to proper clk framework flags
> > instead of blindly copying them, right?  
> 
> Except CLK_FRAC, all flags are defined same as clk framework. I think
> we should add custom flags field and pass zynqmp specific flags there.

Using the same flags in the ATF and the common clk framework works now,
because they have the same value. However, the flags are not actually
the same, because the flags that the driver gets from the ATF are
defined in the ATF and the flags that the driver passes to the common
clk framework are defined in the common clk framework. If the flags in
the common clk framework are changed (which is admittedly unlikely), the
ZynqMP clock driver will break, because it still assumes that the
common clk framework uses the same flags as defined in the ATF.

Therefore, the driver should actually decouple the flags by defining
its own flags that correspond to the flags as defined by the ATF (i.e.
platform specific flags) and convert these flags into flags for the
common clk framework when registering the clocks.

The problem is that two things that have the same value are not
necessarily the same thing.

Michael

> 
> Thanks,
> Jolly Shah
> 
> > 
> > Michael  
> 
