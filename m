Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D49F19C57F
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729588586; cv=none; b=ZaYjvq/heE7nH099FHjK34hALWfGv5730bP69MowuH25igNdBEY7FvJfe2LBfRF9k3PovOweKNjLpTg5nIYaBkaZ+hbnZ0xaiGIHMC9YvzViD8qZRuwhPzg2HlGaLu1K998PBi+pLVhCvDLtHgmusoMVoxQLKcxpCR3tfPbjQCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729588586; c=relaxed/simple;
	bh=T/vXZLFdInElzPYMtvAAk+jioBTOmIcG99+n+rK4X2g=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZDEzuB+RC9PH9BhKsg/XDtq0CTMyf6FxqG19lUG/b4Cv6W/DIHQ3DRYLQ7dwOKNW0jqIJLpatuwp5CyfRIRijidkI1clGLeqewtyPvrM/H/vW4hxoPkInYCEQAvwH562HpDpoynfcQE6kvW3W/MHsRduDpd9F6N6CvCBNwLXtKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=f8rmdQwy; arc=none smtp.client-ip=209.85.208.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="f8rmdQwy"
Received: by mail-ed1-f68.google.com with SMTP id 4fb4d7f45d1cf-5c941623a5aso10729339a12.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1729588583; x=1730193383; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qrWLxWniYgldXhi6j2i53PBD8nYeIsOcEfEhSVeXIlY=;
        b=f8rmdQwyZKJ6a/i0m5bXnr7gsb6mTP5D5PD1N7KEbcO7+JVDyWOaoxRmywcxmSCaIG
         xrRHOhdnyktK7KKvZPdXC0LlaJERYc6rDtyI4zi9NT+lkc/aRUl65P2v0jFmHZyIuIiY
         hTVAkP7QtSkPYwjvkQSsApcSQBN38Fd5ftu+KL7UgbWawKyISjlvLLXE5Mvj7zlx3fmB
         v12pjtCLioP1cXHcMYNxhthb15FDhMxLomA8rQO2vcpMJjSPJI2Y5Ud46QuEDZCjEnCJ
         cp0NQkru0GRM+RNTF1A7UMigG1nku0H1rsh74ckHE/vIlWpZcctksfXHkMFpb2CwHSyk
         a0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729588583; x=1730193383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrWLxWniYgldXhi6j2i53PBD8nYeIsOcEfEhSVeXIlY=;
        b=jlxxcpGlddiA/eqqpf7sfRU534/lw/nfOOYnwrr1kwex/lrh0YYm43uIj8GJmttbtQ
         7ovQHhD95EA8eCBmM/xDvBwadYBmZ9HgOFgVaWTpYigavuvfCqf4jlB+L2Rwe9D3VOGg
         BHaD59mZKeoVmA27uyI7XYlq8zFDMmtTShCL288+XeYn+Swv7uRqllsBK8jb2os3Fiez
         kCD+LzLAPEtotoGmjT0BE5GXtu+/f4Tawczs9Qf3L3rjv3chUE8KeEz+YwJRDP3qlHKn
         34jkDI/npV7Ph8F04mRPOHj4CfnNwEkHOOIQ+OiefGclJCYxl8XlaI6Oq8RJ56bJQL7X
         F7Xg==
X-Forwarded-Encrypted: i=1; AJvYcCX54VoS5epAk9xcFiZeuqf0B2wA1z6HEeF4Ro6w3wo1XXCGT37fQV+EJAHi12mZOCqqEUhji/SOOec=@vger.kernel.org
X-Gm-Message-State: AOJu0YwU+ZPp70VqZXKsU4/zVoRSU1vx8eAhRxwvb9aOP3VlgSZ0QHnC
	TJqty14IcOVHX7RZGRpt3OnitR/IkpjGbXKOaMTKrwtExdtkNhT0R4XJwZc9lzk=
X-Google-Smtp-Source: AGHT+IFXrGNxzwEi2WdXZWLEN+8q3E4ZOF9oX6riQZD0+XCFFpDLA7nAJ7U22UKPiXN7xeCk1T+VUw==
X-Received: by 2002:a17:906:f585:b0:a9a:85b5:2aca with SMTP id a640c23a62f3a-a9aaa4f4e7fmr269581166b.7.1729588582529;
        Tue, 22 Oct 2024 02:16:22 -0700 (PDT)
Received: from localhost (host-95-239-0-46.retail.telecomitalia.it. [95.239.0.46])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb6696b51asm2946644a12.6.2024.10.22.02.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 02:16:22 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Tue, 22 Oct 2024 11:16:43 +0200
To: Rob Herring <robh@kernel.org>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
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
Message-ID: <Zxdte5VGeVHEwQV-@apocalypse>
References: <cover.1728300189.git.andrea.porta@suse.com>
 <e1d6c72d9f41218e755b615b9a985db075ce9c28.1728300189.git.andrea.porta@suse.com>
 <20241010024746.GA978628-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241010024746.GA978628-robh@kernel.org>

Hi Rob,

On 21:47 Wed 09 Oct     , Rob Herring wrote:
> On Mon, Oct 07, 2024 at 02:39:46PM +0200, Andrea della Porta wrote:
> > Common YAML schema for devices that exports internal peripherals through
> > PCI BARs. The BARs are exposed as simple-buses through which the
> > peripherals can be accessed.
> > 
> > This is not intended to be used as a standalone binding, but should be
> > included by device specific bindings.
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
> > +    const: 3
> > +
> > +  "#size-cells":
> > +    const: 2
> > +
> > +  ranges:
> > +    minItems: 1
> > +    maxItems: 6
> > +    items:
> > +      maxItems: 8
> > +      additionalItems: true
> > +      items:
> > +        - maximum: 5  # The BAR number
> > +        - const: 0
> > +        - const: 0
> > +
> > +patternProperties:
> > +  "^pci-ep-bus@[0-5]$":
> > +    $ref: '#/$defs/pci-ep-bus'
> 
> This should just be:
> 
> additionalProperties: true
> 
> properties:
>   compatible:
>     const: simple-bus
> 
> required:
>   - compatible
> 
> Then the compatible will cause simple-bus.yaml to be applied to this 
> node.
>

Ack.
 
> > +    description:
> > +      One node for each BAR used by peripherals contained in the PCI endpoint.
> > +      Each node represent a bus on which peripherals are connected.
> > +      This allows for some segmentation, e.g. one peripheral is accessible
> > +      through BAR0 and another through BAR1, and you don't want the two
> > +      peripherals to be able to act on the other BAR. Alternatively, when
> > +      different peripherals need to share BARs, you can define only one node
> > +      and use 'ranges' property to map all the used BARs.
> > +
> > +required:
> > +  - ranges
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +$defs:
> > +  pci-ep-bus:
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      compatible:
> > +        const: simple-bus
> > +      dma-ranges: true
> > +      ranges: true
> > +      "#address-cells": true
> > +      "#size-cells": true
> > +    required:
> > +      - compatible
> > +      - ranges
> > +      - '#address-cells'
> > +      - '#size-cells'
> 
> All this should be covered by simple-bus.yaml.

Ack.

Many thanks,
Andrea
> 
> Rob
