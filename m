Return-Path: <sergei.shtylyov@cogentembedded.com>
Return-Path: <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH] clk: renesas: build clk-rcar-gen2.o for R8A7792
To: Arnd Bergmann <arnd@arndb.de>, Simon Horman <horms+renesas@verge.net.au>,
 Magnus Damm <damm+renesas@opensource.se>
References: <20160620154341.2242033-1-arnd@arndb.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <80e447e0-b220-6669-b5ea-be43f635f4d2@cogentembedded.com>
Date: Mon, 20 Jun 2016 20:34:24 +0300
MIME-Version: 1.0
In-Reply-To: <20160620154341.2242033-1-arnd@arndb.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hello.

On 06/20/2016 06:43 PM, Arnd Bergmann wrote:

> The newly added support for R8A7792 causes build failures
> because we try to call rcar_gen2_clocks_init but that is not
> built into the kernel:
>
> arch/arm/mach-shmobile/built-in.o: In function `rcar_gen2_timer_init':
> :(.init.text+0x3b0): undefined reference to `rcar_gen2_clocks_init'
>
> This changes the clk Makefile to match the other platforms, though
> I guess it would be better to find another way to do this, e.g.
> by not requiring the external function call by relying on
> CLK_OF_DECLARE(), or by making the ARCH_RCAR_GEN2 also control
> the compilation of the clk driver.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: 3ebee0adbfe7 ("ARM: shmobile: r8a7792: basic SoC support")
> ---
>  drivers/clk/renesas/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/renesas/Makefile b/drivers/clk/renesas/Makefile
> index ead8bb843524..3cdb9aaf8717 100644
> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -6,6 +6,7 @@ obj-$(CONFIG_ARCH_R8A7778)		+= clk-r8a7778.o
>  obj-$(CONFIG_ARCH_R8A7779)		+= clk-r8a7779.o
>  obj-$(CONFIG_ARCH_R8A7790)		+= clk-rcar-gen2.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7791)		+= clk-rcar-gen2.o clk-div6.o
> +obj-$(CONFIG_ARCH_R8A7792)		+= clk-rcar-gen2.o
>  obj-$(CONFIG_ARCH_R8A7793)		+= clk-rcar-gen2.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7794)		+= clk-rcar-gen2.o clk-div6.o
>  obj-$(CONFIG_ARCH_R8A7795)		+= r8a7795-cpg-mssr.o

    It was in the very first patch that I submitted for this SoC:

    http://marc.info/?t=146421262300001&r=1

    It should be queued up by Geert.

MBR, Sergei
