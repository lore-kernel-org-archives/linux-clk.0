Return-Path: <laurent.pinchart@ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>, Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>, LKML <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>, Wolfram Sang <wsa@the-dreams.de>
Subject: Re: clk/Renesas-MSTP: Delete an error message for a failed memory allocation
Date: Fri, 16 Sep 2016 01:55:08 +0300
Message-ID: <64106728.50RHrbMaf7@avalon>
In-Reply-To: <bd139d45-f7c1-ac79-6b38-93b1eb1f3e9a@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net> <2927869.3rNkSDiBcX@avalon> <bd139d45-f7c1-ac79-6b38-93b1eb1f3e9a@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Thursday 15 Sep 2016 22:17:41 SF Markus Elfring wrote:
> >>> Omit an extra message for a memory allocation failure in this function.
> >>> 
> >>> Link:
> >>> http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refact
> >>> or_Strings-WSang_0.pdf
> >>> 
> >>> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> >> 
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > There are two other memory allocation failures printed by drivers in the
> > same directory that, you'll get my ack
> 
> Does this kind of feedback express a general acceptance for the deletion
> of similar error messages?

No, it's my opinion only.

> > if you extend this patch to remove the three messages in one go.
> 
> Does this wish influence the handling of suggested changes for the source
> file "drivers/clk/renesas/clk-mstp.c" anyhow?
> https://patchwork.kernel.org/patch/9332363/

Yes, please submit a new version of this patch that removes all the memory 
allocation error messages from drivers/clk/renesas/ in one go.

-- 
Regards,

Laurent Pinchart
