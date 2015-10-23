Return-Path: <sboyd@codeaurora.org>
Date: Fri, 23 Oct 2015 09:20:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile-icst: fix memory leak
Message-ID: <20151023162048.GZ19782@codeaurora.org>
References: <1445592961-30135-1-git-send-email-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445592961-30135-1-git-send-email-linus.walleij@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/23, Linus Walleij wrote:
> A static code checker found a memory leak in the Versatile
> ICST code. Fix it.
> 
> Fixes: a183da637c52 "clk: versatile: respect parent rate in ICST clock"
> Reported-by: Stephen Boyd <sboyd@codeaurora.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
