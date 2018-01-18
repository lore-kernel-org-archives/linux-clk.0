Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] clk: meson: use dev pointer where possible
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180118120831.8349-1-jbrunet@baylibre.com>
 <20180118120831.8349-2-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <6689fcc2-6f9d-1c6d-c6fe-4ccd4928b7dd@baylibre.com>
Date: Thu, 18 Jan 2018 16:25:58 +0100
MIME-Version: 1.0
In-Reply-To: <20180118120831.8349-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 18/01/2018 13:08, Jerome Brunet wrote:
> The 'dev' pointer is directly available in gxbb and axg clock
> controller, so consistently use it instead of going the through the
> 'pdev' pointer once in while
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg.c  | 8 ++++----
>  drivers/clk/meson/gxbb.c | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 1294f3ad7cd5..87aba8e871a0 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -873,7 +873,7 @@ static int axg_clkc_probe(struct platform_device *pdev)
>  	void __iomem *clk_base;
>  	int ret, clkid, i;
>  
> -	clkc_data = of_device_get_match_data(&pdev->dev);
> +	clkc_data = of_device_get_match_data(dev);
>  	if (!clkc_data)
>  		return -EINVAL;
>  
> @@ -881,9 +881,9 @@ static int axg_clkc_probe(struct platform_device *pdev)
>  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	if (!res)
>  		return -EINVAL;
> -	clk_base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> +	clk_base = devm_ioremap(dev, res->start, resource_size(res));
>  	if (!clk_base) {
> -		dev_err(&pdev->dev, "Unable to map clk base\n");
> +		dev_err(dev, "Unable to map clk base\n");
>  		return -ENXIO;
>  	}
>  
> @@ -918,7 +918,7 @@ static int axg_clkc_probe(struct platform_device *pdev)
>  		ret = devm_clk_hw_register(dev,
>  					clkc_data->hw_onecell_data->hws[clkid]);
>  		if (ret) {
> -			dev_err(&pdev->dev, "Clock registration failed\n");
> +			dev_err(dev, "Clock registration failed\n");
>  			return ret;
>  		}
>  	}
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index af24455af5b4..ba1023983d79 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1976,7 +1976,7 @@ static int gxbb_clkc_probe(struct platform_device *pdev)
>  	int ret, clkid, i;
>  	struct device *dev = &pdev->dev;
>  
> -	clkc_data = of_device_get_match_data(&pdev->dev);
> +	clkc_data = of_device_get_match_data(dev);
>  	if (!clkc_data)
>  		return -EINVAL;
>  
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
