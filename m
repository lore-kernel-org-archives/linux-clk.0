Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dinh Nguyen <dinguyen@kernel.org>, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1525271313-24427-1-git-send-email-dinguyen@kernel.org>
Cc: dinguyen@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org
References: <1525271313-24427-1-git-send-email-dinguyen@kernel.org>
Message-ID: <152642119396.237094.8796686281263472736@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: socfpga: stratix10: use platform driver APIs
Date: Tue, 15 May 2018 14:53:13 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dinh Nguyen (2018-05-02 07:28:32)
> +       struct resource *res;
>         void __iomem *base;
>  =

> -       base =3D of_iomap(np, 0);
> -       if (!base) {
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base =3D devm_ioremap_resource(dev, res);
> +       if (IS_ERR(base)) {
>                 pr_err("%s: failed to map clock registers\n", __func__);
> -               goto err;
> +               return ERR_CAST(base);
>         }
>  =

> -       clk_data =3D kzalloc(sizeof(*clk_data), GFP_KERNEL);
> +       clk_data =3D devm_kzalloc(dev, sizeof(*clk_data), GFP_KERNEL);
>         if (!clk_data)
> -               goto err;
> +               return ERR_CAST(clk_data);

I had to make these ERR_PTR(-ENOMEM), but otherwise I applied this to
clk-next.
