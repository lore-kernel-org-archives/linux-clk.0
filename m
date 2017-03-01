Return-Path: <sboyd@codeaurora.org>
Date: Wed, 1 Mar 2017 11:01:27 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	Nadav Haklai <nadavh@marvell.com>, Hanna Hawa <hannah@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCHv2 1/3] dt-bindings: arm: update Armada CP110 system
 controller binding
Message-ID: <20170301190127.GO25384@codeaurora.org>
References: <1482316017-22154-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1482316017-22154-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20161222001453.GW8288@codeaurora.org>
 <20170301165245.5f2fbfaf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <20170301165245.5f2fbfaf@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/01, Thomas Petazzoni wrote:
> Stephen,
> 
> On Wed, 21 Dec 2016 16:14:53 -0800, Stephen Boyd wrote:
> > On 12/21, Thomas Petazzoni wrote:
> > > It turns out that in the CP110 HW block present in Marvell Armada
> > > 7K/8K SoCs, gatable clock n°18 not only controls SD/MMC, but also the
> > > GOP block. This commit updates the Device Tree binding for this piece
> > > of hardware accordingly.
> > > 
> > > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > > ---  
> > 
> > Applied to clk-next
> 
> Even though you said you applied it, I still don't see this patch in
> mainline, while PATCH 2/3 of this series is now in mainline.
> 
> Was this patch forgotten? Let me know if I should resend it, but I'm
> pretty sure it still applies, since no other changes on this file have
> been merged since quite a while.
> 

No worries. I've made a note to put it into the fixes queue to
send off after rc1.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
