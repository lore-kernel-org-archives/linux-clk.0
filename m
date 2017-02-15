Return-Path: <oss@buserror.net>
Message-ID: <1487183790.5636.13.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: yuantian.tang@nxp.com, mturquette@baylibre.com
Cc: sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Wed, 15 Feb 2017 12:36:30 -0600
In-Reply-To: <1487137656-4006-2-git-send-email-yuantian.tang@nxp.com>
References: <1487137656-4006-1-git-send-email-yuantian.tang@nxp.com>
	 <1487137656-4006-2-git-send-email-yuantian.tang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Subject: Re: [PATCH 2/2] clk: qoriq: Separate root input clock for core PLLs
 on ls1012a
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2017-02-15 at 13:47 +0800, yuantian.tang@nxp.com wrote:
> From: Tang Yuantian <Yuantian.Tang@nxp.com>
> 
> ls1012a has separate input root clocks for core PLLs versus the
> platform PLL, with the latter described as sysclk in the hw docs.
> If a second input clock, named "coreclk", is present, this clock will be
> used for the core PLLs.
> 
> Signed-off-by: Scott Wood <oss@buserror.net>
> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
> ---
>  drivers/clk/clk-qoriq.c | 91 +++++++++++++++++++++++++++++++++++++++++-----

Why did you reset the author on these patches?  Have you changed anything?
 Why aren't they marked either v2 or resend?

-Scott
