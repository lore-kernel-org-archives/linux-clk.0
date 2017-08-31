Return-Path: <sboyd@codeaurora.org>
Date: Thu, 31 Aug 2017 10:59:01 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [GIT PULL] Allwinner clock changes for 4.14, take 3
Message-ID: <20170831175901.GF21656@codeaurora.org>
References: <20170824083620.b5cq4qtyr3cqtpjx@flea.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170824083620.b5cq4qtyr3cqtpjx@flea.lan>
List-ID: <linux-clk.vger.kernel.org>

On 08/24, Maxime Ripard wrote:
> Hi,
> 
> Here is a quite late PR, but this also something we've been waiting
> for for quite some time already.
> 
> These patches convert our last users of the old clock framework to the
> new one. We still have some marginal users of the old clock drivers,
> but they shouldn't prevent the fix for the orphans clocks we hold back
> to work.
> 

Great. Thanks. Pulled into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
