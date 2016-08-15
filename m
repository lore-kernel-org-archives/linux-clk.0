Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 15:40:25 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH V3 3/4] clk: max77686: Add DT binding details for PMIC
 MAX77620
Message-ID: <20160815224025.GQ361@codeaurora.org>
References: <1466160667-28451-1-git-send-email-ldewangan@nvidia.com>
 <1466160667-28451-4-git-send-email-ldewangan@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1466160667-28451-4-git-send-email-ldewangan@nvidia.com>
List-ID: <linux-clk.vger.kernel.org>

On 06/17, Laxman Dewangan wrote:
> Maxim has used the same clock IP on multiple PMICs like MAX77686,
> MAX77802, MAX77620. Only differences are the number of clocks
> from these PMICs like MAX77686 has 3 clocks output, MAX776802 have
> two clock output and MAX77620 has one clock output.
> 
> Add clock binding details and DT example for the MAX77620.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> CC: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> CC: Javier Martinez Canillas <javier@dowhile0.org>
> Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
