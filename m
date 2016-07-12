Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:55960 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751503AbcGLIXk (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Tue, 12 Jul 2016 04:23:40 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Wan Zongshun <vw@iommu.org>, devicetree@vger.kernel.org,
	jason@lakedaemon.net, Wan Zongshun <mcuos.com@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	p.zabel@pengutronix.de, Thomas Gleixner <tglx@linutronix.de>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
Date: Tue, 12 Jul 2016 10:26:28 +0200
Message-ID: <5434334.4rKzx80y6W@wuerfel>
In-Reply-To: <5784968A.7080007@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <1761342.TGgYi16yul@wuerfel> <5784968A.7080007@iommu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tuesday, July 12, 2016 3:04:42 PM CEST Wan Zongshun wrote:
> >
> > Ideally, this should just go away once we use SPARSE_IRQ.
> 
> This platform also can use SPARSE_IRQ? this just a simple irq map and no 
> more irq number in this Soc.
> 

SPARSE_IRQ is implied by ARCH_MULTIPLATFORM, so we will have to
use it once that gets enabled.

Your new irqchip driver already handles IRQ domains, so it will
work out of the box with SPARSE_IRQ, but you have to change the
reference to "NR_IRQS" into something else.

I've prototyped a patch series to enable ARCH_MULTIPLATFORM,
I hope you can start working from what I have and get it to run.

	Arnd
