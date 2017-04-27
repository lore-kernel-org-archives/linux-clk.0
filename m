Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1493141328-28201-1-git-send-email-geert+renesas@glider.be>
References: <1493141328-28201-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 27 Apr 2017 14:43:24 +0200
Message-ID: <CAMuHMdU+o15+7jZp46KgushRQvyJ=j1btZAu1+e3h4vr4h7Vng@mail.gmail.com>
Subject: Re: [PATCH] clk: Provide dummy of_clk_get_from_provider() for compile-testing
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Apr 25, 2017 at 7:28 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> When CONFIG_ON=n, dummies are provided for of_clk_get() and
> of_clk_get_by_name(), but not for of_clk_get_from_provider().
>
> Provide a dummy for the latter, to improve the ability to do
> compile-testing.
>
> Fixes: 766e6a4ec602d0c1 ("clk: add DT clock binding support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/linux/clk.h | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/include/linux/clk.h b/include/linux/clk.h
> index e9d36b3e49de5b1b..3ed97abb5cbb7f94 100644
> --- a/include/linux/clk.h
> +++ b/include/linux/clk.h
> @@ -539,6 +539,10 @@ static inline struct clk *of_clk_get_by_name(struct device_node *np,
>  {
>         return ERR_PTR(-ENOENT);
>  }
> +static inline struct clk *of_clk_get_from_provider(struct of_phandle_args *clkspec)
> +{
> +       return ERR_PTR(-ENOENT);
> +}
>  #endif

0day reported an issue with arch/mips/lantiq/clk.c, which defines its own
dummy version:

| arch/mips//lantiq/clk.c:163:13: error: redefinition of
'of_clk_get_from_provider'

I will add its removal to my v2.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
