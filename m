Return-Path: <andi.shyti@samsung.com>
Date: Wed, 13 Jul 2016 21:44:16 +0900
From: Andi Shyti <andi.shyti@samsung.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>,
 Mark Brown <broonie@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, Jaehoon Chung <jh80.chung@samsung.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-spi@vger.kernel.org, Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH v3 7/7] clk: exynos5433: remove CLK_IGNORE_UNUSED flag from
 SPI clocks
Message-id: <20160713124416.GN18237@samsunx.samsung>
References: <1468317736-18841-1-git-send-email-andi.shyti@samsung.com>
 <1468317736-18841-8-git-send-email-andi.shyti@samsung.com>
 <CGME20160712222323epcas1p4020f224ba47b193243867ab41bc109c8@epcas1p4.samsung.com>
 <146836184696.73491.9452469757415968654@resonance>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
In-reply-to: <146836184696.73491.9452469757415968654@resonance>
List-ID: <linux-clk.vger.kernel.org>

Hi Mike,

> > Because the Exynos5433 SPI driver supports the ioclk handling and
> > the following patch:
> > 
> >   http://marc.info/?l=linux-kernel&m=146787645626318&w=2
> > 
> > fixes a synchronus abort issue, none of the SPI clocks require
> > any critical handling: remove, then, the CLK_IGNORE_UNUSED flag
> > for the SPI related clocks.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> > Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Reviewed-by: Michael Turquette <mturquette@baylibre.com>
> > Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Do you want these patches to go through same tree? If not, I can take
> this patch into clk-next.

oh yes, as Krzysztof and Sylwester pointed out, the dependency is
not that strict as there is no exynos5433 dts yet, so that we
wouldn't break anything if patch 7/7 gets in before the others.

If you want to take in your branch the 7/7, please feel free to
do so. Only the patches on the drivers/spi/spi-s3c64xx.c file
have some dependencies on some previous patches I sent to Mark.

Andi
