Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Carlo Caione <carlo@caione.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180328025050.221585-5-yixun.lan@amlogic.com>
Cc: Qiufang Dai <qiufang.dai@amlogic.com>, Yixun Lan <yixun.lan@amlogic.com>,
 Rob Herring <robh@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20180328025050.221585-1-yixun.lan@amlogic.com>
 <20180328025050.221585-5-yixun.lan@amlogic.com>
Message-ID: <152304527293.94378.2019634000949753214@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 4/6] clk: meson-axg: Add AO Clock and Reset controller driver
Date: Fri, 06 Apr 2018 13:07:52 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Yixun Lan (2018-03-27 19:50:48)
> +       [CLKID_AO_SAR_ADC_CLK]  =3D &axg_saradc_gate,
> +};
> +
> +static struct clk_hw_onecell_data axg_aoclk_onecell_data =3D {

const?

> +       .hws =3D {
> +               [CLKID_AO_REMOTE]       =3D &remote_ao.hw,
> +               [CLKID_AO_I2C_MASTER]   =3D &i2c_master_ao.hw,
> +               [CLKID_AO_I2C_SLAVE]    =3D &i2c_slave_ao.hw,
> +               [CLKID_AO_UART1]        =3D &uart1_ao.hw,
> +               [CLKID_AO_UART2]        =3D &uart2_ao.hw,
> +               [CLKID_AO_IR_BLASTER]   =3D &ir_blaster_ao.hw,
> +               [CLKID_AO_SAR_ADC]      =3D &saradc_ao.hw,
> +               [CLKID_AO_CLK81]        =3D &ao_clk81.hw,
> +               [CLKID_AO_SAR_ADC_SEL]  =3D &axg_saradc_mux.hw,
> +               [CLKID_AO_SAR_ADC_DIV]  =3D &axg_saradc_div.hw,
> +               [CLKID_AO_SAR_ADC_CLK]  =3D &axg_saradc_gate.hw,
> +       },
> +       .num =3D NR_CLKS,
> +};
> +
> +static struct meson_aoclk_data axg_aoclkc_data =3D {

const?

> +       .reset_reg      =3D AO_RTI_GEN_CNTL_REG0,
> +       .num_reset      =3D ARRAY_SIZE(axg_aoclk_reset),
> +       .reset          =3D axg_aoclk_reset,
> +       .num_clks       =3D ARRAY_SIZE(axg_aoclk_regmap),
> +       .clks           =3D axg_aoclk_regmap,
> +       .hw_data        =3D &axg_aoclk_onecell_data,
> +};
