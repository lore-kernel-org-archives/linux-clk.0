Return-Path: <geert.uytterhoeven@gmail.com>
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <1459510635-8204-2-git-send-email-narmstrong@baylibre.com>
References: <1459510635-8204-1-git-send-email-narmstrong@baylibre.com>
	<1459510635-8204-2-git-send-email-narmstrong@baylibre.com>
Date: Mon, 4 Apr 2016 11:10:02 +0200
Message-ID: <CAMuHMdXbruqfFM5NU3KLHxeGvERyv0Jx19-PozzTzWMn_AHnLA@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: Switch clk handling to signed long and introduce
 Quantum State
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-clk <linux-clk@vger.kernel.org>, Michael Turquette <mturquette@baylibre.com>,
	sjan@baylibre.com, Axel Haslam <ahaslam@baylibre.com>, abailon@baylibre.com
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Neil,

On Fri, Apr 1, 2016 at 1:37 PM, Neil Armstrong <narmstrong@baylibre.com> wrote:
> In order to handle the quantum clock state for rate, accuracy and phase,
> switch all core functions to signed long.
>
> Also add QUATUM state flag and QUANTUM return value.
>
> Set QUANTUM default state in clk_core_init.

Thanks for your patch!

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/clk.c            | 104 +++++++++++++++++++++++--------------------
>  include/linux/clk-provider.h |  12 +++--
>  include/linux/clk.h          |  22 ++++-----
>  3 files changed, 74 insertions(+), 64 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index fb74dc1..db7eced 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -51,9 +51,9 @@ struct clk_core {
>         struct clk_core         **parents;
>         u8                      num_parents;
>         u8                      new_parent_index;
> -       unsigned long           rate;
> -       unsigned long           req_rate;
> -       unsigned long           new_rate;
> +       long                    rate;
> +       long                    req_rate;
> +       long                    new_rate;

To account for the imaginary part of the phase, I think this should be a
complex number, not just a long.

Apart from that, it's definitely a step in the right direction!

Sorry for the late comments, I was on holidays last Friday...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
