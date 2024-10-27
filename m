Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E661566A
	for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 13:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730035602; cv=none; b=pLLs2d3oupw9nI9qyBBQzwcKNE/Mz082wlphmcNzBCsLzahO1guqZxYs0dN3EYU8VNt8oLtVVct7UXc0sO4Y3TyinGX1wClotkkqQtB2WrHKDsrYyTr38mXLgk7q3RvvL3kW6hwxy3epj54WhTk1UPs9ZFyA5Or194kJvkaXDnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730035602; c=relaxed/simple;
	bh=wvx2ME6bKjTIAPbcU/DAQDlfa8UXrdBQj2biPzzxyl4=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nGcpoz2538tpRk4m1rWdCK6a/gbiPbo1HW20gcvY9pRIkb114Pk8IvAwNS0gg+wccnA+8/vY9SAF7Jw0kUeyyBd3GgJdFb34gKzSoeVye9Sp96mOQ3EJzYZV74n99Inm9mcIs0k+a+XHG9BNskOKK6HRn8a4lrKZFwPAnkd8UtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=aOaB/FGV; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="aOaB/FGV"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-a9aa8895facso557135266b.2
        for <linux-clk@vger.kernel.org>; Sun, 27 Oct 2024 06:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730035597; x=1730640397; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hkayB6WnSxJs4BKoPWSzkYu8BfwRMxQ9y2LaJgKG6IY=;
        b=aOaB/FGVmkeQ3akQyb4N6EOp9dm4Tzj74BHV+5/08ZTKaimYPxNCgSjO44YOh7H0P3
         UVmLL1BVzbRjYFBqgqqsKAPma4mBh2DLDYBgy1bmgTyN1XCBJhh1RXURqlVmv4fbdkNv
         2RygW9l1+JISERGMtDMoIOOVeMrx/4dKIcZcC3GxxC9V2Uot9FQfly3YLJNapwLThYzY
         m3inBww0G7HSHyCO8x4VuvYTv8/42H1vSM4FhVi4Clwx4rxtnF2XKQXto245kl2HyfKG
         FYqjAMyWzbajNhj6RIlQiqTnPhSZl1kfnEQaHqm9b2/YtI4m+G8C1LIpjbqX9s6h2EWc
         eoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730035597; x=1730640397;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hkayB6WnSxJs4BKoPWSzkYu8BfwRMxQ9y2LaJgKG6IY=;
        b=NuisV82Vmrco+17FtF6I1BmXI/sEPnK9DGdPrzl32QeJKYLfmLDWpGBjUohZ849NN6
         +HbmcyLP1ONgMklyeoJMVxvyX8tXW0I42T2vwyQvnLukaJVdsLKaSrm5g22qSx+rJYul
         66WVJF/ggwuqVdxpc3UfGxCSmFqJ/6i+NuT8nE+fs40QqReYIBoDFvaLaghFmgZKW1wa
         FrPce/Yf6FXzpJBeoyKsjePPWcgmQgBqevVgthE8Gzp/FfhLwKyWsOaZca+7dV04NGqf
         uljy0U+jt6W6M+m6SSLxMMm/5diyjHJgWQHsrHlTK7rvt914sWO1jemdEbQFXYBrw1fS
         8Jgw==
X-Forwarded-Encrypted: i=1; AJvYcCVO0Fm/DgcmdNsIbRlqnIqyA7r5l+ItLi5Dyl+v6NVZ9cq0K4+BGU8uF4Gy7RCDMNiiDkeWJjynqjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyI8eleythX+KumH2DskyzWkpv6+/1MY19brJwyROLlFpNEM1eK
	3HhvwLSYax+BLqy1ogsM8XBM0ndoZKTgR69AhvHycY+u4WbzO33nLKUFc8vl29I=
X-Google-Smtp-Source: AGHT+IGODKCkNnm13dGswFX5M8oMKsn4zXbFtPFHoQf1TvOwmbqjg60TYzbmHIVU8ekajFjlSp52dQ==
X-Received: by 2002:a17:907:94d0:b0:a9a:634:dd2 with SMTP id a640c23a62f3a-a9de61ceb81mr470840366b.43.1730035597406;
        Sun, 27 Oct 2024 06:26:37 -0700 (PDT)
Received: from localhost (host-79-35-211-193.retail.telecomitalia.it. [79.35.211.193])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb62c3646sm2364100a12.47.2024.10.27.06.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 06:26:36 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Sun, 27 Oct 2024 14:26:59 +0100
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
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
Subject: Re: [PATCH v2 10/14] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
Message-ID: <Zx4_o34Iyqb5mh_l@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <3f6f38c06b065f5f6034ad4ed3a24902ee59f378.1728300190.git.andrea.porta@suse.com>
 <20241007165740.14d372f5@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241007165740.14d372f5@bootlin.com>

Hi Herve,

On 16:57 Mon 07 Oct     , Herve Codina wrote:
> Hi Andrea,
> 
> On Mon,  7 Oct 2024 14:39:53 +0200
> Andrea della Porta <andrea.porta@suse.com> wrote:
> 
> > RaspberryPi RP1 is a multi function PCI endpoint device that
> > exposes several subperipherals via PCI BAR.
> > Add a dtb overlay that will be compiled into a binary blob
> > and linked in the RP1 driver.
> > This overlay offers just minimal support to represent the
> > RP1 device itself, the sub-peripherals will be added by
> > future patches.
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> 
> ...
> > +/ {
> > +	fragment@0 {
> > +		target-path="";
> > +		__overlay__ {
> > +			compatible = "pci1de4,1";
> 
> The compatible is not needed here. Indeed, it will be added by the PCI core
> when it scans the bus and adds the missing nodes.
>   https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/pci/of_property.c#L383

Sure, but I've added it so that the dts could be validated.

> 
> > +			#address-cells = <3>;
> > +			#size-cells = <2>;
> > +
> > +			pci_ep_bus: pci-ep-bus@1 {
> > +				compatible = "simple-bus";
> > +				ranges = <0xc0 0x40000000
> > +					  0x01 0x00 0x00000000
> > +					  0x00 0x00400000>;
> > +				dma-ranges = <0x10 0x00000000
> > +					      0x43000000 0x10 0x00000000
> > +					      0x10 0x00000000>;
> > +				#address-cells = <2>;
> > +				#size-cells = <2>;
> > +				interrupt-controller;
> > +				interrupt-parent = <&pci_ep_bus>;
> > +				#interrupt-cells = <2>;
> 
> Not sure this node should be an interrupt controller.
> The interrupt controller is the PCI device itself (i.e.the node
> where the overlay is applied).

Right.

Many thanks,
Andrea

> 
> Best regards,
> Hervé
> 
