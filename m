Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <04cf79a5-df91-d8c2-83b2-ad9e9130ee7a@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net> <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <04cf79a5-df91-d8c2-83b2-ad9e9130ee7a@users.sourceforge.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 21:07:17 +0200
Message-ID: <CAMuHMdVtvg99JY=_+Wj7jpd82=5rKDKOVxg0TYW3wUQsUQzAOA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk/Renesas-MSTP: Delete an error message for a
 failed memory allocation
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>,
	Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>,
	Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 14, 2016 at 10:01 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Sep 2016 21:17:18 +0200
>
> Omit an extra message for a memory allocation failure in this function.
>
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
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
