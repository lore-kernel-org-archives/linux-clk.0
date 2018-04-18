Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <f563532b5c43960a61ae12a37a131be8@codeaurora.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Andy Gross <andy.gross@linaro.org>,
 David Brown <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1522761761-15262-1-git-send-email-anischal@codeaurora.org>
 <1522761761-15262-4-git-send-email-anischal@codeaurora.org>
 <152393708031.51482.15076025836699678476@swboyd.mtv.corp.google.com>
 <f563532b5c43960a61ae12a37a131be8@codeaurora.org>
Message-ID: <152409449007.51482.18266317845214727195@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 3/3] clk: qcom: Add Global Clock controller (GCC) driver for
 SDM845
Date: Wed, 18 Apr 2018 16:34:50 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-04-18 06:03:49)
> On 2018-04-17 09:21, Stephen Boyd wrote:
> > Quoting Amit Nischal (2018-04-03 06:22:41)
> >> +
> >> +static struct clk_rcg2 gcc_usb30_prim_mock_utmi_clk_src =3D {
> >> +       .cmd_rcgr =3D 0xf030,
> >> +       .mnd_width =3D 0,
> >> +       .hid_width =3D 5,
> >> +       .parent_map =3D gcc_parent_map_0,
> >> +       .freq_tbl =3D ftbl_gcc_usb30_prim_mock_utmi_clk_src,
> >> +       .clkr.hw.init =3D &(struct clk_init_data){
> >> +               .name =3D "gcc_usb30_prim_mock_utmi_clk_src",
> >> +               .parent_names =3D gcc_parent_names_0,
> >> +               .num_parents =3D 4,
> >> +               .ops =3D &clk_rcg2_shared_ops,
> > =

> > Still shared? Why?
> =

> We would require the shared_ops for clocks which are configured by
> bootloader.

Why? The bootloader is not active anymore.

> > =

> >> +
> >> +       return qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
> >> +}
> >> +
> >> diff --git a/include/dt-bindings/clock/qcom,gcc-sdm845.h =

> >> b/include/dt-bindings/clock/qcom,gcc-sdm845.h
> >> new file mode 100644
> >> index 0000000..e27d8e2
> >> --- /dev/null
> >> +++ b/include/dt-bindings/clock/qcom,gcc-sdm845.h
> >> @@ -0,0 +1,242 @@
> > [...]
> >> +#define GCC_VDDA_VS_CLK                                               =

> >>  180
> >> +#define GCC_VDDCX_VS_CLK                                       181
> >> +#define GCC_VDDMX_VS_CLK                                       182
> >> +#define GCC_VS_CTRL_AHB_CLK                                    183
> >> +#define GCC_VS_CTRL_CLK                                               =

> >>  184
> >> +#define GCC_VS_CTRL_CLK_SRC                                    185
> >> +#define GCC_VSENSOR_CLK_SRC                                    186
> >> +#define GPLL4                                                  187
> > =

> > Do you have the define for the quad spi clks? And the implementation =

> > for
> > it?
> > =

> =

> In SDM845, Quad SPI clocks are part of gcc_qupv*_wrap*_s* clock group.

Ok thanks. I must have messed up my math before because it didn't match
what bootloader was doing last time I checked.
