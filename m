Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 12:10:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: mturquette@baylibre.com, tony@atomide.com, lee.jones@linaro.org,
	robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	t-kristo@ti.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 03/14] clk: twl6040: Rename the driver and use
 consistent names in the code
Message-ID: <20160815191026.GY361@codeaurora.org>
References: <20160530085522.30398-1-peter.ujfalusi@ti.com>
 <20160530085522.30398-4-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160530085522.30398-4-peter.ujfalusi@ti.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/30, Peter Ujfalusi wrote:
> The driver is to provide the functional clock to OMAP4/5 McPDM. The clock
> is named as pdmclk in the documentations so change the function names,
> structure names and variables to align with this.
> At the same time rename the driver from "twl6040-clk" to "twl6040-pdmclk".
> This can be done w/o regression since the clock driver is not in use at
> the moment, the MFD core driver is not even registering the device for it.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
