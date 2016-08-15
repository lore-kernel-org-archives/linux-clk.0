Return-Path: <sboyd@codeaurora.org>
Date: Mon, 15 Aug 2016 15:08:10 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Denis Efremov <yefremov.denis@gmail.com>
Subject: Re: [PATCH 2/2] clk: fixed-rate: Remove export symbol on setup
 function
Message-ID: <20160815220810.GI361@codeaurora.org>
References: <20160813015023.28221-1-sboyd@codeaurora.org>
 <20160813015023.28221-2-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160813015023.28221-2-sboyd@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/12, Stephen Boyd wrote:
> This function is only called by builtin code, but we always
> exported it and had marked it as __init before commit
> e4eda8e0654c (clk: remove exported function from __init section,
> 2013-01-06) removed that marking. Given that it isn't used by
> modules, lets unexport it and add back __init.
> 
> Cc: Denis Efremov <yefremov.denis@gmail.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
