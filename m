Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:52056 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753898AbcGKPoD (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2016 11:44:03 -0400
From: Arnd Bergmann <arnd@arndb.de>
To: Wan Zongshun <vw@iommu.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Russell King <linux@armlinux.org.uk>,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org, robh@kernel.org,
	jason@lakedaemon.net, p.zabel@pengutronix.de,
	Wan Zongshun <mcuos.com@gmail.com>
Subject: Re: [PATCH v2 02/10] irqchip: add irqchip driver for nuc900
Date: Mon, 11 Jul 2016 17:46:34 +0200
Message-ID: <1761342.TGgYi16yul@wuerfel>
In-Reply-To: <1468135649-19980-3-git-send-email-vw@iommu.org>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <1468135649-19980-3-git-send-email-vw@iommu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Sunday, July 10, 2016 3:27:22 PM CEST Wan Zongshun wrote:
> +
> +#if !defined(CONFIG_SOC_NUC900)
>  #define NR_IRQS                (IRQ_ADC+1)
> +#else
> +#define NR_IRQS                62
> +#endif
>  

The Kconfig symbols are a bit confusing here: CONFIG_SOC_NUC900
controls the compilation of the soc_device driver, but I guess
what you actually mean here is CONFIG_SOC_NUC970, which is the
support for the actual chip.

Maybe rename the former to something less confusing and change
this to CONFIG_SOC_NUC970?

Ideally, this should just go away once we use SPARSE_IRQ.

	Arnd
