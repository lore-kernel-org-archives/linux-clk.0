Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41650 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1956385AbdDZHeY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Apr 2017 03:34:24 -0400
Date: Wed, 26 Apr 2017 09:34:18 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: Provide dummy rcar_rst_read_mode_pins()
 for compile-testing
Message-ID: <20170426073418.GE25517@verge.net.au>
References: <1493141785-29117-1-git-send-email-geert+renesas@glider.be>
 <20170426071305.GC25517@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170426071305.GC25517@verge.net.au>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Apr 26, 2017 at 09:13:06AM +0200, Simon Horman wrote:
> On Tue, Apr 25, 2017 at 07:36:25PM +0200, Geert Uytterhoeven wrote:
> > If the R-Car RST driver is not included, compile-testing R-Car clock
> > drivers fails with a link error:
> > 
> >     undefined reference to `rcar_rst_read_mode_pins'
> > 
> > To fix this, provide a dummy version.  Use the exact same test logic as
> > in drivers/soc/renesas/Makefile, as there is no Kconfig symbol (yet) to
> > control compilation of the R-Car RST driver.
> 
> Adding a Kconfig symbol would be a bit cleaner IMHO.

I now see you are doing so in other patches :)

> > Fixes: 527c02f66d263d2e ("soc: renesas: Add R-Car RST driver")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > This isn't an issue now, but it does prevent enabling compile-testing of
> > the R-Car clock drivers.  As this is a dependency between two different
> > subsystems, I think this patch should be fast-tracked.
> > 
> > The #ifdef condition will be revised later, when the R-Car RST driver
> > gains its own Kconfig symbol.
> > ---
> >  include/linux/soc/renesas/rcar-rst.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/include/linux/soc/renesas/rcar-rst.h b/include/linux/soc/renesas/rcar-rst.h
> > index a18e0783946b66ec..787e7ad53d45f61c 100644
> > --- a/include/linux/soc/renesas/rcar-rst.h
> > +++ b/include/linux/soc/renesas/rcar-rst.h
> > @@ -1,6 +1,11 @@
> >  #ifndef __LINUX_SOC_RENESAS_RCAR_RST_H__
> >  #define __LINUX_SOC_RENESAS_RCAR_RST_H__
> >  
> > +#if defined(CONFIG_ARCH_RCAR_GEN1) || defined(CONFIG_ARCH_RCAR_GEN2) || \
> > +    defined(CONFIG_ARCH_R8A7795) || defined(CONFIG_ARCH_R8A7796)
> >  int rcar_rst_read_mode_pins(u32 *mode);
> > +#else
> > +static inline int rcar_rst_read_mode_pins(u32 *mode) { return -ENODEV; }
> > +#endif
> >  
> >  #endif /* __LINUX_SOC_RENESAS_RCAR_RST_H__ */
> > -- 
> > 2.7.4
> > 
> 
