Return-Path: <sboyd@codeaurora.org>
Date: Wed, 5 Apr 2017 14:52:26 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: gabriel.fernandez@st.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	daniel.thompson@linaro.org, andrea.merello@gmail.com,
	radoslaw.pietrzyk@gmail.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: stm32f4: fix timeout management for pll and
 ready gate
Message-ID: <20170405215226.GG7065@codeaurora.org>
References: <1489652201-19889-1-git-send-email-gabriel.fernandez@st.com>
 <1489652201-19889-3-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1489652201-19889-3-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/16, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Use a classic polling to test bit ready.
> And the shift of the bit ready of LSE & LSI were wrongs.
> 
> Fixes: 861adc44d290 ("clk: stm32f4: Add LSI & LSE clocks")
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
