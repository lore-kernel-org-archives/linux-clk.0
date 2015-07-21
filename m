Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Yingjoe Chen <yingjoe.chen@mediatek.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Russell King <linux@arm.linux.org.uk>,
	devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Sascha Hauer <kernel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: mediatek: enable MTK_TIMER
Date: Tue, 21 Jul 2015 09:52:21 +0200
Message-ID: <8509032.5CRGhrucRP@ubix>
In-Reply-To: <alpine.DEB.2.11.1507180931190.18576@nanos>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com> <1956087.MUsCyY7Qyv@ubix> <alpine.DEB.2.11.1507180931190.18576@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Saturday, July 18, 2015 09:31:53 AM Thomas Gleixner wrote:
> On Fri, 17 Jul 2015, Matthias Brugger wrote:
> > On Monday, July 13, 2015 05:32:47 PM Yingjoe Chen wrote:
> > > Enable MTK_TIMER for MediaTek plaform, which will be used as
> > > schedule clock.
> > > 
> > > Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > > ---
> > 
> > Applied, thanks.
> 
> So you enable the current code w/o the modifications required for this
> to work?
> 

Well as the timer is not defined in dts it should not break the board...
But yes you are right, I will drop this commit for now.

Thanks,
Matthias
