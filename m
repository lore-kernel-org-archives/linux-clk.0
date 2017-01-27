Return-Path: <sboyd@codeaurora.org>
Date: Fri, 27 Jan 2017 10:47:45 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Chris Brand <chris.brand@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Thierry Reding <treding@nvidia.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Juri Lelli <juri.lelli@arm.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCHv5 0/5] Support for Marvell switches with integrated CPUs
Message-ID: <20170127184745.GD8801@codeaurora.org>
References: <20170127032546.14657-1-chris.packham@alliedtelesis.co.nz>
 <87wpdgwj72.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87wpdgwj72.fsf@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 01/27, Gregory CLEMENT wrote:
> Hi all,
>  
>  On ven., janv. 27 2017, Chris Packham <chris.packham@alliedtelesis.co.nz> wrote:
> 
> > The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with
> > integrated CPUs. They CPU block is common within these product lines and
> > (as far as I can tell/have been told) is based on the Armada XP. There
> > are a few differences due to the fact they have to squeeze the CPU into
> > the same package as the switch.
> >
> > I've rebased this series against linux-pinctrl/devel to get access to
> > mvebu_mmio_mpp_ctrl. Everything else still applies cleanly to
> > v4.10.0-rc5.
> 
> Just to let you know that I plan to apply the 3 arm patch once Chris
> will have sent the new series with the minor fixes I asked on patch 3.
> 
> I already applied them in the for-next branch to benefit of some build
> test coverage.
> 
> Stephen,
> 
> you gave your Acked-by on the first patch, but don't you plan to apply
> it on the clk branch?

It must have not been clear if I should apply it, hence the ack.
I'll apply it now.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
