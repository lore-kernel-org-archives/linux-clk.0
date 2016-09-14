Return-Path: <robh+dt@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20160913070722.5867-1-zajec5@gmail.com>
References: <20160905142935.4550-1-zajec5@gmail.com> <20160913070722.5867-1-zajec5@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 14 Sep 2016 18:44:40 -0500
Message-ID: <CAL_Jsq+KF0gVx7=HvyBhXP2p+5+-Q-pKOmNFM4MXpR6bJ_BDFA@mail.gmail.com>
Subject: Re: [PATCH V8] clk: bcm: Add driver for BCM53573 ILP clock
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>,
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>,
	Jon Mason <jonmason@broadcom.com>, Eric Anholt <eric@anholt.net>,
	Stephen Warren <swarren@wwwdotorg.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Tue, Sep 13, 2016 at 2:06 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> This clock is present on BCM53573 devices (including BCM47189) that use
> Cortex-A7. ILP is a part of PMU (Power Management Unit) multi-function
> device so we use syscon (and regmap) for it.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
> V2: Rebase on top of clk-next
>     Use ALP as parent clock
>     Improve comments
>     Switch from ioremap_nocache to ioremap
>     Check of_clk_add_provide result for error
> V3: Drop #include <linux/moduleh>
>     Make ILP DT entry part of PMU
>     Describe ILP as subdevice of PMU in Documentation
> V4: Use BCM53573 name as suggested by Jon and Ray. It seems "Northstar"
>     (even if used in some resources) should be used in relation to
>     Cortex-A9 devices only.
> V5: Rename remaining "ns" references to "bcm53573", sorry, I sent V4 too
>     early.
> V6: Drop #include <linux/clk.h>
>     Use "int" as type where it matches usage
>     Add cpu_relax() in the loop
>     Add disable callback
>     Use _hw_ functions for registering struct clk_hw (new API)
>
>     Thanks a lot Stephen!
> V7: Use syscon and regmap (thanks Rob!)
> V8: Update Documentation (drop unused "reg", unit address)
> ---
>  .../bindings/clock/brcm,bcm53573-ilp.txt           |  36 +++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/clk/bcm/Makefile                           |   1 +
>  drivers/clk/bcm/clk-bcm53573-ilp.c                 | 148 +++++++++++++++=
++++++
>  3 files changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573=
-ilp.txt
>  create mode 100644 drivers/clk/bcm/clk-bcm53573-ilp.c
