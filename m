Return-Path: <robherring2@gmail.com>
Return-Path: <robherring2@gmail.com>
Date: Thu, 21 Jul 2016 17:08:01 -0500
From: Rob Herring <robh@kernel.org>
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, mark.rutland@arm.com,
	thomas.petazzoni@free-electrons.com,
	gregory.clement@free-electrons.com, mw@semihalf.com,
	alior@marvell.com
Subject: Re: [PATCH] clk: mvebu: armada-39x: add clk description for
 supported interfaces
Message-ID: <20160721220801.GA19966@rob-hp-laptop>
References: <1469098090-17836-1-git-send-email-jaz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1469098090-17836-1-git-send-email-jaz@semihalf.com>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jul 21, 2016 at 12:48:10PM +0200, Grzegorz Jaszczyk wrote:
> Both SATA and second USB3.0 interface are supported in Armada-39x SoC
> family. Add necessary clk description, so both xhci and sata drivers
> can be correctly initialized.
> 
> The binding documentation has also been updated accordingly.
> 
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>
> ---
>  Documentation/devicetree/bindings/clock/mvebu-gated-clock.txt | 2 ++
>  drivers/clk/mvebu/armada-39x.c                                | 2 ++
>  2 files changed, 4 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
