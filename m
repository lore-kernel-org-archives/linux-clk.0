Return-Path: <sboyd@codeaurora.org>
Date: Fri, 2 Oct 2015 12:32:35 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gabriel Fernandez <gabriel.fernandez@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Maxime Coquelin <maxime.coquelin@st.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@arm.linux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Pankaj Dev <pankaj.dev@st.com>,
	Olivier Bideau <olivier.bideau@st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabian Frederick <fabf@skynet.be>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@stlinux.com, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/4] drivers: clk: st: Support for enable/disable in
 Clockgen PLLs
Message-ID: <20151002193234.GT12338@codeaurora.org>
References: <1440409251-11166-1-git-send-email-gabriel.fernandez@linaro.org>
 <1440409251-11166-2-git-send-email-gabriel.fernandez@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1440409251-11166-2-git-send-email-gabriel.fernandez@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 08/24, Gabriel Fernandez wrote:
> The patch adds support for enable/disable of the Clockgen PLLs.
> clkgen_pll_enable/clkgen_pll_disable added as generic function for all PLLs.
> 
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
