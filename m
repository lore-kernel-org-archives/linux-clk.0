Return-Path: <sboyd@codeaurora.org>
Date: Thu, 8 Dec 2016 15:17:49 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Harvey Hunt <harvey.hunt@imgtec.com>,
	Paul Burton <paul.burton@imgtec.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Maarten ter Huurne <maarten@treewalker.org>
Subject: Re: [PATCH] clk: ingenic: Fix recalc_rate for clocks with fixed
 divider
Message-ID: <20161208231749.GY5423@codeaurora.org>
References: <20161101095836.22210-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20161101095836.22210-1-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On 11/01, Paul Cercueil wrote:
> Previously, the clocks with a fixed divider would report their rate
> as being the same as the one of their parent, independently of the
> divider in use. This commit fixes this behaviour.
> 
> This went unnoticed as neither the jz4740 nor the jz4780 CGU code
> have clocks with fixed dividers yet.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Nobody replied or reviewed it so I'll bite. Do we have a user of
this code path? If not, please reserve this patch until such a
time and then include it in the series.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
