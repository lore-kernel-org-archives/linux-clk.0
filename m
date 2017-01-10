Return-Path: <dianders@google.com>
MIME-Version: 1.0
In-Reply-To: <1484011661-13474-1-git-send-email-zhengxing@rock-chips.com>
References: <1484011661-13474-1-git-send-email-zhengxing@rock-chips.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 9 Jan 2017 19:06:16 -0800
Message-ID: <CAD=FV=UsMR=HD5799N7ny_Ce8XXCkcd3R3tpX34AEC6UmGkXtA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: rockchip: add "rockchip, grf" property for
 RK3399 PMUCRU/CRU
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
	Caesar Wang <wxt@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>,
	Brian Norris <briannorris@chromium.org>, Jianqun Xu <jay.xu@rock-chips.com>,
	Elaine Zhang <zhangqing@rock-chips.com>, David Wu <david.wu@rock-chips.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Mon, Jan 9, 2017 at 5:27 PM, Xing Zheng <zhengxing@rock-chips.com> wrote:
> The structure rockchip_clk_provider needs to refer the GRF regmap
> in somewhere, if the CRU node has not "rockchip,grf" property,
> calling syscon_regmap_lookup_by_phandle will return an invalid GRF
> regmap, and the MUXGRF type clock will be not supported.
>
> Therefore, we need to add them.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
>
> Changes in v3:
> - add optional roperty rockchip,grf in rockchip,rk3399-cru.txt
>
> Changes in v2:
> - referring pmugrf for PMUGRU
> - fix the typo "invaild" in COMMIT message
>
>  Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt | 5 +++++
>  arch/arm64/boot/dts/rockchip/rk3399.dtsi                        | 2 ++

"dts" and bindings shouldn't change in the same patch since they go
through different trees.  This is why I said:

> This looks sane to me, but before you land it you need to first send
> up a (separate) patch that adjusts:
>       --------

AKA: you need a two patch series here.

Sometimes it's OK to include bindings together with code changes
(depends on the maintainer), but never with dts changes.

-Doug
