Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Sep 2017 15:55:14 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
	lgirdwood@gmail.com, broonie@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com,
	linux@armlinux.org.uk, boris.brezillon@free-electrons.com,
	perex@perex.cz, tiwai@suse.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	cyrille.pitchen@wedev4u.fr, thomas.petazzoni@free-electrons.com,
	Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH v5 3/7] clk: at91: add audio pll clock drivers
Message-ID: <20170901225514.GE21656@codeaurora.org>
References: <cover.ada7bc60e0b3a0f7429afc6ea9e4869131d1b757.1502346448.git-series.quentin.schulz@free-electrons.com>
 <f1c7acbfec384c2c33bf340464a98b731dac8c0c.1502346448.git-series.quentin.schulz@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <f1c7acbfec384c2c33bf340464a98b731dac8c0c.1502346448.git-series.quentin.schulz@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/10, Quentin Schulz wrote:
> This new clock driver set allows to have a fractional divided clock that
> would generate a precise clock particularly suitable for audio
> applications.
> 
> The main audio pll clock has two children clocks: one that is connected
> to the PMC, the other that can directly drive a pad. As these two routes
> have different enable bits and different dividers and divider formulas,
> they are handled by two different drivers. Each of them could modify the
> rate of the main audio pll parent.
> 
> The main audio pll clock can output 620MHz to 700MHz.
> 
> Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
