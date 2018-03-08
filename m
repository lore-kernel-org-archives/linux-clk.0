Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1520495643-164458-1-git-send-email-shawn.lin@rock-chips.com>
References: <1520495643-164458-1-git-send-email-shawn.lin@rock-chips.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Mar 2018 10:40:26 +0100
Message-ID: <CAMuHMdWVxtP4T8jVYLmmhNvQQqCUkHSF2vuoEX847pnE+Yyz_Q@mail.gmail.com>
Subject: Re: [PATCH] clk: Don't show the incorrect clock phase
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 8, 2018 at 8:54 AM, Shawn Lin <shawn.lin@rock-chips.com> wrote:
> It's found that the clock phase output from clk_summary is
> wrong compared to the actual phase reading from the register.
>
> cat /sys/kernel/debug/clk/clk_summary | grep sdio_sample
> sdio_sample     0        1        0 50000000          0 -22
>
> It expose an issue that clk core, clk_core_get_phase, always

exposes

> return the cached core->phase which should be either updated
> by calling clk_set_phase or directly from the first place the
> clk was registered. When registering the clk, the core->phase
> geting from ->get_phase() may return negative value indicating
> error. This is quite common since the clk's phase may be highly
> related to its praent chain, but it was temporary orphan when

parent

> registered, since its parent chain hadn't be ready at that time,
> so the clk drivers decide to return error in this case. However,
> if no clk_set_phase is called, core->phase would never be updated.
> This is wrong, and we should try to update it when all its parent
> chain is settled down, like the way of updating clock rate for that.

chains are settled

> It's not derserved to complicate the code but just update it if

deserved

> seeing it's a nagative number when calling clk_core_get_phase, which

negative

> would be much simple and enough.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---
>
>  drivers/clk/clk.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0f686a9..b49e4c8 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2370,6 +2370,15 @@ static int clk_core_get_phase(struct clk_core *core)
>         int ret;
>
>         clk_prepare_lock();
> +       /*
> +        * clk_set_phase always set the phase in [0, 360],
> +        * so the only reason for core->phase to be nagative

a negative

> +        * number is it's a error number propagated back from

an error

> +        * the clk drivers. So we should try to update it if
> +        * possible.
> +        */
> +       if (core->phase < 0 && core->ops->get_phase)
> +               core->phase = core->ops->get_phase(core->hw);

Can this happen if core->ops->get_phase does not exist?
If yes, we're stuck with a negative number forever?

>         ret = core->phase;
>         clk_prepare_unlock();
>
> --
> 1.9.1

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
