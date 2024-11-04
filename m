Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8813A1AB510
	for <linux-clk@vger.kernel.org>; Mon,  4 Nov 2024 08:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730710475; cv=none; b=DaEBn6FZdgPjqcLlOhti8ESgA+KQp2VegJQB8rVhGR5TxAN/MCMcub4KyfpfzlVZRSwpqpS7zcckYCG9pwSIad+Hfx/0+uu1FtQwzt8jmrqGptDUeDUcTRXom72cXQhlCCqmwxouSldBm85RZl73pH53iU9ZGy4b3ep7+nyJng4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730710475; c=relaxed/simple;
	bh=J1lybsdywqSajY8+XO5SA+Jx3q7N50JOGpD77qB0vPE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xi/bbOtqJha6mjA/6k1E0mZeQsMuMOaqaxaZVEkNgB+QV4c5QlfkF8OnChDazog8Rc+FH4r7OhO621Yb7BCokFAQ7YvN/uIhXK64Po8nbHcUzKHfVzWQWux7WOr1a1RjLpEmeym9P9NFIUFqrvjUAmAMIN8fZM3j8aUkPN6bP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L6D+oWFY; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L6D+oWFY"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9a628b68a7so630434966b.2
        for <linux-clk@vger.kernel.org>; Mon, 04 Nov 2024 00:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730710472; x=1731315272; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wVgtF+RQO3Bp9xa0wTFVgwHh2YZ5qiUAa82quET385A=;
        b=L6D+oWFYL/dRJ3QfMl0QDc1JvClifZsvCwEHs30ScF0oZECySUsxPxUVLXQ0joHblQ
         RJIJdofH9n/APZwIgIPcSs6V9tN6/uz+38DZ+b1OgnKKDo99k4TC+/cQAyXpmpGIUigk
         3pLqhBtRPOOrFwOse+8qTeYoHSWOLR30ffATYgoCdl4e6ZL8Hhac2kTnJSDn0U57K9p6
         GLpzEZ5WkIe3bHW+L0Fkp7g1atHUjJ2R+ousYm6dJX1KbHFIwHCkmXxa4Nw60K0AB8kA
         wii2qixJyFbJ4qd5DrdMBKNqKPewui8aC6ySOWOl7vKdU58U9e4xZEpASWnU2kQVNmpB
         fdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730710472; x=1731315272;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wVgtF+RQO3Bp9xa0wTFVgwHh2YZ5qiUAa82quET385A=;
        b=e8IF1GBv4V0eh41UC3piw6M+lx14UuMSuEYfPhjC74sqBYm3vHE6pjNq7l0c7kb9j0
         lP87B2xLLOY41ynT/lpTLn5GpUztckXSNvZDIS1nskSa0Qq8/d8kFL7rAJfBULgJcTnr
         DBAqzejETQlF4DVSRYLt2fIAmOu/ZOy5JDt/+5q45pangYRXA3sSHGf52n3jhoepkeDl
         oeA57EhFLa1BOQJZuMz4UXzf+34YWAXFW93cP571dI0moXRbZKj338BMRFdm3hY0mkXP
         0zkTwdoDbl0gG9kqNAtGDdoxK5pUbDfCWiY0q7WNqKCMe/gk+f4h5YcnJ96tR44/BN/f
         BoOA==
X-Forwarded-Encrypted: i=1; AJvYcCW7YBGtUZBZ9LYW/4kz7xygM/7z82MRHNsEFWYQhLSDOmhotkFQQDmDHpCtrSRMVNJnDcoKOTW/pII=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYwCK7io3e+BOLnXN+eeINz1Ts44GzXz6DU83worLu1zej6jV8
	P5CQlBvmhYKwpFqsWjXiHoL6X8vs5xRn4HomSj2ikEMMvv1yohFOVfKv/pWKYDo=
X-Google-Smtp-Source: AGHT+IHHWwU4nmC4hKYGVohwmL7B6wm+EPEOdY9CCLcF+bYsvgn7lE94cff864zN3lJnYIL8UQ8UFQ==
X-Received: by 2002:a17:907:2d0d:b0:a99:61d1:348f with SMTP id a640c23a62f3a-a9e655b9703mr1085525566b.52.1730710471755;
        Mon, 04 Nov 2024 00:54:31 -0800 (PST)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5669a18esm524386366b.216.2024.11.04.00.54.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 00:54:31 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 4 Nov 2024 09:54:57 +0100
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
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
Subject: Re: [PATCH v3 05/12] PCI: of_property: Assign PCI instead of CPU bus
 address to dynamic bridge nodes
Message-ID: <ZyiL4RnRC1z907Ly@apocalypse>
References: <cover.1730123575.git.andrea.porta@suse.com>
 <f6b445b764312fd8ab96745fe4e97fb22f91ae4c.1730123575.git.andrea.porta@suse.com>
 <20241102170908.fa5n6pz5ldxb66zk@thinkpad>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241102170908.fa5n6pz5ldxb66zk@thinkpad>

Hi Manivannan,

On 22:39 Sat 02 Nov     , Manivannan Sadhasivam wrote:
> On Mon, Oct 28, 2024 at 03:07:22PM +0100, Andrea della Porta wrote:
> > When populating "ranges" property for a PCI bridge, of_pci_prop_ranges()
> > incorrectly use the CPU bus address of the resource. Since this is a PCI-PCI
> > bridge, the window should instead be in PCI address space. Call
> > pci_bus_address() on the resource in order to obtain the PCI bus
> > address.
> > 
> 
> of_pci_prop_ranges() could be called for PCI devices also (not just PCI
> bridges), right?

Correct. Please note however that while the PCI-PCI bridge has the parent
address in CPU space, an endpoint device has it in PCI space: here we're
focusing on the bridge part. It probably used to work before since in many
cases the CPU and PCI address are the same, but it breaks down when they
differ.

Many thanks,
Andrea

> 
> - Mani
> 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  drivers/pci/of_property.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/pci/of_property.c b/drivers/pci/of_property.c
> > index 5a0b98e69795..886c236e5de6 100644
> > --- a/drivers/pci/of_property.c
> > +++ b/drivers/pci/of_property.c
> > @@ -126,7 +126,7 @@ static int of_pci_prop_ranges(struct pci_dev *pdev, struct of_changeset *ocs,
> >  		if (of_pci_get_addr_flags(&res[j], &flags))
> >  			continue;
> >  
> > -		val64 = res[j].start;
> > +		val64 = pci_bus_address(pdev, &res[j] - pdev->resource);
> >  		of_pci_set_address(pdev, rp[i].parent_addr, val64, 0, flags,
> >  				   false);
> >  		if (pci_is_bridge(pdev)) {
> > -- 
> > 2.35.3
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
