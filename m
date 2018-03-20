Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, afaerber@suse.de,
 mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180317100952.28538-9-manivannan.sadhasivam@linaro.org>
Cc: liuwei@actions-semi.com, mp-cs@actions-semi.com, 96boards@ucrobotics.com,
 devicetree@vger.kernel.org, davem@davemloft.net, mchehab@kernel.org,
 daniel.thompson@linaro.org, amit.kucheria@linaro.org,
 viresh.kumar@linaro.org, hzhang@ucrobotics.com, bdong@ucrobotics.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, manivannanece23@gmail.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20180317100952.28538-1-manivannan.sadhasivam@linaro.org>
 <20180317100952.28538-9-manivannan.sadhasivam@linaro.org>
Message-ID: <152150829204.254778.2737344357539002182@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v5 08/12] clk: actions: Add factor clock support
Date: Mon, 19 Mar 2018 18:11:32 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Manivannan Sadhasivam (2018-03-17 03:09:48)
> +
> +static int clk_val_best(struct clk_hw *hw, unsigned long rate,
> +                       unsigned long *best_parent_rate)
> +{
[...]
> +               }
> +
> +               parent_rate =3D clk_hw_round_rate(clk_hw_get_parent(hw),
> +                               try_parent_rate);
> +               cur_rate =3D DIV_ROUND_UP(parent_rate, clkt->div) * clkt-=
>mul;
> +               if (cur_rate <=3D rate && cur_rate > best) {
> +                       bestval =3D clkt->val;
> +                       best =3D cur_rate;
> +                       *best_parent_rate =3D parent_rate;
> +               }
> +       }
> +
> +       if (!bestval) {
> +               bestval =3D _get_table_maxval(clkt);
> +               *best_parent_rate =3D clk_hw_round_rate(
> +                               clk_hw_get_parent(hw), 1);
> +       }
> +
> +       return bestval;

Also, if this is largely copy/paste from the factor clk code then
perhaps those functions can be exported to here and reused instead of
copy/paste.

> +}
