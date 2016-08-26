Return-Path: <sboyd@codeaurora.org>
Date: Fri, 26 Aug 2016 12:27:32 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: return unsigned int in dummy non-OF
 of_clk_get_parent_count()
Message-ID: <20160826192732.GZ19826@codeaurora.org>
References: <20160826125811.26843-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20160826125811.26843-1-zajec5@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/26, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> In the commit 929e7f3bc7b82 ("clk: Make of_clk_get_parent_count() return
> unsigned ints") of_clk_get_parent_count has been modified to return
> unsigned int. There is also a dummy implementation of the same function
> for configs without CONFIG_OF. For the consistency it should be updated
> as well.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
