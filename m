Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: Free the memory on the error path
Date: Fri, 02 Mar 2018 08:53:39 +0100
Message-ID: <2045062.mzKBZkjcbQ@phil>
In-Reply-To: <1519801008-124310-1-git-send-email-shawn.lin@rock-chips.com>
References: <1519801008-124310-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 28. Februar 2018, 07:56:48 CET schrieb Shawn Lin:
> rockchip_clk_register_branch() and rockchip_clk_register_branch()
> should free the memory internally when seeing any failure.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for 4.17

Thanks
Heiko
