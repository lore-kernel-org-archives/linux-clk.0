Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:54033 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757207AbcGJWPK (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 10 Jul 2016 18:15:10 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Wan Zongshun <vw@iommu.org>, Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	jason@lakedaemon.net, Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	Thomas Gleixner <tglx@linutronix.de>,
	Wan Zongshun <mcuos.com@gmail.com>
Subject: Re: [PATCH v2 09/10] Documentation: devicetree: Add dts description for nuc900
Date: Mon, 11 Jul 2016 00:17:52 +0200
Message-ID: <1850749.ap1S8Xq0fA@wuerfel>
In-Reply-To: <1468136542-2656-2-git-send-email-vw@iommu.org>
References: <1468136542-2656-1-git-send-email-vw@iommu.org> <1468136542-2656-2-git-send-email-vw@iommu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sunday, July 10, 2016 3:42:21 PM CEST Wan Zongshun wrote:
> +
> +Required properties:
> +- compatible : Should be "nuvoton,nuc970-tmr"
> +- reg : Address and length of the register set
> +- clocks : Reference on the timer input clock
> +- interrupts : Reference to the timer interrupt
> +
> +Example:
> +
> +tmr@0xb8001000 {

The name should be "timer", not "tmr", and the address should
not contain a leading "0x".

> +       compatible = "nuvoton,nuc970-tmr";
> +       reg = <0xb8001000 0x1000>;
> +       interrupts = <16>;
> +       clocks = <&clks TIMER0_GATE>,
> +       <&clks TIMER1_GATE>;
> +       clock-names = "timer0", "timer1";
> +};

The clocks/clock-names description does not match the example:
you only define a single clock in the required properties, but
have two separate inputs in the example. Please fix one or the
other.

	Arnd
