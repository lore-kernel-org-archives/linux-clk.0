Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 17/26] clk: rockchip: Convert to clk_hw based provider APIs
Date: Tue, 04 Aug 2015 16:12:19 +0200
Message-ID: <1633764.ZhyQ4HJNBu@diego>
In-Reply-To: <1438362246-6664-18-git-send-email-sboyd@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org> <1438362246-6664-18-git-send-email-sboyd@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 31. Juli 2015, 10:03:57 schrieb Stephen Boyd:
> We're removing struct clk from the clk provider API, so switch
> this code to using the clk_hw based provider APIs.
> 
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>

Looks correct to me and there are no functional changes in here anyway
Reviewed-by: Heiko Stuebner <heiko@sntech.de>


Heiko
