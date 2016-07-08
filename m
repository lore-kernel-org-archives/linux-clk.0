Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Andi Shyti <andi.shyti@samsung.com>, "Rob Herring" <robh+dt@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, "Kukjin Kim" <kgene@kernel.org>,
 "Krzysztof Kozlowski" <k.kozlowski@samsung.com>,
 "Mark Brown" <broonie@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Tomasz Figa" <tomasz.figa@gmail.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1467989201-14661-6-git-send-email-andi.shyti@samsung.com>
Cc: "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Jaehoon Chung" <jh80.chung@samsung.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org,
 "Andi Shyti" <andi.shyti@samsung.com>, "Andi Shyti" <andi@etezian.org>
References: <1467989201-14661-1-git-send-email-andi.shyti@samsung.com>
 <1467989201-14661-6-git-send-email-andi.shyti@samsung.com>
Message-ID: <146799441227.73491.13833003558807352160@resonance>
Subject: Re: [PATCH v2 5/7] spi: s3c64xx: add exynos5433 compatible for ioclk handling
Date: Fri, 08 Jul 2016 09:13:32 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Andi Shyti (2016-07-08 07:46:39)
> @@ -1147,6 +1150,21 @@ static int s3c64xx_spi_probe(struct platform_devic=
e *pdev)
>                 goto err_disable_clk;
>         }
>  =

> +       if (sdd->port_conf->clk_ioclk) {
> +               sdd->ioclk =3D devm_clk_get(&pdev->dev, "spi_ioclk");
> +               if (IS_ERR(sdd->ioclk)) {
> +                       dev_err(&pdev->dev, "Unable to acquire 'ioclk'\n"=
);
> +                       ret =3D PTR_ERR(sdd->ioclk);
> +                       goto err_disable_src_clk;
> +               }
> +
> +               ret =3D clk_prepare_enable(sdd->ioclk);
> +               if (ret) {
> +                       dev_err(&pdev->dev, "Couldn't enable clock 'ioclk=
'\n");
> +                       goto err_disable_src_clk;
> +               }
> +       }
> +
>         pm_runtime_set_autosuspend_delay(&pdev->dev, AUTOSUSPEND_TIMEOUT);
>         pm_runtime_use_autosuspend(&pdev->dev);
>         pm_runtime_set_active(&pdev->dev);
> @@ -1193,6 +1211,8 @@ err_pm_put:
>         pm_runtime_disable(&pdev->dev);
>         pm_runtime_set_suspended(&pdev->dev);
>  =

> +       clk_disable_unprepare(sdd->ioclk);
> +err_disable_src_clk:
>         clk_disable_unprepare(sdd->src_clk);
>  err_disable_clk:
>         clk_disable_unprepare(sdd->clk);

Why aren't these clocks enabled/disabled by calls to pm_runtime_get/put?

Regards,
Mike
