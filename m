Return-Path: <sboyd@codeaurora.org>
Date: Wed, 26 Aug 2015 11:36:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Govindraj Raja <Govindraj.Raja@imgtec.com>
Cc: linux-mips@linux-mips.org, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Zdenko Pulitika <zdenko.pulitika@imgtec.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Ralf Baechle <ralf@linux-mips.org>,
	Andrew Bresticker <abrestic@chromium.org>,
	James Hartley <James.Hartley@imgtec.com>,
	Damien Horsley <Damien.Horsley@imgtec.com>,
	James Hogan <James.Hogan@imgtec.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v6 2/4] clk: pistachio: Fix override of clk-pll settings
 from boot loader
Message-ID: <20150826183635.GP19120@codeaurora.org>
References: <1440605500-13274-1-git-send-email-Govindraj.Raja@imgtec.com>
 <1440605500-13274-3-git-send-email-Govindraj.Raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440605500-13274-3-git-send-email-Govindraj.Raja@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/26, Govindraj Raja wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> 
> PLL enable callbacks are overriding PLL mode (int/frac) and
> Noise reduction (on/off) settings set by the boot loader which
> results in the incorrect clock rate.
> 
> PLL mode and noise reduction are defined by the DSMPD and DACPD bits
> of the PLL control register. PLL .enable() callbacks enable PLL
> by deasserting all power-down bits of the PLL control register,
> including DSMPD and DACPD bits, which is not necessary since
> these bits don't actually enable/disable PLL.
> 
> This commit fixes the problem by removing DSMPD and DACPD bits
> from the "PLL enable" mask.
> 
> Fixes: 43049b0c83f17("CLK: Pistachio: Add PLL driver")
> Cc: <stable@vger.kernel.org> # 4.1
> Reviewed-by: Andrew Bresitcker <abrestic@chromium.org>
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
