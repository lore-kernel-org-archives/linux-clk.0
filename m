Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF331F542B
	for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 13:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739281558; cv=none; b=fkX9whYlj8Bfo/CtpSoTtS6Bbzv403oQua6EuM6uIqu2IjsVJcSPhLBgbR0P2+xxDQC7w9MeEkjPI8IF5NY8pj35p1J3cP02TyXfbGCbMGbOTwNfkI7Yz0Fe2n3IhQjqDM32/h7mfmyfTg0R87mNjDdsa6uP4TYRBZsrnD+cOQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739281558; c=relaxed/simple;
	bh=5Ls6ehrFuNfDtokxDzaR2J5p2+P5rZ6x9GJCMdIdOXU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJBzBVPOP3ig3gTuAm3MooRz3C7zX0LbeIHGXFUeRxJl6+TpFbnMTXa2mt8PFWs1AqQ/pKBprnpMiDOmxOaYpZeumX6GZ6iJnKx7ezJIlunqzIYDCElTqWlVJ/YlQDnOWiZ1rwt3xauaEKvrdYuJAjs7eaR45oQZsmyHuNPEZy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A2DLbn6D; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A2DLbn6D"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ab771575040so1074271966b.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Feb 2025 05:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739281555; x=1739886355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RkP+VyXyd2LDTq1dE/e/+i0gFwY3obdySQr3wdtK8hs=;
        b=A2DLbn6D3yiNZvfFC/1uJgUHenzjcoi+hkZfcq814JXPSlSOlPs/Qet+GZmi+76MTV
         Lu5xGnRkPKsiG0VsG7jiM6C/1ChBjq3mvshyHDa83MCd4FQ+B05gIaSQ1p7K0uM+ltxN
         NNuARlr/LY7RPhAcItmlQxmAp8qXpsVH5kEHTrBzBXGqMxkL/NwWNBz7p2bWAuC9iciq
         fK8W/yz6buao4PKvhXcSHihHdoLjidcAndLA7Xxw0tTAt2hFq6Oyl+UPDmJwF9FrLw2c
         ueckiz/HoRw6zAoLvKxraQp4js/qXehAsdcQyn1D4JMR8LshNiT0VzQsUKV0Lr2ONejI
         vY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739281555; x=1739886355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkP+VyXyd2LDTq1dE/e/+i0gFwY3obdySQr3wdtK8hs=;
        b=NIWbp7GfOTYIVHX97dEMF8btlNQW0m/wTjBLd56c93w4rOEFpyhMTBUvNcsw5A6cyt
         xdmDNw7DjtMABc+yAHG+RPJb+aiXyq6remLu6FVxjCm99co/OgxLt9HdFjDrCl/vwroz
         hnCXJi66YXNpHythqufV0cO2A5qdfIfIzEIgUrcgAG1qFuQFF9A1hglYORMicThKtk0S
         HyC6LD83ccVaOm2vLYP2cvd6MWhOkxJIwncWe8NQCwXHkDhwgKVeeQ2NH9EaxIXQnR/I
         Ux7/wH5julgVJ8l+ZwHI2Zg8EeZpTiU164dDypRKEHJKaBwyckJ/qghonXJnAIwOPX8f
         W/xg==
X-Forwarded-Encrypted: i=1; AJvYcCVe/CIcnUww13FFyUnxVRYVRt7++noMJUSBecb5zoVRu0UqA+ItZcieQZxevm+3qs7dd+hNZPeoSIs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdvxcY8Eej10OUM9311TVma8W5vYoLNjieTICPXlqciHMkQibC
	ZTED8AFLrUH5g2tl7FtFynlPUdHQSu2k6wEa5zDP2j52/K9sW0HxbnZcr7JvaQE=
X-Gm-Gg: ASbGnctocwo8HGPzB+JiHjvbAIACk6r/+9XCPSRve5AYz6zbb337dY2r/wMfTj7dSfV
	7II94NCytLTC7QjIqns9bon+9mXsqSTazkeqjnf621DgNjMbpZ3kB1SpYlAlrIo3268D+qIG40e
	0zSKaksLxCbVTXxBqU0O7K+2FX8+K9HJPbUNdyRI6k+uDtXkXvVgXK6a4pW4mXBL7VvzH6PFilA
	8SimjEZEVFqwGOtYNerN79qgX1PRUw/fOwUg1jBKmRn/ihcDIkh/VEmk5h/kuHx2jvPJE7FdpZv
	IOHCwHtj1Dlcl5ng3IGyqFHn6xvQ00tWSRL4ZihWsXRNMHO4f1yq5gL9HWg=
X-Google-Smtp-Source: AGHT+IG51KR7uQClui5T80GFu03wGjZtCbiNcOn2c2quAcoJxfpyu2MvcnnQYDV8Nd/6UX7Ol8OjhA==
X-Received: by 2002:a17:907:6ea0:b0:ab7:c11:a980 with SMTP id a640c23a62f3a-ab7db544773mr282512766b.17.1739281554584;
        Tue, 11 Feb 2025 05:45:54 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7b43ee08asm522714066b.88.2025.02.11.05.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 05:45:54 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 11 Feb 2025 14:46:53 +0100
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
Subject: Re: [PATCH v7 06/11] pinctrl: rp1: Implement RaspberryPi RP1 gpio
 support
Message-ID: <Z6tUzcCqI2xdKSQ5@apocalypse>
References: <cover.1738963156.git.andrea.porta@suse.com>
 <c4b60fda4b9c87a5efaf5103507fb568413c841a.1738963156.git.andrea.porta@suse.com>
 <8e2b0e05-cd60-4b79-8763-005c3f72a64d@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e2b0e05-cd60-4b79-8763-005c3f72a64d@gmx.net>

Hi Stefan,

On 15:36 Sat 08 Feb     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 07.02.25 um 22:31 schrieb Andrea della Porta:
> > The RP1 is an MFD supporting a gpio controller and /pinmux/pinctrl.
> > Add minimum support for the gpio only portion. The driver is in
> > pinctrl folder since upcoming patches will add the pinmux/pinctrl
> > support where the gpio part can be seen as an addition.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > ---
> >   MAINTAINERS                   |   1 +
> >   drivers/pinctrl/Kconfig       |  11 +
> >   drivers/pinctrl/Makefile      |   1 +
> >   drivers/pinctrl/pinctrl-rp1.c | 789 ++++++++++++++++++++++++++++++++++
> >   4 files changed, 802 insertions(+)
> >   create mode 100644 drivers/pinctrl/pinctrl-rp1.c
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a4a9555c07c5..f2ba6f565d30 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -19756,6 +19756,7 @@ F:	Documentation/devicetree/bindings/misc/pci1de4,1.yaml
> >   F:	Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> >   F:	Documentation/devicetree/bindings/pinctrl/raspberrypi,rp1-gpio.yaml
> >   F:	drivers/clk/clk-rp1.c
> > +F:	drivers/pinctrl/pinctrl-rp1.c
> >   F:	include/dt-bindings/clock/rp1.h
> >   F:	include/dt-bindings/misc/rp1.h
> > 
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index 95a8e2b9a614..53b265cabc26 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -612,6 +612,17 @@ config PINCTRL_MLXBF3
> >   	  each pin. This driver can also be built as a module called
> >   	  pinctrl-mlxbf3.
> > 
> > +config PINCTRL_RP1
> > +	tristate "Pinctrl driver for RP1"
> > +	depends on MISC_RP1
> > +	default MISC_RP1
> > +	select PINMUX
> > +	select PINCONF
> > +	select GENERIC_PINCONF
> > +	help
> > +	  Enable the gpio and pinctrl/mux driver for RaspberryPi RP1
> > +	  multi function device.
> > +
> >   source "drivers/pinctrl/actions/Kconfig"
> >   source "drivers/pinctrl/aspeed/Kconfig"
> >   source "drivers/pinctrl/bcm/Kconfig"
> > diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> > index fba1c56624c0..6fb77de58545 100644
> > --- a/drivers/pinctrl/Makefile
> > +++ b/drivers/pinctrl/Makefile
> > @@ -48,6 +48,7 @@ obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
> >   obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
> >   obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
> >   obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
> > +obj-$(CONFIG_PINCTRL_RP1)       += pinctrl-rp1.o
> >   obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
> >   obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
> >   obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
> > diff --git a/drivers/pinctrl/pinctrl-rp1.c b/drivers/pinctrl/pinctrl-rp1.c
> > new file mode 100644
> > index 000000000000..0d081f75d2ec
> > --- /dev/null
> > +++ b/drivers/pinctrl/pinctrl-rp1.c
> > @@ -0,0 +1,789 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Driver for Raspberry Pi RP1 GPIO unit
> > + *
> > + * Copyright (C) 2023 Raspberry Pi Ltd.
> > + *
> > + * This driver is inspired by:
> > + * pinctrl-bcm2835.c, please see original file for copyright information
> > + */
> > +
> ...
> > +
> > +static struct irq_chip rp1_gpio_irq_chip = {
> > +	.name = MODULE_NAME,
> > +	.irq_enable = rp1_gpio_irq_enable,
> > +	.irq_disable = rp1_gpio_irq_disable,
> > +	.irq_set_type = rp1_gpio_irq_set_type,
> > +	.irq_ack = rp1_gpio_irq_ack,
> > +	.irq_mask = rp1_gpio_irq_disable,
> > +	.irq_unmask = rp1_gpio_irq_enable,
> > +	.flags = IRQCHIP_IMMUTABLE,
> Sorry not sure, but doesn't this miss GPIOCHIP_IRQ_RESOURCE_HELPERS here?

Right. Added.

Thanks,
Andrea

> 
> Thanks
