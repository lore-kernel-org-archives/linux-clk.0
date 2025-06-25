Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A17288C89
	for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 08:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841130; cv=none; b=m0ph2m8oTPk4JLhOt+CL5U6MILKqO+uTM879ZMFjoRdRzP7daiK62Z2hVFfPM8dQ1PB7onpCpc4c6WKmLWe7PvTc4UpnQnX8rkyn07AMfrHtVrUOjP3mzSJqki9zqd1rIHHJlgyjx/BLsfjP/8eG/sebawpMc5DqFb33F7zg24Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841130; c=relaxed/simple;
	bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YEOhe8YQ1M3cipBqkWoGo6c3CvPWSJQAGZmvtJOX/S2qecMzp+qXisw5F7s5gb4t+B8HA4LzS4mkhVaVUYFH0BfOacpoBv+ka52bEEi1j3N2VOA4HVlAqO4FafFNnvatbqu+poRIoRsyqOhpVaVF34Gjb702G4t7/2A+h6P685E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwbAQ1Cr; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwbAQ1Cr"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a071so75829311fa.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Jun 2025 01:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750841127; x=1751445927; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
        b=LwbAQ1Cr3YZihFgPa5aK9bUmn44ivPfF5qkBM8w6l/uw+BGgxyzRFFDannqOEjx/gX
         aEAc1T+yPBUSAdiG2JCq0B6E0+1sWJekOFyCwpg4qbTAMUc5iTIsqyNbO4ifOIZrBXBf
         GRtlQKXAPk2dxGqlv7WDWt/42F/TdnxWe/05eLVL4iDJ7iW5/AbCaQyl/qgqOWSoW+QI
         cQptVJGDMMS7hXIK9qUicyEmM0RVLlilpu4h3tSBTy94ehG8IysLPlyXksaUyD1QFIih
         DYyoiOQI6Vfwr3R4As1c0LSjYYvso/oycxykAAg4S98+/RyfAfEzPdDE2SVE89IJNrnP
         9KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841127; x=1751445927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CWyVOg1ySsSGm3tCccXgrCtfZcjTGRY536tD9B4aXc=;
        b=e5U1Expi1I1m8aBB8Bo5IsXyNOj9cdY9L4CIu8OyIdasJYxI3Ay2252onOW6FENV8w
         4N9V9vuMFxpr0cCucCy8JdgVKAScBUPRGI8bJeaSwZxP8lwpuQ230WFZsvibGTSY7SsF
         sMZdJCjnNYREF8zoaECbj9/2TbUK5pBA0Ty5rqqo6O7Gl7x0WL+PCwUiICPxjYvCoQai
         l9KgV49HcPfPTP0p71iNAcJJbY5s1Clmzam9hBE/kjQdCSr4AKrwpdx4Gn+rnN3xY3Bf
         SY6gSPMbjvv0x/fntrsXAqylsyNlvVIJIfmiMuQjotOLHSrv/TMDWTBWY00KcxTMYe7p
         k2vQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZ3C7yqK1clkuo74u67cZ+lXu8kLO39Tcun6hMxWezSg0KckvmqUKra7do6FwJgFj1LgTn5k+/BL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9pJyVRGeICz1Qo1ssV7YNLZ9e7ez2a7qh7RnbHYOLo+qwRc/9
	AdCfcfrU21BhcHPRZWGudYeN4q5QSal6Ob3GlyXFXLxtE/FyoYpKosltc3YFjPpqM4TdIwQv7mr
	vDWFSqcceDiQwhy3lDNbP/huwW2I9rhiKDZ2qdZLq3g==
X-Gm-Gg: ASbGnct9g5KoXdjrtPtrRt4T6w25AIr2S6+9pTWYcm49rs3zGR5A3V0xVEtzQinvgyG
	WXxJaD777htq9eelm8lb67xbWLDLl1MmsUbQFWoOECiGT8VrWvZMHHljgBi0LPmi3+eFxykS/hG
	QNNCeZ1qYsTtprEDgVw3X9CrcclZF8980cACmnhXkWuQ8=
X-Google-Smtp-Source: AGHT+IE+JyenPgPvT+Svvv9s+V0VraZ6su8hbOajVsCqvqbMTxCrk4fBzjbCyvVMQ0l2eId9Zjx6ak0ozUYWm+PwBYY=
X-Received: by 2002:a05:651c:4201:b0:32b:533a:ef76 with SMTP id
 38308e7fff4ca-32cc6490c2cmr5605931fa.13.1750841127084; Wed, 25 Jun 2025
 01:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8c282b89b1aa8b9e3c00f6bd3980332c47d82df7.1750778806.git.andrea.porta@suse.com>
 <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
In-Reply-To: <9d31a4d7-ffd1-48ca-8df6-0ddc6683a49c@broadcom.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 25 Jun 2025 10:45:15 +0200
X-Gm-Features: AX0GCFs5reLO3eAptejwJU5aIb8qpce34Nq1CQTt9TXYf2HTB17zcNXvrt_8Yc4
Message-ID: <CACRpkdbAxyZK_f8y6mzX_eJ3UM5ZtuXEpSmXE+QpUXaHKw_NGg@mail.gmail.com>
Subject: Re: [PATCH stblinux/next] pinctrl: rp1: Implement RaspberryPi RP1
 pinmux/pinconf support
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrea della Porta <andrea.porta@suse.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczynski <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Derek Kiernan <derek.kiernan@amd.com>, 
	Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Saravana Kannan <saravanak@google.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Herve Codina <herve.codina@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Phil Elwell <phil@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 11:11=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
> On 6/24/25 08:36, Andrea della Porta wrote:
> > The current implementation for the pin controller peripheral
> > on the RP1 chipset supports gpio functionality and just the
> > basic configuration of pin hw capabilities.
> >
> > Add support for selecting the pin alternate function (pinmux)
> > and full configuration of the pin (pinconf).
> >
> > Related pins are also gathered into groups.
> >
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>
> Linus, can I get an ack or reviewed by tag from you and take that in the
> next few days to go with the Broadcom ARM SoC pull requests? Thanks!

I was just very confused by the "stblinux/next" thing in the
subject ... what is that even. I thought the patch was for some
outoftree stuff.

But go ahead!
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
