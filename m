Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A3D1C84C0
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 13:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748527162; cv=none; b=R1qzzby4s3UXI/ojvS/waTmjioEGHEriADCU1OFQSQfWb6oCSKstKwpbVzoVmG5D6f+nwEGEGLtzLK07qRMPe1dA2Cc5/dDffUybUtxbNgT8g0+wkjG2i1ODzAu4E1LtkMpjp2xjdK1IpjIjcMa9/KqgEWOa9no2vwgLdDUJEWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748527162; c=relaxed/simple;
	bh=7LbxeiQ9CUarb7MM6uFQy9Q+5QfMHyPo1PcpNWESj6g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JvV/nY7M11U4TM4ULZV6UH+EFzMuvwfjjIuLob8RuKAHZADf7AtWgLtwpi0BXE4cQQwBhT28PpDZS+mQI8OuMwIHj5tbzHUKUntBoa9AqMjmIMG/KV7vDBkTeyrjdToDvDe99zS3V+8TaqGS70vFvOc/lso+iNZNId7TQR+qFSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cg2PB2Ns; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cg2PB2Ns"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6045a8a59c5so1561078a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 06:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748527157; x=1749131957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=cg2PB2NspTTW82Qn12xK+O8KVnbJs5xRi261SUqSFQDkvz2oP13dKXJAprPXik5gKT
         xsqODPzQ+hRtKPLed0FyKS5UXSBVKXoph1hfNVJgwI259/TW6yJVZy++FprAh+lkr0FH
         zrAoJqW2XDsDaxazpMJVEEuQ45y2WZxeXBe5hYO3IG1oL5+9CoIdDVFvOnc3CW3+Jicg
         ovYKx5wt95SXDO2zD98anfDAnCHMRGevdMe38Xyg7sfFIpGD1AkdkLNmICtX7KLTynjz
         Q+4j4biALOBjSABx5Gf0UCivsGJexFRJQzF60I7i2bY5XeCAoriPrrqT6B6WQNQ+W84+
         nEGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748527157; x=1749131957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bd/re0W0O3SfKxkSQq5B/C3J4e51HN+gv/k4x6dlG2s=;
        b=bh9uPZtcfwKTFl4LW36GiKtoxdzS+45cKfkP1AFNVI6bPzDKGYnWcfRz+EXouHuCra
         JvA/NO28eQe4ZZnm81571flhoX/fBjmpQbQgptuQl5+C9HB0wCmkz/oq6lMkhQEztALR
         On7ykwoN1kBZZtXe1y3v0v6F+Wkm7E66b9afkBAF5+tDBRUIASbXXzEcQmK8Y9aIXFol
         uLfu0rjKKM9hXRj0wccU2Uca2LUdhiYxOJz33M0/qTWqGnHbbGHBzXIOfV6DQhBI1XC7
         DwOunjWRp+LFSQAnD0xBNVSS65V+gNlfMQJ6dyZyKL4WMJ8e003jS6CKx8pm7H4Y0DHo
         1M9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXV/bGGoLyHkVj3kXWCP1fTZ6D1A/5NyGEaIGaxACSMNU5mDicYYCzsBEi/FoUCSyv2rSfWPgZFn+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNfWIuiFyaijprofyXW1CvTsf6Qk3rQ1h33IAbOwD8p9Ys2hHL
	QWWU9u9OV90iy1GZ8I5U23To3JFsbEGbCUc5qY8gegVwwfbprS7nDG/nSnNJKm2H1XA=
X-Gm-Gg: ASbGncsmCM9IZMaEx0LpUwRaTy6iHvCX0cJmiSScplvevDVSy92ceYJKYRUAv2abruL
	NnHQQafxcN1ZkFgEYF6fW4t2MoRjwa8hDhhiaf71YzMfpF8TTDEKrV1+wbUEXMSvE7LSlHQNX1w
	NIFKyxQMufOfO3GiXZC+K40H61w/ufZT7jEapAofUaRO6SbFhVKzz6KiXRcQL5V1LdmjhRLRwny
	xq78nsSmYDIwjhstxM8ANKV8b70fkM+5SWsHwuv9EwsYeHJE1Kp938ttInNWS7hgZ0fFGzFrx90
	k2oeeC/jzFBNhFIxvRio4jSPOpBTMnfKL3H/9X+G1XVPEDIm2i2AdVNE8skfd+KWBapqGa0xpFb
	9Dfzgmbscsx4Gw6skndw/rg==
X-Google-Smtp-Source: AGHT+IFe10hNzzDGzxOKftk1BYzLU57XNvgcDOZ24VhiK0GAx5icGmaI6U2aVUUNIweLENXOhsxpSA==
X-Received: by 2002:a17:906:4fca:b0:ad8:9878:b898 with SMTP id a640c23a62f3a-adacda56014mr193178466b.9.1748527157319;
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045e2sm148109966b.90.2025.05.29.06.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:59:17 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 29 May 2025 16:00:52 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: Re: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device
 using a DT overlay
Message-ID: <aDholLnKwql-jHm1@apocalypse>
References: <cover.1748526284.git.andrea.porta@suse.com>
 <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>

Hi Krzysztof,

On 15:50 Thu 29 May     , Krzysztof Kozlowski wrote:
> On 29/05/2025 15:50, Andrea della Porta wrote:
> > *** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***
> > 
> Can you slow down please? It's merge window and you keep sending the
> same big patchset third time today.

Sorry for that, I was sending it so Florian can pick it up for this
merge window, and I had some trouble with formatting. Hopefully
this was the last one.

Regards,
Andrea

> 
> Best regards,
> Krzysztof
