Return-Path: <tglx@linutronix.de>
Date: Sat, 18 Jul 2015 09:31:53 +0200 (CEST)
From: Thomas Gleixner <tglx@linutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
cc: Yingjoe Chen <yingjoe.chen@mediatek.com>,
    Stephen Boyd <sboyd@codeaurora.org>,
    Michael Turquette <mturquette@baylibre.com>,
    James Liao <jamesjj.liao@mediatek.com>,
    Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org,
    Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
    Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
    Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
    Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>,
    srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
    Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: mediatek: enable MTK_TIMER
In-Reply-To: <1956087.MUsCyY7Qyv@ubix>
Message-ID: <alpine.DEB.2.11.1507180931190.18576@nanos>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com> <1436779969-18610-4-git-send-email-yingjoe.chen@mediatek.com> <1956087.MUsCyY7Qyv@ubix>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

On Fri, 17 Jul 2015, Matthias Brugger wrote:

> On Monday, July 13, 2015 05:32:47 PM Yingjoe Chen wrote:
> > Enable MTK_TIMER for MediaTek plaform, which will be used as
> > schedule clock.
> > 
> > Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > ---
> 
> Applied, thanks.

So you enable the current code w/o the modifications required for this
to work?

Thanks,

	tglx
