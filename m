Return-Path: <sboyd@codeaurora.org>
Date: Mon, 20 Jun 2016 17:48:46 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Roman Volkov <v1ron@mail.ru>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Roman Volkov <rvolkov@v1ros.org>,
	Tony Prisk <linux@prisktech.co.nz>
Subject: Re: [PATCH v2 2/2] clk: vt8500: rework wm8650_find_pll_bits()
Message-ID: <20160621004846.GL1521@codeaurora.org>
References: <20160607215610.8724-1-v1ron@mail.ru>
 <20160607215610.8724-3-v1ron@mail.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160607215610.8724-3-v1ron@mail.ru>
List-ID: <linux-clk.vger.kernel.org>

On 06/08, Roman Volkov wrote:
> From: Roman Volkov <rvolkov@v1ros.org>
> 
> PLL clock on WM8650 is calculated in the following way:
> 
> M * parent [O1] => / P [O2] => / D [O3]
> 
> Where O2 is 600MHz >= (M * parent) / P >= 300MHz.
> 
> Current algorithm does not met this requirement, so that the
> function may return rates which are not supported by the hardware.
> 
> This patch fixes the algorithm and simplifies the code, reducing
> the calculation time by ~10000 times (according to usermode app) by
> removing the nested loops.
> 
> Signed-off-by: Roman Volkov <rvolkov@v1ros.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
