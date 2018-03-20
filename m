Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: David Lechner <david@lechnology.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1521168778-27236-19-git-send-email-david@lechnology.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Sekhar Nori <nsekhar@ti.com>,
 Kevin Hilman <khilman@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Adam Ford <aford173@gmail.com>, linux-kernel@vger.kernel.org,
 David Lechner <david@lechnology.com>
References: <1521168778-27236-1-git-send-email-david@lechnology.com>
 <1521168778-27236-19-git-send-email-david@lechnology.com>
Message-ID: <152156485535.183971.1627687499726447092@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v8 18/42] clk: davinci: New driver for TI DA8XX CFGCHIP clocks
Date: Tue, 20 Mar 2018 09:54:15 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting David Lechner (2018-03-15 19:52:34)
> +
> +typedef int (*da8xx_cfgchip_init)(struct device *dev, void __iomem *base=
);

Should be struct regmap *regmap?

I've squashed this in.

diff --git a/drivers/clk/davinci/da8xx-cfgchip.c b/drivers/clk/davinci/da8x=
x-cfgchip.c
index 858d3786b27b..c971111d2601 100644
--- a/drivers/clk/davinci/da8xx-cfgchip.c
+++ b/drivers/clk/davinci/da8xx-cfgchip.c
@@ -736,7 +736,7 @@ static const struct platform_device_id da8xx_cfgchip_id=
_table[] =3D {
 	{ }
 };
 =

-typedef int (*da8xx_cfgchip_init)(struct device *dev, void __iomem *base);
+typedef int (*da8xx_cfgchip_init)(struct device *dev, struct regmap *regma=
p);
 =

 static int da8xx_cfgchip_probe(struct platform_device *pdev)
 {
