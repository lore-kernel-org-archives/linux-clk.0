Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:49030 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751307AbcDRB6h (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Sun, 17 Apr 2016 21:58:37 -0400
Date: Mon, 18 Apr 2016 09:58:06 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
	mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: do not sleep if IRQ's are still disabled
Message-ID: <20160418015806.GR28903@tiger>
References: <1454107764-19876-1-git-send-email-stefan@agner.ch>
 <20160416010052.GR26353@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160416010052.GR26353@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 15, 2016 at 06:00:53PM -0700, Stephen Boyd wrote:
> On 01/29, Stefan Agner wrote:
> > If a clock gets enabled early during boot time, it can lead to a PLL
> > startup. The wait_lock function makes sure that the PLL is really
> > stareted up before it gets used. However, the function sleeps which
> > leads to scheduling and an error:
> > bad: scheduling from the idle thread!
> > ...
> > 
> > Use udelay in case IRQ's are still disabled.
> > 
> > Signed-off-by: Stefan Agner <stefan@agner.ch>
> 
> This is really old. Shawn, are you picking these up? I'm removing
> these from my queue for now.

Yes, I'm picking them up.

Shawn
