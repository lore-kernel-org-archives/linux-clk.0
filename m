Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506C2C63777
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 09:01:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F169F22241
	for <linux-clk@archiver.kernel.org>; Thu,  3 Dec 2020 09:01:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727858AbgLCJBO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 3 Dec 2020 04:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbgLCJBO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 3 Dec 2020 04:01:14 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32FEBC061A4D
        for <linux-clk@vger.kernel.org>; Thu,  3 Dec 2020 01:00:34 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkkTY-0004Ic-Oh; Thu, 03 Dec 2020 10:00:32 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kkkTX-0001Cj-Sg; Thu, 03 Dec 2020 10:00:31 +0100
Date:   Thu, 3 Dec 2020 10:00:31 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Michal Simek <michal.simek@xilinx.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, rajanv@xilinx.com, tejasp@xilinx.com,
        dshah@xilinx.com, rvisaval@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org
Subject: Re: [PATCH 00/12] soc: xilinx: vcu: Convert driver to clock provider
Message-ID: <20201203090031.GB21858@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <5dd16c21-b204-bb10-feb8-562a298faaf9@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5dd16c21-b204-bb10-feb8-562a298faaf9@xilinx.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:52:30 up 21:19, 51 users,  load average: 0.08, 0.15, 0.17
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 03 Dec 2020 08:46:12 +0100, Michal Simek wrote:
> 
> 
> On 16. 11. 20 8:55, Michael Tretter wrote:
> > Hello,
> > 
> > the xlnx_vcu soc driver is actually a clock provider of a PLL and four output
> > clocks created from the PLL via dividers.
> > 
> > This series reworks the xlnx_vcu driver to use the common clock framework to
> > enable other drivers to use the clocks. I originally posted a series to expose
> > the output clocks as fixed clocks [0]. This series now implements the full
> > tree from the PLL to the output clocks. Therefore, I am sending a separate
> > series that focuses on the clocks, but it depends on v4 of the previous series
> > [1].
> > 
> > Possible consumers for the clocks are the allegro-dvt video encoder driver or
> > the Xilinx Video Codec Unit [2] out of tree driver.
> > 
> > Patch 1 defines the identifiers that shall be used by clock consumers in the
> > device tree.
> > 
> > Patch 2 fixes the generic clk-divider to correctly use parents that are passed
> > via struct clk_hw instead of the clock name.
> > 
> > Patches 3-6 refactor the existing driver and split the function to configure
> > the PLL into smaller helper functions.
> > 
> > Patch 7 registers a fixed rate clock for the PLL. The driver calculated and
> > set the PLL configuration during probe, and exposing a fixed rate clock for
> > that rate allows to use the existing configuration with output clocks from the
> > common clock framework.
> > 
> > Patches 8-10 switch the driver to the common clock framework and register the
> > clock provider.
> > 
> > Patches 11-12 are cleanup patches.
> > 
> > Michael
> > 
> > [0] https://lore.kernel.org/linux-arm-kernel/20200619075913.18900-1-m.tretter@pengutronix.de/
> > [1] https://lore.kernel.org/linux-arm-kernel/20201109134818.4159342-3-m.tretter@pengutronix.de/
> > [2] https://github.com/Xilinx/vcu-modules
> > 
> > Michael Tretter (12):
> >   ARM: dts: define indexes for output clocks
> >   clk: divider: fix initialization with parent_hw
> >   soc: xilinx: vcu: drop coreclk from struct xlnx_vcu
> >   soc: xilinx: vcu: add helper to wait for PLL locked
> >   soc: xilinx: vcu: add helpers for configuring PLL
> >   soc: xilinx: vcu: implement PLL disable
> >   soc: xilinx: vcu: register PLL as fixed rate clock
> >   soc: xilinx: vcu: implement clock provider for output clocks
> >   soc: xilinx: vcu: make pll post divider explicit
> >   soc: xilinx: vcu: make the PLL configurable
> >   soc: xilinx: vcu: remove calculation of PLL configuration
> >   soc: xilinx: vcu: use bitfields for register definition
> > 
> >  drivers/clk/clk-divider.c            |   9 +-
> >  drivers/soc/xilinx/Kconfig           |   2 +-
> >  drivers/soc/xilinx/xlnx_vcu.c        | 613 ++++++++++++++++-----------
> >  include/dt-bindings/clock/xlnx-vcu.h |  15 +
> >  4 files changed, 383 insertions(+), 256 deletions(-)
> >  create mode 100644 include/dt-bindings/clock/xlnx-vcu.h
> > 
> 
> I can't see any other problem with this series.

Thanks for the review! I will wait a bit longer if there is some review
feedback by Stephen regarding patch 2, and then send a v2.

> When we are on this. Can you also please fix these issues reported by
> checkpatch to have new issues more visible?
> 
> ./scripts/checkpatch.pl --strict -f drivers/soc/xilinx/xlnx_vcu.c
> CHECK: Alignment should match open parenthesis
> #614: FILE: drivers/soc/xilinx/xlnx_vcu.c:614:
> +	xvcu->vcu_slcr_ba = devm_ioremap(&pdev->dev, res->start,
> +						 resource_size(res));
> 
> WARNING: Possible repeated word: 'the'
> #707: FILE: drivers/soc/xilinx/xlnx_vcu.c:707:
> +	/* Add the the Gasket isolation and put the VCU in reset. */
> 
> total: 0 errors, 1 warnings, 1 checks, 735 lines checked

Sure. I will add a patch to fix the warnings in v2.

Michael
