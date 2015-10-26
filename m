Return-Path: <sboyd@codeaurora.org>
Date: Mon, 26 Oct 2015 15:06:34 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Joachim Eastwood <manabian@gmail.com>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: Add clk_hw_is_enabled() for use by clk
 providers
Message-ID: <20151026220634.GG19782@codeaurora.org>
References: <1445705724-20805-1-git-send-email-manabian@gmail.com>
 <1445705724-20805-2-git-send-email-manabian@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445705724-20805-2-git-send-email-manabian@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/24, Joachim Eastwood wrote:
> Add clk_hw_is_enabled() to the provider APIs so clk providers can
> use a struct clk_hw instead of a struct clk to check if a clk is
> enabled or not.
> 
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
