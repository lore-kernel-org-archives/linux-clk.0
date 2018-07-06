Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:43778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934414AbeGFRxe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Jul 2018 13:53:34 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Benjamin Herrenschmidt <benh@linux.vnet.ibm.com>,
        linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <c31c3652829e8e7064f750d219237c4eb32773e4.camel@linux.vnet.ibm.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>, linux-aspeed@lists.ozlabs.org
References: <c31c3652829e8e7064f750d219237c4eb32773e4.camel@linux.vnet.ibm.com>
Message-ID: <153089961364.143105.3583653247951877648@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: aspeed: Treat a gate in reset as disabled
Date: Fri, 06 Jul 2018 10:53:33 -0700
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Benjamin Herrenschmidt (2018-07-03 00:24:47)
> On some systems, we come out of the bootloader with some
> gates set with the clock "enabled" but the reset also
> asserted.
> =

> Since 8a53fc511c5e "clk: aspeed: Prevent reset if clock is enabled"
> we check that enabled bit in aspeed_clk_enabled(), and do
> nothing if already set.
> =

> This breaks when the above scenario occurs, as the clock
> is enabled, but the reset still needs to be lifted.
> =

> This patch fixes it by also checking the reset bit (if any)
> and treating a gate in "reset" as being disabled.
> =

> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Fixes: 8a53fc511c5e "clk: aspeed: Prevent reset if clock is enabled"
> CC: Eddie James <eajames@linux.vnet.ibm.com>
> ---

Applied to clk-fixes

