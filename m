Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:56891 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751646AbcA0Ccl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Tue, 26 Jan 2016 21:32:41 -0500
Received: from minime.bse ([77.20.40.102]) by mail.gmx.com (mrgmx101) with
 ESMTPSA (Nemesis) id 0MZgdm-1afMWP3Jba-00LSYW for
 <linux-clk@vger.kernel.org>; Wed, 27 Jan 2016 03:32:39 +0100
Date: Wed, 27 Jan 2016 03:32:36 +0100
From: Daniel =?iso-8859-1?Q?Gl=F6ckner?= <daniel-gl@gmx.net>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Cc: linux-clk@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>
Subject: Re: Bits that affect several muxes
Message-ID: <20160127023236.GA23081@minime.bse>
References: <20160122233737.GA15679@minime.bse>
 <56A72CB7.7050707@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <56A72CB7.7050707@mentor.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Vladimir,

I have added Shawn Guo to CC as the discussion shifts towards the i.MX6.
He wrote the existing i.MX6 PLL bypass code.

On Tue, Jan 26, 2016 at 10:22:15AM +0200, Vladimir Zapolskiy wrote:
> On 23.01.2016 01:37, Daniel Glöckner wrote:
> > today at work I just realized that the i.MX6 clock tree is not correctly
> > modeled wrt. PLL bypassing since bypassing the PLL also bypasses all PFD
> > post dividers. I've seen this before on the jz4730 where disabling the
> > PLL also sets several clocks to the same source.
> 
> could you please give a more detailed example for iMX6 (particular clock
> names, registers, bit fields from the Reference Manual)?

The i.MX6 reference manual says "For the PLL equipped with PFDs the
input reference clock is also bypassed to all PFDs outputs."

I have taken the time to measure the effect of putting the PLLs in
bypass by routing their output to an LVDS clock output on an i.MX6Q.
The results are:

 - All four PFD outputs of PLL2 are switched to the bypass source
   (LVDS1_CLK_SEL=2..5), even the undocumented PFD3
 - The PLL2 output itself (LVDS1_CLK_SEL=1) is not affected by bypass
 - USB1 PLL (LVDS1_CLK_SEL=12) and its PFDs (LVDS1_CLK_SEL=14..17) are
   _not_ affected by bypass
 - USB2 PLL (LVDS1_CLK_SEL=13) is affected by bypass
 - When the ENET PLL is in bypass, only PCIE REF (LVDS1_CLK_SEL=12) is
   switched to the bypass clock, ETHERNET REF and SATA REF
   (LVDS1_CLK_SEL=9, 11) still derive their clock from the ENET PLL
 - ARM, Audio, and Video PLL (LVDS1_CLK_SEL=0, 6, 7) are not affected
   by bypass

It also seems like the ENABLE bit has no effect on many of the PLLs
and only POWERDOWN stops the clock from being forwarded to the LVDS
output. Looks like someone at Freescale/NXP needs to fix some diagrams
in the reference manual.

Best regards,

  Daniel
