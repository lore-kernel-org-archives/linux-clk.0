Return-Path: <sboyd@codeaurora.org>
Date: Mon, 6 Feb 2017 14:48:25 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] clk: sunxi-ng: Check kzalloc() for errors and cleanup
 error path
Message-ID: <20170206224825.GG25384@codeaurora.org>
References: <20170203230050.26181-1-sboyd@codeaurora.org>
 <20170206105120.5gxti6szfmxi4psc@lukather>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170206105120.5gxti6szfmxi4psc@lukather>
List-ID: <linux-clk.vger.kernel.org>

On 02/06, Maxime Ripard wrote:
> On Fri, Feb 03, 2017 at 03:00:50PM -0800, Stephen Boyd wrote:
> > This kzalloc() could fail. Let's bail out with -ENOMEM here
> > instead of NULL dereferencing. That silences static checkers. We
> > should also cleanup on the error path even though this function
> > returning an error probably means the system won't boot.
> > 
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> > Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> 
> Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> 
> Can you apply it directly?
> 

Yep. Thanks.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
