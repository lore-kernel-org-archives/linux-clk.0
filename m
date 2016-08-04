Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, dianders@chromium.org, briannorris@chromium.org, huangtao@rock-chips.com, zhangqing@rock-chips.com, frank.wang@rock-chips.com, wulf@rock-chips.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] clk: rockchip: rk3399: export 480M_SRC clock id for usbphy0/usbphy1
Date: Thu, 04 Aug 2016 21:10:47 +0200
Message-ID: <1918977.W0kRfKbZsD@diego>
In-Reply-To: <1470122401-31934-3-git-send-email-zhengxing@rock-chips.com>
References: <1470122401-31934-1-git-send-email-zhengxing@rock-chips.com> <1470122401-31934-3-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing,

Am Dienstag, 2. August 2016, 15:19:56 schrieb Xing Zheng:
> Export these source clocks for usbphy.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

can you please provide a rationale why you need manual control over that 
intermediate clock?

The two usbphys seem to use the  clk_usb2phyX_ref clocks, generate the 480m 
clocks, but do not seem to need the clk_usbphyX_480m_src gates.

The clk_usbphyX_480m_src clocks on the other hand only lead to the 
clk_usbphy_480m mux, so I'd like some explanation on what you want to achieve 
here :-)


Thanks
Heiko
