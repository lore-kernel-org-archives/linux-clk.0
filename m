Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <2946846.zhWOBzBeGa@wasted.cogentembedded.com>
References: <13079532.zQoaX56ouR@wasted.cogentembedded.com> <2946846.zhWOBzBeGa@wasted.cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Nov 2016 12:17:46 +0100
Message-ID: <CAMuHMdUkJR_jDUbswWDq9WK12-mKmN4XLbAZzXvuR-mYbVzD0A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: shmobile: r8a7745: add CPG clock index macros
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Oct 27, 2016 at 10:42 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add macros usable by  the device tree sources to reference the R8A7745 CPG
> clocks  by index. The data comes from the  table 7.2c in the revision 0.50
> of the RZ/G Series User's Manual.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
