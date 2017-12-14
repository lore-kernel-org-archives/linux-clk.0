Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
Message-ID: <1513245499.32163.2.camel@baylibre.com>
Subject: Re: [PATCH v7 3/6] clk: meson-axg: add clocks dt-bindings required
 header
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yixun Lan <yixun.lan@amlogic.com>, Neil Armstrong
 <narmstrong@baylibre.com>,  Kevin Hilman <khilman@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Carlo Caione <carlo@caione.org>,  Qiufang Dai
 <qiufang.dai@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 linux-amlogic@lists.infradead.org,  devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Thu, 14 Dec 2017 10:58:19 +0100
In-Reply-To: <20171211141348.22048-4-yixun.lan@amlogic.com>
References: <20171211141348.22048-1-yixun.lan@amlogic.com>
	 <20171211141348.22048-4-yixun.lan@amlogic.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On Mon, 2017-12-11 at 22:13 +0800, Yixun Lan wrote:
> From: Qiufang Dai <qiufang.dai@amlogic.com>
> 
> Add the required header for the clocks ID dt-bindings
> exported from various subsystem in the Meson-AXG SoC.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Applied to next/dt

Thx

> ---
>  include/dt-bindings/clock/axg-clkc.h | 71 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
