Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 28 Nov 2017 10:30:22 -0600
From: Rob Herring <robh@kernel.org>
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Carlo Caione <carlo@caione.org>,
	Qiufang Dai <qiufang.dai@amlogic.com>,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: meson-axg: add clock controller drivers
Message-ID: <20171128163022.7b7wvfqedkhhnaj6@rob-hp-laptop>
References: <20171128125330.363-1-yixun.lan@amlogic.com>
 <20171128125330.363-3-yixun.lan@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171128125330.363-3-yixun.lan@amlogic.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Nov 28, 2017 at 08:53:29PM +0800, Yixun Lan wrote:
> From: Qiufang Dai <qiufang.dai@amlogic.com>
> 
> Add clock controller drivers for Amlogic Meson-AXG SoC.
> 
> Signed-off-by: Qiufang Dai <qiufang.dai@amlogic.com>
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>
> ---
>  arch/arm64/Kconfig.platforms         |   1 +
>  drivers/clk/meson/Kconfig            |   8 +
>  drivers/clk/meson/Makefile           |   1 +
>  drivers/clk/meson/axg.c              | 948 +++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/axg.h              | 126 +++++

>  include/dt-bindings/clock/axg-clkc.h |  72 +++

This belongs in the binding patch.

Otherwise, 

Acked-by: Rob Herring <robh@kernel.org>


>  6 files changed, 1156 insertions(+)
>  create mode 100644 drivers/clk/meson/axg.c
>  create mode 100644 drivers/clk/meson/axg.h
>  create mode 100644 include/dt-bindings/clock/axg-clkc.h
