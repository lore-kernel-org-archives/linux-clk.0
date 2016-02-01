Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1454322472-6696-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1454322472-6696-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Mon, 1 Feb 2016 11:41:05 +0100
Message-ID: <CAMuHMdX7HBvGzeqsCVw6bUXBvXa5uMdiZ8GJD75bGezVz2WOxA@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: r8a7795: Add USB-DMAC clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Shimoda-san,

On Mon, Feb 1, 2016 at 11:27 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks for your patch!

> ---
>  This patch is based on the renesas-drivers.git /
>  renesas-devel-20160126-v4.5-rc1 tag.
>  (commit id = f834955ea55e4bed01d55339a4428eef219e8313)
>
>  Reference:
>  http://thread.gmane.org/gmane.linux.kernel.clk/3337/focus=184
>
>  drivers/clk/shmobile/r8a7795-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> index fc260b3..13d59d1 100644
> --- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> @@ -124,6 +124,8 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
>         DEF_MOD("pcie0",                 319,   R8A7795_CLK_S3D1),
>         DEF_MOD("usb3-if1",              327,   R8A7795_CLK_S3D1),
>         DEF_MOD("usb3-if0",              328,   R8A7795_CLK_S3D1),
> +       DEF_MOD("usb-dmac0",             330,   R8A7795_CLK_S3D2),
> +       DEF_MOD("usb-dmac1",             331,   R8A7795_CLK_S3D2),

The datasheet is not very clear about whether the module clock is based of s3d1
(266 MHz) or s3d2 (133 MHz), but given the comment "... it is recommended to
allow several tens of clocks if operating at 260 MHz ..." in section 75.2.2
"DMA0/1 Software Reset Register" of the datasheet, I'm inclined to believe s3d1
would be correct.

I don't think it matters much though, as we're not interested in the actual
rate of the module clock, and both s3d1 and s3d2 cannot be gated.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
