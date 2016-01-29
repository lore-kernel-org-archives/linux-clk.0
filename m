Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1454008958-12655-2-git-send-email-maxime.ripard@free-electrons.com>
References: <1454008958-12655-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454008958-12655-2-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 29 Jan 2016 17:56:09 +0800
Message-ID: <CAGb2v677CEsr49P0xC_3hQYNfMoxRS-B7ptL8_dWsAUX-wPsUQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] clk: sunxi: Refactor A31 PLL6 so that it can be reused
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Jens Kuske <jenskuske@gmail.com>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>, Jean-Francois Moine <moinejf@free.fr>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jan 29, 2016 at 3:22 AM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Remove the fixed dividers from the PLL6 driver to be able to have a
> reusable driver that can be used across several SoCs that share the same
> controller, but don't have the same set of dividers for this clock, and to
> also be reused multiple times in the same SoC, since we're droping the
> clock name.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
> Changes from v2
>   - Rebased and converted over to the new factors refactoring. Fixed the
>     retrieved rate
>
>  arch/arm/boot/dts/sun6i-a31.dtsi     | 36 ++++++++++++++++++------------------
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 25 +++++++++++++++++--------
>  arch/arm/boot/dts/sun8i-a23.dtsi     |  2 +-
>  arch/arm/boot/dts/sun8i-a33.dtsi     |  4 ++--
>  arch/arm/boot/dts/sun8i-h3.dtsi      | 36 ++++++++++++++++++------------------
>  drivers/clk/sunxi/clk-sunxi.c        | 32 ++++++++++++++++----------------
>  6 files changed, 72 insertions(+), 63 deletions(-)

Please also update the #clock-cells section of
Documentation/devicetree/bindings/clock/sunxi.txt

Otherwise,

Acked-by: Chen-Yu Tsai <wens@csie.org>
