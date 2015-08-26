Return-Path: <daniel.lezcano@linaro.org>
Return-Path: <daniel.lezcano@linaro.org>
Message-ID: <55DD6CC4.6010708@linaro.org>
Date: Wed, 26 Aug 2015 09:37:40 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
MIME-Version: 1.0
To: Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 James Liao <jamesjj.liao@mediatek.com>
CC: Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
 Olof Johansson <olof@lixom.net>,
 srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Daniel Kurtz <djkurtz@chromium.org>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/5] add GPT timer support for mt8173
References: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
In-Reply-To: <1436779969-18610-1-git-send-email-yingjoe.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 07/13/2015 11:32 AM, Yingjoe Chen wrote:
> This series add GPT timer support for mt8173. This is based on v4.2-rc1
> and Matthias' next branch (for dts parts).
>
> The first 2 patches comes from 'Add SMP bringup support for mt65xx socs'
> series [1]. I decide to move these 2 patches to this series, since it
> is more relevent here. They are changed based on Matthias' and Daniel's
> comments.
>
> [1] http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000714.html
>
> Daniel Kurtz (1):
>    arm64: dts: mt8173: add timer node
>
> Yingjoe Chen (4):
>    clocksource: mediatek: do not enable GPT_CLK_EVT when setup
>    clocksource: mediatek: Use GPT as sched clock source
>    arm64: mediatek: enable MTK_TIMER
>    clk: mediatek: add 13mhz clock for MT8173
>
>   arch/arm64/Kconfig                       |  1 +
>   arch/arm64/boot/dts/mediatek/mt8173.dtsi |  9 +++++++++
>   drivers/clk/mediatek/clk-mt8173.c        |  5 +++++
>   drivers/clocksource/mtk_timer.c          | 26 ++++++++++++++++++++------
>   include/dt-bindings/clock/mt8173-clk.h   |  3 ++-
>   5 files changed, 37 insertions(+), 7 deletions(-)

Who will take this patchset ? I can take the patch 2 if needed.


-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
