Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 5 Feb 2018 00:09:33 -0600
From: Rob Herring <robh@kernel.org>
To: gabriel.fernandez@st.com
Cc: Mark Rutland <mark.rutland@arm.com>, Lee Jones <lee.jones@linaro.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@st.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, gabriel.fernandez.st@gmail.com,
	olivier.bideau@st.com
Subject: Re: [PATCH 02/14] dt-bindings: clock: add STM32MP1 clocks
Message-ID: <20180205042348.2f7ssmzkajeky5l7@rob-hp-laptop>
References: <1517580222-23301-1-git-send-email-gabriel.fernandez@st.com>
 <1517580222-23301-3-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1517580222-23301-3-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Feb 02, 2018 at 03:03:30PM +0100, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch adds the clock binding entry for STM32MP1
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> ---
>  include/dt-bindings/clock/stm32mp1-clks.h | 248 ++++++++++++++++++++++++++++++
>  1 file changed, 248 insertions(+)
>  create mode 100644 include/dt-bindings/clock/stm32mp1-clks.h

You can squash this into the previous patch.
