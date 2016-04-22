Return-Path: <sboyd@codeaurora.org>
Date: Fri, 22 Apr 2016 14:37:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	mturquette@baylibre.com, lee.jones@linaro.org, lgirdwood@gmail.com,
	broonie@kernel.org, a.zummo@towertech.it,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	zyw@rock-chips.com
Subject: Re: [PATCH v2 6/7] clk: Kconfig: Name RK818 in Kconfig for
 COMMON_CLK_RK808
Message-ID: <20160422213757.GG13149@codeaurora.org>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
 <1461244361-45686-7-git-send-email-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1461244361-45686-7-git-send-email-w.egorov@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

On 04/21, Wadim Egorov wrote:
> The RK808 and RK818 PMICs are using a similar register map.
> We can reuse the clk driver for the RK818 PMIC. So let's add
> the RK818 in the Kconfig description.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
