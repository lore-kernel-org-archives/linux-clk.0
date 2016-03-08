Return-Path: <horms@verge.net.au>
Date: Tue, 8 Mar 2016 09:27:15 +0900
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: Rename header file renesas.h
Message-ID: <20160308002715.GE5024@verge.net.au>
References: <1457315065-28705-1-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdX_GhW+NJNjN9r3KgUAnrp-v+5hFq9H0+hdPxRRFTP8kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAMuHMdX_GhW+NJNjN9r3KgUAnrp-v+5hFq9H0+hdPxRRFTP8kw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Mar 07, 2016 at 02:51:19PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Mar 7, 2016 at 2:44 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> > --- /dev/null
> > +++ b/include/linux/clk/renesas.h
> > @@ -0,0 +1,35 @@
> > +/*
> > + * Copyright 2013 Ideas On Board SPRL
> > + * Copyright 2013, 2014 Horms Solutions Ltd.
> > + *
> > + * Contact: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > + * Contact: Simon Horman <horms@verge.net.au>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License as published by
> > + * the Free Software Foundation; either version 2 of the License, or
> > + * (at your option) any later version.
> > + */
> > +
> > +#ifndef __LINUX_CLK_SHMOBILE_H_
> > +#define __LINUX_CLK_SHMOBILE_H_
> 
> Ideally these should be changed to __LINUX_CLK_RENESAS_H_
> 
> Sorry for not noticing before.

Likewise. I'll re-spin.
