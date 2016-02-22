Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Andrew Lunn <andrew@lunn.ch>,
 "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20160222141617.GA14970@lunn.ch>
Cc: "Rob Herring" <robh@kernel.org>, "Stephen Boyd" <sboyd@codeaurora.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 "Ian Campbell" <ijc+devicetree@hellion.org.uk>,
 "Pawel Moll" <pawel.moll@arm.com>, "Mark Rutland" <mark.rutland@arm.com>,
 "Kumar Gala" <galak@codeaurora.org>, "Jason Cooper" <jason@lakedaemon.net>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Gregory Clement" <gregory.clement@free-electrons.com>,
 "Nadav Haklai" <nadavh@marvell.com>, "Lior Amsalem" <alior@marvell.com>,
 linux-arm-kernel@lists.infradead.org
References: <1455521698-7905-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1455521698-7905-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160222025357.GE15973@rob-hp-laptop>
 <20160222091423.4756a579@free-electrons.com> <20160222141617.GA14970@lunn.ch>
Message-ID: <20160222183203.2278.60153@quark.deferred.io>
Subject: Re: [PATCH 2/3] clk: mvebu: add AP806 core clock driver
Date: Mon, 22 Feb 2016 10:32:03 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Andrew Lunn (2016-02-22 06:16:17)
> > Such information will come later, and we can rework the drivers and DT
> > bindings accordingly. Those DT bindings cannot be stable, as the
> > platform is under heavy development and we'll probably discover some
> > issues down the road.
> =

> Hi Thomas
> =

> Maybe add a big fat warning that the bindings are unstable, and the DT
> blob must be kept in sync with the kernel?

+1 and feel free to blame the lack of documentation.  No one can expect
bindings to be finalized when the chip topology is not fully understood.

Regards,
Mike

> =

>      Andrew
