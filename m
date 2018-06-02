Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Shawn Lin <shawn.lin@rock-chips.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1524907018-195819-1-git-send-email-shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
 Elaine Zhang <zhangqing@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>
References: <1524907018-195819-1-git-send-email-shawn.lin@rock-chips.com>
Message-ID: <152792179514.225090.14160753405751043107@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 1/2] clk: Add clk_set_rate_safe() API support
Date: Fri, 01 Jun 2018 23:43:15 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Shawn Lin (2018-04-28 02:16:57)
> From: Elaine Zhang <zhangqing@rock-chips.com>
> =

> Compared with clk_set_rate(), this API would maintain the clock rate
> of its children to avoid exception if the new rate is higher than
> the old rate.
> =

> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
> ---

There's no cover letter, and the length and quality of the commit
message leaves me with more questions than answers. Please resend with a
proper argument for this patch set.

My first question is why can't we fix clk_set_rate() or
clk_set_rate_range() APIs to do what you want?
