Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <20161125002852.18097-1-megous@megous.com>
References: <20161125002852.18097-1-megous@megous.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Nov 2016 11:22:53 +0800
Message-ID: <CAGb2v65wC_xjdx6Vk55xUPxkzg+hgi+pNF1tXhJJ53TWWHG+5Q@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH] clk: sunxi-ng: fix PLL_CPUX adjusting on H3
To: =?UTF-8?Q?Ond=C5=99ej_Jirman?= <megous@megous.com>
Cc: dev <dev@linux-sunxi.org>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Maxime Ripard <maxime.ripard@free-electrons.com>,
	Chen-Yu Tsai <wens@csie.org>, Jorik Jonker <jorik@kippendief.biz>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Nov 25, 2016 at 8:28 AM,  <megous@megous.com> wrote:
> From: Ondrej Jirman <megous@megous.com>
>
> When adjusting PLL_CPUX on H3, the PLL is temporarily driven
> too high, and the system becomes unstable (oopses or hangs).
>
> Add a notifier to avoid this situation by temporarily switching
> to a known stable 24 MHz oscillator.
>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Tested-by: Lutz Sammer <johns98@gmx.net>

A Fixes tag would be nice. Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>
