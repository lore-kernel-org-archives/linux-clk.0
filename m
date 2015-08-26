Return-Path: <sboyd@codeaurora.org>
Date: Wed, 26 Aug 2015 11:36:31 -0700
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
Subject: Re: [PATCH v6 1/4] clk: pistachio: Fix 32bit integer overflows
Message-ID: <20150826183631.GO19120@codeaurora.org>
References: <1440605500-13274-1-git-send-email-Govindraj.Raja@imgtec.com>
 <1440605500-13274-2-git-send-email-Govindraj.Raja@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440605500-13274-2-git-send-email-Govindraj.Raja@imgtec.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/26, Govindraj Raja wrote:
> From: Zdenko Pulitika <zdenko.pulitika@imgtec.com>
> 
> This commit fixes 32bit integer overflows throughout the pll driver
> (i.e. wherever the result of integer multiplication may exceed the
> range of u32).
> 
> One of the functions affected by this problem is .recalc_rate. It
> returns incorrect rate for some pll settings (not for all though)
> which in turn results in the incorrect rate setup of pll's child
> clocks.
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
