Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <e28d35f9-e519-5f3b-c27d-958605b5b851@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net> <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <e28d35f9-e519-5f3b-c27d-958605b5b851@users.sourceforge.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 21:18:25 +0200
Message-ID: <CAMuHMdVLx5fha0J4zc6J-ytK=J-12iRsaybbxo07wvPaQxTcpg@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk/Renesas-MSTP: Rename jump labels in cpg_mstp_attach_dev()
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-clk <linux-clk@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Michael Turquette <mturquette@baylibre.com>, Simon Horman <horms+renesas@verge.net.au>,
	Stephen Boyd <sboyd@codeaurora.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Markus,

On Wed, Sep 14, 2016 at 10:04 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Sep 2016 21:41:50 +0200
>
> Adjust jump labels according to the current Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/clk/renesas/clk-mstp.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
> index 6c82e0e..2f90718 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -256,19 +256,18 @@ int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
>                                            &clkspec)) {
>                 if (of_device_is_compatible(clkspec.np,
>                                             "renesas,cpg-mstp-clocks"))
> -                       goto found;
> +                       goto get_clk;
>
>                 /* BSC on r8a73a4/sh73a0 uses zb_clk instead of an mstp clock */
>                 if (!strcmp(clkspec.np->name, "zb_clk"))
> -                       goto found;
> +                       goto get_clk;
>
>                 of_node_put(clkspec.np);
>                 i++;
>         }
>
>         return 0;
> -
> -found:
> + get_clk:

"Choose label names which say what the goto does or why the goto exists."

I prefer the "why" over the "what".

And the "indent labels with a single space" rule will be removed soon, as
there's no longer a technical reason for it after
https://lkml.org/lkml/2016/9/7/316

>         clk = of_clk_get_from_provider(&clkspec);
>         of_node_put(clkspec.np);
>
> @@ -278,20 +277,19 @@ found:
>         error = pm_clk_create(dev);
>         if (error) {
>                 dev_err(dev, "pm_clk_create failed %d\n", error);
> -               goto fail_put;
> +               goto put_clk;
>         }
>
>         error = pm_clk_add_clk(dev, clk);
>         if (error) {
>                 dev_err(dev, "pm_clk_add_clk %pC failed %d\n", clk, error);
> -               goto fail_destroy;
> +               goto destroy_clk;
>         }
>
>         return 0;
> -
> -fail_destroy:
> + destroy_clk:
>         pm_clk_destroy(dev);
> -fail_put:
> + put_clk:

Same here.

>         clk_put(clk);
>         return error;
>  }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
