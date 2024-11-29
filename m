Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320FC14AD3D
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 16:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732897671; cv=none; b=JPwUU9phdkmqyW/8qsI3kBBhrmMKL2HNjNQ4iRfCz9o+bOr/BtZ5A0VmnOkBaDLm3dPuvgg53rNy+Yw/mjrBDmB5skSopjLVPBZdQydQWjW9gG2hJ8o6tQ0bRh6J+IGGYokKz9iQzo/1rHZ8yM5UpsOcElIj28YzHi5Adyy9u9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732897671; c=relaxed/simple;
	bh=5w1O89chOqgyMhWZqb9VM6E+m7Ixqgv0RFEj+OZES/M=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U+56deaHKE9K2SjsxXoVJTboG6QAYPE/IPeAPMZipZcBfSl7i9g7AgEbJeoUqsAsM2ecxd3sGNxtqEW/oknVpj6Ys/PchaT6xwfcc7OmYhRNnH+jhfxE9ORt10bT5Tpsyju4rGt6pa4UqrsO0RK13et0RSo9tl9WyLlA/NOQ/RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SXKYN/KE; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SXKYN/KE"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa578d10d50so328171466b.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 08:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732897666; x=1733502466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OwH5v+3GE18kFTNrayT4BgfE0WPSq36ccL8dVwg+Yh0=;
        b=SXKYN/KEOyynrFJcDSY9fKinPxPtzm7uWRAULf7byMbXWKz2zCJu6+aQnV0Ep6+Wpz
         UWoux77G37vEbXIdP0h95EneTQqw8W2nAx5UaY/ePqEfSOrxE9elLbGEcs/ZIqsv6bqF
         Y6Ukh96oPrRmCQvTdqpOU/xxQW0kIQIsYqzpkA823EiuH7tr+sBr8y/aZY7OEBoPuO07
         4yeVObIAAL64qCdwaLxiXHktmKeQrd/sagClP4y8JbCRwV36elsRVvcFRCncLiiHcx1g
         NDURsOThUhktc//Il1++bMjEk9NqtJYNbliGeWiyN9/7LaoAe4Js8NNjnaRwr1ql/4DY
         EUwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732897666; x=1733502466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OwH5v+3GE18kFTNrayT4BgfE0WPSq36ccL8dVwg+Yh0=;
        b=ZTsVfBOnV0pEnW/qaZkfiwD1fAc43GOoqaLT7wm9tNDcewGKiepNG2lImut+PDboNu
         kIj2U6qLUruRqXSM53sN8El5Uhr94OhTvGUcY8z+05ENcV7InaxEcigUolQBSX4nGX2X
         mMC907GzbjgOXULsLEyrmgpwfDrV9fTBSsCRdGe6AsRTVV9dXfl8ICa34b9gh1tZL1yi
         LLnXgM/MWtQWp6g03KFeTzNcQIm5mb1kWtBB+I+6ac34gqgmTGmvZSvtjE8lC/yNslSH
         47ixVlTZ7GPkSnYUzMzUI/drAblwqsx8UbIOBX8kpdcEcy3le98M0z+rcqH6sbZ92dww
         X2BA==
X-Forwarded-Encrypted: i=1; AJvYcCVSzNX270BgG8JlKYmiJ1rEVRpWYFez12C8OwEUH7q1IVUfCwO7OoiMYDn0PcbF33cN1wov2WyHi2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRK5BPk51AngTEP0dTZj21k1IpiaqZjPfK6XafK/MZMcCVjpSI
	phb0S7uHnm0Z5j+XwgHBAno2cxKO4cdlQeEnrO1OlnTzLPqurMwI1jjI+goxi88=
X-Gm-Gg: ASbGncv+mpkAcgBT707/mtc5tjSiH4tD7vKwiY87fdwBzfBoWKuNIIYxUdyKJtR5HdP
	OgYhkxcwVyd7yC9PdXSx0mDV/axx/m1pGtYWEe6qGy5TFqdjXhFUjCgfFrPjn5VWNY2vNPtCzKy
	R4XDqncR7mYK41Khqs1ugCeuzKONl9w2OzCnR9HiVdnM4G2IZdBAI4uBHChhTPQZ7HzdwHpFFWk
	SGiiHoAmOEulFn5UyOLhOfvsd4B7fyOQH1ri0JBpYax0FeDSrFjo4wAc7JMnnotUIAbMGW/jYhi
	5zgEEV3iY4Pp9BFNVINg
X-Google-Smtp-Source: AGHT+IFdG9GOu7z7VbF3RaWxqyGcxIpQuKws1pr8ZUhjgAPYuz3ueFSPxNUGdj5E67EBohC3LgYQSw==
X-Received: by 2002:a17:906:318d:b0:aa5:1957:3431 with SMTP id a640c23a62f3a-aa580edfbfcmr1150158266b.1.1732897666347;
        Fri, 29 Nov 2024 08:27:46 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c193asm189510666b.38.2024.11.29.08.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 08:27:45 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 17:28:19 +0100
To: Stefan Wahren <wahrenst@gmx.net>
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
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v4 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z0nro2vMNxoU35GH@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <c48e6b9b178cdaa01b92ae82e8fd24c2ba5f170c.1732444746.git.andrea.porta@suse.com>
 <c5575991-eab1-40ef-a984-b23076b09cf3@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5575991-eab1-40ef-a984-b23076b09cf3@gmx.net>

Hi Stephan,

On 19:35 Mon 25 Nov     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 24.11.24 um 11:51 schrieb Andrea della Porta:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> >
 
...

> > +          Support the RP1 peripheral chip found on Raspberry Pi 5 board.
> > +	  controller, USB controller, I2C, SPI and UART.
> > +
> > +          The driver is responsible for enabling the DT node once the PCIe
> > +	  endpoint has been configured, and handling interrupts.
> > +
> > +          This driver uses an overlay to load other drivers to support for
> > +	  RP1 internal sub-devices.
> Please fix up the leading whitespace here

Ack.

> > diff --git a/drivers/misc/rp1/Makefile b/drivers/misc/rp1/Makefile
> > new file mode 100644
> > index 000000000000..508b4cb05627
> > --- /dev/null
> > +++ b/drivers/misc/rp1/Makefile
> > @@ -0,0 +1,3 @@
> > +# SPDX-License-Identifier: GPL-2.0-only

...

> > +#define RP1_INT_SYSCFG		58
> > +#define RP1_INT_CLOCKS_DEFAULT	59
> > +#define RP1_INT_VBUSCTRL	60
> > +#define RP1_INT_PROC_MISC	57
> > +#define RP1_INT_END		61
> > +
> > +struct rp1_dev {
> > +	struct pci_dev *pdev;
> > +	struct irq_domain *domain;
> > +	struct irq_data *pcie_irqds[64];
> > +	void __iomem *bar1;
> > +	int ovcs_id;
> /* overlay changeset id */

Ack.

> > +	bool level_triggered_irq[RP1_INT_END];
> > +};
> > +
> > +static void msix_cfg_set(struct rp1_dev *rp1, unsigned int hwirq, u32 value)
> > +{

...

> > +	struct device_node *rp1_node;
> > +	struct rp1_dev *rp1;
> > +	int err  = 0;
> Please remove the extra space after err

Ack.

> > +	int i;
> > +
> > +	rp1_node = dev_of_node(dev);
> > +	if (!rp1_node) {
> > +		dev_err(dev, "Missing of_node for device\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	rp1 = devm_kzalloc(&pdev->dev, sizeof(*rp1), GFP_KERNEL);
> > +	if (!rp1)
> > +		return -ENOMEM;
> > +
> > +	rp1->pdev = pdev;

...

> > +	err = pci_alloc_irq_vectors(pdev, RP1_INT_END, RP1_INT_END,
> > +				    PCI_IRQ_MSIX);
> > +	if (err < 0)
> > +		return dev_err_probe(&pdev->dev, err,
> > +				     "pci_alloc_irq_vectors failed");
> > +	else if (err != RP1_INT_END) {
> Please add braces for the if case

Ack.

Many thanks,
Andrea

> > +		dev_err(&pdev->dev, "Cannot allocate enough interrupts\n");
> > +		return -EINVAL;
> > +	}
> > +
> > 
