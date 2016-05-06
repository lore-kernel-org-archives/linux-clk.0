Return-Path: <sboyd@codeaurora.org>
Date: Fri, 6 May 2016 15:56:45 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 0/7] clk: rockchip: cleanup some code duplication
Message-ID: <20160506225645.GG3492@codeaurora.org>
References: <1461849075-8310-1-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461849075-8310-1-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 04/28, Heiko Stuebner wrote:
> This tries to generalize code paths that contain some (nearly)
> duplicate code. While it's only a bit noticeable now for 3 different
> plls, the effect should be more pronounced when the next pll-type
> shows up.
> 

Looks ok. Are you sending another pull? Or I can apply them
directly.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
