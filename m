Return-Path: <shawnguo@kernel.org>
Date: Mon, 13 Feb 2017 21:05:36 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Baoyou Xie <baoyou.xie@linaro.org>, lgirdwood@gmail.com,
	robh+dt@kernel.org, mark.rutland@arm.com, jun.nie@linaro.org,
	mturquette@baylibre.com, sboyd@codeaurora.org, perex@perex.cz,
	tiwai@suse.com, shawn.guo@linaro.org, vinod.koul@intel.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, mathieu.poirier@linaro.org,
	xie.baoyou@zte.com.cn, chen.chaokai@zte.com.cn,
	wang.qiang01@zte.com.cn
Subject: Re: [PATCH v4 2/3] ASoC: zx-i2s: Add the info of pclk to the binding
 document for zx2967 family
Message-ID: <20170213130534.GA4151@dragon>
References: <1486609978-18482-1-git-send-email-baoyou.xie@linaro.org>
 <1486609978-18482-2-git-send-email-baoyou.xie@linaro.org>
 <20170209164645.ztvockrd6jxpybwt@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170209164645.ztvockrd6jxpybwt@sirena.org.uk>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Feb 09, 2017 at 04:46:45PM +0000, Mark Brown wrote:
> On Thu, Feb 09, 2017 at 11:12:57AM +0800, Baoyou Xie wrote:
> 
> > - - compatible : Must be "zte,zx296702-i2s"
> > + - compatible : Must be one of:
> > +	"zte,zx296718-i2s", "zte,zx296702-i2s"
> > +	"zte,zx296702-i2s"
> 
> You've added the new compatible twice here?

It's indeed a bit confusing.  Might be better if we add a couple of
bullet like below.

 - compatible : Must be one of:
	- "zte,zx296718-i2s", "zte,zx296702-i2s";
	- "zte,zx296702-i2s";

In this case, it's more easier for readers to understand that the first
one is for I2S device on SoC ZX296718, while it's compatible with the
I2S on ZX296702.

Shawn
