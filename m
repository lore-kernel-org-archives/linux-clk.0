Return-Path: <shawnguo@kernel.org>
Date: Thu, 9 Feb 2017 11:22:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, jun.nie@linaro.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, perex@perex.cz, tiwai@suse.com,
	shawn.guo@linaro.org, vinod.koul@intel.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, mathieu.poirier@linaro.org,
	xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn,
	wang.qiang01@zte.com.cn
Subject: Re: [PATCH v4 3/3] ASoC: zx-i2s: introduce pclk for zx2967 family
Message-ID: <20170209032238.GQ3407@dragon>
References: <1486609978-18482-1-git-send-email-baoyou.xie@linaro.org>
 <1486609978-18482-3-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486609978-18482-3-git-send-email-baoyou.xie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 09, 2017 at 11:12:58AM +0800, Baoyou Xie wrote:
> The pclk is necessary for zx2967 I2S controller. the driver
> currently doesn't handle it. This is something we need to fix.
> 
> In turn, the driver supports zx296718's I2S controller.
> 
> By the way, this patch also change the clock name from tx to wclk
> to make it clear.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>

Reviewed-by: Shawn Guo <shawnguo@kernel.org>
