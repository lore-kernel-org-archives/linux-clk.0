Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 14 Jun 2016 07:39:27 -0500
From: Rob Herring <robh@kernel.org>
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	linux-arm-kernel@lists.infradead.org,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>,
	Romain Perier <romain.perier@free-electrons.com>,
	Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>,
	Wilson Ding <dingwei@marvell.com>,
	Shadi Ammouri <shadi@marvell.com>
Subject: Re: [PATCH 07/10] dt-bindings: clock: add DT binding for the TBG
 clocks on Armada 3700
Message-ID: <20160614123927.GA1049@rob-hp-laptop>
References: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
 <1465565018-14172-8-git-send-email-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465565018-14172-8-git-send-email-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 10, 2016 at 03:23:35PM +0200, Gregory CLEMENT wrote:
> This commit adds the DT binding documentation for the Time Base Generator
> clock used in the Marvell Armada 3700 SoCs.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  .../bindings/clock/armada3700-tbg-clock.txt        | 27 ++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/armada3700-tbg-clock.txt

Acked-by: Rob Herring <robh@kernel.org>
