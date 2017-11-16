Return-Path: <shawn.guo@linaro.org>
Return-Path: <shawn.guo@linaro.org>
Date: Thu, 16 Nov 2017 14:47:16 +0800
From: Shawn Guo <shawn.guo@linaro.org>
To: Jiancheng Xue <xuejiancheng@hisilicon.com>
Cc: hermit.wangheming@hisilicon.com, sboyd@codeaurora.org,
	mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, project-aspen-dev@linaro.org,
	tianshuliang <tianshuliang@hisilicon.com>
Subject: Re: [project-aspen-dev] Re: [PATCH 1/3] clk: hisilicon: add hisi
 phase clock support
Message-ID: <20171116064715.GC24950@dragon>
References: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
 <1508324429-6012-2-git-send-email-xuejiancheng@hisilicon.com>
 <20171116023131.GI11163@dragon>
 <78d5a8dc-5009-332b-e888-c37dc68bac91@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <78d5a8dc-5009-332b-e888-c37dc68bac91@hisilicon.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 16, 2017 at 11:40:18AM +0800, Jiancheng Xue wrote:
> >> +struct clk_hisi_phase {
> >> +	struct clk_hw	hw;
> >> +	void __iomem	*reg;
> >> +	u32		*phase_values;
> >> +	u32		*phase_regs;
> >> +	u8		phase_num;
> > 
> > I do not think this value-reg table is necessary, as the register value
> > maps to phase degree in a way that is easy for programming, i.e. degree
> > increases 45 with register value increases one.
> > 
> We expected that this interface could be more generic. That means it can
> be also used in other maps instances.

Okay, if you think there will be some case using different programming
model, I'm fine with it.

Shawn
