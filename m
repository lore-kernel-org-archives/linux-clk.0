Return-Path: <sboyd@codeaurora.org>
Date: Wed, 26 Aug 2015 11:36:38 -0700
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
Subject: Re: [PATCH v6 3/4] clk: pistachio: Fix PLL rate calculation in
 integer mode
Message-ID: <20150826183638.GQ19120@codeaurora.org>
References: <1440605500-13274-1-git-send-email-Govindraj.Raja@imgtec.com>
 <1440605500-13274-4-git-send-email-Govindraj.Raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440605500-13274-4-git-send-email-Govindraj.Raja@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/26, Govindraj Raja wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> 
> .recalc_rate callback for the fractional PLL doesn't take operating
> mode into account when calculating PLL rate. This results in
> the incorrect PLL rates when PLL is operating in integer mode.
> 
> Operating mode of fractional PLL is based on the value of the
> fractional divider. Currently it assumes that the PLL will always
> be configured in fractional mode which may not be
> the case. This may result in the wrong output frequency.
> 
> Also vco was calculated based on the current operating mode which
> makes no sense because .set_rate is setting operating mode. Instead,
> vco should be calculated using PLL settings that are about to be set.
> 
> Fixes: 43049b0c83f17("CLK: Pistachio: Add PLL driver")
> Cc: <stable@vger.kernel.org> # 4.1
> Reviewed-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> Signed-off-by: Govindraj Raja <govindraj.raja@imgtec.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
