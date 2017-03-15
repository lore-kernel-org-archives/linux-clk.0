Return-Path: <sboyd@codeaurora.org>
Date: Wed, 15 Mar 2017 13:43:07 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: gabriel.fernandez@st.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	daniel.thompson@linaro.org, andrea.merello@gmail.com,
	radoslaw.pietrzyk@gmail.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] STM32F4 clock fixes
Message-ID: <20170315204307.GK10239@codeaurora.org>
References: <1489588071-18164-1-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489588071-18164-1-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/15, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch-set contains 2 fixes.
> One concerning exclusion of wrong values for PLLQ (0 & 1)
> And the second is a fix about timeout management of PLL and LSE/LSI clocks.

But neither of the patches have a "Fixes" tag. Can you please
indicate what commits they're fixing?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
