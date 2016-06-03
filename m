Return-Path: <shawn.lin@rock-chips.com>
Subject: Re: [RFC PATCH v1 2/6] clk: rockchip: rk3399: add SCLK_DDRCLK ID for
 ddrc
To: Lin Huang <hl@rock-chips.com>, heiko@sntech.de, mark.yao@rock-chips.com,
 myungjoo.ham@samsung.com
References: <1464947719-6245-1-git-send-email-hl@rock-chips.com>
 <1464947719-6245-3-git-send-email-hl@rock-chips.com>
Cc: shawn.lin@rock-chips.com, huangtao@rock-chips.com, typ@rock-chips.com,
 airlied@linux.ie, mturquette@baylibre.com, dbasehore@chromium.org,
 sboyd@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, kyungmin.park@samsung.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <9d392979-0a20-ca74-9699-2440d07dddd3@rock-chips.com>
Date: Fri, 3 Jun 2016 20:34:52 +0800
MIME-Version: 1.0
In-Reply-To: <1464947719-6245-3-git-send-email-hl@rock-chips.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Lin

How about merge it into your patch#3.

On 2016/6/3 17:55, Lin Huang wrote:
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> ---
> Changes in v1:
> - None
>
>  include/dt-bindings/clock/rk3399-cru.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/dt-bindings/clock/rk3399-cru.h b/include/dt-bindings/clock/rk3399-cru.h
> index 50a44cf..8a0f0442 100644
> --- a/include/dt-bindings/clock/rk3399-cru.h
> +++ b/include/dt-bindings/clock/rk3399-cru.h
> @@ -131,6 +131,7 @@
>  #define SCLK_DPHY_RX0_CFG		165
>  #define SCLK_RMII_SRC			166
>  #define SCLK_PCIEPHY_REF100M		167
> +#define SCLK_DDRCLK			168
>
>  #define DCLK_VOP0			180
>  #define DCLK_VOP1			181
>


-- 
Best Regards
Shawn Lin
