Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4977219A74
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 14:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431977; cv=none; b=TsFTEzzM7HS5PErOpzC1YxloxGb9qujqf2kXod38P3cn2rbneYDOy86kboREfAcpDHvIsoYMSaFOLRvtz83O2Wsco0SjsDRzoo/hi+rokCIGf7jphOjbm2De9BjlLb41P4vYniA+PWx4w7DUB/+0sRukEo1tnJCqKbndw8hiajA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431977; c=relaxed/simple;
	bh=2+kPAr0dvmHCcJWjxbEc5aC2Udav9z+QVmz7IcF6XTE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWEYnyc+r1T0ED95dAjZb3ZvSVCNqyqy86UjBRaVL0HoeIh1eXKlPEFdaTjqAWF01fMvKBBXFMx8IIqMY2XjN+uMJb94UB0c7qfVsk25Wb0ATcqIE8lMY2bzrghj9m/sjHf5Dwbczvqw3Q/KKyCQ5i97kgbVrI9ORKdk+yZkIQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yzv2soNm; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yzv2soNm"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-aa6c0dbce1fso138747366b.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736431974; x=1737036774; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlBu6Jl4eyQAszKaCyX1ruIoK5I/dtBYkp0OS6r+WLA=;
        b=Yzv2soNm0uBp2fUxOQWj9AGYLawzBswwdFnZVZg4SwuEFqtvM/USr9J/LJEg6EMwMC
         2pFmK4gO5Gc9C9JgBdok3FICOHteEI+4lUwltS9wttnV+YW5vN5yMKQ6PHFy/FaRE2JN
         qfgVjHJ3mZp3BPlkiRiZwffeiY/vFDR1GS781O6u4tArk+cZ7pdc93YCx3KJpFxTVmY5
         ABmlcLZcpfFqmt0x9Jr4L0kXVN5DmEHrHjOd/Uv3AXXWIHHI2xzZuHmuwyTHQjb9tfNG
         lv4olp0Lr7hwMQVdLgBL9CskOOqRyyPYo5i/Wkb21Ms8aAq8u3b7Qs5u7R/p6AEA9V0X
         bPyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431974; x=1737036774;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlBu6Jl4eyQAszKaCyX1ruIoK5I/dtBYkp0OS6r+WLA=;
        b=pZInq/uYnMpfZEag5RHKUxJQlj2NRNcAhcgyw7cin1XMLGz0SVgS9Q/Tl185T60IzQ
         +WnNWf0zyBvGqXhdwnH5dToHJqEvIgO+ZKo+DXbGsbrAJ2/AekXCSjW0+vMRE9c6ShB7
         S8oa3n6ICmBLZLaMveZUkj8f9yAyTn8+YYYJe5ZHoC0QC5sWen+p9uuiyra7E2lyUk0I
         pp3xa5d/WNq8ZOReKPJ7rpGk9Y3KJ17DvGY/rNrPg3qsp3QFr2P0aBuBTVB4h2UDCBFr
         wwroZP5dhVqKDEKJ8HZjpfhi6J6pFiAd6uCtybmvjtaLs9hUpVfR8Pa5++rf/SIc6ECx
         LQUg==
X-Forwarded-Encrypted: i=1; AJvYcCVReO8tp4pLD5qgUqizKtAYPYhpFMBSoOde8+lCZMzYZOcs7KSrxJtfg0BBvR5ztpQH6TX1WA53kdM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj5xDgfKkuHP7KwapZxwXkuT3z6VhQkAj4IxGl9l1C8p+OR4lI
	Ww/0W7ZdFgjtrLosbilp/I+86DLbDjh8G5LgJs4jdfFAa7u6zt6lmBwbKSCEYhc=
X-Gm-Gg: ASbGncvtPZ0WuUjSFtSJkDREG72eVXNnoKV555TdAIHFL5j0HDp36ZeEyqiazOCIeKU
	y+t2FdtrdMVwKXoblRdXKIZqYqvX6HDh3SdsFrtCM8wtJ5NWaWPXrCE67iIBmMdrvcunSd5UVg9
	TRVLP/haG2TmoMbMaZ/FqmL22kRWuQCz5oFL4YPxW86DGgvmlgPfZkp79Hm2pPtCxODZ/0VkWpw
	lIwl6q7ndlGPlYMcNboLRrc/GOuJmOg1btSVci2jofp6IjGL5n18JBHkrDcBbRSTeCxIoxzLwyR
	kiISbo6ZBt7GO/t0saWPhfFLCuHeag==
X-Google-Smtp-Source: AGHT+IEOXSEbBA1axGYMcra+RQ2TbWnh4xp8zHitSs1AcfUx4imSb6e/9u6/B80hfC1lQxS7w4XDzw==
X-Received: by 2002:a05:6402:530f:b0:5d1:2377:5af3 with SMTP id 4fb4d7f45d1cf-5d972e00027mr14520603a12.5.1736431974259;
        Thu, 09 Jan 2025 06:12:54 -0800 (PST)
Received: from localhost (host-79-40-232-186.business.telecomitalia.it. [79.40.232.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c90e8888sm75783566b.80.2025.01.09.06.12.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 06:12:53 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 9 Jan 2025 15:13:42 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Rob Herring <robh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z3_ZlvbszezcanA4@apocalypse>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>
 <20241210224837.GA702616-robh@kernel.org>
 <Z2A0aAPotT0NvoCl@apocalypse>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z2A0aAPotT0NvoCl@apocalypse>

Hi Rob,

On 15:08 Mon 16 Dec     , Andrea della Porta wrote:
> Hi Rob,
> 
> On 16:48 Tue 10 Dec     , Rob Herring wrote:
> > On Mon, Dec 02, 2024 at 12:19:32PM +0100, Andrea della Porta wrote:
> > > The RaspberryPi RP1 is a PCI multi function device containing
> > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > and others.

...

> > > +#define RP1_INT_ADC_FIFO	52
> > > +#define RP1_INT_PCIE_OUT	53
> > > +#define RP1_INT_SPI6		54
> > > +#define RP1_INT_SPI7		55
> > > +#define RP1_INT_SPI8		56
> > > +#define RP1_INT_SYSCFG		58
> > > +#define RP1_INT_CLOCKS_DEFAULT	59
> > > +#define RP1_INT_VBUSCTRL	60
> > > +#define RP1_INT_PROC_MISC	57
> > 
> > Why all these defines which will never be used because they come from 
> > DT?
> >
> 
> Right, those defines where originally designed to be included from dts, but
> previous discussion deemed interrupt numbers to be hardcoded instead of being
> specified as mnemonics. In the driver source code I just use RP1_INT_END as the
> number of interrupts but I thought that the specific interrupt numbers should
> be documented in some way or another. Since no one is currently referencing
> those defines, would it be better to just turn those in a multiline comment
> just to describe them in a more compact form?

So, here's a couple of proposals about the interrupt defines:

- since they were banned from devicetree, and are not used anywhere in the code,
  turn them into a (admittedly long) multiline comment, so they are still at
  least documented

- since they were banned from devicetree, and are not use anywhere in the code,
  just drop them, we don't currently need them after all

Not sure what's the best way here, anyone can advise?

Many thanks,
Andrea
