Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 12:10:22 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: mturquette@baylibre.com, tony@atomide.com, lee.jones@linaro.org,
	robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	t-kristo@ti.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 01/14] clk: twl6040: Correct clk_ops
Message-ID: <20160815191022.GW361@codeaurora.org>
References: <20160530085522.30398-1-peter.ujfalusi@ti.com>
 <20160530085522.30398-2-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160530085522.30398-2-peter.ujfalusi@ti.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/30, Peter Ujfalusi wrote:
> Since the drover only supports prepare callbacks, the use of is_enabled is
> not correct, it should be handling is_prepared.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
