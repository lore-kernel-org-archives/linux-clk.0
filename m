Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <9dd477896f4dc3b354d5875f8c4ecce1807c375c.camel@baylibre.com>
Subject: Re: [PATCH] clk: meson-axg: pcie: drop the mpll3 clock parent
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Qiufang Dai
 <qiufang.dai@amlogic.com>, Jianxin Qin <jianxin.qin@amlogic.com>, Jian Hu
 <jian.hu@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Mon, 27 Aug 2018 15:21:40 +0200
In-Reply-To: <20180801121625.9488-1-yixun.lan@amlogic.com>
References: <20180801121625.9488-1-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2018-08-01 at 12:16 +0000, Yixun Lan wrote:
> We found the PCIe driver doesn't really work with
> the mpll3 clock which is actually reserved for debug,
> So drop it from the mux list.
> 
> Fixes: 33b89db68236 ("clk: meson-axg: add clocks required by pcie driver")
> Tested-by: Jianxin Qin <jianxin.qin@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> 
> ---

Applied, Thx
