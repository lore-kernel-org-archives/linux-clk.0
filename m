Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:55830 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752070AbcKHXPO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Nov 2016 18:15:14 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Ritesh Harjani <riteshh@codeaurora.org>, ulf.hansson@linaro.org,
        linux-mmc@vger.kernel.org, adrian.hunter@intel.com,
        shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, david.brown@linaro.org,
        andy.gross@linaro.org, linux-arm-msm@vger.kernel.org,
        georgi.djakov@linaro.org, alex.lemberg@sandisk.com,
        mateusz.nowak@intel.com, Yuliy.Izrailov@sandisk.com,
        asutoshd@codeaurora.org, kdorfman@codeaurora.org,
        david.griego@linaro.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, rnayak@codeaurora.org,
        pramod.gurav@linaro.org
Subject: Re: [PATCH v6 05/14] mmc: sdhci-msm: Update DLL reset sequence
Date: Wed, 09 Nov 2016 00:14:18 +0100
Message-ID: <4491681.Re2JGGCuz1@wuerfel>
In-Reply-To: <20161108230622.GN16026@codeaurora.org>
References: <1478517877-23733-1-git-send-email-riteshh@codeaurora.org> <1478517877-23733-6-git-send-email-riteshh@codeaurora.org> <20161108230622.GN16026@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, November 8, 2016 3:06:22 PM CET Stephen Boyd wrote:
> > +
> > +             config = readl_relaxed(host->ioaddr + CORE_DLL_CONFIG_2);
> > +             config &= ~(0xFF << 10);
> > +             config |= mclk_freq << 10;
> > +
> > +             writel_relaxed(config, host->ioaddr + CORE_DLL_CONFIG_2);
> > +             /* wait for 5us before enabling DLL clock */
> 
> Usually there's a barrier between writel_relaxed() and delay
> because we don't know when the writel will be posted out and the
> delay is there to wait for the operation to happen. Probably
> should change this to be a writel() instead.
> 

The barrier in writel() is not for posted writes, it is to synchronize
with memory accesses *before* the write.

In general, if you want to ensure that a write has made it to the
device, you need to read back from the same address (the specific
behavior may depend on the bus).

While in general, using the non-relaxed accessors should be the
default (and there should be a comment for each *_relaxed access),
but I don't think using writel() would let you skip the delay here.

	Arnd
