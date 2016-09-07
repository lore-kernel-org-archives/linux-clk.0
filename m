Return-Path: <sboyd@codeaurora.org>
Date: Wed, 7 Sep 2016 14:28:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-clk@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-amlogic@lists.infradead.org, jbrunet@baylibre.com,
	johnyoun@synopsys.com, kishon@ti.com, khilman@baylibre.com,
	carlo@caione.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, mturquette@baylibre.com,
	will.deacon@arm.com, catalin.marinas@arm.com,
	gregkh@linuxfoundation.org, mark.rutland@arm.com,
	robh+dt@kernel.org
Subject: Re: [PATCH 1/7] clk: gxbb: expose USB clocks
Message-ID: <20160907212836.GC12510@codeaurora.org>
References: <20160904213152.25837-1-martin.blumenstingl@googlemail.com>
 <20160904213152.25837-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160904213152.25837-2-martin.blumenstingl@googlemail.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/04, Martin Blumenstingl wrote:
> USB0_DDR_BRIDGE and USB1_DDR_BRIDGE1 are needed for the related
> dwc2 usb controller. USB, USB0 and USB1 are needed for the PHYs.
> Expose these clocks to DT and comment out in clk driver.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---

Assuming authorship is resolved:

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
