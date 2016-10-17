Return-Path: <arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
To: Pan Wen <wenpan@hisilicon.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, xuwei5@hisilicon.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, howell.yang@hisilicon.com, xuejiancheng@hisilicon.com, jalen.hsu@hisilicon.com, lvkuanliang@hisilicon.com, suwenping@hisilicon.com, raojun@hisilicon.com, kevin.lixu@hisilicon.com, Marty Plummer <netz.kernel@gmail.com>
Subject: Re: [PATCH 1/3] arm: hisi: add ARCH_MULTI_V5 support
Date: Mon, 17 Oct 2016 15:48:49 +0200
Message-ID: <5893354.6MrIxqzRoI@wuerfel>
In-Reply-To: <20161017120705.3726-2-wenpan@hisilicon.com>
References: <20161017120705.3726-1-wenpan@hisilicon.com> <20161017120705.3726-2-wenpan@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

On Monday, October 17, 2016 8:07:03 PM CEST Pan Wen wrote:
> Add support for some HiSilicon SoCs which depend on ARCH_MULTI_V5.
> 
> Signed-off-by: Pan Wen <wenpan@hisilicon.com>
> 

Looks ok. I've added Marty Plummer to Cc, he was recently proposing
patches for Hi3520, which I think is closely related to this one.
Please try to work together so the patches don't conflict. It should
be fairly straightforward since you are basically doing the same
change here.

	Arnd
