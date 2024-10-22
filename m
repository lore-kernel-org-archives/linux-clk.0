Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com [209.85.208.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCA4161302
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 09:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729588545; cv=none; b=SnNdoBolrTAwxMP3ehz44nrvGCfS3ZrNlrUtRgl64jUf+BPVN4NS4bBBWPOb2pFyDtdMBfM5zqPu8rD/p1OUmnimyGvl+E+b6DWHZIz4EFJqTT1IP7ZXIvsAPU2ZzLOlu/8BESYqoF7+7ycgvHu9tfpfE7jWDDyNQ5reF71L6Rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729588545; c=relaxed/simple;
	bh=Uk8Pa45s/KheSrUEOKOicHeanGteTnbgslk7ul9tBQs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jbFh+tfixr2LNoPyLExDntC/88KkG9HaSs4juyEj9on1Rs68GHiFkL70W1vG3TxZWEx9aKH2A1mYh8fYNj65KzySBwF+FN5zoJy0dFIlRPuuL3CWaw+qgLkmnYE1BMsEHbJ2Ms61VuWXuo+AilPxc9In5q3bzgpBbeExdfUFRfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y6cUtWkI; arc=none smtp.client-ip=209.85.208.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y6cUtWkI"
Received: by mail-ed1-f67.google.com with SMTP id 4fb4d7f45d1cf-5c9388a00cfso5890228a12.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 02:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729588542; x=1730193342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsPzi2IAagO7nqzLDsgxybyAdjpi8ZWkxbmu+EWhc0o=;
        b=Y6cUtWkIgaRVKYVYdl2h1UzqB19s2QfcONrnlSfVLZQZImtmS0Yck8MI9MLImZpIA7
         v2bmHG2UcW8G/u7HTtFtuuGyXeF/V2jNevD9rJH5ftn0DPvYiDc427c/ooUQDsJog2TV
         xBB75xu/PxyYqYd3PoxXHVZ+6AFDvc/vwQBI3OSiqIzduh3jc+xMKyLA7vlXjjrgBZjO
         CecWDRBdvdfyzxd0etVZSyBxG7Se0E3EU/j+bCOjrUycAV7bDboxdLZ1wKeHwA2E9Nen
         E4scyprJZv82bMxmnofMxR/UpuZQ6YNI8Xmc7sIYqzZtv+gppIeRlCHTRo18+1EFHm01
         s0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729588542; x=1730193342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsPzi2IAagO7nqzLDsgxybyAdjpi8ZWkxbmu+EWhc0o=;
        b=dSFjXd0U1AitP9wA/ctQD08hJFCZHIxZB7BWK1cKQ75NuIMJ2RO0eKKlgcmxy38gGG
         QgOg2OtYexvFpOI7YQaULos0FEwbUrpQoKlVVr8BXlvR0O3K0h4/LewM1Pw91YkxR6OK
         K89mzgOjK7Krsj36l/I+Uzjpv1OhWMJvkmmDnf3GzRBNaeqTB2FKGc+/G+TOeCluj812
         Q3GYzJjorBbp27BzzQGUe71LDBJk1SjtCP+sC7ID56MsF7zHn/0Qvu4gd7AiXF2Vefvr
         V7zbBljJIQLQe8fIZEig1wIxIyWEB5d4RJueanjU/lS5ezseHhowcdcZHVCkfxQcPwLP
         Cz2w==
X-Forwarded-Encrypted: i=1; AJvYcCU4lNMcU8MkYvZWiWgDzBJ4rJNMSzFQnsx1JHUn/dtxH+thLc4hsavKjM3GcIXUrVKXUqw4wdTlKu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWg9bDxXMebnipCm3z9eHmZSv2g0nz08sldNc9AGVmZ5bC3dlY
	JPK7J3qm8cQQh5Y/DWDUbBZ2Cl8+KvvgoHoY4vm3CPzxdzmmFaRfBQsvabqueN0=
X-Google-Smtp-Source: AGHT+IG0UbTdshGjhe1cBG9B7a7reFtp9fnVda6ehg+mYut3t/cw34W4iDARXx7x4hjoKD2s8wnmcA==
X-Received: by 2002:a17:906:6a29:b0:a99:e504:40c5 with SMTP id a640c23a62f3a-a9a69bb4776mr1542963966b.39.1729588542016;
        Tue, 22 Oct 2024 02:15:42 -0700 (PDT)
Received: from localhost (host-95-239-0-46.retail.telecomitalia.it. [95.239.0.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d8381sm308924466b.45.2024.10.22.02.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:15:41 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 22 Oct 2024 11:16:02 +0200
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v2 03/14] dt-bindings: pci: Add common schema for devices
 accessible through PCI BARs
Message-ID: <ZxdtUm_uoFvvKtVl@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <e1d6c72d9f41218e755b615b9a985db075ce9c28.1728300189.git.andrea.porta@suse.com>
 <flxm3zap4opsjf2s4wfjwdj6idf7p6errgtiru4xgbgkfx4ves@xxiz42cghgvr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <flxm3zap4opsjf2s4wfjwdj6idf7p6errgtiru4xgbgkfx4ves@xxiz42cghgvr>

Hi Krzysztof,

On 08:24 Tue 08 Oct     , Krzysztof Kozlowski wrote:
> On Mon, Oct 07, 2024 at 02:39:46PM +0200, Andrea della Porta wrote:
> > Common YAML schema for devices that exports internal peripherals through
> > PCI BARs. The BARs are exposed as simple-buses through which the
> > peripherals can be accessed.
> > 
> > This is not intended to be used as a standalone binding, but should be
> > included by device specific bindings.
> 
> It still has to be tested before posting... Mailing list is not a
> testing service. My and Rob's machines are not a testing service.

Sorry about that, I must have missed that file when rechecking all the schemas
after rebasing on 6.12-rc1.

> 
> > 
> > Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> > ---
> >  .../devicetree/bindings/pci/pci-ep-bus.yaml   | 69 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 70 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > new file mode 100644
> > index 000000000000..9d7a784b866a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pci/pci-ep-bus.yaml
> > @@ -0,0 +1,69 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pci/pci-ep-bus.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Common properties for PCI MFD endpoints with peripherals addressable from BARs.
> 
> Drop full stop and capitalize it.

Ack.

> 
> > +
> > +maintainers:
> > +  - Andrea della Porta  <andrea.porta@suse.com>
> > +
> > +description:
> > +  Define a generic node representing a PCI endpoint which contains several sub-
> > +  peripherals. The peripherals can be accessed through one or more BARs.
> > +  This common schema is intended to be referenced from device tree bindings, and
> > +  does not represent a device tree binding by itself.
> > +
> > +properties:
> > +  "#address-cells":
> 
> Use consistent quotes, either ' or ".

Ack.

Many thanks,
Andrea

> 
> Best regards,
> Krzysztof
> 
