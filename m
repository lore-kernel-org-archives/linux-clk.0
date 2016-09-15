Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>, Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [PATCH 2/4] clk/Renesas-MSTP: Delete an error message for a failed memory allocation
Date: Thu, 15 Sep 2016 22:13:17 +0300
Message-ID: <2927869.3rNkSDiBcX@avalon>
In-Reply-To: <CAMuHMdVtvg99JY=_+Wj7jpd82=5rKDKOVxg0TYW3wUQsUQzAOA@mail.gmail.com>
References: <566ABCD9.1060404@users.sourceforge.net> <04cf79a5-df91-d8c2-83b2-ad9e9130ee7a@users.sourceforge.net> <CAMuHMdVtvg99JY=_+Wj7jpd82=5rKDKOVxg0TYW3wUQsUQzAOA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Thursday 15 Sep 2016 21:07:17 Geert Uytterhoeven wrote:
> On Wed, Sep 14, 2016 at 10:01 PM, SF Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Wed, 14 Sep 2016 21:17:18 +0200
> > 
> > Omit an extra message for a memory allocation failure in this function.
> > 
> > Link:
> > http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refacto
> > r_Strings-WSang_0.pdf
> > 
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

There are two other memory allocation failures printed by drivers in the same 
directory that, you'll get my ack if you extend this patch to remove the three 
messages in one go.

-- 
Regards,

Laurent Pinchart
