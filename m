Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:36680 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S965219AbdEWIaC (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 May 2017 04:30:02 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>, mark.rutland@arm.com
Cc: xf@rock-chips.com, linux-clk@vger.kernel.org,
        huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        robh+dt@kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org,
        zhengxing@rock-chips.com
Subject: Re: [PATCH v3 1/3] clk: rockchip: add dt-binding header for rk3128
Date: Tue, 23 May 2017 10:29:52 +0200
Message-ID: <1725571.3NA4bbO7jm@phil>
In-Reply-To: <1495501865-18512-2-git-send-email-zhangqing@rock-chips.com>
References: <1495501865-18512-1-git-send-email-zhangqing@rock-chips.com> <1495501865-18512-2-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Elaine,

Am Dienstag, 23. Mai 2017, 09:11:03 CEST schrieb Elaine Zhang:
> Add the dt-bindings header for the rk3128,
> that gets shared between the clock controller and
> the clock references in the dts.
> Add softreset ID for rk3128.
> And it also applies to the RK3126 SoC.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  include/dt-bindings/clock/rk3128-cru.h | 283 +++++++++++++++++++++++++++++++++
>  1 file changed, 283 insertions(+)
>  create mode 100644 include/dt-bindings/clock/rk3128-cru.h
> 
> diff --git a/include/dt-bindings/clock/rk3128-cru.h b/include/dt-bindings/clock/rk3128-cru.h
> new file mode 100644
> index 000000000000..5f055a41584b
> --- /dev/null
> +++ b/include/dt-bindings/clock/rk3128-cru.h

[...]

> +#define SCLK_USB480M		154
> +#define SCLK_USB480M_PHY	155

We probably don't need the clock-id for USB480M_PHY, as it is an external
clock and is unused. Instead as I wrote in the previous patch, it should
be added to the list of external clocks in the binding txt document.


Heiko
