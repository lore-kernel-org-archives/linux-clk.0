Return-Path: <dianders@google.com>
MIME-Version: 1.0
In-Reply-To: <1484011661-13474-1-git-send-email-zhengxing@rock-chips.com>
References: <1484011661-13474-1-git-send-email-zhengxing@rock-chips.com>
From: Doug Anderson <dianders@google.com>
Date: Mon, 9 Jan 2017 19:08:32 -0800
Message-ID: <CAD=FV=XWWt4tfEh0x7pHiCz8mzag3NLBzPO1Z9EPMQ=TxAK5Yw@mail.gmail.com>
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
> +Optional Properties:
> +
> +- rockchip,grf: phandle to the syscon managing the "general register files"
> +  If missing pll rates are not changable, due to the missing pll lock status.

On rk3399 the GRF isn't used for pll lock status.  It's used for PLL muxes.

...so technically if you don't include it then the PLL muxes won't be
changeable.  Hopefully the code handles this if the property is listed
as "Optional".  ...and unless Heiko says otherwise, you probably need
to list it as "Optional" since (presumably) there might be backward
compatibility issues.

-Doug
