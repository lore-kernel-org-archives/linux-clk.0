Return-Path: <narmstrong@baylibre.com>
Return-Path: <narmstrong@baylibre.com>
Subject: Re: [PATCH 2/2] clk: meson: use devm_of_clk_add_hw_provider
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20180118120831.8349-1-jbrunet@baylibre.com>
 <20180118120831.8349-3-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <a54cff83-33f4-6767-9f0e-abbfc19172d0@baylibre.com>
Date: Thu, 18 Jan 2018 16:25:56 +0100
MIME-Version: 1.0
In-Reply-To: <20180118120831.8349-3-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 18/01/2018 13:08, Jerome Brunet wrote:
> There is no remove callbacks in meson's clock controllers and
> of_clk_del_provider is never called if of_clk_add_hw_provider has been
> executed, introducing a potential memory leak.
> Fixing this by the using the devm variant.
> 
> In reality, the leak would never happen since these controllers are
> never unloaded once in use ... still, this is worth cleaning.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/axg.c     | 4 ++--
>  drivers/clk/meson/gxbb.c    | 5 +++--
>  drivers/clk/meson/meson8b.c | 4 ++--
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 87aba8e871a0..02f4401d7bc3 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -923,8 +923,8 @@ static int axg_clkc_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> -			clkc_data->hw_onecell_data);
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   clkc_data->hw_onecell_data);
>  }
>  
>  static struct platform_driver axg_driver = {
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index ba1023983d79..472a3cfbfbc5 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -2028,8 +2028,9 @@ static int gxbb_clkc_probe(struct platform_device *pdev)
>  			goto iounmap;
>  	}
>  
> -	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> -			clkc_data->hw_onecell_data);
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   clkc_data->hw_onecell_data);
>  
>  iounmap:
>  	iounmap(clk_base);
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 3ffea80c1308..abac079ff77f 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -878,8 +878,8 @@ static int meson8b_clkc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	return of_clk_add_hw_provider(dev->of_node, of_clk_hw_onecell_get,
> -			&meson8b_hw_onecell_data);
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   &meson8b_hw_onecell_data);
>  }
>  
>  static const struct of_device_id meson8b_clkc_match_table[] = {
> 

Well devm is allocating a devm structure to unregister the clocks when removed, which will never happen
so this allocation is useless.

Anyway it's cleaner if we do some other stuff after this call in the future.

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
