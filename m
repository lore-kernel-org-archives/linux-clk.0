Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1529763567-13131-4-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1529763567-13131-1-git-send-email-tdas@codeaurora.org>
 <1529763567-13131-4-git-send-email-tdas@codeaurora.org>
Message-ID: <153109408562.143105.15954380130353645468@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add display clock controller driver for SDM845
Date: Sun, 08 Jul 2018 16:54:45 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-06-23 07:19:27)
> diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-s=
dm845.c
> new file mode 100644
> index 0000000..af437e0
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-sdm845.c
> @@ -0,0 +1,674 @@
> +// SPDX-License-Identifier: GPL-2.0
[...]
> +static struct clk_alpha_pll disp_cc_pll0 =3D {
> +       .offset =3D 0x0,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
> +       .clkr =3D {
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "disp_cc_pll0",
> +                       .parent_names =3D (const char *[]){ "bi_tcxo" },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_fabia_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_byte0_clk_src =3D {
> +       .cmd_rcgr =3D 0x20d0,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_byte0_clk_src",
> +               .parent_names =3D disp_cc_parent_names_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,

Why is there the no cache flag? Last time I asked I don't think I got
any answer, and there isn't a comment here so please at least add a
comment to the code so we don't forget.

> +               .ops =3D &clk_byte2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_byte1_clk_src =3D {
> +       .cmd_rcgr =3D 0x20ec,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_byte1_clk_src",
> +               .parent_names =3D disp_cc_parent_names_0,
> +               .num_parents =3D 4,
> +               .flags =3D CLK_SET_RATE_PARENT | CLK_GET_RATE_NOCACHE,
> +               .ops =3D &clk_byte2_ops,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_disp_cc_mdss_esc0_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_esc0_clk_src =3D {
> +       .cmd_rcgr =3D 0x2108,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_esc0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_esc0_clk_src",
> +               .parent_names =3D disp_cc_parent_names_0,
> +               .num_parents =3D 4,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
> +static struct clk_rcg2 disp_cc_mdss_esc1_clk_src =3D {
> +       .cmd_rcgr =3D 0x2120,
> +       .mnd_width =3D 0,
> +       .hid_width =3D 5,
> +       .parent_map =3D disp_cc_parent_map_0,
> +       .freq_tbl =3D ftbl_disp_cc_mdss_esc0_clk_src,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "disp_cc_mdss_esc1_clk_src",
> +               .parent_names =3D disp_cc_parent_names_0,
> +               .num_parents =3D 4,
> +               .ops =3D &clk_rcg2_ops,
> +       },
> +};
> +
[...]
> +
> +MODULE_LICENSE("GPL v2");

MODULE_DESCRIPTION?
