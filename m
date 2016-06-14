Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Tue, 14 Jun 2016 07:42:36 -0500
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
Subject: Re: [PATCH 09/10] dt-bindings: clock: add DT binding for the
 peripheral clocks on Armada 3700
Message-ID: <20160614124236.GA2001@rob-hp-laptop>
References: <1465565018-14172-1-git-send-email-gregory.clement@free-electrons.com>
 <1465565018-14172-10-git-send-email-gregory.clement@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1465565018-14172-10-git-send-email-gregory.clement@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 10, 2016 at 03:23:37PM +0200, Gregory CLEMENT wrote:
> This commit adds the DT binding documentation for the peripheral clocks
> used in the Marvell Armada 3700 SoCs.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> ---
>  .../bindings/clock/armada3700-periph-clock.txt     | 70 ++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
> new file mode 100644
> index 000000000000..549a5ad14031
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/armada3700-periph-clock.txt
> @@ -0,0 +1,70 @@
> +* Peripheral Clock bindings for Marvell Armada 37xx SoCs
> +
> +Marvell Armada 37xx SoCs provide peripheral clocks which are
> +used as clock source for the peripheral of the SoC.
> +
> +There are two different block associated to north bridge and south

s/block/blocks/

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>
