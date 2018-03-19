Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
MIME-Version: 1.0
To: Rob Herring <robh+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <f1445b95864af04f1f90d3be96d0a485d1bb4560.1520327262.git.ryder.lee@mediatek.com>
References: <cover.1520327262.git.ryder.lee@mediatek.com>
 <f1445b95864af04f1f90d3be96d0a485d1bb4560.1520327262.git.ryder.lee@mediatek.com>
Message-ID: <152149148431.242365.4625152577833480987@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 3/6] clk: mediatek: add audsys support for MT2701
Date: Mon, 19 Mar 2018 13:31:24 -0700
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Garlic Tseng <garlic.tseng@mediatek.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Quoting Ryder Lee (2018-03-06 01:09:28)
> +
> +static const struct of_device_id of_match_clk_mt2701_aud[] = {
> +       { .compatible = "mediatek,mt2701-audsys", },
> +       {}
> +};
> +
> +static int clk_mt2701_aud_probe(struct platform_device *pdev)
> +{
> +       struct clk_onecell_data *clk_data;
> +       struct device_node *node = pdev->dev.of_node;
> +       int r;
> +
> +       clk_data = mtk_alloc_clk_data(CLK_AUD_NR);
> +
> +       mtk_clk_register_gates(node, audio_clks, ARRAY_SIZE(audio_clks),
> +                              clk_data);
> +
> +       r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r) {
> +               dev_err(&pdev->dev,
> +                       "could not register clock provider: %s: %d\n",
> +                       pdev->name, r);
> +
> +               return r;
> +       }

This fails to remove the clk provider when devm_of_platform_populate()
returns an error.

> +
> +       return devm_of_platform_populate(&pdev->dev);
> +}
> +
> +static struct platform_driver clk_mt2701_aud_drv = {
> +       .probe = clk_mt2701_aud_probe,
> +       .driver = {
> +               .name = "clk-mt2701-aud",
> +               .of_match_table = of_match_clk_mt2701_aud,
> +       },
> +};
> +
> +builtin_platform_driver(clk_mt2701_aud_drv);

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
