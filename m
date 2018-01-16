Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1516106529-19703-1-git-send-email-fabio.estevam@nxp.com>
References: <1516106529-19703-1-git-send-email-fabio.estevam@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jan 2018 14:19:18 +0100
Message-ID: <CAMuHMdUURgzHV_jsU0o9DGuyCjhd8j7iU_Fs86GY2pEEx+Xh9g@mail.gmail.com>
Subject: Re: [PATCH] clk: Print the clock name in the warnings
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>,
	Fabio Estevam <festevam@gmail.com>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Fabio,

On Tue, Jan 16, 2018 at 1:42 PM, Fabio Estevam <fabio.estevam@nxp.com> wrote:
> When getting the clock related warnings, it is useful to know what
> is the clock name that is causing the problem.
>
> Add it to the warning message, so that the output becomes clearer
> like this:

I love your patch! Yet something to improve:

> [    2.388129] ------------[ cut here ]------------
> [    2.392883] WARNING: CPU: 0 PID: 1 at drivers/clk/clk.c:812 clk_core_disable+0xd4/0xec
> [    2.400822] clock name: uart4_ipg_gate

This means we still have to look into the sources, to find out which
condition triggered. So what about improving the warning messages,
cfr. e.g. below?

> ...
>
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
>  drivers/clk/clk.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0f686a9..42dbb1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -548,7 +548,7 @@ static void clk_core_rate_unprotect(struct clk_core *core)
>         if (!core)
>                 return;
>
> -       if (WARN_ON(core->protect_count == 0))
> +       if (WARN(core->protect_count == 0, "clock name: %s\n", core->name))

"%s already unprotected\n"?

>                 return;
>
>         if (--core->protect_count > 0)
> @@ -681,16 +681,17 @@ static void clk_core_unprepare(struct clk_core *core)
>         if (!core)
>                 return;
>
> -       if (WARN_ON(core->prepare_count == 0))
> +       if (WARN(core->prepare_count == 0, "clock name: %s\n", core->name))

"%s already unprepared\n"?

>                 return;
>
> -       if (WARN_ON(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL))
> +       if (WARN(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL,
> +           "clock name: %s\n", core->name))

"Unpreparing critical %s\n"?

>                 return;
>
>         if (--core->prepare_count > 0)
>                 return;
>
> -       WARN_ON(core->enable_count > 0);
> +       WARN(core->enable_count > 0, "clock name: %s\n", core->name);

"Unpreparing enabled %s\n"?

>         trace_clk_unprepare(core);
>
> @@ -808,10 +809,11 @@ static void clk_core_disable(struct clk_core *core)
>         if (!core)
>                 return;
>
> -       if (WARN_ON(core->enable_count == 0))
> +       if (WARN(core->enable_count == 0, "clock name: %s\n", core->name))

"%s already disabled\n"?

>                 return;
>
> -       if (WARN_ON(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL))
> +       if (WARN(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL,
> +           "clock name: %s\n", core->name))

"Disabling critical %s\n"?

>                 return;
>
>         if (--core->enable_count > 0)
> @@ -866,7 +868,7 @@ static int clk_core_enable(struct clk_core *core)
>         if (!core)
>                 return 0;
>
> -       if (WARN_ON(core->prepare_count == 0))
> +       if (WARN(core->prepare_count == 0, "clock name: %s\n", core->name))

"Enabling unprepared %s\n"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
