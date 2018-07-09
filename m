Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1528285308-25477-2-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1528285308-25477-1-git-send-email-anischal@codeaurora.org>
 <1528285308-25477-2-git-send-email-anischal@codeaurora.org>
Message-ID: <153111447519.143105.17241493270191899078@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/4] clk: qcom: gdsc: Add support to enable/disable the clocks
 with GDSC
Date: Sun, 08 Jul 2018 22:34:35 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-06-06 04:41:45)
> For some of the GDSCs, there is a requirement to enable/disable the
> few clocks before turning on/off the gdsc power domain. Add support

Why is there a requirement? Do the clks need to be in hw control mode or
they can't be turned off when the GDSC is off? It's hard for me to
understand with these vague statements.

> for the same by specifying a list of clk_hw pointers per gdsc and
> enable/disable them along with power domain on/off callbacks.
> =

> Signed-off-by: Amit Nischal <anischal@codeaurora.org>
> ---
>  drivers/clk/qcom/gdsc.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gdsc.h |  5 +++++
>  2 files changed, 49 insertions(+)
> =

> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index a077133..b6adca1 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -12,6 +12,8 @@
>   */
> =

>  #include <linux/bitops.h>
> +#include <linux/clk.h>

Ugh.

> +#include <linux/clk-provider.h>

Both, really?

>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/jiffies.h>
> @@ -208,11 +210,41 @@ static inline void gdsc_assert_reset_aon(struct gds=
c *sc)
>         regmap_update_bits(sc->regmap, sc->clamp_io_ctrl,
>                            GMEM_RESET_MASK, 0);
>  }
> +
> +static int gdsc_clk_prepare_enable(struct gdsc *sc)
> +{
> +       int i, ret;
> +
> +       for (i =3D 0; i < sc->clk_count; i++) {
> +               ret =3D clk_prepare_enable(sc->clk_hws[i]->clk);
> +               if (ret) {
> +                       for (i--; i >=3D 0; i--)
> +                               clk_disable_unprepare(sc->clk_hws[i]->clk=
);
> +                       return ret;
> +               }
> +       }
> +       return 0;
> +}
> +

Looks an awful lot like bulk_enable clk API.
