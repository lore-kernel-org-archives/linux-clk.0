Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 29 Jan 2018 12:52:37 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Nicolas Pitre <nico@linaro.org>, daniel.thompson@linaro.org,
	philippe.cornu@st.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, gabriel.fernandez.st@gmail.com
Subject: Re: [PATCH 1/2] clk: stm32: END_PRIMARY_CLK should be declare after
 CLK_SYSCLK
Message-ID: <20180129185237.kbtvr2uhbxjfpfyj@rob-hp-laptop>
References: <1516286980-8603-1-git-send-email-gabriel.fernandez@st.com>
 <1516286980-8603-2-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1516286980-8603-2-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 18, 2018 at 03:49:39PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> Update of END_PRIMARY_CLK was missed, it should be after CLK_SYSCLK
> hsi and sysclk are overwritten by gpioa and gpiob.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  include/dt-bindings/clock/stm32fx-clock.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
