Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55DACCEF.8040004@linaro.org>
Date: Mon, 24 Aug 2015 09:51:11 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
MIME-Version: 1.0
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
CC: Daniel Kurtz <djkurtz@chromium.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	James Liao <jamesjj.liao@mediatek.com>,
	Russell King <linux@arm.linux.org.uk>,
	srv_heupstream <srv_heupstream@mediatek.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Rob Herring <robh+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Sascha Hauer <kernel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/5] clocksource: mediatek: do not enable GPT_CLK_EVT
 when setup
References: <CAGS+omD8k_Cfxv3bYyjmjtLbiavo-WmJPn0Z-CBhN_nnv65Tag@mail.gmail.com>		 <1437552878-3684-1-git-send-email-yingjoe.chen@mediatek.com>		 <55CC56C4.8080201@linaro.org> <1439820602.3414.12.camel@mtksdaap41>	 <55D5E40A.6080904@linaro.org> <1440167950.20169.29.camel@mtksdaap41>
In-Reply-To: <1440167950.20169.29.camel@mtksdaap41>
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/21/2015 04:39 PM, Yingjoe Chen wrote:

[ ... ]

>>    - Does the spurious interrupt occurs *every* time ? at each boot ?
>
> Yes. If you applied this series to enable mtk timer without this fix on
> mt8173 or mt8135 you can reproduce it. It occurs for every boot.
>
> It crash before uart driver is ready, so you'll have to use earlycon to
> see the crash log.

Can you give me the earlycon params ?

Thanks.

  -- Daniel

-- 
  <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

