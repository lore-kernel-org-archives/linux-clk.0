Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1430415954-29517-4-git-send-email-sebastian.hesselbarth@gmail.com>
References: <1430415954-29517-1-git-send-email-sebastian.hesselbarth@gmail.com>
	<1430415954-29517-4-git-send-email-sebastian.hesselbarth@gmail.com>
Date: Thu, 30 Apr 2015 15:20:38 -0300
Message-ID: <CAOMZO5BYnE2epGrWbnNnaqEt1r6+xoPYWKtjc8w-Ze22aitgXA@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: si5351: Do not pass struct clk in platform_data
From: Fabio Estevam <festevam@gmail.com>
To: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Jean-Francois Moine <moinejf@free.fr>, Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	Michael Welling <mwelling@ieee.org>, Russell King <rmk+linux@arm.linux.org.uk>,
	linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Thu, Apr 30, 2015 at 2:45 PM, Sebastian Hesselbarth
<sebastian.hesselbarth@gmail.com> wrote:

>          * property silabs,pll-source : <num src>, [<..>]
>          * allow to selectively set pll source
> @@ -1328,8 +1321,17 @@ static int si5351_i2c_probe(struct i2c_client *client,
>         i2c_set_clientdata(client, drvdata);
>         drvdata->client = client;
>         drvdata->variant = variant;
> -       drvdata->pxtal = pdata->clk_xtal;
> -       drvdata->pclkin = pdata->clk_clkin;
> +       drvdata->pxtal = devm_clk_get(&client->dev, "xtal");
> +       drvdata->pclkin = devm_clk_get(&client->dev, "clkin");
> +
> +       if (PTR_ERR(drvdata->pxtal) == -EPROBE_DEFER ||
> +           PTR_ERR(drvdata->pclkin) == -EPROBE_DEFER)
> +               return -EPROBE_DEFER;
> +
> +       if (IS_ERR(drvdata->pxtal) && IS_ERR(drvdata->pclkin)) {

Don't you want || instead?
