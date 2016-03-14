Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Xing Zheng <zhengxing@rock-chips.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: rockchip: remove redundant checking of device_node
Date: Mon, 14 Mar 2016 01:26:33 +0100
Message-ID: <2962531.qNIN5DvN6o@phil>
In-Reply-To: <1457799953-3267-1-git-send-email-shawn.lin@rock-chips.com>
References: <1457799871-3015-1-git-send-email-shawn.lin@rock-chips.com> <1457799953-3267-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
List-ID: <linux-clk.vger.kernel.org>

Am Sonntag, 13. M=E4rz 2016, 00:25:53 schrieb Shawn Lin:
> rockchip_clk_of_add_provider is used by sub-clk driver which
> already call of_iomap before calling it. If device_node does
> not exist, of_iomap returns NULL which will fail to init the
> sub-clk driver. So really it's redundant.
>=20
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied for v4.7

Thanks
Heiko
