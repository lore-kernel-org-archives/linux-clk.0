Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <CAOMZO5BfDRsO=gn_SjkDa_09KEf_EjZcfM5VQawaR1-dQE0o0g@mail.gmail.com>
References: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
 <20180111211948.GL28313@codeaurora.org> <CAOMZO5BfDRsO=gn_SjkDa_09KEf_EjZcfM5VQawaR1-dQE0o0g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Jan 2018 10:42:25 +0100
Message-ID: <CAMuHMdU4zyKvpMbbJpOTxnMtACEQc_X9yWceUoB3xUp3RcFWvg@mail.gmail.com>
Subject: Re: Warnings from drivers/clk/clk.c
To: Fabio Estevam <festevam@gmail.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Sascha Hauer <kernel@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Fabio,

On Mon, Jan 15, 2018 at 5:48 PM, Fabio Estevam <festevam@gmail.com> wrote:
> On Thu, Jan 11, 2018 at 7:19 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
>> We have two WARN_ON in this function. Do you know which one hit
>> (makes me think we should put a printk in here now and also
>> include the clk name).
>
> Yes, having the clk name that causes the warning really helps debugging.
>
> Do you mean like this?
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0f686a9..6fed292 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -681,8 +681,12 @@ static void clk_core_unprepare(struct clk_core *core)
>         if (!core)
>                 return;
>
> -       if (WARN_ON(core->prepare_count == 0))
> +       if (core->prepare_count == 0) {
> +               pr_err("%s: %s called with enable_count not zero\n",
> +                      __func__, core->name);
> +               WARN_ON(1);
>                 return;
> +       }

I believe you can just replace WARN_ON() by WARN(condition, format...)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
