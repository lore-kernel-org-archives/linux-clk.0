Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,  Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>,  Andrew Lunn
 <andrew@lunn.ch>,  Jason Cooper <jason@lakedaemon.net>,  Hua Jing
 <jinghua@marvell.com>,  Antoine Tenart
 <antoine.tenart@free-electrons.com>,  Nadav Haklai <nadavh@marvell.com>,
  Victor Gu <xigu@marvell.com>,  Neta Zur Hershkovits <neta@marvell.com>,
  =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@free-electrons.com>,  Marcin
 Wojtas <mw@semihalf.com>,  Wilson Ding <dingwei@marvell.com>,
  linux-arm-kernel@lists.infradead.org,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 0/3] Add DVFS support on CPU clock for Armada 37xx
References: <20171130134029.20751-1-gregory.clement@free-electrons.com>
Date: Thu, 21 Dec 2017 11:53:27 +0100
In-Reply-To: <20171130134029.20751-1-gregory.clement@free-electrons.com>
	(Gregory CLEMENT's message of "Thu, 30 Nov 2017 14:40:26 +0100")
Message-ID: <87efnofj2w.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hello,
 
 On jeu., nov. 30 2017, Gregory CLEMENT <gregory.clement@free-electrons.com> wrote:

> Hi,
>
> This small series is needed to use DVFS on Armada 37xx. When DVFS is
> enabled the CPU clock setting is done using an other set of registers
> from the North Bridge Power Management block.
>
> The series adds the possibility to modify the CPU frequency using the
> associate load level matching the target frequency. However
> configuring the frequencies for each load is done by the cpufreq
> driver submitted in a separate series.
>
> Obviously having both series (cpufreq and clk) is needed to support
> DVFS on Armada 37xx, but there is no dependencies between the series
> (for building or at runtime).


I sent this series 3 weeks ago and I didn't have any feedback on
it. Does it mean that the series is OK for you and that you wait for a
PR for it?

Thanks,

Gregory



>
> Gregory CLEMENT (3):
>   clk: mvebu: armada-37xx-periph: cosmetic changes
>   clk: mvebu: armada-37xx-periph: prepare cpu clk to be used with DVFS
>   clk: mvebu: armada-37xx-periph: add DVFS support for cpu clocks
>
>  drivers/clk/mvebu/armada-37xx-periph.c | 310 +++++++++++++++++++++++++++++++--
>  1 file changed, 293 insertions(+), 17 deletions(-)
>
> -- 
> 2.15.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
