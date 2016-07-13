Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?Alexander_M=C3=BCller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
 <1468432181-9550-7-git-send-email-serveralex@gmail.com>
In-Reply-To: <1468432181-9550-7-git-send-email-serveralex@gmail.com>
Message-ID: <146844555421.73491.17534974282265619018@resonance>
Subject: Re: [PATCH v2 6/7] gxbb: clk: Move MESON_GATE macro to gxbb
Date: Wed, 13 Jul 2016 14:32:34 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Alexander,

Quoting Alexander M=C3=BCller (2016-07-13 10:49:40)
> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
> ---
>  drivers/clk/meson/clkc.h |  14 ----
>  drivers/clk/meson/gxbb.c | 176 +++++++++++++++++++++++++----------------=
------
>  2 files changed, 95 insertions(+), 95 deletions(-)
> =

> diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
> index 53326c3..061a01e 100644
> --- a/drivers/clk/meson/clkc.h
> +++ b/drivers/clk/meson/clkc.h
> @@ -97,20 +97,6 @@ struct meson_clk_mpll {
>         spinlock_t *lock;
>  };
>  =

> -#define MESON_GATE(_name, _reg, _bit)                                  \
> -struct clk_gate gxbb_##_name =3D {                                      =
         \

Please leave this macro in clkc.h, but change the above line to:

	#define MESON_GATE(_name, _reg, _bit)	\
	struct clk_gate _name =3D {		\

Note that gxbb_##_name is replaced with _name. I should have done it
like this from the beginning but it's a bit of a brain fart.

>  /* Everything Else (EE) domain gates */
> -static MESON_GATE(ddr, HHI_GCLK_MPEG0, 0);

Then reflow the above gxbb gate clock like so:

	static MESON_GATE(gxbb_ddr, HHI_GCLK_MPEG0, 0);

Then you can re-use the same macro in your meson8b driver by prefixing
all of your gate clocks with "meson8b_".

Regards,
Mike
