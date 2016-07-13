Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: Michael Turquette <mturquette@baylibre.com>
To: =?utf-8?q?Alexander_M=C3=BCller?= <serveralex@gmail.com>,
 linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <1468432181-9550-1-git-send-email-serveralex@gmail.com>
 <1468432181-9550-8-git-send-email-serveralex@gmail.com>
In-Reply-To: <1468432181-9550-8-git-send-email-serveralex@gmail.com>
Message-ID: <146844682774.73491.3554377408257493400@resonance>
Subject: Re: [PATCH v2 7/7] meson: clk: Add support for clock gates
Date: Wed, 13 Jul 2016 14:53:47 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Alexander M=C3=BCller (2016-07-13 10:49:41)
> This patch adds support for the meson8b clock gates. Most of
> them are disabled by Amlogic U-Boot, but need to be enabled
> for ethernet, USB and many other components.
> =

> Signed-off-by: Alexander M=C3=BCller <serveralex@gmail.com>
> ---
>  drivers/clk/meson/meson8b.c | 263 ++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/clk/meson/meson8b.h |   5 +
>  2 files changed, 268 insertions(+)
> =

> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 9a656d9..0a0e01d 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -27,6 +27,20 @@
>  #include "clkc.h"
>  #include "meson8b.h"
>  =

> +#define MESON8B_GATE(_name, _reg, _bit)                                 =
       \
> +struct clk_gate meson8b_##_name =3D {                                   =
 \
> +       .reg =3D (void __iomem *) _reg,                                  =
 \
> +       .bit_idx =3D (_bit),                                             =
 \
> +       .lock =3D &clk_lock,                                             =
 \
> +       .hw.init =3D &(struct clk_init_data) {                           =
 \
> +               .name =3D #_name,                                        =
 \
> +               .ops =3D &clk_gate_ops,                                  =
 \
> +               .parent_names =3D (const char *[]){ "clk81" },           =
 \
> +               .num_parents =3D 1,                                      =
 \
> +               .flags =3D (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),    =
 \
> +       },                                                              \
> +};

As I mentioned in patch #6, let's keep this shared between meson8b and
gxbb in clkc.h.

> +
>  static DEFINE_SPINLOCK(clk_lock);
>  =

>  static const struct pll_rate_table sys_pll_rate_table[] =3D {
> @@ -311,6 +325,92 @@ struct clk_gate meson8b_clk81 =3D {
>         },
>  };
>  =

> +/* Everything Else (EE) domain gates */
> +
> +static MESON8B_GATE(ddr, HHI_GCLK_MPEG0, 0);

To do the above, "ddr" will need to become "meson8b_ddr", etc.

Regards,
Mike
