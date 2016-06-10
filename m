Return-Path: <tony@atomide.com>
Date: Fri, 10 Jun 2016 04:36:40 -0700
From: Tony Lindgren <tony@atomide.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, lee.jones@linaro.org,
	robh+dt@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	t-kristo@ti.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH v1 06/14] ARM: dts: omap5-board-common: Add pdmclk
 binding for audio
Message-ID: <20160610113639.GE22406@atomide.com>
References: <20160530085522.30398-1-peter.ujfalusi@ti.com>
 <20160530085522.30398-7-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160530085522.30398-7-peter.ujfalusi@ti.com>
List-ID: <linux-clk.vger.kernel.org>

* Peter Ujfalusi <peter.ujfalusi@ti.com> [160530 01:58]:
> The twl6040 codec is generating the pdmclk, which is used by the McPDM as
> functional clock.

Applying patches 6 - 10 into omap-for-v4.8/dt thanks.

Tony
