Return-Path: <sboyd@codeaurora.org>
Date: Thu, 21 Dec 2017 15:13:41 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Antoine Tenart <antoine.tenart@free-electrons.com>,
	=?iso-8859-1?Q?Miqu=E8l?= Raynal <miquel.raynal@free-electrons.com>,
	Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>,
	Hua Jing <jinghua@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>
Subject: Re: [PATCH 0/3] Add DVFS support on CPU clock for Armada 37xx
Message-ID: <20171221231341.GC7997@codeaurora.org>
References: <20171130134029.20751-1-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171130134029.20751-1-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 11/30, Gregory CLEMENT wrote:
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
> 

Are you relying on the clk API returning an error to detect if
DVFS is present or not? Just curious why that part of the code
was there.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
