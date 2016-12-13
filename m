Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 13 Dec 2016 14:07:55 -0600
From: Rob Herring <robh@kernel.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: devicetree@vger.kernel.org,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Kumar Gala <galak@codeaurora.org>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@free-electrons.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	Marcin Wojtas <mw@semihalf.com>, Nadav Haklai <nadavh@marvell.com>,
	Hanna Hawa <hannah@marvell.com>,
	Yehuda Yitschak <yehuday@marvell.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: update Armada CP110 system
 controller binding
Message-ID: <20161213200755.g4zkj4rxyzjd3as3@rob-hp-laptop>
References: <1481632880-9198-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1481632880-9198-2-git-send-email-thomas.petazzoni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1481632880-9198-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Dec 13, 2016 at 01:41:18PM +0100, Thomas Petazzoni wrote:
> It turns out that in the CP110 HW block present in Marvell Armada
> 7K/8K SoCs, gatable clock n°18 not only controls SD/MMC, but also the
> GOP block. This commit updates the Device Tree binding for this piece
> of hardware accordingly.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  .../devicetree/bindings/arm/marvell/cp110-system-controller0.txt    | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
