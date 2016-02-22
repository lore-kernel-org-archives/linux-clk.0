Return-Path: <andrew@lunn.ch>
Date: Mon, 22 Feb 2016 15:16:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Rob Herring <robh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: mvebu: add AP806 core clock driver
Message-ID: <20160222141617.GA14970@lunn.ch>
References: <1455521698-7905-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1455521698-7905-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160222025357.GE15973@rob-hp-laptop>
 <20160222091423.4756a579@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20160222091423.4756a579@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

> Such information will come later, and we can rework the drivers and DT
> bindings accordingly. Those DT bindings cannot be stable, as the
> platform is under heavy development and we'll probably discover some
> issues down the road.

Hi Thomas

Maybe add a big fat warning that the bindings are unstable, and the DT
blob must be kept in sync with the kernel?

     Andrew
