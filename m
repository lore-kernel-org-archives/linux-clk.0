Return-Path: <sboyd@codeaurora.org>
Date: Fri, 23 Sep 2016 14:52:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-mips@linux-mips.org,
	linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH V1 1/3] clk: Loongson1: Refactor Loongson1 clock
Message-ID: <20160923215257.GG21232@codeaurora.org>
References: <1474259936-9657-1-git-send-email-keguang.zhang@gmail.com>
 <1474259936-9657-2-git-send-email-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1474259936-9657-2-git-send-email-keguang.zhang@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/19, Keguang Zhang wrote:
> From: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> Factor out the common functions into loongson1/clk.c
> to support both Loongson1B and Loongson1C. And, put
> the rest into loongson1/clk-loongson1b.c.
> 
> Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
> 
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
