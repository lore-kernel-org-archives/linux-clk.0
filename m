Return-Path: <david.wu@rock-chips.com>
Subject: Re: [PATCH v2 3/4] clk: rockchip: rv1108: rename macphy to mac
To: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
 sboyd@codeaurora.org, heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com,
 cl@rock-chips.com, andy.yan@rock-chips.com, wdc@rock-chips.com
References: <1503303367-17915-1-git-send-email-zhangqing@rock-chips.com>
 <1503303367-17915-4-git-send-email-zhangqing@rock-chips.com>
From: "David.Wu" <david.wu@rock-chips.com>
Message-ID: <521d67b9-3598-8781-c2a0-76e7829c9a45@rock-chips.com>
Date: Mon, 21 Aug 2017 18:30:22 +0800
MIME-Version: 1.0
In-Reply-To: <1503303367-17915-4-git-send-email-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=gbk; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Elaine,

ÔÚ 2017/8/21 16:16, Elaine Zhang Ð´µÀ:
> This MAC has no internal phy for rv1108.
> 
> Signed-off-by: Elaine Zhang<zhangqing@rock-chips.com>
> ---
>   drivers/clk/rockchip/clk-rv1108.c      | 12 ++++++------
>   include/dt-bindings/clock/rv1108-cru.h |  6 +++---
>   2 files changed, 9 insertions(+), 9 deletions(-)

Acked-by: David Wu <david.wu@rock-chips.com>

Usually, MAC and PHY are separate, macphy is easy to cause ambiguity, 
and RV1108 SOC does not have integrated ethernet PHY. It is more clear 
to change the name.
