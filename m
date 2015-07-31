Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <1438312441.26889.5.camel@mtksdaap41>
Subject: Re: [PATCH v2 1/5] clocksource: mediatek: do not enable GPT_CLK_EVT
 when setup
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
CC: Stephen Boyd <sboyd@codeaurora.org>,
	James Liao <jamesjj.liao@mediatek.com>,
	Russell King <linux@arm.linux.org.uk>,
	srv_heupstream <srv_heupstream@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	<linux-mediatek@lists.infradead.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>, <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Daniel Kurtz <djkurtz@chromium.org>
Date: Fri, 31 Jul 2015 11:14:01 +0800
In-Reply-To: <1437552878-3684-1-git-send-email-yingjoe.chen@mediatek.com>
References: <CAGS+omD8k_Cfxv3bYyjmjtLbiavo-WmJPn0Z-CBhN_nnv65Tag@mail.gmail.com>
	 <1437552878-3684-1-git-send-email-yingjoe.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 2015-07-22 at 16:14 +0800, Yingjoe Chen wrote:
> Spurious mtk timer interrupt is noticed at boot and cause kernel
> crash. It seems if GPT is enabled, it will latch irq status even
> when its IRQ is disabled. When irq is enabled afterward, we see
> spurious interrupt.
> Change init flow to only enable GPT_CLK_SRC at mtk_timer_init.
> 
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---
> Update to my patch [1], added __init as Daniel suggest. This is the
> only patch that need to change in that series, so I only sent this one.
> 
> http://lists.infradead.org/pipermail/linux-mediatek/2015-July/001545.html


Hi Daniel, Thomas,

Any suggestions for mtk_timer fixes in this series?
Should I resend and add tags from the reviewers?

Joe.C


