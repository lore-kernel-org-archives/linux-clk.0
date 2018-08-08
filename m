Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([85.220.165.71]:55477 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727174AbeHHL22 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Aug 2018 07:28:28 -0400
Date: Wed, 8 Aug 2018 11:09:36 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
        <u.kleine-koenig@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Fabio Estevam <festevam@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Krummsdorf Michael <Michael.Krummsdorf@tq-group.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: mxs: ensure that i.MX28's ref_io clks are not
 operated too fast
Message-ID: <20180808090936.mx6c23qkwo2xtd3a@pengutronix.de>
References: <20170503185625.10297-1-u.kleine-koenig@pengutronix.de>
 <20180726143232.ds22exgxiv6zlsn5@pengutronix.de>
 <10f5e651-caf4-3fe0-87c0-fe42ccdc6349@i2se.com>
 <CAOMZO5Cgf6aeNKWn5CnV8X-+bo20M00efoAxv51GPDE45Pg4yg@mail.gmail.com>
 <20180801093113.wnjeg5a3rjbh7yc4@pengutronix.de>
 <758892002.155298.1533716617448@email.1und1.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <758892002.155298.1533716617448@email.1und1.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Aug 08, 2018 at 10:23:37AM +0200, Stefan Wahren wrote:
> Hi,
> 
> > > On Thu, Jul 26, 2018 at 11:50 AM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> > > 
> > > > I only want to note that we are using this ugly hack for Duckbill to avoid
> > > > this issue:
> > > >
> > > > https://github.com/I2SE/linux/commit/e457d5e0309c07e30e8dd8b17c32f7b3cbdd9547
> > > 
> > > Do you see the problem on TQMa28L with Stefan's hack applied?
> > 
> > With this change by Stefan the bug is not reproducible. Your change to
> > set the bypass bits only later doesn't help though.
> 
> i can confirm that Fabio's patch doesn't fix the clock issue on
> Duckbill. But the idea seems to be right. If i remove all write access
> to CLKSEQ and FRAC0 in clk_misc_init() instead of swap them, i don't
> need the ref_xtal hack anymore. I think Fabio's patch doesn't work
> because the bootloader (U-Boot in my case) is already feeding SSP from
> ref_io.

I spend some time with this problem again and found out that it also
depends on hclk. If that runs quicker than 2x sspX I couldn't reproduce
the issue. When slowing down hclk to 1x sspX the issue reappeared with
all stuff related to sspX keeping the same.

Probably a problem when the value crosses the clock domain from sspX to
hclk?!

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
