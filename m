Return-Path: <SRS0=gleC=RP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 284ACC4360F
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 17:26:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EBE24214AF
	for <linux-clk@archiver.kernel.org>; Tue, 12 Mar 2019 17:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbfCLR0R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 12 Mar 2019 13:26:17 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:46217 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727691AbfCLR0R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 12 Mar 2019 13:26:17 -0400
Received: from litschi.hi.pengutronix.de ([2001:67c:670:100:feaa:14ff:fe6a:8db5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <m.tretter@pengutronix.de>)
        id 1h3lAL-00072r-Mr; Tue, 12 Mar 2019 18:26:13 +0100
Date:   Tue, 12 Mar 2019 18:26:13 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        kernel@pengutronix.de, Michael Turquette <mturquette@baylibre.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Jolly Shah <jolly.shah@xilinx.com>
Subject: Re: [PATCH 3/5] clk: zynqmp: do not export zynqmp_clk_register_mux
Message-ID: <20190312182613.5e76432a@litschi.hi.pengutronix.de>
In-Reply-To: <155240955647.20095.10179114897194099184@swboyd.mtv.corp.google.com>
References: <20190312110016.29174-1-m.tretter@pengutronix.de>
        <20190312110016.29174-4-m.tretter@pengutronix.de>
        <155240955647.20095.10179114897194099184@swboyd.mtv.corp.google.com>
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

On Tue, 12 Mar 2019 09:52:36 -0700, Stephen Boyd wrote:
> Quoting Michael Tretter (2019-03-12 04:00:14)
> > zynqmp_clk_register_mux is an internal function of the driver that only
> > should be used from clkc.c. Therefore, there is no need to export that
> > function.
> > 
> > Follow the suit of the other files of the driver and do not export the
> > register function.  
> 
> Does this mean that the divider file shouldn't export the divider
> registration function either? Please add a patch for that if it's the
> case. Otherwise this looks fine given that the code using this function
> is always built in.
> 

I will fix the divider in v2.

Michael
