Return-Path: <sboyd@codeaurora.org>
Date: Fri, 1 Sep 2017 15:55:23 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
	lgirdwood@gmail.com, broonie@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com,
	linux@armlinux.org.uk, boris.brezillon@free-electrons.com,
	perex@perex.cz, tiwai@suse.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
	cyrille.pitchen@wedev4u.fr, thomas.petazzoni@free-electrons.com
Subject: Re: [PATCH v5 6/7] ASoC: atmel-classd: remove aclk clock from DT
 binding
Message-ID: <20170901225523.GH21656@codeaurora.org>
References: <cover.ada7bc60e0b3a0f7429afc6ea9e4869131d1b757.1502346448.git-series.quentin.schulz@free-electrons.com>
 <baa9ebcc16cba5f41ee5b01895ec7cfce60a8ddc.1502346448.git-series.quentin.schulz@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <baa9ebcc16cba5f41ee5b01895ec7cfce60a8ddc.1502346448.git-series.quentin.schulz@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/10, Quentin Schulz wrote:
> Since gclk (generated-clk) is now able to determine the rate of the
> audio_pll, there is no need for classd to have a direct phandle to the
> audio_pll while already having a phandle to gclk.
> 
> This binding is used by no board in mainline so it is safe to be
> modified.
> 
> Signed-off-by: Quentin Schulz <quentin.schulz@free-electrons.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
