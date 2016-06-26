Return-Path: <alexandre.belloni@free-electrons.com>
Date: Sun, 26 Jun 2016 03:02:00 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, rtc-linux@googlegroups.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/8] rtc: ac100: Add RTC driver for X-Powers AC100
Message-ID: <20160626010200.GZ5809@piout.net>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-5-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1466391138-12862-5-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>

On 20/06/2016 at 10:52:14 +0800, Chen-Yu Tsai wrote :
> +static int ac100_rtc_probe(struct platform_device *pdev)
> +{
> +	struct ac100_dev *ac100 = dev_get_drvdata(pdev->dev.parent);
> +	struct ac100_rtc_dev *chip;
> +	int ret;
> +
> +	chip = devm_kzalloc(&pdev->dev, sizeof(*chip), GFP_KERNEL);
> +	platform_set_drvdata(pdev, chip);
> +	chip->dev = &pdev->dev;
> +	chip->regmap = ac100->regmap;
> +	mutex_init(&chip->mutex);
> +
> +	chip->irq = of_irq_get(pdev->dev.of_node, 0);

Forgot that one, platform_get_irq() is probably more common but I don't
care that much. I think you can then avoid including of.h and of_irq.h.

> +	if (chip->irq < 0) {
> +		dev_err(&pdev->dev, "No IRQ resource\n");
> +		return chip->irq;
> +	}
> +

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
