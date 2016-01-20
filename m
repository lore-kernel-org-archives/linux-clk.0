Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Return-Path: <Marc_Gonzalez@sigmadesigns.com>
Subject: Re: [PATCH] clk: tango4: rename ARCH_TANGOX to ARCH_TANGO
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>
CC: linux-clk <linux-clk@vger.kernel.org>
References: <5698F34D.20101@sigmadesigns.com>
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Message-ID: <569F7A01.4060700@sigmadesigns.com>
Date: Wed, 20 Jan 2016 13:13:53 +0100
MIME-Version: 1.0
In-Reply-To: <5698F34D.20101@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-15"
List-ID: <linux-clk.vger.kernel.org>

On 15/01/2016 14:25, Marc Gonzalez wrote:

> Requested by arm-soc maintainer Kevin Hilman in v9 review.
> http://article.gmane.org/gmane.linux.ports.arm.kernel/456331
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
>  drivers/clk/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

If I understand correctly, Linux maintainers are currently busy
pushing their trees into 4.5-rc1 ?

Can this trivial fix be included in 4.5-rc2 in order to match the
platform code that will go in 4.5-rc1 ?

https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/tree/arch/arm/mach-tango/Kconfig

Regards.
