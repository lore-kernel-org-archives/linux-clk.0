Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: "jianqun.xu" <jay.xu@rock-chips.com>
Cc: huangtao@rock-chips.com, mturquette@baylibre.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3368: protect aclk_bus and aclk_peri clocks
Date: Thu, 03 Dec 2015 00:31:37 +0100
Message-ID: <4430667.DaSfi9RHQ7@diego>
In-Reply-To: <1449062551-2498-1-git-send-email-jay.xu@rock-chips.com>
References: <1449062551-2498-1-git-send-email-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Jianqun,

Am Mittwoch, 2. Dezember 2015, 21:22:31 schrieb jianqun.xu:
> From: Jianqun xu <jay.xu@rock-chips.com>
> 
> Add aclk_bus and aclk_peri to the list of rk3368 critical clocks,
> which are the base clocks that supply for all peripherals, never
> to be disabled automatically.
> 
> Signed-off-by: Jianqun xu <jay.xu@rock-chips.com>

applied to my clk branch for 4.5
[after adapting to Caesar's other critical clock]


Thanks
Heiko
