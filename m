Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA130262D0B
	for <linux-clk@vger.kernel.org>; Thu,  8 May 2025 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746693493; cv=none; b=UNuLkr8FRdEgMYVSvWi75kcCrCx+6PcgrE5MwJreRL+fRq1BIbR7WbMFzTEHksy3nOOmyyYRxaTdTlpqUjpdzr8gvfbf2EsDENtt92MAsKSxVBBcRQvuMO+J8KUgDpQ5b8Y6awyhfaGdPZVblHvNzdSWedhTGKjeCndBeCNJmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746693493; c=relaxed/simple;
	bh=a2qUKyHbD7wFrfHoQBkc3lrz78v9ti8SashhJopPeDk=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYdTdXvPlfA4hruYHA2f/GckvJcb4Ahp84yRO7bg2DO41GBmGpQzB83KvGZcAIN8Wi1Zr7oJVzRJ6KwV07lq8U4OTgs9GXK0kvEljvrxYVPMWCpDsls5KbL27/HNl3pbz/62YtsVIEyKVLpDcLN0JcHxghCSco3v7bBNWmWHIHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dERj47/e; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dERj47/e"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac29fd22163so119693266b.3
        for <linux-clk@vger.kernel.org>; Thu, 08 May 2025 01:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1746693490; x=1747298290; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TN5BLghxBo/9cI/M/eSHpoxUXcqkl+83toZkzInNZmw=;
        b=dERj47/eNtz5wa+JqEixrFHavwf/WQ3VS0m2xznrZvc+dNPjZtiidmwrXDMnDviH8p
         aUcZQ23WuzdOBsvRKBLApTJaeLHZddHq9c5Ltu+hQ/AhZVyDwgnbtVGdwOREvznqmFMH
         0gPr+iVlfNozzeZrl7BY+EmMP23nwosnn3E83oIZGkYmLhjCyw2B433AnWykzDtSC50P
         sRnAKeWvo1uwiZTv5ijTqUQmUK+X+/FeoIkv3tETo6mu9WQCqtFlGuEcMHAGUq8Fwwtg
         n1nHJZg9BxOJ4w2AOScTuVHvpMLXOK487GmRHGW3t0rpn96pNXjLu4ePtUv2wdsw/hsb
         WiZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693490; x=1747298290;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TN5BLghxBo/9cI/M/eSHpoxUXcqkl+83toZkzInNZmw=;
        b=VZ5fklIXvY2x/8Py8dEW/JvS3AqHzZTiJl9L6bxqYdiMKXYj///UU5XQ0otlsIXGow
         YO8/W8ZiyP0A/jgGOca3DfBCeIerI4VVudIGhBrb+Es7JkzJo8qfSMWYhjKXmaKHTcTd
         qZric1nWiyd/9LXotmeiVyV8225yEt6fKCNnUPXc//vRak0gHGcL+AgOOzK1SoFiK6o7
         3aIjOOxZdpQNE5dLnVUI9bZqHNy8c/R/7BpyDRFqB6rKdSPD1piJVD0Ts8nIZSDheaLO
         Dmor8+tC1mUbn2hbbiATWsN5ME9AekxafRQw/UgmMHP0CsMqpuipd3GdlEk9WoQ5c+0u
         ZPHA==
X-Forwarded-Encrypted: i=1; AJvYcCXaUwFrzI4UcYFZ4bpN2gmSKWXldudrs8yZtk72Vmp+M0jIt9PjWJ9uS5TLcZHJLK7/sZ3/a4PkkYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlc0NFWcDAxiAMXkOuunftMyk970OmZu9d2nM+QjPx40SXTtvr
	uitQ9j68V7xdHzPnhGTEgg57ktncPPQvHKbNQSLoNPSF3HbxNbTRoeDntKrlv1E=
X-Gm-Gg: ASbGncscZe6aL36y5+QwjAGUpVYNlbJ/m2XOcJy7pHOCz7Vn+rbsOodGjaHfBtrUOV0
	HExrJM6k0GpOUzLfzhqwE6FF1lO250F6WLyYa94geUbjd+BbvBixek//9/X3BnCggZG4NqgKpOA
	yv1y75Bt3VS4jioJECNkGvBJaSRve+dPTQpAl6ExB/y4mPPLNRSQeHMf9UT5DTeF1W8kJuhCK8l
	uemMm2RWXupBp2diY/6TtKu/5j5IF4tlFaf8+88t0zKR8cg4CKA0iG84I5gt1zcStMAbWrEgCQj
	CczDK4QGH83DsLNXtDH50b3qN0x72xhqzWARcSYBvKqJhT08fzOZcF1CU4u+eZqpqVdl/zBcmfF
	FEcwNUA==
X-Google-Smtp-Source: AGHT+IFAz0hpCdqZar4HwvS30xYrKUVB/5CH1AYDISg2ZQz4Cx3c/u+PhQRq6xHbtI2Pon4FDK1RKg==
X-Received: by 2002:a17:907:d7cb:b0:ac3:48e4:f8bb with SMTP id a640c23a62f3a-ad1fe947a69mr204692566b.41.1746693489868;
        Thu, 08 May 2025 01:38:09 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3f0fsm1059881366b.58.2025.05.08.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 01:38:09 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 8 May 2025 10:39:38 +0200
To: Stephen Boyd <sboyd@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v9 -next 04/12] clk: rp1: Add support for clocks provided
 by RP1
Message-ID: <aBxtyvI3LUaM3P00@apocalypse>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <e8a9c2cd6b4b2af8038048cda179ebbf70891ba7.1745347417.git.andrea.porta@suse.com>
 <aBprHfQ7Afx1cxPe@apocalypse>
 <8513c30f597f757a199e4f9a565b0bf5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8513c30f597f757a199e4f9a565b0bf5@kernel.org>

Hi Stephen,

On 12:44 Wed 07 May     , Stephen Boyd wrote:
> Quoting Andrea della Porta (2025-05-06 13:03:41)
> > Hi Stephen,
> > 
> > On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
> > > RaspberryPi RP1 is an MFD providing, among other peripherals, several
> > > clock generators and PLLs that drives the sub-peripherals.
> > > Add the driver to support the clock providers.
> > 
> > Since subsequent patches in the set depends on this one and as the next
> > merge window is approaching, assuming there are no blockers can I kindly ask
> > if you can merge it on your tree for the upcoming pull request?
> > 
> > This patch should apply cleanly to your clk-next branch except for some fuzz
> > lines on MAINTAINERS. Please let me know if you want me to adjust it.
> > 
> 
> I need to take the dt-binding header as well so it compiles. What's the
> plan there? Do you want me to provide a branch with the clk driver and
> binding header? Or do you want to send a PR to clk tree with the clk
> driver and the binding header and then base your DTS patches on the
> binding header and send that to the soc maintainers? I'm also happy to
> give a Reviewed-by tag if that works for you and then you can just take
> it through the soc tree.

Any of those would work for me, but I agree with you, we need a plan
because this patchset is crossing the border of several subsystems, and
as such there's also other dependencies between patches that will inevitably
led to conflicts.
The only decoupled pacthes are the pinctrl driver and its bindings, which 
I guess could be taken by Linus Walleij, but all others have dependencies
on either the bindings (clk driver) or dts (misc driver which embeds the
dt overlay, and should be taken by Greg).

So if Florian is willing to take the bindings and since it's already 
taking many of the patches, it could be reasonable if he takes the
entire patchset.

I guess the final decision is up to Florian. Whatever you choose, I'll
adjust the patches accordingly but be warned that there will be some
(minor) conflicts down the merge path: one being the fact that linux-next
bcm2712-rpi-5-b.dts has pcie nodes while Florian's devicetree/next has not.
I'll do my best to help fixing those.

Many thanks,
Andrea

- 
