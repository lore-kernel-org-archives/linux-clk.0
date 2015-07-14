Return-Path: <sboyd@codeaurora.org>
Date: Mon, 13 Jul 2015 17:40:48 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Sascha Hauer <kernel@pengutronix.de>,
	Olof Johansson <olof@lixom.net>, srv_heupstream@mediatek.com,
	linux-arm-kernel@lists.infradead.org,
	Daniel Kurtz <djkurtz@chromium.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/5] clocksource: mediatek: Use GPT as sched clock source
Message-ID: <20150714004048.GM30412@codeaurora.org>
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
 <1436779969-18610-3-git-send-email-yingjoe.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1436779969-18610-3-git-send-email-yingjoe.chen@mediatek.com>
List-ID: <linux-clk.vger.kernel.org>

On 07/13, Yingjoe Chen wrote:
> When cpu is in deep idle, arch timer will stop counting. Setup GPT as
> sched clock source so it can keep counting in idle.
> 
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
