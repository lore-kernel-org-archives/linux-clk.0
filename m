Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 23 May 2017 10:19:09 -0500
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Nadav Haklai <nadavh@marvell.com>,
	Kostya Porotchkin <kostap@marvell.com>,
	Neta Zur Hershkovits <neta@marvell.com>,
	Marcin Wojtas <mw@semihalf.com>, Omri Itach <omrii@marvell.com>,
	Shadi Ammouri <shadi@marvell.com>
Subject: Re: [PATCH 3/7] clk: mvebu: cp110: do not depend anymore of the
 *-clock-output-names
Message-ID: <20170523151909.3n37igjjsfx6ojun@rob-hp-laptop>
References: <cover.737145f06ff0191d1a9210bcd141e679bf45fe5f.1495208533.git-series.gregory.clement@free-electrons.com>
 <e47d288af5d42d4cc145eb7fa708f984a0fc0d9d.1495208533.git-series.gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <e47d288af5d42d4cc145eb7fa708f984a0fc0d9d.1495208533.git-series.gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, May 19, 2017 at 05:55:21PM +0200, Gregory CLEMENT wrote:
> Using the *-clock-output-names property was a convenient way to have a
> unique name for each clock even when there are multiple cp110 blocks
> as we can find on Armada 8K.
> 
> However it has some drawbacks: the main one being a stronger link than
> necessary between the driver and the device tree. For example the clock
> name can't be changed, removed or moved. It is still the early stage of
> introduction of the Armada 7K/8K and the hardware is still not totally
> documented, especially for the clock part. By removing the use of
> *-clock-output-names it will be easier to add new clocks without breaking
> the compatibility.
> 
> The name of each clock is now created by using its physical address as a
> prefix (as it was done for the platform device names). Thanks to this we
> have an automatic way to compute a unique name.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt |  14 +----------
>  drivers/clk/mvebu/cp110-system-controller.c                                | 106 ++++++++++++++++++++++++++++++++++++++++++++----------------------------
>  2 files changed, 65 insertions(+), 55 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
