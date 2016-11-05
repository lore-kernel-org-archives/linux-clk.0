Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Jianqun Xu <jay.xu@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, huangtao@rock-chips.com, zhangqing@rock-chips.com, zhengxing@rock-chips.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, lintao@rock-chips.com
Subject: Re: [PATCH] clk: rockchip: remove more CLK_IGNORE_UNUSED for rk3399 clocktree
Date: Sat, 05 Nov 2016 23:14:46 +0100
Message-ID: <1554357.c2SylEul2r@phil>
In-Reply-To: <1478144333-13436-1-git-send-email-jay.xu@rock-chips.com>
References: <1478144333-13436-1-git-send-email-jay.xu@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Donnerstag, 3. November 2016, 11:38:53 CET schrieb Jianqun Xu:
> Optimize rk3399 clocktree by removing CLK_IGNORE_UNUSED of some clocks.
> 
> clocks will managered by usb:
> - clk_usbphy0_480m_src
> - clk_usbphy1_480m_src
> - clk_usbphy_480m
> 
> clocks will be managered by pvtm:
> - clk_pvtm_core_l
> - clk_pvtm_core_b
> - clk_pvtm_ddr
> 
> clocks will be managered by dfi:
> - pclk_ddr_mon
> - clk_dfimon0_timer
> - clk_dfimon1_timer
> - aclk_dcf
> - pclk_dcf
> 
> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>

I gave this a test on a rk3399-gru device and was still able to boot 
sucessfully. So I've applied the patch to my clk-branch for 4.10

Thanks
Heiko
