Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1530186451-24648-3-git-send-email-tdas@codeaurora.org>
Cc: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <tdas@codeaurora.org>
References: <1530186451-24648-1-git-send-email-tdas@codeaurora.org>
 <1530186451-24648-3-git-send-email-tdas@codeaurora.org>
Message-ID: <153111810881.143105.16566097827979485161@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v2 2/2] clk: qcom: gcc: Register QUPv3 RCGs for DFS on SDM845
Date: Sun, 08 Jul 2018 23:35:08 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Taniya Das (2018-06-28 04:47:31)
> @@ -3437,7 +3457,12 @@ static int gcc_sdm845_probe(struct platform_device=
 *pdev)
>         regmap_update_bits(regmap, 0x48190, BIT(0), 0x1);
>         regmap_update_bits(regmap, 0x52004, BIT(22), 0x1);
> =

> -       return qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
> +       ret =3D qcom_cc_really_probe(pdev, &gcc_sdm845_desc, regmap);
> +       if (ret)
> +               return ret;
> +
> +       return qcom_cc_register_rcg_dfs(pdev, gcc_dfs_clocks,
> +                                       ARRAY_SIZE(gcc_dfs_clocks));

This looks backwards. We shouldn't expose the clks to drivers and then
make their functionality work by registering dfs clks. The order should
be swapped.
