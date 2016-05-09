Return-Path: <sboyd@codeaurora.org>
Date: Mon, 9 May 2016 15:13:39 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: James Liao <jamesjj.liao@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, John Crispin <blogic@openwrt.org>,
	Arnd Bergmann <arnd@arndb.de>, Sascha Hauer <kernel@pengutronix.de>,
	Daniel Kurtz <djkurtz@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
	srv_heupstream@mediatek.com
Subject: Re: [PATCH v7 8/9] clk: mediatek: Add config options for MT2701
 subsystem clocks
Message-ID: <20160509221339.GU3492@codeaurora.org>
References: <1460621514-65191-1-git-send-email-jamesjj.liao@mediatek.com>
 <1460621514-65191-9-git-send-email-jamesjj.liao@mediatek.com>
 <20160506230214.GH3492@codeaurora.org>
 <1462772246.5344.4.camel@mtksdaap41>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1462772246.5344.4.camel@mtksdaap41>
List-ID: <linux-clk.vger.kernel.org>

On 05/09, James Liao wrote:
> HI Stephen,
> 
> On Fri, 2016-05-06 at 16:02 -0700, Stephen Boyd wrote:
> > On 04/14, James Liao wrote:
> > > MT2701 subsystem clocks are optional and should be enabled only if
> > > their subsystem drivers are ready to control these clocks.
> > > 
> > > Signed-off-by: James Liao <jamesjj.liao@mediatek.com>
> > > ---
> > 
> > Why is this patch split off from the patch that introduces the
> > file?
> 
> I was looking for comments about how to make subsystem clocks optional.
> So I used a separated patch to do it. Is it an acceptable way to use
> config options to enable subsystem clock support?
> 

Yes config options are fine.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
