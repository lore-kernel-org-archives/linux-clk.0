Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: dianders@google.com, linux-rockchip@lists.infradead.org, hl@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: fix the incorrect pclk_edp div width for RK3399
Date: Wed, 18 Jan 2017 11:25:21 +0100
Message-ID: <1739624.bC7E8g3lgy@diego>
In-Reply-To: <1484713256-3005-1-git-send-email-zhengxing@rock-chips.com>
References: <1484713256-3005-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 18. Januar 2017, 12:20:56 CET schrieb Xing Zheng:
> The range of the  pclk_edp_div_con is [13:8] and 6 bits, not 5.
> 
> Reported-by: Lin Huang <hl@rock-chips.com>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied for 4.11 with Lin's test tag


Thanks
Heiko
