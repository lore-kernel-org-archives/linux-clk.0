Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Xing Zheng <zhengxing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] clk: rockchip: fix warning reported by kernel-doc
Date: Mon, 14 Mar 2016 01:25:54 +0100
Message-ID: <3159306.SvFJfiirsP@phil>
In-Reply-To: <1457799914-3101-1-git-send-email-shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com> <1457799914-3101-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Sonntag, 13. M=E4rz 2016, 00:25:14 schrieb Shawn Lin:
> ./scripts/kernel-doc -man -v drivers/clk/rockchip/clk.h > /dev/null
>=20
> drivers/clk/rockchip/clk.h:133: warning: missing initial short
> description on line:
>  * struct rockchip_clk_provider: information about clock provider
> drivers/clk/rockchip/clk.h:133: info: Scanning doc for struct
> drivers/clk/rockchip/clk.h:164: warning: missing initial short
> description on line:
>  * struct rockchip_pll_clock: information about pll clock
> drivers/clk/rockchip/clk.h:164: info: Scanning doc for struct
> drivers/clk/rockchip/clk.h:194: warning: No description found for
> parameter 'parent_names'
> drivers/clk/rockchip/clk.h:194: warning: No description found for
> parameter 'num_parents'
> drivers/clk/rockchip/clk.h:194: warning: Excess struct/union/enum/typ=
edef
> member 'parent_name' description in 'rockchip_pll_clock'
> drivers/clk/rockchip/clk.h:235: warning: missing initial short
> description on line:
>  * struct rockchip_cpuclk_reg_data: describes register offsets and
> masks of the cpuclock
>=20
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for v4.7

Thanks
Heiko
