Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: xf@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, huangtao@rock-chips.com, xxx@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] clk: rockchip: fix up the RK3228 clk cpu setting table
Date: Wed, 17 May 2017 19:59:10 +0200
Message-ID: <1825774.zEsp3ZZPRs@phil>
In-Reply-To: <1493362967-4040-2-git-send-email-zhangqing@rock-chips.com>
References: <1493362967-4040-1-git-send-email-zhangqing@rock-chips.com> <1493362967-4040-2-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Freitag, 28. April 2017, 15:02:45 CEST schrieb Elaine Zhang:
> support more cpu freq, and add armcore div setting.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>

applied for 4.13, after fixing the indentations of the defines to match
the previous style (and other rockchip socs).


Thanks
Heiko
