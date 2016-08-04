Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, dianders@chromium.org, briannorris@chromium.org, huangtao@rock-chips.com, zhangqing@rock-chips.com
Subject: Re: [PATCH v3 7/7] clk: rockchip: rk3399: Add support frac mode frequencies
Date: Thu, 04 Aug 2016 21:19:08 +0200
Message-ID: <12790025.3tRiQgk9GG@diego>
In-Reply-To: <1470122579-32083-1-git-send-email-zhengxing@rock-chips.com>
References: <1470122401-31934-1-git-send-email-zhengxing@rock-chips.com> <1470122579-32083-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing,

Am Dienstag, 2. August 2016, 15:22:59 schrieb Xing Zheng:
> We need to support various display resolutions for external
> display devices like HDMI/DP, the frac mode can help us to
> acquire almost any frequencies, and need higher VCOs to reduce
> clock jitters.
> 
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

why does this need to be a separate rate array and cannot live in the general 
pll rate array?

The plls are general purpose, so we shouldn't limit them arbitarily.

I currently only see some frequencies (594MHz, 297MHz, 54MHz) that are present 
in both arrays but have different settings. As your patch description says 
that these settings reduce clock jitter, wouldn't the general frequencies also 
profit from merging these new values into the general rate array?


Heiko
