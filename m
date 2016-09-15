Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <2f96a36e-fae9-5992-7259-67c92692bbc3@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net> <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <2f96a36e-fae9-5992-7259-67c92692bbc3@users.sourceforge.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 21:11:56 +0200
Message-ID: <CAMuHMdWga6cdCK84Q+aXFhrEG-CLuG=a1v1Ani2ODUotA=jgfA@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk/Renesas-MSTP: Use kmalloc_array() in cpg_mstp_clocks_init()
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>,
	Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 14, 2016 at 10:00 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Sep 2016 21:10:47 +0200
>
> A multiplication for the size determination of a memory allocation
> indicated that an array data structure should be processed.
> Thus use the corresponding function "kmalloc_array".
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
