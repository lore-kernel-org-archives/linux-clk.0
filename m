Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81EB25A2B9
	for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 08:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747039368; cv=none; b=M6kU3Jo/dXMXjJfdwatYsOOHwNfr+iWQBAfpLUY/lqyiXw93PkOEYDWpB6vsBIsyb7j4V+1tOmEqlC/ECUB0o9kBsQHYQIoZNR2goadMbmBqsdDQryfNaRsNaPrpnD/H+1H/WMePC9Oe9DhNBYtxs+tzNzQlHW9w1jO88fsOYx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747039368; c=relaxed/simple;
	bh=1B5dgztH11GB21THwBIVK8ZGrtwBfTuLl4JLE5N72O8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcBT8FJxlY53r4ulsUrRuE2vTbn9eVdfTEIOg5EJailCOiW+Ot5Z8kVnUPKqzGDNSI8Vh5pb0/58EWhCC//Qf2QgsMjR3XksGmvB+e4iaTk/ojB3w7XboUPe3l6pwDhdCwqQ/ihOVSlLC1NA6YrLoE+BLtRGo3raUiwtzMrwQoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=CnwiY725; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="CnwiY725"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b07d607dc83so3247654a12.1
        for <linux-clk@vger.kernel.org>; Mon, 12 May 2025 01:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747039366; x=1747644166; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X+5YGsytKao/1xj60NvbEzUS05YJXuIqDnMKPWIykv4=;
        b=CnwiY725l/8rn3/SmX8jstVgTl0mcsK5ub+7f+XBgtEUMWwalseINQtAyayW9hPPaM
         lsd/otVFrSGXlrY656RrhDOoiou8oCf5Z55M+8otDkB85ILhSAw6nGMQAbVaUY+1KSDa
         NYkZQPNFAfufsbLtj8IFQerAcCoGMUxV+NPF/ubTAatdMxl5n/qNlujxDYwbJTJCLMHQ
         u9g9nwjLG76pNzK1usqlXHD018uYWXqbl5ADXdY9rTUFiAapBCScEh6kTZRrcsnUQ44Q
         i1eltUbncTej76UhQRltg8i99x3+HE4oD8OJO0VUKPoQWFr/SaDTDjl46XBfqihlQQBb
         SUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747039366; x=1747644166;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+5YGsytKao/1xj60NvbEzUS05YJXuIqDnMKPWIykv4=;
        b=SSAqGBoYtLUi59hMjG6SVOhT8DVgKQJA5eUgdL3nOxg+biKZ6sKBf3czbpx0gBxqjG
         SE2tof3UMBaaD9ve4QRasB5FLjAugajYX6/9rfSQiIH0RCjvbh7Myh8J0tRk6drvUNKg
         K4ogfzj+xcf3lqfZ/UMwOdcxFGC1MYJC3VjqGs7tLGcW+7vpDMl68o+qrb+lDDJDJAfK
         aPOXu9GBSTGPv12DjRVn6LtBf+PWPTK1H+q3jv1ipxezm/kEcDJ0XxudZOiOoSEJ/uC+
         u3WyLzFfd+Rwpeqrfy0II2CclQi9SAniZMSr43YtcfNDAGLK2HW6/49UelZ58Qa1XtUW
         IdAw==
X-Forwarded-Encrypted: i=1; AJvYcCWKWBpzSVxPlFGqEyTAs9vq6Isi4F6c1BeBiLjHprH9wMYYHhWKw1PqYkLzS9SU8InCn42P3fAgSmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbM2ByVLtHz86CEtdowsq4DTf3XAw8PUrVlqW5VPsGUZjiyhdu
	0IPWnpvshIAyA554MtklXC0fgG9T1+0655i3KKp0t3t6+eFSV8Z3kgKCJxnr4xA=
X-Gm-Gg: ASbGncuW0XaWS+7mTi6cgGJKDrAbCGK8IQvLubR4fczFET7gGbCp03YdQ824DGdQXx3
	NEbdXc1P9wdOKxoMCBL/aR9/I80W/3P3Y4rcDie+SbiU86QaUDEf01globuGGfPwtH4hhaTZ8rb
	cJwJaRycg1zAm9cbuAoMUlv5DpPYktiTDSUQ3Y7dVov1TWjfcO40Dokg3q8C0KbUOwSVYNPVakc
	jg+YoGUae5dqIpXc7pLUbDerqZso1ptw/S6k2f7rvfoNfhFtVcfOfKWuZN3+M8MjrAYZncXbx/I
	7uKDdR4MjakpMFFbxIAUYVJVMtSXZ1YeW2rJ6iAiTEmF8AI6IwqqtzUU3Q9GmT2Zu5Zicg==
X-Google-Smtp-Source: AGHT+IEz7Q7VathijLmBODr/a+xLNbkuuG9lsRlC6Htr1xO5LtaIVMh8ToMMpvZPxZ7MXgvORUvBzQ==
X-Received: by 2002:a17:903:166b:b0:224:c47:b6c3 with SMTP id d9443c01a7336-22fc8b0fa27mr146195415ad.6.1747039365955;
        Mon, 12 May 2025 01:42:45 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7546aefsm58573605ad.37.2025.05.12.01.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 01:42:45 -0700 (PDT)
Date: Mon, 12 May 2025 14:12:31 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <aCG0d3Lh9KwS5a9N@sunil-laptop>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-22-apatel@ventanamicro.com>
 <aCGkdqcLhPVXSSLq@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCGkdqcLhPVXSSLq@smile.fi.intel.com>

On Mon, May 12, 2025 at 10:34:14AM +0300, Andy Shevchenko wrote:
> On Sun, May 11, 2025 at 07:09:37PM +0530, Anup Patel wrote:
> > 
> > Add ACPI support for the RISC-V RPMI system MSI based irqchip driver.
> 
> ...
> 
> 	struct fwnode_handle *fwnode;
> 	...
> 	fwnode = dev_fwnode(dev);
> 
> > +	if (is_acpi_node(dev_fwnode(dev))) {
> > +		u32 nr_irqs;
> > +
> > +		rc = riscv_acpi_get_gsi_info(dev_fwnode(dev), &priv->gsi_base, &id,
> > +					     &nr_irqs, NULL);
> 
> 		...(fwnode, ...)
> 
> ...and so on...
> 
Sure.

> > +		if (rc) {
> > +			dev_err(dev, "failed to find GSI mapping\n");
> > +			return rc;
> > +		}
> > +
> > +		/* Update with actual GSI range */
> > +		if (nr_irqs != priv->nr_irqs)
> > +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> > +	}
> 
> > -		if (is_of_node(dev_fwnode(dev)))
> > +		if (is_of_node(dev_fwnode(dev))) {
> >  			of_msi_configure(dev, to_of_node(dev_fwnode(dev)));
> > +		} else {
> 
> 		} else if (is_acpi_..._node(...)) {
> 
Okay.

> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> 
> ...
> 
> > +#ifdef CONFIG_ACPI
> > +	if (!acpi_disabled)
> 
> Why?
> 
Same code as in the other patch. I will update this in the next version
in case any change required.

Thanks,
Sunil
