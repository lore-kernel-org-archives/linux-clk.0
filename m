Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 16:34:58 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	daniel.thompson@linaro.org, andrea.merello@gmail.com,
	radoslaw.pietrzyk@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, ludovic.barre@st.com,
	olivier.bideau@st.com, amelie.delaunay@st.com
Subject: Re: [PATCH v2 1/3] dt-bindings: mfd: stm32f4: Fix STM32F4_X_CLOCK()
 macro
Message-ID: <20170121003458.GW20800@codeaurora.org>
References: <1483952833-14704-1-git-send-email-gabriel.fernandez@st.com>
 <1483952833-14704-2-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1483952833-14704-2-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/09, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Macro to select a clock was not correct.
> 
> Offset of enable register starts at 0x30, then calculation to select a bit is:
> (@enable_reg - 0x30) / 4 * 32 + bit_to_select
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Tested-by: M'boumba Cedric Madianga <cedric.madianga@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
