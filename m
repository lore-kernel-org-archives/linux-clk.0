Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1457398135-12320-1-git-send-email-horms+renesas@verge.net.au>
References: <1457398135-12320-1-git-send-email-horms+renesas@verge.net.au>
Date: Tue, 8 Mar 2016 09:19:07 +0100
Message-ID: <CAMuHMdWx6VsiZNiw4=KVOH5jKRogbCVmKd3SfTRSdJ3V6vbjqw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: div6: use RENESAS for #define
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 8, 2016 at 1:48 AM, Simon Horman <horms+renesas@verge.net.au> wrote:
> Name the #define guarding compilation of this header
> __RENESAS_CLK_DIV6_H__ rather than __SHMOBILE_CLK_DIV6_H__.
>
> This is a follow-up to renaming the directory in which this file lives from
> shmobile to renesas which is in turn part of an ongoing process to migrate
> from ARCH_SHMOBILE to ARCH_RENESAS the motivation for which being that
> RENESAS seems to be a more appropriate name than SHMOBILE for the majority
> of Renesas ARM based SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
