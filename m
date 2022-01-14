Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BC3FC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 14 Jan 2022 08:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235349AbiANIOv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Jan 2022 03:14:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbiANIOu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Jan 2022 03:14:50 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83966C061574
        for <linux-clk@vger.kernel.org>; Fri, 14 Jan 2022 00:14:50 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1n8HjQ-0005ZW-8n; Fri, 14 Jan 2022 09:14:44 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1n8HjO-0005iZ-Ir; Fri, 14 Jan 2022 09:14:42 +0100
Date:   Fri, 14 Jan 2022 09:14:42 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, michal.simek@xilinx.com,
        rajan.vaja@xilinx.com, kernel@pengutronix.de
Subject: Re: [PATCH] clk: zynqmp: warn always when a clock op fails
Message-ID: <20220114081442.GR26783@pengutronix.de>
References: <20220112141229.700708-1-m.tretter@pengutronix.de>
 <20220112202937.034D9C36AE5@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220112202937.034D9C36AE5@smtp.kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:57:47 up 34 days, 16:43, 64 users,  load average: 0.13, 0.12,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 12 Jan 2022 12:29:35 -0800, Stephen Boyd wrote:
> Quoting Michael Tretter (2022-01-12 06:12:29)
> > The warning that a clock operation failed is only printed once. However,
> > the function is called for various different clocks. The limit hides
> > warnings if different clock are affected by the failures.
> > 
> > Print the warning every time when a clock operation fails.
> > 
> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > ---
> >  drivers/clk/zynqmp/clk-gate-zynqmp.c | 12 +++++------
> >  drivers/clk/zynqmp/clk-mux-zynqmp.c  |  8 +++----
> >  drivers/clk/zynqmp/divider.c         | 12 +++++------
> >  drivers/clk/zynqmp/pll.c             | 32 ++++++++++++++--------------
> >  4 files changed, 32 insertions(+), 32 deletions(-)
> > 
> > diff --git a/drivers/clk/zynqmp/clk-gate-zynqmp.c b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> > index 565ed67a0430..0d9a39110f29 100644
> > --- a/drivers/clk/zynqmp/clk-gate-zynqmp.c
> > +++ b/drivers/clk/zynqmp/clk-gate-zynqmp.c
> > @@ -41,8 +41,8 @@ static int zynqmp_clk_gate_enable(struct clk_hw *hw)
> >         ret = zynqmp_pm_clock_enable(clk_id);
> >  
> >         if (ret)
> > -               pr_warn_once("%s() clock enabled failed for %s, ret = %d\n",
> > -                            __func__, clk_name, ret);
> > +               pr_warn("%s() clock enable failed for %s (id %d), ret = %d\n",
> > +                       __func__, clk_name, clk_id, ret);
> 
> Can we just remove these prints entirely? The driver that calls
> clk_enable() should be checking the return value and taking proper
> action. What is the user going to do with these messages?
> 

The clocks are handled by a firmware, which checks if the Linux system has the
permission to change certain clocks. The warnings help users to identify an
unexpected configuration of the firmware. However, I guess it would make sense
to change the warnings to pr_debug.

Michael
