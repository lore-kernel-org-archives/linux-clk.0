Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Sep 2016 16:02:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: gabriel.fernandez@st.com
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@gmail.com>,
	Patrice Chotard <patrice.chotard@st.com>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Olivier Bideau <olivier.bideau@st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrzej Hajda <a.hajda@samsung.com>, Pankaj Dev <pankaj.dev@st.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@stlinux.com,
	linux-clk@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
	Peter Griffin <peter.griffin@linaro.org>, arnaud.pouliquen@st.com,
	benjamin.gaignard@st.com, vincent.abriou@st.com,
	Gabriel Fernandez <gabriel.fernandez@linaro.org>
Subject: Re: [PATCH v3 02/14] drivers: clk: st: Simplify clock binding of
 STiH4xx platforms
Message-ID: <20160916230257.GO7243@codeaurora.org>
References: <1472473626-15398-1-git-send-email-gabriel.fernandez@st.com>
 <1472473626-15398-3-git-send-email-gabriel.fernandez@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1472473626-15398-3-git-send-email-gabriel.fernandez@st.com>
List-ID: <linux-clk.vger.kernel.org>

On 08/29, gabriel.fernandez@st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@st.com>
> 
> This patch reworks the clock binding to avoid too much detail in DT.
> Now we have only compatible string per type of clock
> (remark from Rob https://lkml.org/lkml/2016/5/25/492)
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@st.com>
> Acked-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
