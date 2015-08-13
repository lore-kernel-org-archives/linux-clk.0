Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <1439287924-6988-1-git-send-email-hl@rock-chips.com>
References: <1439287924-6988-1-git-send-email-hl@rock-chips.com>
Date: Thu, 13 Aug 2015 16:10:52 +0200
Message-ID: <CACRpkdZpk+djjb08Ls0CQdCD=wmNYQSDTMWwgJs_CMGYWXpoQw@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] clk: rockchip: add pclk_pd_pmu to the list of
 rk3288 critical clocks
From: Linus Walleij <linus.walleij@linaro.org>
To: Lin Huang <hl@rock-chips.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	Doug Anderson <dianders@chromium.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Aug 11, 2015 at 12:12 PM, Lin Huang <hl@rock-chips.com> wrote:

> From: Heiko Stuebner <heiko@sntech.de>
>
> pclk_pd_pmu needs to keep running and with the upcoming gpio clock
> handling this is not always the case anymore. So add it to the list
> of critical clocks for now.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Lin Huang <hl@rock-chips.com>
> ---
> Changes in v5:
> - Add From: Heiko Stuebner <heiko@sntech.de>
> - Add Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Patch applied to the pinctrl tree with Doug's reviwe tag and
Stephen B's ACK.

Yours,
Linus Walleij
