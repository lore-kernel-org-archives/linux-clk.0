Return-Path: <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Jul 2016 13:50:44 +0200
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Grzegorz Jaszczyk <jaz@semihalf.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com,
 gregory.clement@free-electrons.com, mw@semihalf.com, alior@marvell.com
Subject: Re: [PATCH] clk: mvebu: armada-39x: add clk description for
 supported interfaces
Message-ID: <20160721135044.5f573741@free-electrons.com>
In-Reply-To: <1469098090-17836-1-git-send-email-jaz@semihalf.com>
References: <1469098090-17836-1-git-send-email-jaz@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hello,

On Thu, 21 Jul 2016 12:48:10 +0200, Grzegorz Jaszczyk wrote:
> Both SATA and second USB3.0 interface are supported in Armada-39x SoC
> family. Add necessary clk description, so both xhci and sata drivers
> can be correctly initialized.
> 
> The binding documentation has also been updated accordingly.
> 
> Signed-off-by: Grzegorz Jaszczyk <jaz@semihalf.com>

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

(I verified in the datasheet that those bits indeed control the usb3h1
and sata0 clocks).

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
