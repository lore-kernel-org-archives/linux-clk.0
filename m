Return-Path: <lee.jones@linaro.org>
Return-Path: <lee.jones@linaro.org>
Date: Tue, 10 May 2016 15:03:20 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, mturquette@baylibre.com, sboyd@codeaurora.org,
	lgirdwood@gmail.com, broonie@kernel.org, a.zummo@towertech.it,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	zyw@rock-chips.com
Subject: Re: [PATCH v5 3/6] regulator: rk808: Add regulator driver for RK818
Message-ID: <20160510140320.GO19473@dell>
References: <1462886340-7893-1-git-send-email-w.egorov@phytec.de>
 <1462886340-7893-4-git-send-email-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <1462886340-7893-4-git-send-email-w.egorov@phytec.de>
List-ID: <linux-clk.vger.kernel.org>

On Tue, 10 May 2016, Wadim Egorov wrote:

> Add support for the rk818 regulator. The regulator module consists
> of 4 DCDCs, 9 LDOs, 1 switch and 1 BOOST converter which is used to
> power OTG and HDMI5V.
> 
> The output voltages are configurable and are meant to supply power
> to the main processor and other components.
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---
>  drivers/regulator/Kconfig           |   4 +-
>  drivers/regulator/rk808-regulator.c | 143 ++++++++++++++++++++++++++++++++++--
>  2 files changed, 138 insertions(+), 9 deletions(-)

Needs an Ack before I can take the set.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
