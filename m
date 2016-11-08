Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1478593430-23102-1-git-send-email-rnayak@codeaurora.org>
References: <1478593430-23102-1-git-send-email-rnayak@codeaurora.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Nov 2016 10:36:46 +0100
Message-ID: <CAMuHMdW6-oRJ4CKbUeXOixvKFOZ3vf8pGhCH87rOx1KuE8bdGQ@mail.gmail.com>
Subject: Re: [PATCH] clk: Free struct clk allocated during clk_hw_register()
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Rajendra,

On Tue, Nov 8, 2016 at 9:23 AM, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> With clk_hw_register() API we hide the struct clk from the caller
> and return an int error code instead, so the caller (clk provider)
> is not expected to use hw->clk on return.

That's correct, in case of failure.

> Free the memory, and mark hw->clk as NULL before returning.
>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
>  drivers/clk/clk.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0fb39fe..f81e4aa 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2628,7 +2628,15 @@ struct clk *clk_register(struct device *dev, struct clk_hw *hw)
>   */
>  int clk_hw_register(struct device *dev, struct clk_hw *hw)
>  {
> -       return PTR_ERR_OR_ZERO(clk_register(dev, hw));
> +       struct clk *c;
> +
> +       c = clk_register(dev, hw);
> +       if (IS_ERR(c))
> +               return PTR_ERR(c);
> +
> +       __clk_free_clk(c);
> +       hw->clk = NULL;

This is the success path, not the failure path (on failure, clk_register()
has already freed the struct clk).
Why do you free the struct clk in case of success?

What am I missing?

> +       return 0;
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_register);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
