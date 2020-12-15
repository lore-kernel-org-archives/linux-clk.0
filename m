Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7CCC4361B
	for <linux-clk@archiver.kernel.org>; Tue, 15 Dec 2020 12:05:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A99312220F
	for <linux-clk@archiver.kernel.org>; Tue, 15 Dec 2020 12:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728774AbgLOMFO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Dec 2020 07:05:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728669AbgLOL5Q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Dec 2020 06:57:16 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 850D8C0617A6
        for <linux-clk@vger.kernel.org>; Tue, 15 Dec 2020 03:56:36 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kp8wT-0007W9-CP; Tue, 15 Dec 2020 12:56:33 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1kp8wS-0002Ce-QC; Tue, 15 Dec 2020 12:56:32 +0100
Date:   Tue, 15 Dec 2020 12:56:32 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, rajanv@xilinx.com, tejasp@xilinx.com,
        dshah@xilinx.com, rvisaval@xilinx.com, michals@xilinx.com,
        kernel@pengutronix.de, robh+dt@kernel.org, mturquette@baylibre.com
Subject: Re: [PATCH 00/12] soc: xilinx: vcu: Convert driver to clock provider
Message-ID: <20201215115632.GB23407@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <160783860077.1580929.7577989890301235621@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <160783860077.1580929.7577989890301235621@swboyd.mtv.corp.google.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 12:38:56 up 13 days, 5 min, 63 users,  load average: 0.05, 0.10,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 12 Dec 2020 21:50:00 -0800, Stephen Boyd wrote:
> Quoting Michael Tretter (2020-11-15 23:55:20)
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
> 
> After this series is this anything besides a clk provider? If it's only
> providing clks it would make sense to move the driver into drivers/clk/
> 

1. The driver is also responsible for resetting the entire VCU (the
VCU_GASKET_INIT register). This isn't something that an individual encoder or
decoder driver should be doing. However, other clock drivers also implement a
reset controller.

2. There are several registers for AXI performance monitoring in the VCU
System-Level Control register space. Right now, these are not used by the
driver and I have no plans to actually use them, but this might be an argument
against the move.

I think it is OK to move the driver to drivers/clk/, but I don't have a strong
opinion about it.

Michael
