Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <b945de99-815a-b380-e13c-17b01e0febad@users.sourceforge.net>
References: <566ABCD9.1060404@users.sourceforge.net> <1575ddf1-bd1a-fe98-046a-a586eb30fe47@users.sourceforge.net>
 <b945de99-815a-b380-e13c-17b01e0febad@users.sourceforge.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Sep 2016 21:11:07 +0200
Message-ID: <CAMuHMdX=We-N--Fc0KWD_p8AmnBMYDW9b560VGKi+SZ5k85e9A@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk/Renesas-MSTP: Less function calls in
 cpg_mstp_clocks_init() after error detection
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

On Wed, Sep 14, 2016 at 10:03 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 14 Sep 2016 21:30:27 +0200
>
> The kfree() function was called in up to two cases
> by the cpg_mstp_clocks_init() function during error handling even if
> the passed variable contained a null pointer.

It's perfectly legal to call kfree() on a NULL pointer.

> * Split a condition check for memory allocation failures so that
>   each pointer from these function calls will be checked immediately.
>
>   See also background information:
>   Topic "CWE-754: Improper check for unusual or exceptional conditions"
>   Link: https://cwe.mitre.org/data/definitions/754.html
>
> * Return directly after a call of the function "kzalloc" failed
>   at the beginning.

Both calls are already close together.

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/clk/renesas/clk-mstp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

In addition, your patch increases the LoC, IMHO without improving the code.

>
> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
> index 1fdc44b..6c82e0e 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -167,10 +167,12 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
>         unsigned int i;
>
>         group = kzalloc(sizeof(*group), GFP_KERNEL);
> +       if (!group)
> +               return;
> +
>         clks = kmalloc_array(MSTP_MAX_CLOCKS, sizeof(*clks), GFP_KERNEL);
> -       if (group == NULL || clks == NULL) {
> +       if (!clks) {
>                 kfree(group);
> -               kfree(clks);
>                 return;
>         }

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
