Return-Path: <sboyd@codeaurora.org>
Date: Fri, 10 Feb 2017 09:17:46 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, jun.nie@linaro.org, mturquette@baylibre.com,
	perex@perex.cz, tiwai@suse.com, shawn.guo@linaro.org,
	vinod.koul@intel.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	shawnguo@kernel.org, mathieu.poirier@linaro.org,
	xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn,
	wang.qiang01@zte.com.cn
Subject: Re: [PATCH v4 1/3] clk: zte: add i2s clocks for zx296718
Message-ID: <20170210171746.GP25384@codeaurora.org>
References: <1486609978-18482-1-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486609978-18482-1-git-send-email-baoyou.xie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 02/09, Baoyou Xie wrote:
> The i2s related clock support is missing from the existing zx296718
> clock driver. This patch adds it, so that the upstream ZX I2S driver
> can work out.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
