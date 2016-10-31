Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <20161031095214.GA2335@verge.net.au>
References: <20161021154737.3803065-1-arnd@arndb.de> <CAMuHMdU6nVn=P0B5Xeqh5T-Mn8YEK_4oH1kvAPcpQzkviX669w@mail.gmail.com>
 <3808786.t4RxxDciQu@wuerfel> <CAMuHMdWq9_xHZgMtho87yRnR+RBVA22Ss+8dPRb4OQ+Vrni69A@mail.gmail.com>
 <CAMuHMdXRjgETtjBHHu2mHt9iEfe_rL5fpD-pgPH9MWniOFubQQ@mail.gmail.com> <20161031095214.GA2335@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 31 Oct 2016 11:02:36 +0100
Message-ID: <CAMuHMdV6==enPXf_A=SO-PdSihKZdaRUvZA6ZM5+Dy6KJxhrJw@mail.gmail.com>
Subject: Re: [PATCH] clk: fix link error for rcar-gen2
To: Simon Horman <horms@verge.net.au>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Magnus Damm <damm+renesas@opensource.se>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Oct 31, 2016 at 10:52 AM, Simon Horman <horms@verge.net.au> wrote:
> From: Simon Horman <horms+renesas@verge.net.au>
> Subject: [PATCH] ARM: shmobile: only call rcar_gen2_clocks_init() if present
>
> The RZ/G1M (r8a7743) uses the R-Car Gen2 core, but not the R-Car Gen2 clock
> driver. This is a harbinger of a transition for R-Car Gen2 SoCs. As the
> process to get all the required pieces in place is somewhat complex it
> seems useful to try to disentangle dependencies where possible.
>
> The approach here is to temporarily disable calling rcar_gen2_clocks_init()
> if no R-Car Gen2 SoC are configured and thus the symbol will not be

SoCs

> present.
>
> Fixes: 1254f607fc3d ("ARM: shmobile: r8a7743: basic SoC support")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
