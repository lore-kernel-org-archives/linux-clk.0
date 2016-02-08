Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1454326145-4008-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1454326145-4008-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Mon, 8 Feb 2016 16:30:49 +0100
Message-ID: <CAMuHMdXAuaHW8nu5KczVek=htV-oD-qBpANMui0G+0+nupALow@mail.gmail.com>
Subject: Re: [PATCH v2] clk: shmobile: r8a7795: Add USB-DMAC clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 1, 2016 at 12:29 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on the renesas-drivers.git /
>  renesas-devel-20160126-v4.5-rc1 tag.
>  (commit id = f834955ea55e4bed01d55339a4428eef219e8313)
>
>  Reference:
>  http://thread.gmane.org/gmane.linux.kernel.clk/3337/focus=184
>
>  Changes from v1:
>   - Use R8A7795_CLK_S3D1 instead of R8A7795_CLK_S3D2.

Thanks, will queue for next renesas-drivers and v4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
