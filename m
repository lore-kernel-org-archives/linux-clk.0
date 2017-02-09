Return-Path: <jun.nie@linaro.org>
Return-Path: <jun.nie@linaro.org>
Subject: Re: [PATCH v4 3/3] ASoC: zx-i2s: introduce pclk for zx2967 family
To: Baoyou Xie <baoyou.xie@linaro.org>, lgirdwood@gmail.com,
 broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 mturquette@baylibre.com, sboyd@codeaurora.org, perex@perex.cz,
 tiwai@suse.com, shawn.guo@linaro.org, vinod.koul@intel.com
References: <1486609978-18482-1-git-send-email-baoyou.xie@linaro.org>
 <1486609978-18482-3-git-send-email-baoyou.xie@linaro.org>
Cc: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, shawnguo@kernel.org, mathieu.poirier@linaro.org,
 xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
From: Jun Nie <jun.nie@linaro.org>
Message-ID: <d35fa104-1525-f30d-ddaa-94fc944557a6@linaro.org>
Date: Thu, 9 Feb 2017 16:19:08 +0800
MIME-Version: 1.0
In-Reply-To: <1486609978-18482-3-git-send-email-baoyou.xie@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 2017年02月09日 11:12, Baoyou Xie wrote:
> The pclk is necessary for zx2967 I2S controller. the driver
> currently doesn't handle it. This is something we need to fix.
>
> In turn, the driver supports zx296718's I2S controller.
>
> By the way, this patch also change the clock name from tx to wclk
> to make it clear.
>
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---

Reviewed-by: Jun Nie <jun.nie@linaro.org>
