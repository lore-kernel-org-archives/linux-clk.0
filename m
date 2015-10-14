Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Scott Branden <sbranden@broadcom.com>
Cc: Jon Mason <jonmason@broadcom.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Florian Fainelli <f.fainelli@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Ray Jui <rjui@broadcom.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: Re: [PATCH v2 7/7] clk: ns2: add clock support for Broadcom Northstar 2 SoC
Date: Wed, 14 Oct 2015 22:16:45 +0200
Message-ID: <6398606.WW44dcgQDV@wuerfel>
In-Reply-To: <561EB10B.40502@broadcom.com>
References: <1444770485-11210-1-git-send-email-jonmason@broadcom.com> <6427519.eIBEvCNlle@wuerfel> <561EB10B.40502@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 14 October 2015 12:46:19 Scott Branden wrote:
> >
> > My patch fixes it by always selecting COMMON_CLK_IPROC from
> > ARCH_BCM_CYGNUS. I wasn't sure whether you want COMMON_CLK_IPROC
> > to still be user-selectable, so I left that in place. Normally
> > I'd expect it to be a silent option though, that just gets
> > implicitly enabled whenever a platform that needs it is built
> > into the kernel.
> COMMON_CLK_IPROC can be a silent option and selected as Arnd has done below.

Ok, please do that then. If you want to apply my patch directly,
you can remove that last paragraph from the description.

> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Scott Branden <sbranden@broadcom.com>

Thanks for taking a look!

	Arnd
