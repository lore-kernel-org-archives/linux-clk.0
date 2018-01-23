Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 23 Jan 2018 09:52:24 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jason Cooper <jason@lakedaemon.net>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/9] mfd: syscon: Add ingenic-tcu.h header
Message-ID: <20180123095224.oxso26lfzl3x56up@dell>
References: <20180101143344.2099-1-paul@crapouillou.net>
 <20180110224838.16711-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20180110224838.16711-1-paul@crapouillou.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, 10 Jan 2018, Paul Cercueil wrote:

> This header contains macros for the registers that are present in the
> regmap shared by all the drivers related to the TCU (Timer Counter Unit)
> of the Ingenic JZ47xx SoCs.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  include/linux/mfd/syscon/ingenic-tcu.h | 54 ++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 include/linux/mfd/syscon/ingenic-tcu.h

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
