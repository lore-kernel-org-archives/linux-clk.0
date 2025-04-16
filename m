Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DCE22422C
	for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 18:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744828820; cv=none; b=dQht6rW7tkFhVUeH94A5UfZsQs1PV7ncfHJRVKM3aShPxffbi9t/FjvKv4O8WV3M2G72Sdqsgxs7ME3LA3kaeWlnKdTDPo3Lfoc2aF6l6eD51aS/QIHtqAHrSDulDYZw2lp51mh9Mxis9YuFj9WefudNF+Fj90RankzNGLpHZC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744828820; c=relaxed/simple;
	bh=I0EC3INMQjYBg9VGIiLtTG4Lcuu/qjJUk/7T+xVwA2c=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6DedrR3nqkkG+7BZ3DX7s0k+1N8omtLKxHJJm5Y+Ql0lV369taACabPd5l9K9PoJaZ5A4h/ZJyqY/IkbAjxFOgiT9qz55ciWFUHHGiyLemPcBSIoBUOoPfEwdCtMbQURX2GXj2vvQa2Y6u1hDOiSlfeq/IvSa9W37NFQBfAF7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LD1GMJSQ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LD1GMJSQ"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1043327166b.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Apr 2025 11:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744828815; x=1745433615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=LD1GMJSQOrBW+IW3DUebNTOeBoNHlzgNfHC6N+Cy/2/K3acmAfdsvgYhMSVUb2TlVe
         Yk+gUdmx/w/dvO6YltaqRDKqg5FHljjnniE2GorWOmwTLiKVYxj0SVG+NXEpp+JuXkOR
         uOVGcghvdhcGTzCxXN2i0t48Hwwg08Q3ehyBkLhJdfgbzEQzz23z9qTq2NtepnaN7P13
         UpYykxGF+EyY50WwA1Q5Vmf7CoR6Uo8dB7mhZbFjataonD8Bg8fxvMB142n54y6RK5+0
         XTeA/YZbmEfn+3atBwgCnAKmAb7b+veSiNS3H215KE6Yz0R0Nkr+Izd58UCs6N/xNw+3
         fT3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744828815; x=1745433615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hf73Zqm591Z4cwB1QMdZKpjmrpXWTvATJ+WgcmCQVhs=;
        b=Mda4FgbiZKoFG1NUIfZdNkTjQxB8DcB5o8lRlD+YQ5tnIQ6v+4sWUZ/HOYirkGc8Wt
         a0U7J9zyR2Bmxo06iADHuOGDHVThRJLElITr0dJj4x74kpHPKUcggP3w+t4qgPhJneqW
         asyswgf63hvHej0J3nLR0vEvZWtGBvHqlZO9Wtg+QZLK5alrs2Zvfot76faoY9dQ5P1e
         3MJHkQ9R5rotw3cIScszNGMGghQrj/wOa3vvtTw2GI3Q4dH+sOmxvqnt+LrF9bTGJtlO
         6HTKK04U9gF7cYuyCQAn+EZX6uHetWLEZCvX3G4Mg3UZBwfJbLoNVZXRkUrwwRij7UbY
         5SHg==
X-Forwarded-Encrypted: i=1; AJvYcCVugiJaxM1l5Sc4LNpzVr+ZhDUyBjU3ZSJwW1CSwsShjOrgX+ed4H42ev+PfIJqC2WNL6WGCGuc1To=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKwPfT1URjGSiLgjvn4wR4fYloDEiDrC92f9p/gDwe2RWgq7tg
	kRUBluC9V7n9iixg5+3ZFj8QzaJag1UdpX/WQnHFihR5OTc999dCkySotAm1FLQ=
X-Gm-Gg: ASbGncu63ZRQRe5YmRbMWf5H6nREbS7fKRPftpHjenjGQOw5u1qcC7wp/wZrN4OXykZ
	CTHbACzWedFg2O4XGm8H1S7MaaHHY/mMxuB8YrpPggtMgpjgAK2XtNX4QHbwnXrT2xvwA6QOkD/
	9aPpcXRB/zUnWac0R5X1XxKI4cdN6qOqY4hAQ2G5pWMNwTsYk0itjkHrlnD5tq015/db+OmQG1C
	OV8ofLNZ9C8Gs8dwdaq9OGxvrzu6XDqNjYboAmK5Y9DtgaG6qohL1CvcH6QWbAN6oLbg6yxXgaM
	mfjAglwJsrH9haRGVSxmubf6lCiUM7EY2nMfQNDDJ+7byVqZ6ApcoRwMLTOR+UQU/fFgEao=
X-Google-Smtp-Source: AGHT+IHvwwjkQBu7DihmtTvqsvfxr52Defd8zqRFD9EThPH0EkutvTV+muEgyvB55Eg0nTCHnjLeIA==
X-Received: by 2002:a17:906:f5a9:b0:ac2:cf0b:b809 with SMTP id a640c23a62f3a-acb429ed4d2mr324522566b.31.1744828815585;
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d34a5a8sm174672666b.183.2025.04.16.11.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:40:15 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 16 Apr 2025 20:41:37 +0200
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
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v8 11/13] arm64: dts: bcm2712: Add external clock for RP1
 chipset on Rpi5
Message-ID: <Z__54c628WTjznoG@apocalypse>
References: <cover.1742418429.git.andrea.porta@suse.com>
 <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
 <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45c1a50c-2ecd-4201-85e5-9a0e94f06fa3@gmx.net>

Hi Stefan,

On 13:55 Mon 14 Apr     , Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 19.03.25 um 22:52 schrieb Andrea della Porta:
> > The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
> > Add clk_rp1_xosc node to provide that.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> i'm fine with the patch content, but I think this is necessary before
> Patch 9 is applied?

True. Thanks for pointing that out.

Cheers,
Andrea

> > ---
> >   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index fbc56309660f..1850a575e708 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -16,6 +16,13 @@ chosen: chosen {
> >   		stdout-path = "serial10:115200n8";
> >   	};
> > 
> > +	clk_rp1_xosc: clock-50000000 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-output-names = "rp1-xosc";
> > +		clock-frequency = <50000000>;
> > +	};
> > +
> >   	/* Will be filled by the bootloader */
> >   	memory@0 {
> >   		device_type = "memory";
> 
