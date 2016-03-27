Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4] clk: rockchip: fix big.LITTLE cores alternate reparent failed
Date: Sun, 27 Mar 2016 23:26:52 +0200
Message-ID: <1608479.lxyeMomFsd@diego>
In-Reply-To: <1458974276-10325-2-git-send-email-zhengxing@rock-chips.com>
References: <1458974276-10325-1-git-send-email-zhengxing@rock-chips.com> <1458974276-10325-2-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Samstag, 26. M=E4rz 2016, 14:37:53 schrieb Xing Zheng:
> On the RK3399, the order of the core's parents are LPLL/BPLL/DPLL/GPL=
L,
> there is incorrect to select bit_0 and bit_1 as the main and alternat=
e
> parents for LPLL/BPLL. They should be configurable.
>=20
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

I've folded this fix into the original patch [0]


Thanks
Heiko


[0] https://git.kernel.org/cgit/linux/kernel/git/mmind/linux-rockchip.g=
it/commit/?h=3Dv4.7-clk/next&id=3D268aebaa2410152bf91ea1ede6b284ff81388=
22d
