Return-Path: <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] clk: s2mps11: remove redundant variable
To: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org
References: <1453105525-31506-1-git-send-email-andi.shyti@samsung.com>
 <1453105525-31506-2-git-send-email-andi.shyti@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, Andi Shyti <andi@etezian.org>
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <569D76A3.1080802@samsung.com>
Date: Tue, 19 Jan 2016 08:34:59 +0900
MIME-version: 1.0
In-reply-to: <1453105525-31506-2-git-send-email-andi.shyti@samsung.com>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 18.01.2016 17:25, Andi Shyti wrote:
> In the probe function the s2mps11_clk pointer is used only to
> iterate through the s2mps11_clks. The naming itself brings
> confusion and the readability is not improved.
> 
> Remove it, save some memory and headaches due to name similarity.

Moving the declaration of 's2mps11_clk' into the for-loop could be also
a way of improving the readability (narrow scope of variable) but your
approach also looks fine.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

> 
> Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> ---
>  drivers/clk/clk-s2mps11.c | 36 +++++++++++++++++-------------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
> index d266299..ccb12f1 100644
> --- a/drivers/clk/clk-s2mps11.c
> +++ b/drivers/clk/clk-s2mps11.c
> @@ -28,7 +28,7 @@
>  #include <linux/mfd/samsung/s5m8767.h>
>  #include <linux/mfd/samsung/core.h>
>  
> -#define s2mps11_name(a) (a->hw.init->name)
> +#define s2mps11_name(a) (a.hw.init->name)
>  
>  static struct clk **clk_table;
>  static struct clk_onecell_data clk_data;
> @@ -177,18 +177,16 @@ static struct device_node *s2mps11_clk_parse_dt(struct platform_device *pdev,
>  static int s2mps11_clk_probe(struct platform_device *pdev)
>  {
>  	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
> -	struct s2mps11_clk *s2mps11_clks, *s2mps11_clk;
> +	struct s2mps11_clk *s2mps11_clks;
>  	unsigned int s2mps11_reg;
>  	struct clk_init_data *clks_init;
>  	int i, ret = 0;
>  
>  	s2mps11_clks = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
> -				sizeof(*s2mps11_clk), GFP_KERNEL);
> +				sizeof(*s2mps11_clks), GFP_KERNEL);
>  	if (!s2mps11_clks)
>  		return -ENOMEM;
>  
> -	s2mps11_clk = s2mps11_clks;
> -
>  	clk_table = devm_kcalloc(&pdev->dev, S2MPS11_CLKS_NUM,
>  				sizeof(struct clk *), GFP_KERNEL);
>  	if (!clk_table)
> @@ -221,26 +219,26 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
>  	if (IS_ERR(s2mps11_clks->clk_np))
>  		return PTR_ERR(s2mps11_clks->clk_np);
>  
> -	for (i = 0; i < S2MPS11_CLKS_NUM; i++, s2mps11_clk++) {
> +	for (i = 0; i < S2MPS11_CLKS_NUM; i++) {
>  		if (!clks_init[i].name)
>  			continue; /* Skip clocks not present in some devices */
> -		s2mps11_clk->iodev = iodev;
> -		s2mps11_clk->hw.init = &clks_init[i];
> -		s2mps11_clk->mask = 1 << i;
> -		s2mps11_clk->reg = s2mps11_reg;
> -
> -		s2mps11_clk->clk = devm_clk_register(&pdev->dev,
> -							&s2mps11_clk->hw);
> -		if (IS_ERR(s2mps11_clk->clk)) {
> +		s2mps11_clks[i].iodev = iodev;
> +		s2mps11_clks[i].hw.init = &clks_init[i];
> +		s2mps11_clks[i].mask = 1 << i;
> +		s2mps11_clks[i].reg = s2mps11_reg;
> +
> +		s2mps11_clks[i].clk = devm_clk_register(&pdev->dev,
> +							&s2mps11_clks[i].hw);
> +		if (IS_ERR(s2mps11_clks[i].clk)) {
>  			dev_err(&pdev->dev, "Fail to register : %s\n",
> -						s2mps11_name(s2mps11_clk));
> -			ret = PTR_ERR(s2mps11_clk->clk);
> +						s2mps11_name(s2mps11_clks[i]));
> +			ret = PTR_ERR(s2mps11_clks[i].clk);
>  			goto err_reg;
>  		}
>  
> -		s2mps11_clk->lookup = clkdev_create(s2mps11_clk->clk,
> -					s2mps11_name(s2mps11_clk), NULL);
> -		if (!s2mps11_clk->lookup) {
> +		s2mps11_clks[i].lookup = clkdev_create(s2mps11_clks[i].clk,
> +					s2mps11_name(s2mps11_clks[i]), NULL);
> +		if (!s2mps11_clks[i].lookup) {
>  			ret = -ENOMEM;
>  			goto err_reg;
>  		}
> 
