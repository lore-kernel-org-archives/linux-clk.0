Return-Path: <sboyd@codeaurora.org>
Date: Mon, 6 Jul 2015 15:12:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 6/7] clk: rockchip: add missing include guards
Message-ID: <20150706221202.GL20866@codeaurora.org>
References: <1436086820-3757-1-git-send-email-heiko@sntech.de>
 <1436086820-3757-7-git-send-email-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436086820-3757-7-git-send-email-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On 07/05, Heiko Stuebner wrote:
> Review for the rk3368 turned up that the clock header was missing include
> guards. This is also true for the already existing clock binding headers,
> so add them.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---

Applied to clk-rk3368.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
