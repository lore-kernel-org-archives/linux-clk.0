Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:53850 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755675AbdESKbb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 May 2017 06:31:31 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: xf@rock-chips.com, linux-clk@vger.kernel.org,
        huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
        sboyd@codeaurora.org, zhengxing@rock-chips.com
Subject: Re: [PATCH v2 2/3] dt-bindings: add bindings for rk3128 clock controller
Date: Fri, 19 May 2017 12:31:18 +0200
Message-ID: <3487841.3AV9ZOvb54@phil>
In-Reply-To: <1495073819-4160-3-git-send-email-zhangqing@rock-chips.com>
References: <1495073819-4160-1-git-send-email-zhangqing@rock-chips.com> <1495073819-4160-3-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Elaine,

Am Donnerstag, 18. Mai 2017, 10:16:58 CEST schrieb Elaine Zhang:
> Add devicetree bindings for Rockchip cru which found on
> Rockchip SoCs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3128-cru.txt         | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt b/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
> new file mode 100644
> index 000000000000..455a9a00a623
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt
> @@ -0,0 +1,56 @@
> +* Rockchip RK3128 Clock and Reset Unit
> +
> +The RK3128 clock controller generates and supplies clock to various
> +controllers within the SoC and also implements a reset controller for SoC
> +peripherals.
> +
> +Required Properties:
> +
> +- compatible: should be "rockchip,rk3128-cru"
> +- reg: physical base address of the controller and length of memory mapped
> +  region.
> +- #clock-cells: should be 1.
> +- #reset-cells: should be 1.
> +
> +Optional Properties:
> +
> +- rockchip,grf: phandle to the syscon managing the "general register files"
> +  If missing pll rates are not changeable, due to the missing pll lock status.
> +
> +Each clock is assigned an identifier and client nodes can use this identifier
> +to specify the clock which they consume. All available clocks are defined as
> +preprocessor macros in the dt-bindings/clock/rk3128-cru.h headers and can be
> +used in device tree sources. Similar macros exist for the reset sources in
> +these files.
> +
> +External clocks:
> +
> +There are several clocks that are generated outside the SoC. It is expected
> +that they are defined using standard clock bindings with following
> +clock-output-names:
> + - "xin24m" - crystal input - required,
> + - "ext_i2s" - external I2S clock - optional,
> + - "gmac_clkin" - external GMAC clock - optional

missing usb480m_phy as external clock, that comes back from the usbphy block.


Otherwise looks good
Heiko

