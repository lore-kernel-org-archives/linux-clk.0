Return-Path: <wens@csie.org>
MIME-Version: 1.0
In-Reply-To: <1441977997-29041-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1441977997-29041-1-git-send-email-maxime.ripard@free-electrons.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 16 Sep 2015 13:42:11 +0800
Message-ID: <CAGb2v67oU-0_Wt8Z0JFRmAXbOamSf_tME51wB25NYkNnx3XvtA@mail.gmail.com>
Subject: Re: [PATCH 0/4] ARM: sun8i: Fix A23 and A33 clock gates indices
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 11, 2015 at 9:26 PM, Maxime Ripard
<maxime.ripard@free-electrons.com> wrote:
> Hi everyone,
>
> Here is a patch set that adds the missing clocks for the message box
> in the A33 and A23 SoCs.
>
> In order to support that properly, the addition of a new clock driver
> for the A33 has been needed, and we split the gates definition that
> was previously shared to each DTSI.
>
> Let me know what you think,
> Maxime
>
> Maxime Ripard (4):
>   clk: sunxi: Add A33 gates support
>   ARM: sun8i: Add the A33 AHB1 gates clock driver
>   ARM: sun8i: Move A23 AHB1 gates out of common DTSI
>   ARM: sun8i: A23: Add missing msgbox gate
>
>  arch/arm/boot/dts/sun8i-a23-a33.dtsi | 25 -------------------------
>  arch/arm/boot/dts/sun8i-a23.dtsi     | 25 +++++++++++++++++++++++++
>  arch/arm/boot/dts/sun8i-a33.dtsi     | 27 +++++++++++++++++++++++++++
>  drivers/clk/sunxi/clk-simple-gates.c |  2 ++
>  4 files changed, 54 insertions(+), 25 deletions(-)

Apart from the small issue with the second patch's commit message,
this series looks good.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
