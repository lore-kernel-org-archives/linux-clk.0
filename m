Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 3 Jan 2017 14:41:21 -0600
From: Rob Herring <robh@kernel.org>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: heiko@sntech.de, mturquette@baylibre.com, sboyd@codeaurora.org,
	xf@rock-chips.com, mark.rutland@arm.com, linux-clk@vger.kernel.org,
	huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/4] dt-bindings: add bindings for rk3328 clock
 controller
Message-ID: <20170103204121.cmbtttx5oogfmm5y@rob-hp-laptop>
References: <1482979511-6847-1-git-send-email-zhangqing@rock-chips.com>
 <1482979511-6847-3-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1482979511-6847-3-git-send-email-zhangqing@rock-chips.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Dec 29, 2016 at 10:45:09AM +0800, Elaine Zhang wrote:
> Add devicetree bindings for Rockchip cru which found on
> Rockchip SoCs.
> 
> Changes in v4:
>   dropping the "rockchip,cru" and "syscon" properties for bindings of rk3328
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  .../bindings/clock/rockchip,rk3328-cru.txt         | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3328-cru.txt

Acked-by: Rob Herring <robh@kernel.org>
