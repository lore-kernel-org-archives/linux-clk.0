Return-Path: <magnus.damm@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1746913.nJHMkg2anu@avalon>
References: <20150828091550.21731.85227.sendpatchset@little-apple>
	<20150828091602.21731.21262.sendpatchset@little-apple>
	<1746913.nJHMkg2anu@avalon>
Date: Sat, 29 Aug 2015 17:33:19 +0900
Message-ID: <CANqRtoS-rvW5-0aZ+aKwX4Kjnuf9pahGA2jqpjRHK116MZKY1Q@mail.gmail.com>
Subject: Re: [PATCH v3 01/04] clk: shmobile: Get rid of CONFIG_ARCH_SHMOBILE_MULTI
From: Magnus Damm <magnus.damm@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, SH-Linux <linux-sh@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Gaku Inami <gaku.inami.xw@bp.renesas.com>,
	Stephen Boyd <sboyd@codeaurora.org>, "Simon Horman [Horms]" <horms@verge.net.au>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

Hi Laurent,

On Sat, Aug 29, 2015 at 4:59 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> Hi Magnus,
>
> Thank you for the patch.
>
> On Friday 28 August 2015 18:16:02 Magnus Damm wrote:
>> From: Magnus Damm <damm+renesas@opensource.se>
>>
>> Shmobile is all multiplatform these days, so get rid of the
>> reference to CONFIG_ARCH_SHMOBILE_MULTI. Also instead of always
>> enabling DIV6 and MSTP adjust the Makefile to enable DIV6 and
>> MSTP depending on if they are included in the SoC or not.
>>
>> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Assuming you have verified that adding the same object file several times to
> obj-y won't cause any issue,

Yeah. A good example of such (mis)use is in arch/arm/mach-shmobile/Kconfig.
I've also built 32-bit shmobile_defconfig and 64-bit defconfig without issues.

> Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

/ magnus
