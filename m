Return-Path: <f.fainelli@gmail.com>
Return-Path: <f.fainelli@gmail.com>
Subject: Re: [PATCHv2 0/5] Support for Marvell switches with integrated CPUs
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-arm-kernel@lists.infradead.org
References: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij
 <linus.walleij@linaro.org>, Jason Cooper <jason@lakedaemon.net>,
 Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Arnd Bergmann <arnd@arndb.de>,
 Thierry Reding <treding@nvidia.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Juri Lelli <juri.lelli@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Laxman Dewangan <ldewangan@nvidia.com>,
 Kalyan Kinthada <kalyan.kinthada@alliedtelesis.co.nz>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6c6795d3-06ab-a4f0-78ad-5ecc78c1aa2f@gmail.com>
Date: Wed, 4 Jan 2017 20:07:37 -0800
MIME-Version: 1.0
In-Reply-To: <20170105033641.6212-1-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Le 01/04/17 à 19:36, Chris Packham a écrit :
> The 98DX3236, 98DX3336 and 98DX4251 are a set of switch ASICs with
> integrated CPUs. They CPU block is common within these product lines and
> (as far as I can tell/have been told) is based on the Armada XP. There
> are a few differences due to the fact they have to squeeze the CPU into
> the same package as the switch.

It's really great to see these changes, do you have a plan to also add
support for the integrated switch using a DSA/switchdev driver?

Thanks!
-- 
Florian
