Return-Path: <sboyd@codeaurora.org>
Date: Thu, 2 Jul 2015 15:51:43 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@linaro.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 3/9] clk: rockchip: protect register macros against
 multipart values
Message-ID: <20150702225143.GM4301@codeaurora.org>
References: <1434637116-17124-1-git-send-email-heiko@sntech.de>
 <1434637116-17124-4-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1434637116-17124-4-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 06/18, Heiko Stuebner wrote:
> The macros calculate the correct offset from the id in the parameter.
> If this parameter does not consist of a single number, the calculation
> will return wrong registers in the best case or create unaligned accesses
> in the worst case. So protect the calculations against such values.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-rk3368

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
