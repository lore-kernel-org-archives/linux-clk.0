Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868A07DA6D
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750223303; cv=none; b=PZLR5lZ2F+mEOjyGDMu+uGpV3jKQMP9drKk7tdDmdzXhUgfTZ1R1OpvFIhZ7SP2wjvXCnW7avAcqy3R+6nW30sdD8PrDmsEoKhSVJAj2YaMjXt/3J9dCV71TGGTctOVhnxB8tkYCYBDqkjTIL7EGc6vle9tMf4Dc4Lj37USpWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750223303; c=relaxed/simple;
	bh=MzlWFzxk1qDJ/5xEzQ4YhLlPSbZkMC8YmJv1GemlOe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxMRn1hGbqhtsIA+rWg8uo+UmhUlTzV/lNLhIYNbd28PkJEd8Ld5sew2HPGLBC3ZI1dS78If9WGx9Z06+hkpTDbArPJSWERJjJzFJPf/MNWIUZ8dUawUl2Yrqb8bjPVlN0exHVJhsmE/Pm+hCzJmWD6rEUDupk6RhrbM484Y3bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=R6IReRDK; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="R6IReRDK"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d710d8so80806975ad.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 22:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750223300; x=1750828100; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0piupPu8V/gl6O7trlkzEQzKsY2tqiYS+DKkqKrrgIw=;
        b=R6IReRDKPO8V6G+5cplMVZyDczIAJveJYxN5f4AYotF7R3iQKA5BNLamnM1uduQhSc
         7gE4ru0iOQJj83ZF6X0xqeNTy3PxeQSEvPbgoTHrqr/Z7mgUj4jYvFYO4XgLNMAZN3b8
         FrerMdvXuj2uwksGNFEIVgzBGAm0MGIowZsENt8dvb8E8iMebRH6+ioTvOhiU+avP10m
         eDw1Sh4Hk84M8WCRg+P0tyjyPmzO6NJ7Q6LuteBfcNyelkFCVlkEQxlDu6q6K309sJl9
         sPOuC4xzpFrCAAPUGQC9+GGkB/FXmyQGhD7cNKROJYgImlMcW7ehkm8tdyu96CFu1PmI
         ix6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750223300; x=1750828100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0piupPu8V/gl6O7trlkzEQzKsY2tqiYS+DKkqKrrgIw=;
        b=FTlDYpY0oXz2RwO4hsh3L+9vfrCSfmMRTcVBAi6CkPJCMc933HB3TZ7Qk34yqfUPnn
         JQotTBP+Vmn+8JPx/7eAUzyodFeJS6a+LE1wyZwIZ5GFL5B58cPxIQx3KsFYdyQr3yjU
         na1iE2A2ZXeh5gYRrzoMwFxenaESpv1U4zqaTBaRj0R3dO6UXGANOZR2D/dzcvN9Gqm4
         zTxQ73ftf1D4D95k7EzN6pbd+1MZg5iKZfdKtQKlax2ZEERDejv7YysM3p0ofAfpSTq3
         8KtlF3slb4IbyBGxNplTMw/0yhXz4qJkYMFLEFdxFG2xGfYdwKHjerps9536nY5nA66m
         JK3w==
X-Forwarded-Encrypted: i=1; AJvYcCXAnATT1Twtw6Mri70qv3sPdmf4Fo/xvd35NvJFIU4YVEznFUxuEFL81BZ1zENVuy4b3wowmGsTB+0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvVUqI1GEPQudKaJmyap7+UgWZKoljt1BH0HC/gqsXLcSIQS4H
	n7crUIzrX5PPtHrEd3/bnKmccTJL98xazSOvt2rxqoLq2dbNQqHZK+0kdOS7WzMWdnQ=
X-Gm-Gg: ASbGncuLhxAfioTK83A9PLid9zOpsZskAlSTzhynIqRNFvqJ12gNffe+nCzQXa/19oF
	VLLFmT91RbT6jiABmZSvSBBVn6WnnEanrVXl75wlJUAxmknKWDP1GSqlQYJwoq0nQqLPot6hVzs
	4bO/vFw2gMuZQTJaQWDe791c0y9Oc2dnvlNT2x/dKSp+BylobGKyOi/un/9QbpoqJ1350svWKGO
	Vc6zUR3dZav/oKEnNlp5vsN0qR210MGmDEdYWRlYUK/R7PoNAB+GiG+YLnOeg4aQ+babEgDX9D7
	zXKKwOm8K1attxNLcc8AaJUY0NXm3O3ufdj1lvNO9NlKnxDY2ZyG/ICKcIK7+I2jBrPwJw==
X-Google-Smtp-Source: AGHT+IFQmeYov3M4TJeicSZPxmrAUyfFLdsmh1502m8UPHV9igXkcxtyc+FtIrcqYue77oYSTt8fUA==
X-Received: by 2002:a17:903:348f:b0:235:88b:2d06 with SMTP id d9443c01a7336-2366b337f3cmr135541935ad.6.1750223299794;
        Tue, 17 Jun 2025 22:08:19 -0700 (PDT)
Received: from sunil-laptop ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deb54desm90646085ad.179.2025.06.17.22.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 22:08:19 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:38:05 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
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
Subject: Re: [PATCH v5 21/23] irqchip/riscv-rpmi-sysmsi: Add ACPI support
Message-ID: <aFJJternIoBDAxrz@sunil-laptop>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-22-apatel@ventanamicro.com>
 <87frg3irgq.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frg3irgq.ffs@tglx>

On Fri, Jun 13, 2025 at 05:36:21PM +0200, Thomas Gleixner wrote:
> On Wed, Jun 11 2025 at 11:52, Anup Patel wrote:
> > @@ -211,6 +213,9 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> >  	struct rpmi_sysmsi_priv *priv;
> > +	struct irq_domain *msi_domain;
> > +	struct fwnode_handle *fwnode;
> > +	u32 id;
> >  	int rc;
> >  
> >  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > @@ -241,6 +246,22 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
> >  	}
> >  	priv->nr_irqs = rc;
> >  
> > +	fwnode = dev_fwnode(dev);
> > +	if (is_acpi_node(fwnode)) {
> > +		u32 nr_irqs;
> > +
> > +		rc = riscv_acpi_get_gsi_info(fwnode, &priv->gsi_base, &id,
> > +					     &nr_irqs, NULL);
> > +		if (rc) {
> > +			dev_err(dev, "failed to find GSI mapping\n");
> > +			return rc;
> > +		}
> > +
> > +		/* Update with actual GSI range */
> > +		if (nr_irqs != priv->nr_irqs)
> > +			riscv_acpi_update_gsi_range(priv->gsi_base, priv->nr_irqs);
> > +	}
> > +
> >  	/* Set the device MSI domain if not available */
> >  	if (!dev_get_msi_domain(dev)) {
> >  		/*
> > @@ -250,8 +271,13 @@ static int rpmi_sysmsi_probe(struct platform_device *pdev)
> >  		 * then we need to set it explicitly before using any platform
> >  		 * MSI functions.
> >  		 */
> > -		if (dev_of_node(dev))
> > +		if (is_of_node(fwnode)) {
> >  			of_msi_configure(dev, dev_of_node(dev));
> > +		} else if (is_acpi_device_node(fwnode)) {
> > +			msi_domain = irq_find_matching_fwnode(imsic_acpi_get_fwnode(dev),
> > +							      DOMAIN_BUS_PLATFORM_MSI);
> 
> msi_domain is only used here and so it should be declared in this scope
> and not at the top of the function.
> 
Yes, let me change in the next revision. Thanks!

> > +			dev_set_msi_domain(dev, msi_domain);
> > +		}
> 
> Other than that:
> 
> Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

Thank you!
Sunil
