Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25601B85D3
	for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2025 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737448968; cv=none; b=fKwtOFN96p/RFmhdrWwGYjshZhMkmbMJszXkxMJnKjXdcJLJcWnFHjFzJAsWMH4vL8uc0L7k9gZZc4C7HQ28XY3Qjih6qmsvNZyF5IqFBDxBejRCvWunmvXv0ZqUdS4TbYMRzn2QHmubxQW/k/mHP3jsi4VcAXlcncVqu2pQbXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737448968; c=relaxed/simple;
	bh=btTsSgCbAPnhnTrI4HdjrpnhkhsKx37tGtdBNk94yms=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMi/zbo3uFQ8falUHgVI5fR/ZeExilIkns3SxVXHrh662XBHQXovpdIFIeO32xlGVPh6l14AeyyFSNpx5Hsqf4pS1ZPDhdFixEn74ZCglH75iSmiayPFkvC8SU5bO+76+7Bj8awj7lZyg+4hYyfBg+oxAIY/eH6IZhJiZiZRY/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HF5znpdU; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HF5znpdU"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-aa684b6d9c7so915937766b.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Jan 2025 00:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737448965; x=1738053765; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WfyBwrVAKcG2iSXqbe+KfTaCoLpZROxE8VUSqF7vM6w=;
        b=HF5znpdUsdaV6qLC9lBW25Mt4f8DohDD1Hv7Xil8TqKPGDeyrYwnuiHERZ9qsA7RFj
         hzcjMIBllI4/HO1rhtP3NvR0q8s9VIEnk2B7BENXK4O2lkUH2zSeg9C4VRCmZYR+gCL8
         eEOenBONGYMFWHn6QpvSJxeRafK7EEfASUC5nVZQyNLQkJz+Uj22VO3xI97fzlH45H5U
         Wyxv0Qtca0MP8clcOQZK4qUVxSOKnuJBEHlSrhdpQEyf+3/rZRxKSQeVMOwYHjPxzgqE
         uskuEfRKQTTd8/ZnfIQxJZXJ5pPnLZQBVqdg0jmA2dFEwb/YSTCqTqWzDTdtQXFD+BTx
         FKbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737448965; x=1738053765;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfyBwrVAKcG2iSXqbe+KfTaCoLpZROxE8VUSqF7vM6w=;
        b=ilwM6uvMMo+VjuwyfqEGT1qz35+jFspSltOPErc5oyqDmOvAmiMlmZTt+6y+aOl8P4
         H7Z/XAGw3Tznb/ACR3CtseIJ6bucq+FJIQqqgjQfjQfHu1uT/PYyQdguGrzMjAKtK93J
         8s7kTHBmgjuW9eNRaAWWGZwWReH9gU9Mqh+dr/OAuEMPkaC0Vec0B45pae7mT9DF5AsU
         9t/WZpxF3gRKROKDru/i+wYVPty8YB+cUHmiOC87nUXVF60L216K8g2ZBhH8pl87F89h
         /z31UMVlb1VMDrrsS42YvM3sHMlxjeQRLcmKB4Zffi3Gr1Sd4gIzd26HrZJZA/O8eYwU
         DZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+YRVO6vC9f5wlfdWy0gfQRE0yYYk0Q2AFhXdgM0BQWlklTyOs70GnPh7QURWeZUlFNMtDSb5VRfM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlUdFb83B9/hvZkbk3LZxtemnl2BK8z/jbhoeeuYoq2dUlTH1q
	NR/Xvk0+Tiy6uh+6IggL5MrxzwdoecDt6Ycj/SO2VjuNIDJR57/xVlrg6GAoo9Q=
X-Gm-Gg: ASbGncsfVlWceApPqbSAjj2jIRZVRL4b2w6tQXexCMwJxhvbDeqEmynzNNEnN1ePEUf
	1f7GZkPeMJaLo1ntyTszhfvus4HznZZisJ65qTUjVMAetPXNXHvJoSriiFJWCHtJCaE4qw/zK3d
	6MlOfnHWtSFmIYvfNUSN3jsLJpqZe40adZY+8590k1Gxz0gna4vzXQeo3pIEzrFzk9sH5/IZrZT
	omDk5+ZoEe6eGBNrTYhSL/mbC4kG9ep0YieXjGW/tjsFHp9iILahraj6Ih5nU9M2nk6qafjv/55
	gTLNYp/M84B5rK8M/Q8Iinut0Yzyp4zxfkNvHHNM
X-Google-Smtp-Source: AGHT+IHJoMEfBlMLvkr8KlEq8oWlxXFcL1m1dYtTgkFptyAjoAjldlyHkpeVawKUvQ8QmvdxpOWQWw==
X-Received: by 2002:a17:906:5617:b0:ab2:b8c3:be3c with SMTP id a640c23a62f3a-ab38b3fb0dcmr1352712066b.51.1737448964785;
        Tue, 21 Jan 2025 00:42:44 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384c75baesm719449966b.1.2025.01.21.00.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 00:42:44 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 21 Jan 2025 09:43:37 +0100
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v6 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z49eOdVvwknOoD3E@apocalypse>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <550590a5a0b80dd8a0c655921ec0aa41a67c8148.1736776658.git.andrea.porta@suse.com>
 <2025011722-motocross-finally-e664@gregkh>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011722-motocross-finally-e664@gregkh>

Hi Greg,

On 12:47 Fri 17 Jan     , Greg Kroah-Hartman wrote:
> On Mon, Jan 13, 2025 at 03:58:07PM +0100, Andrea della Porta wrote:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> > 
> > Implement a bare minimum driver to operate the RP1, leveraging
> > actual OF based driver implementations for the on-board peripherals
> > by loading a devicetree overlay during driver probe.
> > 
> > The peripherals are accessed by mapping MMIO registers starting
> > from PCI BAR1 region.
> > 
> > With the overlay approach we can achieve more generic and agnostic
> > approach to managing this chipset, being that it is a PCI endpoint
> > and could possibly be reused in other hw implementations. The
> > presented approach is also used by Bootlin's Microchip LAN966x
> > patchset (see link) as well, for a similar chipset.
> > 
> > For reasons why this driver is contained in drivers/misc, please
> > check the links.
> 
> Links aren't always around all the time, please document it here why
> this is needed, and then links can "add to" that summary.

Ack.

> 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf

...

> > diff --git a/drivers/misc/rp1/rp1_pci.c b/drivers/misc/rp1/rp1_pci.c
> > new file mode 100644
> > index 000000000000..3e8ba3fa7fd5
> > --- /dev/null
> > +++ b/drivers/misc/rp1/rp1_pci.c
> > @@ -0,0 +1,305 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2018-24 Raspberry Pi Ltd.
> > + * All rights reserved.
> > + */
> > +
> > +#include <linux/err.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqchip/chained_irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/module.h>
> > +#include <linux/msi.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/pci.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include "rp1_pci.h"
> 
> Why does a self-contained .c file need a .h file?  Please put it all in
> here.

I agree with you. Indeed, the very first version of this patch had the header
file placed inside the .c, but I received concerns about it and some advice to
do it differently, as you can see here:
https://lore.kernel.org/all/ZtWDpaqUG9d9yPPf@apocalypse/
so I've changed it accordingly in V2. So right now I'm not sure what the
acceptable behaviour should be ...

> 
> > +
> > +#define RP1_DRIVER_NAME		"rp1"
> 
> KBUILD_MODNAME?

Right. Thanks for pointing that out.

> 
> > +
> > +#define RP1_HW_IRQ_MASK		GENMASK(5, 0)
> > +
> > +#define REG_SET			0x800
> > +#define REG_CLR			0xc00
> > +
> > +/* MSI-X CFG registers start at 0x8 */
> > +#define MSIX_CFG(x) (0x8 + (4 * (x)))
> > +
> > +#define MSIX_CFG_IACK_EN        BIT(3)
> > +#define MSIX_CFG_IACK           BIT(2)
> > +#define MSIX_CFG_ENABLE         BIT(0)
> > +
> > +/* Address map */
> > +#define RP1_PCIE_APBS_BASE	0x108000
> > +
> > +/* Interrupts */
> > +#define RP1_INT_END		61
> 
> 
> 
> > +
> > +struct rp1_dev {
> > +	struct pci_dev *pdev;
> > +	struct irq_domain *domain;
> > +	struct irq_data *pcie_irqds[64];
> > +	void __iomem *bar1;
> > +	int ovcs_id;	/* overlay changeset id */
> > +	bool level_triggered_irq[RP1_INT_END];
> > +};
> > +
> > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > +{
> > +	iowrite32(value, rp1->bar1 + RP1_PCIE_APBS_BASE + REG_SET + MSIX_CFG(hwirq));
> 
> Do your writes need a read to flush them properly?  Or can they handle
> this automatically?
>

I had some thoughts with RaspberryPi foundation folks to double check it, and it
seems that there should be no need to readback the value (unless we want to go
really paranoid), so I would avoid that since in case of level handled interrupt
we would end up reading the register on every triggering interrupts.

Many thanks,
Andrea
 
> thanks,
> 
> greg k-h
