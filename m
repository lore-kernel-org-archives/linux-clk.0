Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB59203719
	for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 17:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739469472; cv=none; b=Xc2GkWrxq7P3/zQxJG/3F4Ktr8VsBtOx5/Ctsvy5NI45DChbzYW4gmTXLy4RKv07FaZll3Tn0B4oYACRPwSGvyvultuiKVSOETosd5lrDKgik8kKjW4JRV1QN1hHbR7jXx9l2gIc3HYjpHQREFIuxWlOcXiKa13HwW4UHcYNigI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739469472; c=relaxed/simple;
	bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mqMMXh8+VRrktRGrDnGIxw7PMj8A4IKoiVGxXdc5+jZDJthgc6UCHuw3FnkJ+e+3z0Xml/KYPK4fe80owWNvTstLlPJOMlIrgWcR7pRFCcMvpk0h419NG9cvFi86XFzo6/NBZaSJU9eJB2PZ1KsxIPlA3jFAtrsGOg8PSaEU9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=DCdtDMF5; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="DCdtDMF5"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7430e27b2so234033666b.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Feb 2025 09:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1739469469; x=1740074269; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
        b=DCdtDMF5xCu6D99J8ipr2xNNMloOw+nxwbV7J0RxdRxacuH4MLAcWkzqtpIHvJYCsM
         KGY4uK5XpYAuDtgVd4Ss3RTctRp88G8zCecrUOV27ugzkMoH7212U2Rs+kcEbKuKRNsC
         +jX9HQbSahUZr3i8BcpOM4+R0eJzFvitJafrZFsHdXPaXbYmguyaG/uPo64CMcfSYKAs
         7klaC8saAfUGmAB3+4njsEQkayE/iCvnAOWqyl/7R3VHT4+UWu8hUK0tJo/izRYCY52A
         rVD6D6AGDYBB5GYW+BeM0dZ2MHE3K/nTA9ZOG0U/bHhHZalhV6dmmVuojwom3Xybtn/4
         Wdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739469469; x=1740074269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uxe/sPCuvuszkG09tatgP/sxrgyFyklm5riZrTlzQJA=;
        b=oaz4GuUsEzhNhQ8mLYtxSV7MW4dWfCaCBtds0nKYrrRAX2oJYBVHp7bE+yamDpMmgJ
         XH7Y9JOEt/C+0wY0Xd31EDpavfNrfRkClxXNgRumVPS+Hz/gLYm8wQsFZsHZ9ekijVuT
         b54URwbXcqoetFdLXO32OKABRyzsFifVa9Qxc/TGx0Y3ExHnGnCBfduJFqcxquoEBUZ7
         qpHKVXMaohwxfyqVCRAV3K2RtBwZZFfQiKkC7Aq/GCCgI/Qj008ucU+Fzc6h23AJQEkB
         HucX35TUpkjYDVkmz+uP2SBVgFhExC19KHm0VimJbgB+rxMtb+BbpWk9TL/36y3ddaeg
         cz/A==
X-Forwarded-Encrypted: i=1; AJvYcCWNbCvPg9PgZG+oW6IIXUuJMzLMHcpMofao07qeSR+qFtuw5QEOb6b4d0faVVAN/lTpEcAZQy4o4Xw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mjgo1b63Nd2J4GRfyNfsPo5aVFwiISS4An6ebHdUDl3wC739
	4d88wtFJFwEtoDnEYaSUZb72LE3qZrafqGUi9dYl/f+jSXpMPySs5VN94G5oue5Y+ouT/ibEoc/
	Csrfy9BIRkwUKhfccwuCAhxA0uiLqbTdp+tFI2Q==
X-Gm-Gg: ASbGncuw8T9iL38El9RJ20pdTqajosp2/9zsr4grpn4pLnLoh3VzLr71J6avWOl3iWq
	Q4xss3V1xMjDPEgin9FExpDUyub49SDFfOrtGvspeuaClbSXVVL7XfZMeS3klUMuHsXiw8g5uHo
	CaGg8Tzg72KEUnuqUeuwUSEYmEecnS
X-Google-Smtp-Source: AGHT+IEK78m51sGJDd3X7obouAmtice1DYZhDC7vdVZTdA3vPC4baSC0McAYMZqXZ2JdRz2CuZ0fh5G5y4aENoDxPdM=
X-Received: by 2002:a17:907:971a:b0:ab9:63bf:8105 with SMTP id
 a640c23a62f3a-ab963bf8270mr490444566b.1.1739469468776; Thu, 13 Feb 2025
 09:57:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMEGJJ3=W8_R0xBvm8r+Q7iExZx8xPBHEWWGAT9ngpGWDSKCaQ@mail.gmail.com>
 <20250213171435.1c2ce376@bootlin.com> <a3c5103c-829a-4301-ba53-6ef9bd1e74e7@lunn.ch>
 <CAMEGJJ3-JXhin_Ht76EqUNAwLiNisa9PrCrdUzCgj=msGZfb5A@mail.gmail.com> <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
In-Reply-To: <821d4c74-09b0-4c1b-b8ef-f8c08d0f6b5b@lunn.ch>
From: Phil Elwell <phil@raspberrypi.com>
Date: Thu, 13 Feb 2025 17:57:37 +0000
X-Gm-Features: AWEUYZnQGb_LTFgRMGvR2NkevZWJdZdjShSWV1aYMFwhkUzlH95FjIU8_Kkz2O0
Message-ID: <CAMEGJJ0QbzCScfTRA_pw_8A=iMYMAAFs69zFNLwcOxF5Syugpw@mail.gmail.com>
Subject: Re: [PATCH v6 00/10] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Andrew Lunn <andrew@lunn.ch>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrea della Porta <andrea.porta@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, 
	"maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" <bcm-kernel-feedback-list@broadcom.com>, bhelgaas@google.com, brgl@bgdev.pl, 
	Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, derek.kiernan@amd.com, 
	devicetree@vger.kernel.org, dragan.cvetic@amd.com, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, krzk+dt@kernel.org, kw@linux.com, 
	Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	"open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS" <linux-pci@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, lpieralisi@kernel.org, 
	luca.ceresoli@bootlin.com, manivannan.sadhasivam@linaro.org, 
	masahiroy@kernel.org, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, saravanak@google.com, Stephen Boyd <sboyd@kernel.org>, 
	thomas.petazzoni@bootlin.com, Stefan Wahren <wahrenst@gmx.net>, 
	Will Deacon <will@kernel.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Feb 2025 at 17:45, Andrew Lunn <andrew@lunn.ch> wrote:
>
> > > Or do you mean a custom board, which has a CPU, RP1 and the button and
> > > fan are directly on this custom board? You then want a board DTS which
> > > includes all these pieces?
> >
> > That depends on whether you count the Raspberry Pi 5 as a custom board.
>
> So you mean the Pi 5 board would itself make use of the resources the
> RP1 device has? They are not simply connected to headers for plugin
> boards, but used by the main board? Hence you want to describe them in
> the board .DTS file.

That's correct. But even for plug-in devices, those which are on
non-discoverable buses need overlays to declare them, which causes a
problem when the overlay application happens before the kernel is
started.

Phil
