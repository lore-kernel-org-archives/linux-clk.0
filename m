Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1456431985-31750-1-git-send-email-sboyd@codeaurora.org>
References: <1456431985-31750-1-git-send-email-sboyd@codeaurora.org>
Date: Thu, 25 Feb 2016 21:32:04 +0100
Message-ID: <CAMuHMdUHVm0ZNfhxv_=sK3z6BjaJK0OxRun8GzfYg0w+HnX7VQ@mail.gmail.com>
Subject: Re: [PATCH] clk: shmobile: Free 'clock' on error path
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Thu, Feb 25, 2016 at 9:26 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> We forgot to free this clock when we return early in this code.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> ---
>  drivers/clk/shmobile/renesas-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/shmobile/renesas-cpg-mssr.c b/drivers/clk/shmobile/renesas-cpg-mssr.c
> index 925b6007e531..58e24b326a48 100644
> --- a/drivers/clk/shmobile/renesas-cpg-mssr.c
> +++ b/drivers/clk/shmobile/renesas-cpg-mssr.c
> @@ -348,6 +348,7 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
>  #else
>                         dev_dbg(dev, "Ignoring MSTP %s to prevent disabling\n",
>                                 mod->name);
> +                       kfree(clock);
>                         return;
>  #endif

I had hoped for the whole "#else /* !CLK_ENABLE_HAND_OFF */" branch
to be removed before anyone would start to fix silly issues like this ;-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
