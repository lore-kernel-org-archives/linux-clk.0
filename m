Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1522665945-28147-4-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1522665945-28147-1-git-send-email-tdas@codeaurora.org>
 <1522665945-28147-4-git-send-email-tdas@codeaurora.org>
Message-ID: <152303280515.143116.7021012753371503067@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 3/3] clk: qcom: gdsc: Add support to poll CFG register to check
 GDSC state
Date: Fri, 06 Apr 2018 09:40:05 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-04-02 03:45:45)
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index e89584e..e0c83ba 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -83,6 +88,38 @@ static int gdsc_poll_status(struct gdsc *sc, unsigned =
int reg, bool en)
>         return -ETIMEDOUT;
>  }
> =

> +static int gdsc_is_enabled_by_poll_cfg_reg(struct gdsc *sc, bool en)
> +{
> +       u32 val;
> +       int ret;
> +
> +       ret =3D regmap_read(sc->regmap, sc->gdscr + CFG_GDSCR_OFFSET, &va=
l);
> +       if (ret)
> +               return ret;
> +
> +       if (en)
> +               return !!(val & GDSC_POWER_UP_COMPLETE);
> +       else
> +               return !(val & GDSC_POWER_DOWN_COMPLETE);

Make this into

	if (en)
		return ...

	return ...

> +}
> +
> +static int gdsc_poll_cfg_status(struct gdsc *sc, bool en)
> +{
> +       ktime_t start =3D ktime_get();
> +       ktime_t timeout =3D
> +               (sc->flags & GDS_TIMEOUT) ? TIMEOUT_US_GDS : TIMEOUT_US;
> +
> +       do {
> +               if (gdsc_is_enabled_by_poll_cfg_reg(sc, en) =3D=3D en)
> +                       return 0;
> +       } while (ktime_us_delta(ktime_get(), start) < timeout);
> +
> +       if (gdsc_is_enabled_by_poll_cfg_reg(sc, en) =3D=3D en)
> +               return 0;
> +
> +       return -ETIMEDOUT;
> +}
> +
>  static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>  {
>         int ret;
> @@ -106,6 +143,9 @@ static int gdsc_toggle_logic(struct gdsc *sc, bool en)
>                 return 0;
>         }
> =

> +       if (sc->flags & POLL_CFG_GDSCR)
> +               return gdsc_poll_cfg_status(sc, en);
> +
>         if (sc->gds_hw_ctrl) {
>                 status_reg =3D sc->gds_hw_ctrl;
>                 /*
> @@ -258,8 +298,12 @@ static int gdsc_disable(struct generic_pm_domain *do=
main)
>                  */
>                 udelay(1);
> =

> -               reg =3D sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
> -               ret =3D gdsc_poll_status(sc, reg, true);
> +               if (sc->flags & POLL_CFG_GDSCR) {
> +                       ret =3D gdsc_poll_cfg_status(sc, true);
> +               } else {
> +                       reg =3D sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->g=
dscr;
> +                       ret =3D gdsc_poll_status(sc, reg, true);
> +               }

Maybe this can be pushed into the gdsc_poll_status() function so that
we can keep the "how do we poll status bit" logic in one place.

>                 if (ret)
>                         return ret;
>         }
