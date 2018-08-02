Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Amit Nischal <anischal@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1532942540-2814-2-git-send-email-anischal@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Odelu Kukatla <okukatla@codeaurora.org>, Taniya Das <tdas@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Amit Nischal <anischal@codeaurora.org>
References: <1532942540-2814-1-git-send-email-anischal@codeaurora.org>
 <1532942540-2814-2-git-send-email-anischal@codeaurora.org>
Message-ID: <153322925025.10763.7919558124009549240@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2] clk: qcom: Add camera clock controller driver for SDM845
Date: Thu, 02 Aug 2018 10:00:50 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Amit Nischal (2018-07-30 02:22:20)
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm=
845.c
> new file mode 100644
> index 0000000..702ca66
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -0,0 +1,1744 @@
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] =3D {
> +       F(19200000, P_BI_TCXO, 1, 0, 0),
> +       F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
> +       F(200000000, P_CAM_CC_PLL0_OUT_EVEN, 3, 0, 0),
> +       F(404000000, P_CAM_CC_PLL1_OUT_EVEN, 2, 0, 0),
> +       F(480000000, P_CAM_CC_PLL2_OUT_EVEN, 1, 0, 0),
> +       F(600000000, P_CAM_CC_PLL0_OUT_EVEN, 1, 0, 0),
> +       { }
> +};
> +
> +/*
> + * As per HW design, some of the CAMCC RCGs needs to
> + * move to XO clock during their clock disable so using

Per hw design sure, but what about hw design is causing this?

> + * clk_rcg2_shared_ops for such RCGs.
> + * Also, use CLK_SET_RATE_PARENT flag for the RCGs which
> + * have non-fixed PLL as parent source and requires

Mention the PLL that isn't fixed?

> + * reconfiguration of the PLL frequency.
> + */
> +static struct clk_rcg2 cam_cc_bps_clk_src =3D {
> +       .cmd_rcgr =3D 0x600c,
> +       .mnd_width =3D 0,
