Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1523263306-28665-4-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1523263306-28665-1-git-send-email-tdas@codeaurora.org>
 <1523263306-28665-4-git-send-email-tdas@codeaurora.org>
Message-ID: <152393945465.51482.14681802799278909180@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 3/3] clk: qcom: gdsc: Add support to poll CFG register to
 check GDSC state
Date: Mon, 16 Apr 2018 21:30:54 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-04-09 01:41:46)
> @@ -64,18 +69,43 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>         return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK,=
 val);
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
> +
> +       return !(val & GDSC_POWER_DOWN_COMPLETE);
> +}
> +
>  static int gdsc_poll_status(struct gdsc *sc, unsigned int reg, bool en)
>  {
>         ktime_t start;
> =

>         start =3D ktime_get();
>         do {
> -               if (gdsc_is_enabled(sc, reg) =3D=3D en)
> -                       return 0;
> +               if (sc->flags & POLL_CFG_GDSCR) {
> +                       if (gdsc_is_enabled_by_poll_cfg_reg(sc, en) =3D=
=3D en)
> +                               return 0;
> +               } else {
> +                       if (gdsc_is_enabled(sc, reg) =3D=3D en)
> +                               return 0;

Ok, I thought you would bury the is_enabled_by_poll_cfg_reg() stuff into
gdsc_is_enabled() directly. Because that function is used in one more
place than here, in gdsc_init(), to figure out if a GDSC is on at boot
time. The sc->gds_hw_ctrl check should be able to get buried into
gdsc_is_enabled() as well so that the function doesn't have to take a
register at all.

> +               }
>         } while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
> =

> -       if (gdsc_is_enabled(sc, reg) =3D=3D en)
> -               return 0;
> +       if (sc->flags & POLL_CFG_GDSCR) {
> +               if (gdsc_is_enabled_by_poll_cfg_reg(sc, en) =3D=3D en)
> +                       return 0;
> +       } else {
> +               if (gdsc_is_enabled(sc, reg) =3D=3D en)
> +                       return 0;
> +       }

And then this duplicate diff wouldn't happen either.

> =

>         return -ETIMEDOUT;
>  }
> @@ -254,6 +284,7 @@ static int gdsc_disable(struct generic_pm_domain *dom=
ain)
>                 udelay(1);
> =

>                 reg =3D sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
> +

This change shouldn't be here?

>                 ret =3D gdsc_poll_status(sc, reg, true);
>                 if (ret)
>                         return ret;
