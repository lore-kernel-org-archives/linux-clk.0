Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] clk: rockchip: free memory for error handle
Date: Tue, 02 Feb 2016 22:11:54 +0100
Message-ID: <1720574.6lM2zyED9Z@diego>
In-Reply-To: <1454384270-20018-1-git-send-email-shawn.lin@rock-chips.com>
References: <1454384270-20018-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 2. Februar 2016, 11:37:50 schrieb Shawn Lin:
> Add free memeory if rockchip_clk_register_branch
> failed.
> 
> Fixes: a245fecbb806 ("clk: rockchip: add basic infrastructure...")
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk-branch for 4.6

Thanks
Heiko
