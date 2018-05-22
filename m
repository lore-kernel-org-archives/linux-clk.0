Return-Path: <nsekhar@ti.com>
Subject: Re: [PATCH v11 01/27] clk: davinci: pll: allow dev == NULL
To: David Lechner <david@lechnology.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
	<sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland
	<mark.rutland@arm.com>,
        Kevin Hilman <khilman@kernel.org>,
        Bartosz
 Golaszewski <bgolaszewski@baylibre.com>,
        Adam Ford <aford173@gmail.com>, <linux-kernel@vger.kernel.org>
References: <20180518164829.27052-1-david@lechnology.com>
 <20180518164829.27052-2-david@lechnology.com>
From: Sekhar Nori <nsekhar@ti.com>
Message-ID: <fb68ea47-9d94-143d-0ee1-b7ba7da2c378@ti.com>
Date: Tue, 22 May 2018 14:13:43 +0530
MIME-Version: 1.0
In-Reply-To: <20180518164829.27052-2-david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

On Friday 18 May 2018 10:18 PM, David Lechner wrote:
> @@ -711,11 +777,11 @@ int of_davinci_pll_init(struct device *dev,
>  		int n_clks =  max_sysclk_id + 1;
>  		int i;
>  
> -		clk_data = devm_kzalloc(dev, sizeof(*clk_data), GFP_KERNEL);
> +		clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>  		if (!clk_data)
>  			return -ENOMEM;
>  
> -		clks = devm_kmalloc_array(dev, n_clks, sizeof(*clks), GFP_KERNEL);
> +		clks = kmalloc_array(n_clks, sizeof(*clks), GFP_KERNEL);
>  		if (!clks)
>  			return -ENOMEM;

This should be:

		if (!clks) {
			kfree(clk_data);
			return -ENOMEM;
		}

With that fixed:

Reviewed-by: Sekhar Nori <nsekhar@ti.com>

Thanks,
Sekhar
