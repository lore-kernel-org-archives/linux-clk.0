Return-Path: <matthias.bgg@gmail.com>
Return-Path: <matthias.bgg@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@codeaurora.org>, Michael Turquette <mturquette@baylibre.com>, James Liao <jamesjj.liao@mediatek.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>, Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org, Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5] clocksource: mediatek: do not enable GPT_CLK_EVT when setup
Date: Fri, 17 Jul 2015 23:56:35 +0200
Message-ID: <287437450.ZlyYtovZRG@ubix>
In-Reply-To: <1436779969-18610-2-git-send-email-yingjoe.chen@mediatek.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com> <1436779969-18610-2-git-send-email-yingjoe.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Monday, July 13, 2015 05:32:45 PM Yingjoe Chen wrote:
> Spurious mtk timer interrupt is noticed at boot and cause kernel
> crash. It seems if GPT is enabled, it will latch irq status even
> when its IRQ is disabled. When irq is enabled afterward, we see
> spurious interrupt.
> Change init flow to only enable GPT_CLK_SRC at mtk_timer_init.
> 
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
