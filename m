Return-Path: <dongas86@gmail.com>
Return-Path: <dongas86@gmail.com>
Date: Mon, 8 May 2017 19:07:26 +0800
From: Dong Aisheng <dongas86@gmail.com>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@pengutronix.de, broonie@kernel.org, yibin.gong@nxp.com,
	rjw@rjwysocki.net, viresh.kumar@linaro.org, mturquette@baylibre.com,
	shawnguo@kernel.org, fabio.estevam@nxp.com, anson.huang@nxp.com,
	ping.bai@nxp.com, leonard.crestez@nxp.com, octavian.purdila@nxp.com
Subject: Re: [RFC PATCH 0/3] clk: introduce clk_bulk_get accessories
Message-ID: <20170508110726.GA18153@b29396-OptiPlex-7040>
References: <1491969809-20154-1-git-send-email-aisheng.dong@nxp.com>
 <20170422030419.GV7065@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170422030419.GV7065@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 21, 2017 at 08:04:19PM -0700, Stephen Boyd wrote:
> On 04/12, Dong Aisheng wrote:
> > 
> > Together with the err path handling for each clocks, it does make
> > things a bit ugly.
> > 
> > Since we already have regulator_bulk_get accessories, i thought we
> > probably could introduce clk_bulk_get as well to handle such case to
> > ease the driver owners' life. 
> > 
> > Besides IMX cpufreq driver, there is also some similar cases
> > in kernel which could befinit from this api as well.
> > e.g.
> > drivers/cpufreq/tegra124-cpufreq.c
> > drivers/cpufreq/s3c2412-cpufreq.c
> > sound/soc/samsung/smdk_spdif.c
> > arch/arm/mach-omap1/serial.c
> > ...
> > 
> > And actually, if we handle clocks more than 3, then it might be
> > worthy to try, which there is quite many manay in kernel and
> > that probably could save a lot codes.
> > 
> > This is a RFC patch intending to bring up the idea to discuss.
> > 
> 
> Idea seems fine to me. Please also add Russell King, as we need
> an ack from him on the clk.h API changes.
> 

Great! Thanks! And sorry to miss Russell King.
Quite willing to add him to help review in the next series.

Regards
Dong Aisheng
