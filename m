Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Zhong <zyw@rock-chips.com>
Cc: zhengxing@rock-chips.com, yzq@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, tfiga@chromium.org, linux-rockchip@lists.infradead.org, dianders@chromium.org, groeck@chromium.org, marcheu@chromium.org, wulf@rock-chips.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [v2 PATCH] clk: rockchip: mark rk3399 hdcp_noc and vio_noc as critical
Date: Fri, 12 Aug 2016 00:17:15 +0200
Message-ID: <1721159.V5xB9fz0jT@diego>
In-Reply-To: <1470765753-11619-1-git-send-email-zyw@rock-chips.com>
References: <1470765753-11619-1-git-send-email-zyw@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Dienstag, 9. August 2016, 11:02:33 schrieb Chris Zhong:
> Fix incorrect rk3399 aclk_vio gating bit, it should be 0, not 10. With
> this modification, the aclk_vio_noc should be put into critical list,
> since it is required by VOP.
> And the Type-C DP need these clocks: aclk_hdcp_noc, hclk_hdcp_noc,
> pclk_hdcp_noc. Mark them as critical to avoid someone close them.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>

I've split that patch in two and applied them there:
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.8-clk/fixes&id=a3f457d9636b3f5ae4fc6502cb0c95f60f5e342b
(gate-bit-fix)
https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.git/commit/?h=v4.9-clk/next&id=54479449c801e46ee2b6ba08e2f19cd810f74f94
(critical clocks)

with the provided Reviewed-bys.


Heiko
