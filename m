Return-Path: <vz@mleia.com>
Subject: Re: [PATCH v7 1/3] clk: nxp: clk-lpc32xx: rename
 clk_gate_is_enabled()
To: gabriel.fernandez@st.com, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>
References: <1500474344-9832-1-git-send-email-gabriel.fernandez@st.com>
 <1500474344-9832-2-git-send-email-gabriel.fernandez@st.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Russell King <linux@armlinux.org.uk>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Nicolas Pitre <nico@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, daniel.thompson@linaro.org,
 andrea.merello@gmail.com, radoslaw.pietrzyk@gmail.com,
 Lee Jones <lee.jones@linaro.org>, Sylvain Lemieux <slemieux.tyco@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 ludovic.barre@st.com, olivier.bideau@st.com, amelie.delaunay@st.com,
 gabriel.fernandez.st@gmail.com, Arvind Yadav <arvind.yadav.cs@gmail.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <6626e519-0b69-367c-1966-6dee894febfc@mleia.com>
Date: Thu, 20 Jul 2017 00:00:23 +0300
MIME-Version: 1.0
In-Reply-To: <1500474344-9832-2-git-send-email-gabriel.fernandez@st.com>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hello Gabriel,

On 07/19/2017 05:25 PM, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> We need to export clk_gate_is_enabled() from clk framework, then
> to avoid compilation issue we have to rename clk_gate_is_enabled()
> in NXP LPC32xx clock driver.
> We changed all gate op with 'lpc32xx_' prefix:
> lpc32xx_clk_gate_enable(),
> lpc32xx_clk_gate_disable(),
> lpc32xx_clk_gate_is_enabled().
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
With best wishes,
Vladimir
