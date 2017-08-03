Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:55064 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751184AbdHCBPF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 2 Aug 2017 21:15:05 -0400
Date: Thu, 3 Aug 2017 09:13:58 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Stefan Agner <stefan@agner.ch>
Cc: kernel@pengutronix.de, sboyd@codeaurora.org, aisheng.dong@nxp.com,
        dwmw2@infradead.org, computersforpeace@gmail.com,
        boris.brezillon@free-electrons.com, marek.vasut@gmail.com,
        richard@nod.at, robh+dt@kernel.org, mark.rutland@arm.com,
        han.xu@nxp.com, fabio.estevam@freescale.com,
        LW@karo-electronics.de, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 0/3] ARM: dts: imx7: add NAND support
Message-ID: <20170803011357.GA31819@dragon>
References: <cover.9fab78eaa869dbad4c9ad7e8578c9cef3e49daa8.1496961128.git-series.stefan@agner.ch>
 <20170614151146.GC30112@dragon>
 <c05aff108433c9ced4c85efcf3ba65e8@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <c05aff108433c9ced4c85efcf3ba65e8@agner.ch>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 01, 2017 at 07:41:41PM -0700, Stefan Agner wrote:
> Hi Shawn,
> 
> On 2017-06-14 08:11, Shawn Guo wrote:
> > On Thu, Jun 08, 2017 at 03:34:46PM -0700, Stefan Agner wrote:
> >> Stefan Agner (3):
> >>   clk: imx7d: create clocks behind rawnand clock gate
> >>   ARM: dts: imx7: add GPMI NAND and APBH DMA
> >>   ARM: dts: imx7-colibri: add NAND support
> > 
> > Both dts patches look good to me.  Please ping me after the clk patch
> > lands on mainline.
> 
> The clk patch landed in mainline. These two patches seem to apply fine
> still. Can you queue them for -next?

Just applied.  Thanks for reminding.

Shawn
