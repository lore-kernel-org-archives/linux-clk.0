Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B33C433E0
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 15:30:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C0D123358
	for <linux-clk@archiver.kernel.org>; Wed, 20 Jan 2021 15:30:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390789AbhATP31 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 20 Jan 2021 10:29:27 -0500
Received: from inva020.nxp.com ([92.121.34.13]:58500 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731468AbhATP3A (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 20 Jan 2021 10:29:00 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0331D1A0A82;
        Wed, 20 Jan 2021 16:28:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E93E01A0A42;
        Wed, 20 Jan 2021 16:28:13 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id D4AA52039A;
        Wed, 20 Jan 2021 16:28:13 +0100 (CET)
Date:   Wed, 20 Jan 2021 17:28:13 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Sascha Hauer <s.hauer@pengutronix.de>
Cc:     Adam Ford <aford173@gmail.com>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Adam Ford-BE <aford@beaconembedded.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V3] clk: imx: Fix reparenting of UARTs not associated
 with sdout
Message-ID: <20210120152813.x2pbs5vprevkly23@fsr-ub1664-175>
References: <20210115182909.314756-1-aford173@gmail.com>
 <20210118125204.hxsanoohwvdtdvym@fsr-ub1664-175>
 <CAHCN7x+CXUuPN7upiv3D+REOU4d_=i30no+SkRzUjWY58o=uUQ@mail.gmail.com>
 <20210120144454.f6b72lnasw4q3bde@fsr-ub1664-175>
 <20210120151305.GC19063@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210120151305.GC19063@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-01-20 16:13:05, Sascha Hauer wrote:
> Hi Abel,
> 
> On Wed, Jan 20, 2021 at 04:44:54PM +0200, Abel Vesa wrote:
> > On 21-01-18 08:00:43, Adam Ford wrote:
> > > On Mon, Jan 18, 2021 at 6:52 AM Abel Vesa <abel.vesa@nxp.com> wrote:

...

> > > 
> > > >
> > > > TBH, I'm against the idea of having to call consumer API from a clock provider driver.
> > > > I'm still investigating a way of moving the uart clock control calls in drivers/serial/imx,
> > > > where they belong.
> > > 
> > > That makes sense.
> > > 
> > 
> > Just a thought. The uart clock used for console remains on from u-boot,
> > so maybe it's enough to just add the CLK_IGNORE_UNUSED flag to all the
> > uart root clocks and remove the prepare/enable calls for uart clocks 
> > for good. I don't really have a way to test it right now, but maybe
> > you could give it a try.
> 
> That would mean that UART clocks will never be disabled, regardless of
> whether they are used for console or not. That doesn't sound very
> appealing.

AFAIK, the only uart clock that is enabled by u-boot is the one used for
the console. Later on, when the serial driver probes, it will enable it itself.

Unless I'm missing something, this is exactly what we need.
