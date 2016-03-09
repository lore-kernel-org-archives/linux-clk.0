Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org
Subject: Re: [PATCH v3 6/7] clk: rockchip: add a COMPOSITE_FRACMUX_NOGATE type
Date: Wed, 09 Mar 2016 13:35:05 +0100
Message-ID: <3000848.liT5htmroZ@diego>
In-Reply-To: <1457491411-31114-1-git-send-email-zhengxing@rock-chips.com>
References: <1457491027-30936-1-git-send-email-zhengxing@rock-chips.com> <1457491411-31114-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Mittwoch, 9. M=E4rz 2016, 10:43:31 schrieb Xing Zheng:
> Because there are some frac clock mux nodes don't need gate node on
> the RK3399.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

applied to my clk-branch for 4.7 after checking the TRM and replacing

"don't need gate node " with "don't have a gate node" :-)


Heiko
