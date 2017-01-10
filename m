Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 9 Jan 2017 23:35:31 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Nicolas Pitre <nico@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
	daniel.thompson@linaro.org, andrea.merello@gmail.com,
	radoslaw.pietrzyk@gmail.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, kernel@stlinux.com, ludovic.barre@st.com,
	olivier.bideau@st.com, amelie.delaunay@st.com
Subject: Re: [PATCH 1/4] clk: stm32f7: Add stm32f7 clock DT bindings for
 STM32F746 boards
Message-ID: <20170110053531.dp2xt3bpprzb76gi@rob-hp-laptop>
References: <1483711165-17149-1-git-send-email-gabriel.fernandez@st.com>
 <1483711165-17149-2-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1483711165-17149-2-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 06, 2017 at 02:59:22PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch introduces the stm32f7 clock DT bindings.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  .../devicetree/bindings/clock/st,stm32-rcc.txt       | 20 ++++++++++++++++++++
>  include/dt-bindings/clock/stm32fx-clock.h            | 20 ++++++++++++++++++++
>  2 files changed, 40 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
