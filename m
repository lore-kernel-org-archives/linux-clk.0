Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F7B1B392B
	for <linux-clk@vger.kernel.org>; Mon,  2 Jun 2025 07:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748850905; cv=none; b=oW4mHL2eIF1sb/xDsE0bOMFZZ9YEt4Gd/+iNVRSggzFs2gd0/XNnussW7oEsHRhz2dL7NQW3ylysmxl8HeMrsVZMEkjo3Cr6ew0BYgg7L1FKuv40S0+u6pQbr0iI3JOG/wNWLy6bWCD6P0Iwn5gLd18E6sF5ih5/mzQWRlIpeeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748850905; c=relaxed/simple;
	bh=/eCRwbS/rN2ZWoD/Lu11QTQjPmNCmF14z0tboBkD57o=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ty+pa8lo6cE1ArEhrN3dN4LvyZmgF7/vIkfCjIFNB2s3vwGdfcmplEYFr5UNzlvELVnxwJnZAcFo/Tam3zeeH/JGoRTF0lD4rx+krRPcvWUeJ0VZzP56KBBQ6xu6wfQn00x9pcV5XECwgg9YDA2gj56CX5E3pzG6O1iHRoYsAaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f6srqiLX; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f6srqiLX"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-ad8826c05f2so729991866b.3
        for <linux-clk@vger.kernel.org>; Mon, 02 Jun 2025 00:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748850901; x=1749455701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pw+Y5BshWhNb94U5zV1jdIqM6Bb94uu0DoTvWRycrlQ=;
        b=f6srqiLXx14d0irnIUtPbecarGE6GIJGgg+Sjeb2YG6pTW651jNlJAjNPD0k8/qazK
         ALgHY3hrYFazIhoaPxc3L+wF1ZqVfED7HXe2ReRwuwHTFW7IxF+76IM1JuKE4f44OAQr
         8MJn0KRqi3bNebXFSSy4IhmME6eK7BJjHZwqc0Rvch5Q+IBtzAjqr11ZtP5zxDWJZX4K
         l0FeTBS6jj0UJYsXVaLMgonbcr+mjLYs5SQENP8KsPgfKKJYrpMX/XqhwwEP6MHNMKq/
         KtZMhaKiKbWrZIGJaoqI5FifGbEqm5AZwEUn2dbZB4rOqEzuX4Z1/Lu7sQwLbRRWHzR8
         9GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748850901; x=1749455701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pw+Y5BshWhNb94U5zV1jdIqM6Bb94uu0DoTvWRycrlQ=;
        b=vNiKqsHabJ/bkojU9vdp2pSz9EerkSBd0Uli34yG51T9jPQFqpXWDt7qWGBU/KzSem
         4S96zhtWDRHh+kLzCNFbOCmMRk/sIOj9I13TXLrtXCjpbPJDNUdRlMCHW+73xy8AMs6G
         fCmuKhC2uALK70aHu9ppAkK7UpPutCtn3GH0Lu4tOcVzgk/4u366VZW5C8HIiVZ3hUhV
         C7nWUIhbfv9qTRSHEHqVpeCVgPSxqF61AHIY9ItBq1xAyMR38JKzMmy8XGPCCNc9U/fz
         jJzGg5DKpx1qcrN8FL3QArBx6z8EN4rSbtM14skt8SgXzby78sWOar8LTJX9PFAMm9ae
         vRJA==
X-Forwarded-Encrypted: i=1; AJvYcCV/3BCcDHNKci2rD3jT2ZaZtCoxRl20z+La1FqMR75J06ZYqnkQvPclj9C+faNxK/cbNUR6m55Cme8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH7+QKpMa7Qm9quQsfXE+lHaJgg5ZHTAKvtbOxFK6GW7W6fPpg
	982wsMKE40nfuXptrCkNtp4BlyZyjQemM2lr64Khb8MpIB+H4nsHatGyU4wTsje7oe4=
X-Gm-Gg: ASbGnctpl+zSEPhOFA2HD2isPmPxa0a8VN61CXcIuz6V/neKE5YwdUR8Rm/QspJXvNl
	tTbkC2r3LeHBpewx2nI6qFQqRPJA4nmA5YH+Cf1cFP9L+Az67B4BJgleWqsnJXVhz2os3FnUmtd
	c3WLEnTVg1caEY0XWiwUJ0Ig2UClrJnmS4w+zbtFkkhB5+2zE4NkhVMCYRA6ujXYRM8EuKUEJPT
	qSBVPCZP3I9p/bI07tGf4gds/zoXIzp0bqx0MDSlCeVBmr1YX9/5cRqNXsK1NDAftKeBjmfe4k5
	7/ruiOtOnt4H+51A53AoZYVkLdgMRCgrm7ip6M9eCdUTKHTWLACY14SKHT+h7GGrHfr9IDa7z8B
	UeimjtBhBbudkRhpg0ydb4w==
X-Google-Smtp-Source: AGHT+IHF9M9iH6tYPPh5MIhkY3Ci/eDAulcraBxUrXh9olFXnZZZyiItNIM7oMxNMVOCoyclD4K34g==
X-Received: by 2002:a17:907:d8f:b0:ad8:8eb7:1c7a with SMTP id a640c23a62f3a-adb36c0767emr1041585566b.52.1748850900474;
        Mon, 02 Jun 2025 00:55:00 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045bbsm749892766b.118.2025.06.02.00.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 00:55:00 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 2 Jun 2025 09:56:36 +0200
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"derek.kiernan@amd.com" <derek.kiernan@amd.com>,
	"dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aD1ZNAeB4tpMNTGZ@apocalypse>
References: <cover.1748526284.git.andrea.porta@suse.com>
 <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
 <aDholLnKwql-jHm1@apocalypse>
 <7934ae2a-3fc5-4ea2-b79a-ecbe668fd032@app.fastmail.com>
 <0e154ae3-e0ab-4a4e-aa39-999ea1c720ed@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e154ae3-e0ab-4a4e-aa39-999ea1c720ed@broadcom.com>

Hi Florian,

On 16:46 Fri 30 May     , Florian Fainelli wrote:
> On 5/29/25 23:03, Arnd Bergmann wrote:
> > On Thu, May 29, 2025, at 16:00, Andrea della Porta wrote:
> > > Hi Krzysztof,
> > > 
> > > On 15:50 Thu 29 May     , Krzysztof Kozlowski wrote:
> > > > On 29/05/2025 15:50, Andrea della Porta wrote:
> > > > > *** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***
> > > > > 
> > > > Can you slow down please? It's merge window and you keep sending the
> > > > same big patchset third time today.
> > > 
> > > Sorry for that, I was sending it so Florian can pick it up for this
> > > merge window, and I had some trouble with formatting. Hopefully
> > > this was the last one.
> > 
> > That's not how the merge window works, you missed 6.16 long ago:
> > 
> > Florian sent his pull requests for 6.16 in early may, see
> > https://lore.kernel.org/linux-arm-kernel/20250505165810.1948927-1-florian.fainelli@broadcom.com/
> > 
> > and he needed time to test the contents before sending them to me.
> > 
> > If the driver is ready to be merged now, Florian can pick it up
> > after -rc1 is out, and then include it in the 6.17 pull requests
> > so I can include them in the next merge window.
> 
> I have applied all of the patches in the respective branch as we had
> discussed with Andrea and also merged all of the branches into my "next"
> branch so we can give this some proper soak testing. Once 6.16-rc1 is
> available, all those branches (devicetree/next, defconfig-arm64/next,
> drivers/next, etc.) will be rebased against that tag such that the patches
> that are already included will be dropped, and only this patch set plus what
> I have accumulated will be applied on top (if that makes sense).
> 
> As Arnd says though, this is too late for 6.16 so this would be included in
> 6.17. Andrea, thank you very much for your persistence working on this patch
> series, and sorry that the request to merge those patches came in during a
> time where I was away. The good news is that I am not doing that again
> anytime soon.

It was a pleasure, and many thanks for your patience too.

Andrea

> 
> Thank you!
> -- 
> Florian
