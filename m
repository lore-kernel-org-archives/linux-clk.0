Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1522140044.2632.19.camel@baylibre.com>
Subject: Re: [PATCH v2 1/7] clk: meson: drop meson_aoclk_gate_regmap_ops
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>, Carlo
 Caione <carlo@caione.org>
Cc: Rob Herring <robh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Qiufang Dai <qiufang.dai@amlogic.com>,
 linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Tue, 27 Mar 2018 10:40:44 +0200
In-Reply-To: <20180323143816.200573-2-yixun.lan@amlogic.com>
References: <20180323143816.200573-1-yixun.lan@amlogic.com>
	 <20180323143816.200573-2-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Fri, 2018-03-23 at 22:38 +0800, Yixun Lan wrote:
> let's remove the unused meson_aoclk_gate_regmap_ops
> 
> Fixes: 1f932d99710d ("clk: meson: remove superseded aoclk_gate_regmap")
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---

Applied, Thx
