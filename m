Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
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
Subject: Re: [PATCH 2/5] clocksource: mediatek: Use GPT as sched clock source
Date: Fri, 17 Jul 2015 23:49:40 +0200
Message-ID: <1649653.yGMEJPDvvi@ubix>
In-Reply-To: <1436779969-18610-3-git-send-email-yingjoe.chen@mediatek.com>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com> <1436779969-18610-3-git-send-email-yingjoe.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Monday, July 13, 2015 05:32:46 PM Yingjoe Chen wrote:
> When cpu is in deep idle, arch timer will stop counting. Setup GPT as
> sched clock source so it can keep counting in idle.
> 
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
