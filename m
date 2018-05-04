Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1525428158-29147-2-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1525428158-29147-1-git-send-email-tdas@codeaurora.org>
 <1525428158-29147-2-git-send-email-tdas@codeaurora.org>
Message-ID: <152545267793.138124.15345698220033125655@swboyd.mtv.corp.google.com>
Subject: Re: [v8] clk: qcom: clk-rpmh: Add QCOM RPMh clock driver
Date: Fri, 04 May 2018 09:51:17 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-05-04 03:02:38)
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> new file mode 100644
> index 0000000..944fe04
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -0,0 +1,334 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +};
> +
> +struct clk_rpmh_desc {
> +       struct clk_hw **clks;
> +       size_t num_clks;
> +};

This could be replaced with the clk_hw_onecell_data struct and then the
only problem becomes the const part which seems pretty impossible to fix
at this point. One "workaround" is to memdup the structure. Ugh.

> +
> +static DEFINE_MUTEX(rpmh_clk_lock);
> +
> +#define __DEFINE_CLK_RPMH(_platform, _name, _name_active, _res_name,   \
> +                         _res_en_offset, _res_on, _div)                \
> +       static struct clk_rpmh _platform##_##_name_active;              \
> +       static struct clk_rpmh _platform##_##_name =3D {                 =
 \
[..]
> +
> +static unsigned long clk_rpmh_recalc_rate(struct clk_hw *hw,
> +                                       unsigned long prate)
> +{
> +       struct clk_rpmh *r =3D to_clk_rpmh(hw);
> +       unsigned long rate =3D prate;
> +
> +       /*
> +        * RPMh clocks have a fixed rate. Return static rate.
> +        */
> +       do_div(rate, r->div);

Integer division won't suffice?

> +       return rate;
> +}
[...]
> +
> +static struct clk_hw *of_clk_rpmh_hw_get(struct of_phandle_args *clkspec,
> +                                            void *data)
> +{
> +       struct clk_hw *hw_clks =3D data;
> +       unsigned int idx =3D clkspec->args[0];
> +
> +       if (idx < 0) {

It can't be less than 0 though because it's unsigned.

> +               pr_err("%s: invalid index %u\n", __func__, idx);
> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       return &hw_clks[idx];
> +}
