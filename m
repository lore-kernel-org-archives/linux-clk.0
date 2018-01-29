Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Mon, 29 Jan 2018 17:12:40 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, linux-rockchip@lists.infradead.org,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	yang.zheng@rock-chips.com, zhangqing@rock-chips.com
Subject: Re: [PATCH 7/7] clk: rockchip: document hdmi_phy external input for
 rk3328
Message-ID: <20180129231240.qgcpggenb4s3g3i4@rob-hp-laptop>
References: <20180122141530.12398-1-heiko@sntech.de>
 <20180122141530.12398-8-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180122141530.12398-8-heiko@sntech.de>
List-ID: <linux-clk.vger.kernel.org>

On Mon, Jan 22, 2018 at 03:15:30PM +0100, Heiko Stuebner wrote:
> The hdmi-phy block inside the soc also loops its pll output back
> into the clock controller, so document that already used input clock.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
