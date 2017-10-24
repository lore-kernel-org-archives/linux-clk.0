Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Romain Perier <romain.perier@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, philipp.tomsich@theobroma-systems.com, klaus.goger@theobroma-systems.com, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 4/4] arm64: dts: rockchip: add efuse for RK3368 SoCs
Date: Tue, 24 Oct 2017 15:37:33 +0200
Message-ID: <5744497.0PmpLyO0rR@phil>
In-Reply-To: <20170904085119.25981-5-romain.perier@collabora.com>
References: <20170904085119.25981-1-romain.perier@collabora.com> <20170904085119.25981-5-romain.perier@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 4. September 2017, 10:51:19 CEST schrieb Romain Perier:
> This adds the definition for eFuse that is found on RK3368 SoCs with the
> corresponding data cells.
> 
> Signed-off-by: Romain Perier <romain.perier@collabora.com>

applied for 4.15 after the following changes
- moved efuse node to its correct position (determined by register address)
- use correct clock-id as added by patch1 (efuse256 without the underscore)
- added the #address- and #size-cells properties for the subnodes
  to make dtc happy

Please pay a bit more attention for future patches.


Thanks
Heiko
