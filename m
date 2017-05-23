Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 23 May 2017 09:08:48 -0500
From: Rob Herring <robh@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: heiko@sntech.de, xf@rock-chips.com, linux-clk@vger.kernel.org,
	huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com, mturquette@baylibre.com, sboyd@codeaurora.org,
	zhengxing@rock-chips.com
Subject: Re: [PATCH v2 2/3] dt-bindings: add bindings for rk3128 clock
 controller
Message-ID: <20170523140848.7a3auouimenz5ii2@rob-hp-laptop>
References: <1495073819-4160-1-git-send-email-zhangqing@rock-chips.com>
 <1495073819-4160-3-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1495073819-4160-3-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, May 18, 2017 at 10:16:58AM +0800, Elaine Zhang wrote:
> Add devicetree bindings for Rockchip cru which found on
> Rockchip SoCs.
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3128-cru.txt         | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3128-cru.txt

This and patch 1 can be combined, but don't have to be. For both:

Acked-by: Rob Herring <robh@kernel.org>
