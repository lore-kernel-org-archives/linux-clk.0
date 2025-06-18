Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7373280334
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 09:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750239941; cv=none; b=CO+R7phejs1t2nx2G0MqXHqR1N9gx/qWXnHr8t3dGlRZpLY7tQpy9DwHD9q30dWO3uqcfEal2YSAxMMZsFhLnLUD/SG+HB+HBYiP+SGT4sPxy6y2u0hvAuRHValMkD4mJhlP6Covvtp2zWt918ikegvqM1arK1hf/M39Oeb7mOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750239941; c=relaxed/simple;
	bh=iAjLoMsszcwu/0Vb0KghUOteF+dXhpPUULmxrg+YQxU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VRychlL6/eXR962p8keFoINU+QO+6QoeEURopqVbzKofD24ArDQb07Rx/j6g4ERSRC3/X6OYuj1PIYG4BVYqVVl9OBlxV69j88/uRV+40N2YP6cDkUyFxNvcYDcRIZgVTcuCt6ngYhbWCSR/yzEiv+4DhevplTjcWHzMRGCFVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Qupafl0c; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Qupafl0c"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ade76b8356cso1342924866b.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750239938; x=1750844738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UYnRFTZ45S0BZCYHJEL9/estxYeR2eD0JqS9fCRB9Zg=;
        b=Qupafl0c5CMMKlHN7UvUZrt/02ySqRGQpRAnC5qKjbRYjkqTLAMniB2gGJwOWDcYYA
         RAG4LIIOepVqdNxJJ5QtX5Zizs/sZ4ef7KQzgDot1F3FYYZIGWR70raM5X/d855K4Ile
         QtSHCO85ZvwhZSvehGiplrMrkwezuYMQvYC0cd+xheUti/NVFcQnVXSI/J45jPYicrga
         zVoEcyLbUiokXNk0wmuI+3eoa16RUoBfy8jg0hmuGJSVtOeGtRIbelVF4hyTgjgi+Ixa
         dnM7scfcH9aph4NEjaaonb4apI8T/MgDa9qmaIsEOplGxlEO/JaQFJSPIiRDAY+ZR0s1
         IDPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750239938; x=1750844738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UYnRFTZ45S0BZCYHJEL9/estxYeR2eD0JqS9fCRB9Zg=;
        b=m6EHHFC0wDxdSzD5TIHmqBJQf2fODeqNUCPtgIiYfOIes4iykpO5d0t/y8HHCtINjE
         meIG7NnripkYSq9BTRojJlnpXtvgdNgoG+814mMNZFtE1D8XKaXA/wd2zj+3UDQpqi4f
         ePeik3TUKGcBb7JCOHtYlqk6P+wD5irCKNCRk8ASVDNjhP9f06i+CBeS1aSftGfb7YbB
         BK7uY4/MsJ0ANDkUcyYHUe38h1NSN1k2QU6s+QkMvZk2nsBdL+xUz9m6uRL6Pys1yg4S
         ggsFbjH3y9OADC8vMv4m31fuqX9l6BdoEZUm362XGPl1SR2+TRfC8qDhlhdQgqo/9rIF
         safA==
X-Forwarded-Encrypted: i=1; AJvYcCVbHJ05UJ3LwK7mKP4EeLGOGGRfWeo0CBhL3ZB9F8FvDfrajm6+KW+gP+6bf1ZrZmqF+pHa3Meydns=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRdmV4u4FdDqpCYPJcVzB4GkhCCF1gpBC0B3/9km+5MmEr3Znm
	/SEhnEYjgS2wy25ScGuFUcWMODkBLCodk/OGGRmxJr66oOJKxXnay8J2HupeT+3jO2U=
X-Gm-Gg: ASbGncvKsrIfpc4BWij+MAeC0clfnGEhxIN5sdbD91+i5FVDhz5gI0Epyh3JqiXF64V
	pgzsKIvroMinpvjjy/Ml55Q6kXogoGjUb7+9/hgnyIsHwuseYnLtImofj1J31jr/yVs+t/a5+LP
	4TNh9wPqnyq7RfkYz9o5W+q9qx6mT/fHJV4qUIWTJHdiP/kSmGPpvY5UrZci+lSOvIMBlD9B1in
	R3IW6Lb8NHmVTDlYLuBpGosJnJjBtHJr8QSetH5AUvCcuM7EYEwHUHgWPtmPOuqNvTOtboIVRxC
	VXE4MKau6lN4etrd+/ODklUFZzuO8kDmY9dFMtccmb6WPl6h2WZj9bVbAetiiDjPa/tpszfL221
	rEgPz9cVukfUK5t7a1UryafG8Wu7Vd87iP2mHWGGyKIA=
X-Google-Smtp-Source: AGHT+IHVR01GWZaWv7baTcjU5O0kFwotFGhrlpvKdhdubFxB0wxEVad57csE1YDZMPi3+Mm5z4P0Fw==
X-Received: by 2002:a17:907:3c90:b0:adb:2577:c0c5 with SMTP id a640c23a62f3a-adfad5c74fdmr1544262766b.38.1750239938008;
        Wed, 18 Jun 2025 02:45:38 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec8158d4dsm1015674366b.28.2025.06.18.02.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 02:45:37 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 18 Jun 2025 11:47:16 +0200
To: Bjorn Helgaas <helgaas@kernel.org>
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
	kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH stblinux/next 2/2] clk: rp1: Implement ramaining clock
 tree
Message-ID: <aFKLJELw3JuFI9GR@apocalypse>
References: <b70b9f2d50e3155509c2672e6779c0840f38ad5e.1750165398.git.andrea.porta@suse.com>
 <20250617145144.GA1135520@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617145144.GA1135520@bhelgaas>

Hi Bjorn,

On 09:51 Tue 17 Jun     , Bjorn Helgaas wrote:
> On Tue, Jun 17, 2025 at 03:10:27PM +0200, Andrea della Porta wrote:
> > The RP1 clock generator driver currently defines only the fundamental
> > clocks such as the front PLLs for system, audio and video subsystems
> > and the ethernet clock.
> > 
> > Add the remaining clocks to the tree so as to be completed.
> 
> In subject, s/ramaining/remaining/

Ack.

> 
> I guess we actually get some functional benefit here (something that
> previously did not work, will start working after this patch)?  It
> would be good to mention that here.  "Completing the tree" sounds
> nice, but if I were being asked to merge this, I'd like to know what
> benefit it brings.

Sure, I will add details in the next revision.

Many thanks,
Andrea

> 
> Bjorn
