Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1447343686-2038-1-git-send-email-geert+renesas@glider.be>
References: <1447343686-2038-1-git-send-email-geert+renesas@glider.be>
Date: Fri, 4 Dec 2015 10:04:26 +0100
Message-ID: <CAMuHMdUrsRqLMM70NG3JC-pwk5d1h=b5aBDNCKmUTK61KwGXWQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] clk: shmobile: Add new CPG/MSSR driver
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: Magnus Damm <damm+renesas@opensource.se>, Simon Horman <horms+renesas@verge.net.au>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-sh list <linux-sh@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 12, 2015 at 4:54 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This series adds a new driver for the Renesas CPG (Clock Pulse
> Generator) and MSSR (Module Standby and Software Reset) blocks for R-Car
> H3 (r8a7795).  This is supposed to be more in-line with current CCF best
> practices, and allows expansion to cover the module reset functionality
> in the future. This drivers follows the DT bindings in
> Documentation/devicetree/bindings/clock/renesas,cpg-mssr.txt, which have
> been accepted in clk/clk-next.
> Support for other SoCs may be added later.

Ping?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
