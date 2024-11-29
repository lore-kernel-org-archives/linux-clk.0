Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF413156677
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 18:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732904262; cv=none; b=HILnLHrZzV1YDXJpPcGw6w++zVWtMrrVY6a19ozaoyLKrp8ZHQ9+cdAQa7xJ7Lud4Rw/MEeOquOlBDrR2aBPPR2sNIr25mRLNFMX1UUMmVhafzapM1WhLw9geH5EWdeph6heTqHfXJoIBlgosKXQ6Yp2TLMzRjETtMHYEJWtuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732904262; c=relaxed/simple;
	bh=fN0bLk90ZCqU7t/VgLksSaWfjvLd7tuev8IlpU2KjsE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RuZTY0z863mUfGb5OefB/pgAPM6BeHw25zG0b7rBMgEdOVfNmCgoUwnbtKOjy/2OAPM3+1RZSfKVN2aReRPQTsL0Hbep94LTTr7XGqQFjkptjuTxDPJktpOX/hy3m73ZBC3Gva36FO73eyMYeTSFBCGsQzM4bkxw6gX+NmjgcRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SnQRzeNL; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SnQRzeNL"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9e44654ae3so249584966b.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 10:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732904259; x=1733509059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/K5xGcTYHJ/8xAu9IkRPPHbt4WWLkz+NlJpLlbPrtJ8=;
        b=SnQRzeNLk5c7PEqfpHhgVBsmwKuQCsuV1f/0oERNlyJqz/K2rylASeCEgXxa60Pgcc
         ingVz5XZcah5FZXSfGj1/zDe/yy1YB/q+eZStOeMvUeG0eVNyTZVuacz1SbBxShKBhrB
         6da0qBDYWpnWYwfk6kmc20th2IXKiXfhqDQnunlU2tcq/XxRy7KIPxQ730SudN+mAYJz
         ioIIzug23+X977rvz2y7R+JMJ96tozihtkpI6BBY2UW7Zq3JiJmcQn8nI+aR+7WYH9Uk
         nS3FBAogQJm0+f1tLMAyVOPtcImOrptr1UUfa82JCWIN8qoHQvMzbso32yD89Xlj4dta
         yg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732904259; x=1733509059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K5xGcTYHJ/8xAu9IkRPPHbt4WWLkz+NlJpLlbPrtJ8=;
        b=YqhBxvB7GwUmq7ItUiBEhdy8rXgGD+UvJCVzLPphrHCRhLC8Eq05NCTN4EKZLXNY3C
         EGLUmnW6mByFNEN/kfvlz0rGxr+M2RnKTd7DdEdcG6m+UMhatFi5q69emwB1Ktmmm6yW
         mRMM8VxqUgJ87JyM/OZNs4Of7356wUtN2VL6zIpCKIexOS92DFXd+C45lXUWQZtoGQLq
         FsEicQyXRZI6yqpqIFguFIQZjAsDEdA3xm8hxd3VGvkZyDE7lcOXxY/UJNevkwWAr1s0
         I1Il5wA9TIbD1YjV8dk1NGNT1WPehP3c6nPmsO30zliDgFWURrksN80Vgu0r+i1GqcnT
         t1Kg==
X-Forwarded-Encrypted: i=1; AJvYcCXbc9tZXMfhrmb3BPqrKt2OFaiOF86QYRFwbJmuMViaB5YEY+ElkG2NGS+TNo6FImLdtQW4O/Npi9A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA8kwbleS4mJkzLopT/hnOZJMsQ9EVx08TKom2dd4bG/hMqx5v
	IBAe1UXB0Am0sT16+pGTxCeJfOb7JUeB4l7lK8GWfmnmLR32lEOAqHq0zCVCaRk=
X-Gm-Gg: ASbGncvXiy/A95GUox6CXm7s7f1vCTxY4bQO12SOP07F3+JsxtbYFuDBS3sYDZT4AI/
	IQ0mpvknrgqXCZGLkafXmoPkywcG5Ya0qc/THjb3osKJ3gtUMQMIfTkEDfB2QCFja0QQkrkW60K
	vO72JiYLFiJ58oOkGQg0+9zv4gxlsn4gd2gwj50ThYEzUA5uvNWMAUcaxdGq8lSZ2lq7avoBGEX
	LUkz5fv/98YCmHVuLeUDVw9lxDhdA0sp+IsT2RWuh1vppEMw5xQKD3LGM7vSiEjZpSwHPA0j2Hi
	2fmjrLs4uD1xumfCM4O2
X-Google-Smtp-Source: AGHT+IFoJJFPtLBuSMIqJyGFIVwrCuTOeFzAqiPp8piO0gnCMrA5ajUljudZL/pGS/GtLks+6yCgNQ==
X-Received: by 2002:a17:906:2189:b0:aa5:391e:cadf with SMTP id a640c23a62f3a-aa58103cca7mr869419266b.42.1732904258959;
        Fri, 29 Nov 2024 10:17:38 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e64dcsm197279866b.95.2024.11.29.10.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 10:17:38 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 29 Nov 2024 19:18:12 +0100
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
Subject: Re: [PATCH v4 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z0oFZGM72FDQX55N@apocalypse>
References: <cover.1732444746.git.andrea.porta@suse.com>
 <c48e6b9b178cdaa01b92ae82e8fd24c2ba5f170c.1732444746.git.andrea.porta@suse.com>
 <2024112535-viper-uncivil-3054@gregkh>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024112535-viper-uncivil-3054@gregkh>

Hi Greg,

On 14:46 Mon 25 Nov     , Greg Kroah-Hartman wrote:
> On Sun, Nov 24, 2024 at 11:51:45AM +0100, Andrea della Porta wrote:
> > --- a/include/linux/pci_ids.h
> > +++ b/include/linux/pci_ids.h
> > @@ -2611,6 +2611,9 @@
> >  #define PCI_VENDOR_ID_TEKRAM		0x1de1
> >  #define PCI_DEVICE_ID_TEKRAM_DC290	0xdc29
> >  
> > +#define PCI_VENDOR_ID_RPI		0x1de4
> > +#define PCI_DEVICE_ID_RPI_RP1_C0	0x0001
> 
> As you only use these in one file, please read the top of this file for
> why this isn't needed here, but rather should be back in that one
> driver.

The reason I've defined them in pci_ids.h is due to the fact that they are
indeed used both by the driver (drivers/misc/rp1/rp1_pci.c) and in 
drivers/pci/quirks.c.

Many thanks,
Andrea 

> 
> thanks,
> 
> greg k-h
