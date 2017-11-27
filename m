Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1511789830.30519.3.camel@baylibre.com>
Subject: Re: [PATCH v4 1/4] clk: meson: gxbb: fix wrong clock for SARADC/SANA
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
  linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Mon, 27 Nov 2017 14:37:10 +0100
In-Reply-To: <20171107141223.1507-1-yixun.lan@amlogic.com>
References: <20171107141223.1507-1-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-11-07 at 22:12 +0800, Yixun Lan wrote:
> According to the datasheet, in Meson-GXBB/GXL series,
> The clock gate bit for SARADC is HHI_GCLK_MPEG2 bit[22],
> while clock gate bit for SANA is HHI_GCLK_MPEG0 bit[10].
> 
> Test passed at gxl-s905x-p212 board.
> 
> The following published datasheets are wrong and should be updated
> [1] GXBB v1.1.4
> [2] GXL v0.3_20170314
> 
> Fixes: 738f66d3211d ("clk: gxbb: add AmLogic GXBB clk controller driver")
> Tested-by: Xingyu Chen <xingyu.chen@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---

Applied fixes/drivers
Thanks
