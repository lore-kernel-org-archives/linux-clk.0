Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1A8225A4F
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 13:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748525313; cv=none; b=dMyT8nL2AYv8MvqclEfg5sFtxq2czIWEWq+jBzdZMSNE2dB7jiYYFBTMQSAH9c37Ay9vqmhCmxfunor4HagpPjX2PM6z0gWpocj05i8G5nHzjCdmck2hc531iAUuV08ZJ0F7FXwbs63HPslWWUbOfXdNthKu9Osk0M0VOZVJ5os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748525313; c=relaxed/simple;
	bh=dxaIdhwkxrcOH7PEuve5FxQGB0PHBCUqWE1E/dvQymc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SajptpRATuMcOGC/Kb0IwU2Jz9LN3WrwWeomMCAzUlGZ5HFjy4Idwk43dGl9q5c2CjdCvQIZpajcv9DqQyGnpZYTEx0nnUK7fBU/7SD35HJE+K6KfLeH6A6Efs1l+dMRUtSF3m3knr1OSTQVuLrA2eC8ZD8ngfre4Dv0xIz8iuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A3v8zUXn; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A3v8zUXn"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-6049431b0e9so1402320a12.0
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 06:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748525310; x=1749130110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=A3v8zUXnzauQLe9ygE6mTbuXx1BUCCXTZaNjNvsVuhlJM4xdoOkcJZVNMEHC21WEDR
         oMYMuh6MVkOPh3tuPnDWs1noaLEPe2ioTEJQXn8E1p9L6RasaWKK9QHPk/ln0EOk09fN
         VEx08SFJHeYBdvO6QuKBXlyJjwNfITKmr6qnoyTsioaxGdxDwrFLHXfumzowGdqWBusE
         7oBr8AhYUM8JSI3APz2CfNeUkn2LfQyQWloaj7yEPiqWTooDA62nUc0Fr0ue6wnz1PoK
         GCoULDD35NKBw87W4rVdP8ZADod79bcKFVf9+VFckjV5RhFS/xJKOon8BlGh7AWeBprf
         m1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525310; x=1749130110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kiFDdDACgorTtuRk6Gy6UOaoSPvn2tyJrIu3RsE3v0=;
        b=s1m/UhPDy8ZUXwbzUGkpkoqLIEJwwlvbIlzmSxa28X+clZUVwO6ft0PnzGxi2ufEzx
         qOI0pTkv+b1Ivu0ukS5Gexr7LVpgjbDVIaU0I8ES+hReaDVWWLmkHK45jise/wQSAFmP
         VpDIfTLTyKsd7SgyIr/rqBkranchZ5fuGFyHi1E+C0mDSyNnIWQ7fGzPA++pKIfg9nWq
         zxx8in3cE2qDJFsnKCi07YlS/WBChFkBDsAOMaTNizh2ZL5ybryAMdvicI6sWdCNAMeU
         Np38+58j1o+NZXIQSUiN3xoxzqEPFrNk0xRle1uCSNVSi6OzIA81iMZna40663oHYFUK
         b69A==
X-Forwarded-Encrypted: i=1; AJvYcCX2884wJVqt+NMrvsDCJ2EfvUmLG8gSvpQdBVV8WtQCPsafQsNiW37LiwnLfl410FoyVC1y3NrhpU0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqGV/JHc4QssjbvYocsdOyf7h/B8KsK2vMzwb2lfDXyyy0vuBf
	48y0KyiSjP30MJGmFIs6B+rihv8hHno7r/8ajBpBO2PAa3SsX2ve9kIDvV1/VqfdL/c=
X-Gm-Gg: ASbGncuWd4ilpxcKSuosg5+QaC4LsLSn0MIH+9v0boOvYadgpE+1voDvKycfIItCgVr
	WkeKzx/yYrE+mp50rgdr7/AaDI0CPFDdOIhPekUB1npV1ywNMFkDp41CrFNsfWLCt0YFcpiVHk+
	Z1Ngw/nSiPAo2JeH+IElc+pa2s+VPzUnL/kjWiGr1tb8oUl/5JMnG3YwlLUaOY4GbSM8TeBl4lh
	+xerVstwXfBZTx3xR4T+Mlym5X32XPKwHyQ9vnOAfPwu8EEz4c90rqraTf+0Z3XgqoL3Kpv2QYV
	lrlkqTIY9GnF0NGk14qrMo6AnAclCHSTs5O5JgInUKhmvNiguYMZS8L7/sto5WZ3mNkauXONr7r
	xWgm7KP/7+zCnaAB3ybDy1yWUGSr0gaE9
X-Google-Smtp-Source: AGHT+IHK4Y7PatnxnQUlnLwZj15PpOrDfyPqPLYipWAui/kq0fXHKQv8bz76vrMm7M/L8eA7f812UQ==
X-Received: by 2002:a05:6402:27c6:b0:5fc:954e:bd4f with SMTP id 4fb4d7f45d1cf-602d906bc1amr16501831a12.8.1748525309931;
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5d9587sm2364236a12.15.2025.05.29.06.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:28:29 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 15:30:04 +0200
To: Matthias Brugger <mbrugger@suse.com>
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
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com
Subject: Re: [PATCH v11 07/13] misc: rp1: RaspberryPi RP1 misc driver
Message-ID: <aDhhXF_MNn34Bu2N@apocalypse>
References: <cover.1748522349.git.andrea.porta@suse.com>
 <20250529124412.26311-2-andrea.porta@suse.com>
 <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdd3fe2f-28eb-4c85-99b2-7220cb15b9bc@suse.com>

Hi Matthias,

On 15:24 Thu 29 May     , Matthias Brugger wrote:
> 
> 
> On 29/05/2025 14:43, Andrea della Porta wrote:
> > The RaspberryPi RP1 is a PCI multi function device containing
> > peripherals ranging from Ethernet to USB controller, I2C, SPI
> > and others.
> > 
> > Implement a bare minimum driver to operate the RP1, leveraging
> > actual OF based driver implementations for the on-board peripherals
> > by loading a devicetree overlay during driver probe if the RP1
> > node is not already present in the DT.
> > 
> > The peripherals are accessed by mapping MMIO registers starting
> > from PCI BAR1 region.
> > 
> > With the overlay approach we can achieve more generic and agnostic
> > approach to managing this chipset, being that it is a PCI endpoint
> > and could possibly be reused in other hw implementations. The
> > presented approach is also used by Bootlin's Microchip LAN966x
> > patchset (see link) as well, for a similar chipset.
> > In this case, the inclusion tree for the DT overlay is as follow
> > (the arrow points to the includer):
> > 
> >   rp1-pci.dtso <---- rp1-common.dtsi
> > 
> > On the other hand, to ensure compatibility with downstream, this
> > driver can also work with a DT already comprising the RP1 node, so
> > the dynamically loaded overlay will not be used if the DT is already
> > fully defined.
> > 
> > The reason why this driver is contained in drivers/misc has
> > been paved by Bootlin's LAN966X driver, which first used the
> > overlay approach to implement non discoverable peripherals behind a
> > PCI bus. For RP1, the same arguments apply: it's not used as an SoC
> > since the driver code is not running on-chip and is not like an MFD
> > since it does not really need all the MFD infrastructure (shared regs,
> > etc.). So, for this particular use, misc has been proposed and deemed
> > as a good choice. For further details about that please check the links.
> > 
> > This driver is heavily based on downstream code from RaspberryPi
> > Foundation, and the original author is Phil Elwell.
> > 
> > Link: https://datasheets.raspberrypi.com/rp1/rp1-peripherals.pdf
> > Link: https://lore.kernel.org/all/20240612140208.GC1504919@google.com/
> > Link: https://lore.kernel.org/all/83f7fa09-d0e6-4f36-a27d-cee08979be2a@app.fastmail.com/
> > Link: https://lore.kernel.org/all/2024081356-mutable-everyday-6f9d@gregkh/
> > Link: https://lore.kernel.org/all/20240808154658.247873-1-herve.codina@bootlin.com/
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > Acked-by: Bjorn Helgaas <bhelgaas@google.com>   # quirks.c, pci_ids.h
> 
> What changed in this patch so that you didn't include the Acked-by from Greg
> [1], or is this an oversight?

Nothing really, just an oversight. Thanks for spotting that out. I will resend V12
with it as I also notice that are some inconsistencies with mail Message-id, as a
result of subseqeunt invokation of git-format-patch from different branch.

Thanks,
Andrea

> 
> Regards,
> Matthias
> 
> [1] https://lore.kernel.org/linux-arm-kernel/2025042551-agency-boozy-dc3b@gregkh/
> 
