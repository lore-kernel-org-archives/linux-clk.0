Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20180619134051.16726-2-jbrunet@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org,
 David Brown <david.brown@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Quentin Schulz <quentin.schulz@free-electrons.com>,
 Maxime Ripard <maxime.ripard@free-electrons.com>
References: <20180619134051.16726-1-jbrunet@baylibre.com>
 <20180619134051.16726-2-jbrunet@baylibre.com>
Message-ID: <20180619170307.33232.70445@harbor.lan>
Subject: Re: [PATCH 1/2] clk: qcom: drop CLK_SET_RATE_GATE from sdc clocks
Date: Tue, 19 Jun 2018 10:03:07 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2018-06-19 06:40:50)
> the mmci driver (drivers/mmc/host/mmci.c) does the following sequence:
> * clk_prepare_enable()
> * clk_set_rate()
> =

> on SDCx_clk which is a children of SDCx_src. SDCx_src has
> CLK_SET_RATE_GATE so this sequence should not be allowed but this was not
> enforced. IOW, the flag is ignored. Dropping the flag won't change
> anything to the current behaviour of the platform.
> =

> CLK_SET_RATE_GATE is being fixed and enforced now. If the flag was kept,
> the mmci driver would receive -EBUSY when calling clk_set_rate()
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied to clk-qcom-set-rate-gate.

Thanks,
Mike

> ---
>  drivers/clk/qcom/gcc-ipq806x.c | 3 ---
>  drivers/clk/qcom/gcc-mdm9615.c | 2 --
>  drivers/clk/qcom/gcc-msm8660.c | 5 -----
>  drivers/clk/qcom/gcc-msm8960.c | 5 -----
>  4 files changed, 15 deletions(-)
> =

> diff --git a/drivers/clk/qcom/gcc-ipq806x.c b/drivers/clk/qcom/gcc-ipq806=
x.c
> index 28eb200d0f1e..5f61225657ab 100644
> --- a/drivers/clk/qcom/gcc-ipq806x.c
> +++ b/drivers/clk/qcom/gcc-ipq806x.c
> @@ -1220,7 +1220,6 @@ static struct clk_rcg sdc1_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1269,7 +1268,6 @@ static struct clk_rcg sdc3_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1353,7 +1351,6 @@ static struct clk_rcg tsif_ref_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> diff --git a/drivers/clk/qcom/gcc-mdm9615.c b/drivers/clk/qcom/gcc-mdm961=
5.c
> index b99dd406e907..849046fbed6d 100644
> --- a/drivers/clk/qcom/gcc-mdm9615.c
> +++ b/drivers/clk/qcom/gcc-mdm9615.c
> @@ -947,7 +947,6 @@ static struct clk_rcg sdc1_src =3D {
>                         .parent_names =3D gcc_cxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -996,7 +995,6 @@ static struct clk_rcg sdc2_src =3D {
>                         .parent_names =3D gcc_cxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> diff --git a/drivers/clk/qcom/gcc-msm8660.c b/drivers/clk/qcom/gcc-msm866=
0.c
> index c347a0d44bc8..7e930e25c79f 100644
> --- a/drivers/clk/qcom/gcc-msm8660.c
> +++ b/drivers/clk/qcom/gcc-msm8660.c
> @@ -1558,7 +1558,6 @@ static struct clk_rcg sdc1_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1607,7 +1606,6 @@ static struct clk_rcg sdc2_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1656,7 +1654,6 @@ static struct clk_rcg sdc3_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1705,7 +1702,6 @@ static struct clk_rcg sdc4_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1754,7 +1750,6 @@ static struct clk_rcg sdc5_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> diff --git a/drivers/clk/qcom/gcc-msm8960.c b/drivers/clk/qcom/gcc-msm896=
0.c
> index eb551c75fba6..fd495e0471bb 100644
> --- a/drivers/clk/qcom/gcc-msm8960.c
> +++ b/drivers/clk/qcom/gcc-msm8960.c
> @@ -1628,7 +1628,6 @@ static struct clk_rcg sdc1_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1677,7 +1676,6 @@ static struct clk_rcg sdc2_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1726,7 +1724,6 @@ static struct clk_rcg sdc3_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1775,7 +1772,6 @@ static struct clk_rcg sdc4_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> @@ -1824,7 +1820,6 @@ static struct clk_rcg sdc5_src =3D {
>                         .parent_names =3D gcc_pxo_pll8,
>                         .num_parents =3D 2,
>                         .ops =3D &clk_rcg_ops,
> -                       .flags =3D CLK_SET_RATE_GATE,
>                 },
>         }
>  };
> -- =

> 2.14.3
>=20
