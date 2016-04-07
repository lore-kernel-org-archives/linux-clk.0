Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1457551114-21764-5-git-send-email-geert+renesas@glider.be>
References: <1457551114-21764-1-git-send-email-geert+renesas@glider.be>
	<1457551114-21764-5-git-send-email-geert+renesas@glider.be>
Date: Thu, 7 Apr 2016 13:26:04 +0200
Message-ID: <CAMuHMdUzJLxTziZLLB6qm6AqDkcjWuD787r4unvXvmMarU2_3Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: cpg-mssr: Export cpg_mssr_{at,de}tach_dev()
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms+renesas@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 9, 2016 at 8:18 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The R-Car SYSC PM Domain driver has to power manage devices in power
> areas using clocks. To reuse code and to share knowledge of clocks
> suitable for power management, this is ideally done through the existing
> cpg_mssr_attach_dev() and cpg_mssr_detach_dev() callbacks.
>
> Hence these callbacks can no longer rely on their "domain" parameter
> pointing to the CPG/MSSR Clock Domain. To handle this, keep a pointer to
> the clock domain in a static variable. cpg_mssr_attach_dev() has to
> support probe deferral, as the R-Car SYSC PM Domain may be initialized,
> and devices may be added to it, before the CPG/MSSR Clock Domain is
> initialized.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

I'd like to withdraw this patch, as I found a much cleaner solution.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
