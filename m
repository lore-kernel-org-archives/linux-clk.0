Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1453456949-9840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1453456949-9840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Date: Fri, 22 Jan 2016 11:51:52 +0100
Message-ID: <CAMuHMdWi3ZCvo9CVdn-7Tboxkwv9F_x+1LrJ1ozGQ_gJEM7bgg@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: r8a7795: Add USB3.0 clocks
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Shimoda-san,

On Fri, Jan 22, 2016 at 11:02 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  This patch is based on the latest clk.git / clk-next branch.
>  (commit id = 3da834e3e5a4a5d26882955298b55a9ed37a00bc)
>
>  drivers/clk/shmobile/r8a7795-cpg-mssr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> index 13e9947..fc260b3 100644
> --- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> +++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
> @@ -122,6 +122,8 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
>         DEF_MOD("scif2",                 310,   R8A7795_CLK_S3D4),
>         DEF_MOD("pcie1",                 318,   R8A7795_CLK_S3D1),
>         DEF_MOD("pcie0",                 319,   R8A7795_CLK_S3D1),
> +       DEF_MOD("usb3-if1",              327,   R8A7795_CLK_S3D1),
> +       DEF_MOD("usb3-if0",              328,   R8A7795_CLK_S3D1),

Thank you, looks fine! Note that I couldn't verify the parent clock.

Will queue for next renesas-drivers and v4.6.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
