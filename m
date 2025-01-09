Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C129220691
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 15:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736437988; cv=none; b=XKJkrNIBsgdN+Ub7MLVZYKS6Z6eZuL1fol7O1KDDxGhNGs4BFrKd1yVkImmbh5BcBsZCVzktIW4B/ESyEDtfAxdZhygzyGmqXpdKvl/L8CuiRHVEphBgUWhwzyDpRbeC6TMsY73dxYRO4QagWtCr3UccYYsOpB0/wh3bichZ7tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736437988; c=relaxed/simple;
	bh=pJgGVj88K8V7gJ0zgIUhUwlsCxKgV+W4Ci2hCN34mIY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7lo93uN4xkqPBa8UuyG0LZ9h8ZAw6FVwE6yHgWBQIiaJWf5J8vIYbhYyoz3yHVXBNKkcR16HLSdGMiYD00BrzCMYt7sC8XO2TY2CNF4hDaHRWF53pscIcqtTasDGEs0sp3wIHgBYGOf/RfryEOufrGTgteylVS5z12wsAJti5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Bl/mYVoK; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Bl/mYVoK"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso1622171a12.0
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 07:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736437985; x=1737042785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aiM8y2KF3+onAr2SvicvIVsqQjxBJ+k4H+eZXUhohgA=;
        b=Bl/mYVoKctKrr4gURZuPaipQQxFpkN47P0NlpCMfjizKqQNYQVhLEN+Rrs1NmO6Bbl
         Pk0gJ699p+KTMEwouYyn5iWanH06Zfa8lCBNjlTFl7Vsb1+MZr/5bicGx9uRLFleFiT9
         rgTppDeph9xyTknOcMsi/Zma8kkEErYrwCbAfR1jbPcBNswOMQzcWUXL1mXsaCVhauMl
         fUvIGf+9SAIUDmL+1Y+f+DiF9C7JPvtot6yczg+M574vA9tgtRKVZ84mdAClQqcWYUrP
         Jiag7lXRPPPKmsgTX0C42XLBThXjXic+pkAAjgFyP0NONL0CF0HPhMXwbySw60jCxTvB
         vQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437985; x=1737042785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aiM8y2KF3+onAr2SvicvIVsqQjxBJ+k4H+eZXUhohgA=;
        b=npUAqh7SSbor+9j4uQvGqwDIRjVes3akxOnXqWYO45A+iLdyECy6IVbvtAn9m4KCTq
         DNS1qQ3NwlJ8Z21MOqGPY5PGdNIGmUUAigTjrdCJ+ruWUgA0SaTJ3JkIZO+lsBqjPs1X
         VoVgJY/1aEGbuYj+aAU6O60s4CYZy/RF7zc4Qy9pdFpTstOXz72zsS1mhjzkiazL84pP
         jmS15yjLcVXAZFV54nPDPeNgJxSVXhapa0TLjM1C59MTKprprLhwivJbJRFeginode9P
         HAO6yg8Cgu+qKNFK4NHx6zfXoARNszcn0nYTqmJPpl0ZAjyGle6LxZPSOHYaWX5fIPVx
         cV5w==
X-Forwarded-Encrypted: i=1; AJvYcCUo9SUgEXAdf9WxVSTi+LXyGcgk65VWCVmNG2qj+0NtVnI6esX+c3czQn/bNaLDtVxwYCx4+KAPPgY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCz/2MqyUVCa7MTXVCHjGjd14m0A/qQ0nAta8C1ExGRwB51v3e
	OxPqauIrAOZGr14N6tjp32HHBXqeYaHzSAnoxMVtMvbzge46emYhFBj0GdC0+nQ=
X-Gm-Gg: ASbGncujXrHLWJGqKF+jHgQJSg+r/DehBaI0ZAugcaCO2qZEm4K5uxf4B1NQGVYDbyH
	59HBVzfdZdkJrwXfwnRWEZTSNCMigSBiur+l+2stPju8rPd0tIdavRrKGtydLjAcMfyLJBrbyjt
	P/TbWPMlPQ9CfCM0iNS3V6KVmIR8ZxC5s/8hFCqMhE3D5WQBiztqsM3p/+pUTJRv+btX8JGyNcf
	4HDDlAl0CXTe/LbXxQjkBvvMSQNaLcoqI3IX336+xBenMPv+tvMYNn6b9LVNHWtQ2Jbcw5V6tmu
	Hh7HUnm4xXF4A9VpTrJqMnF4xbSyig==
X-Google-Smtp-Source: AGHT+IHcBvpBouxzG2xA8PisFV1s3Jhs8UiQjwM9GQq0MdUzIaP9cn8QbUIcgBfqgLqpN4NyhXITew==
X-Received: by 2002:a17:906:fd87:b0:aab:cce0:f8b4 with SMTP id a640c23a62f3a-ab2abc9ed6cmr644656666b.52.1736437984935;
        Thu, 09 Jan 2025 07:53:04 -0800 (PST)
Received: from localhost (host-79-40-232-186.business.telecomitalia.it. [79.40.232.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9563b32sm82250366b.122.2025.01.09.07.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:53:04 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 9 Jan 2025 16:53:52 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
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
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v5 08/10] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <Z3_xEEGVWFu-bDjT@apocalypse>
References: <cover.1733136811.git.andrea.porta@suse.com>
 <28fe72eec1c08781770cee65032bb10a6d5994a9.1733136811.git.andrea.porta@suse.com>
 <20241210224837.GA702616-robh@kernel.org>
 <Z2A0aAPotT0NvoCl@apocalypse>
 <Z3_ZlvbszezcanA4@apocalypse>
 <20250109155036.27b82b7e@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250109155036.27b82b7e@bootlin.com>

Hi Herve,

On 15:50 Thu 09 Jan     , Herve Codina wrote:
> Hi Andrea,
> 
> On Thu, 9 Jan 2025 15:13:42 +0100
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > Hi Rob,
> > 
> > On 15:08 Mon 16 Dec     , Andrea della Porta wrote:
> > > Hi Rob,
> > > 
> > > On 16:48 Tue 10 Dec     , Rob Herring wrote:  
> > > > On Mon, Dec 02, 2024 at 12:19:32PM +0100, Andrea della Porta wrote:  
> > > > > The RaspberryPi RP1 is a PCI multi function device containing
> > > > > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > > > > and others.  
> > 
> > ...
> > 
> > > > > +#define RP1_INT_ADC_FIFO	52
> > > > > +#define RP1_INT_PCIE_OUT	53
> > > > > +#define RP1_INT_SPI6		54
> > > > > +#define RP1_INT_SPI7		55
> > > > > +#define RP1_INT_SPI8		56
> > > > > +#define RP1_INT_SYSCFG		58
> > > > > +#define RP1_INT_CLOCKS_DEFAULT	59
> > > > > +#define RP1_INT_VBUSCTRL	60
> > > > > +#define RP1_INT_PROC_MISC	57  
> > > > 
> > > > Why all these defines which will never be used because they come from 
> > > > DT?
> > > >  
> > > 
> > > Right, those defines where originally designed to be included from dts, but
> > > previous discussion deemed interrupt numbers to be hardcoded instead of being
> > > specified as mnemonics. In the driver source code I just use RP1_INT_END as the
> > > number of interrupts but I thought that the specific interrupt numbers should
> > > be documented in some way or another. Since no one is currently referencing
> > > those defines, would it be better to just turn those in a multiline comment
> > > just to describe them in a more compact form?  
> > 
> > So, here's a couple of proposals about the interrupt defines:
> > 
> > - since they were banned from devicetree, and are not used anywhere in the code,
> >   turn them into a (admittedly long) multiline comment, so they are still at
> >   least documented
> > 
> > - since they were banned from devicetree, and are not use anywhere in the code,
> >   just drop them, we don't currently need them after all
> > 
> > Not sure what's the best way here, anyone can advise?
> 
> Maybe in the #interrupt-cells description in the device-tree binding?
> 
> In your patch 4, you describe this interrupt controller and you have:
>   '#interrupt-cells':
>     const: 2
>     description:
>       Specifies respectively the interrupt number and flags as defined
>       in include/dt-bindings/interrupt-controller/irq.h.
> 
> In this description, why not add the supported interrupt number values?
>     description: |
>       Specifies respectively the interrupt number and flags as defined
>       in include/dt-bindings/interrupt-controller/irq.h.
>       The supported values for the interrupt number are:
>         - IO BANK0: 0
>         - IO BANK1: 1
> ...
> 
> Or something similar.
> 
> This kind of description is already available. For instance:
>   https://elixir.bootlin.com/linux/v6.13-rc1/source/Documentation/devicetree/bindings/dma/fsl,imx-sdma.yaml#L64
> 
> Does it make sense?

Seems fine to me, if there's no concern from anyone I will procede like that.
Thanks for the suggestion.

Andrea

> 
> Best regards,
> Hervé
