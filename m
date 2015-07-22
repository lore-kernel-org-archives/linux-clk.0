Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1437553489.22203.6.camel@mtksdaap41>
Subject: Re: [PATCH 1/5] clocksource: mediatek: do not enable GPT_CLK_EVT
 when setup
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Daniel Kurtz <djkurtz@chromium.org>
CC: James Liao <jamesjj.liao@mediatek.com>,
	Russell King <linux@arm.linux.org.uk>,
	srv_heupstream <srv_heupstream@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Olof Johansson" <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	<linux-mediatek@lists.infradead.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	<linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Date: Wed, 22 Jul 2015 16:24:49 +0800
In-Reply-To: <CAGS+omD8k_Cfxv3bYyjmjtLbiavo-WmJPn0Z-CBhN_nnv65Tag@mail.gmail.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
	 <1436779969-18610-2-git-send-email-yingjoe.chen@mediatek.com>
	 <CAGS+omD8k_Cfxv3bYyjmjtLbiavo-WmJPn0Z-CBhN_nnv65Tag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2015-07-14 at 15:39 +0800, Daniel Kurtz wrote:
> Hi Yingjoe,
> 
> On Mon, Jul 13, 2015 at 5:32 PM, Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
> > Spurious mtk timer interrupt is noticed at boot and cause kernel
> > crash. It seems if GPT is enabled, it will latch irq status even
> > when its IRQ is disabled. When irq is enabled afterward, we see
> > spurious interrupt.
> > Change init flow to only enable GPT_CLK_SRC at mtk_timer_init.
> >
> > Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > ---
> >  drivers/clocksource/mtk_timer.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/clocksource/mtk_timer.c b/drivers/clocksource/mtk_timer.c
> > index 68ab423..237c20b 100644
> > --- a/drivers/clocksource/mtk_timer.c
> > +++ b/drivers/clocksource/mtk_timer.c
> > @@ -156,9 +156,11 @@ static void mtk_timer_global_reset(struct mtk_clock_event_device *evt)
> >         writel(0x3f, evt->gpt_base + GPT_IRQ_ACK_REG);
> >  }
> >
> > -static void
> > -mtk_timer_setup(struct mtk_clock_event_device *evt, u8 timer, u8 option)
> > +static void mtk_timer_setup(struct mtk_clock_event_device *evt, u8 timer,
> > +                           u8 option, bool enable)
> 
> This function can be: __init
> 
> Other than this tiny nit, and the small potential conflict in patch 4,
> this whole series is:
> 
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> 
> (I do think it is a bit strange that the mediatek,mt6577-timer binding
> does not use "clock-names", but that is independent of this patch
> set).
> 


Hi Daniel,

Thanks for your review.

I added __init as you suggested, and Pi-Cheng already sent an updated
version of his patch to resolve the conflict[1].

Joe.C

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001592.html



