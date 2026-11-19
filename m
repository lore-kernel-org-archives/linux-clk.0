Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.92.40.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795099586;
	b=PVnYvNY3LmSsLXVpuLiLF0/cOR/BmKwQPcwNeJ05HYaXsfT3JHLX7+argWeI94nxAZTy
	 VDAUDtPOmRCZvVY3JZd4Xz6dyteogpU87+uQK+9HsCcA6TnoboFVQH1vGEULEbrmm6FXk
	 qsu4nm4FEc5X6MoheWiZJZJy7rCcmtNkTjpFAT8zULe67BzIFLCsjfMOhZ6PfKsOb0lHE
	 myXSH0v1CGfifuB56ccJWbgBiYNws37Yy26yWbRii2//bxQ7PokNIsDae7ZNEbveQZMqt
	 nPxjtGWVpE9pL1Nwo05i1qdkp49iTafbUHlobnuZ1T0SmatNKt+3m+DL7utpA4Ak39A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099586;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:User-Agent:
	 X-Last-TLS-Session-Version;
	bh=mjnwJhgivOtcVF1fvsobspXXgbNjrXo23hOqgODgs+4=;
	b=xVoSCjpwrQTVv/Gv7CEXYC9Pfg7yU+PUX//qwILFckIUhp+abRdbtuNPCdHR+shCH8qB
	 STGJRcs62szdO2yJUojCDbwrKR2BZdIcVWi1ttSPC5koPb00NSKfhXFU8KPKFNZIzRCqU
	 zdbu5RKwd57eV8plovt8+aZvKh07a0fZniIs04AR2GKh+Hfc9jHj3YfB9rkgaeAoOmsw9
	 3ngdh/xmuOh7K5lXJJi/4rjIYjiL9aw0MEZpP1v1rc2bunxrkXaMoHTlJiT1b3M687OuR
	 cJaSAjg3cED4eGkF+7/TM0HOsZoLgZh2qChxXGULZt6Q4vE9yJkkgYr2JosbbWyLOXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=thorsis.com;
	spf=pass smtp.mailfrom=thorsis.com;
	dkim=pass header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b="fCrb/VIV";
	arc=none smtp.remote-ip=217.92.40.78
Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4C7606A320;
	Thu, 19 Nov 2026 14:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE4C7606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=thorsis.com header.i=@thorsis.com header.a=rsa-sha256 header.s=dkim header.b=fCrb/VIV
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B9BE1483638;
	Thu, 19 Nov 2026 15:46:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1795099583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=mjnwJhgivOtcVF1fvsobspXXgbNjrXo23hOqgODgs+4=;
	b=fCrb/VIVTWaNGQl9fgtlyLOU+Rq2w+qEzTSqxh3/njn+IeyBA56fMqPkY0CCZgzMtECFQm
	1OiPLwIArYkxsrYrlRHzI+aUH9wK2QQYxlCu3aKInZ8/jBSeBxX6YjwNqjUJ2OHCVW59hY
	icri4rUwWpQUiAIupc/KOYpsK6RNnKNARTk3m/UO1pXqJVmmNMwbW50V9sOBrM2eecic6i
	oWKIMzcjzQRuF+CW50waJWV09jBdt3uxnuCFgt9GtnRjW5pmYDisr9jKCNwvdXbk8t6toe
	722kOloQYJSoWe/wEC5ootIzoIOp+fcg0ug5xASQiSUwa4TCxqDtPxgwe36F8A==
Date: Thu, 19 Nov 2026 15:46:12 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@kernel.org>
Cc: Alexander Dahl <ada@thorsis.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4 02/16] dt-bindings: clock: at91: Split up per SoC
 partially
Message-ID: <20261119-bruising-peroxide-4f2c3211155a@thorsis.com>
Mail-Followup-To: Claudiu Beznea <claudiu.beznea@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>
References: <20261105110715.2486432-1-ada@thorsis.com>
 <20261105110715.2486432-3-ada@thorsis.com>
 <0f0cc1da-46dc-431e-a10d-dcbbf7419960@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f0cc1da-46dc-431e-a10d-dcbbf7419960@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Last-TLS-Session-Version: TLSv1.3

Hello Claudiu,

Am Sun, Nov 15, 2026 at 04:35:23PM +0200 schrieb Claudiu Beznea:
> Hi, Alexaner,
> 
> On 11/5/26 13:06, Alexander Dahl wrote:
> > Before adding even more new indexes creating more holes in the
> > clk at91 drivers pmc_data->chws arrays, split this up.
> > 
> > This is a partial split up only for some of the old PMC definitions.
> > 
> > Binding splitup was proposed for several reasons:
> > 
> > 1) keep the driver code simple, readable, and efficient
> > 2) avoid accidental array index duplication
> > 3) avoid memory waste by creating more and more unused array members.
> > 
> > Old values are kept to not break dts, and to maintain dt ABI.
> > 
> > Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> > Signed-off-by: Alexander Dahl <ada@thorsis.com>
> > ---
> > 
> > Notes:
> >      v4:
> >      - "re-added" some definitions present in hardware but not used in dt
> >      - reword header comment (at91 -> Microchip) for newer SoCs
> >      - PMC_UTMI was renamed where appropriate according to datasheets
> >      v3:
> >      - full splitup for all at91 family SoCs instead of just a few
> >      v2:
> >      - new patch, not present in v1
> > 
> >   .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
> >   .../bindings/usb/atmel,at91sam9rl-udc.yaml    |  3 ++-
> >   .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 16 ++++++++++++
> >   .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 16 ++++++++++++
> >   include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++
> >   include/dt-bindings/clock/atmel,sama5d3-pmc.h | 16 ++++++++++++
> >   include/dt-bindings/clock/atmel,sama5d4-pmc.h | 17 ++++++++++++
> >   .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 +++++++++++
> >   .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 ++++++++++++++
> >   .../clock/microchip,sama7d65-pmc.h            | 26 +++++++++++++++++++
> >   .../dt-bindings/clock/microchip,sama7g5-pmc.h | 23 ++++++++++++++++
> >   15 files changed, 236 insertions(+), 2 deletions(-)
> >   create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
> >   create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
> >   create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> > 
> > diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> > index 84c4801df8d9a..8c89ccc3d6393 100644
> > --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> > +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> > @@ -67,9 +67,10 @@ additionalProperties: false
> >   examples:
> >     - |
> >       #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
> >       reset-controller@fffffd00 {
> >           compatible = "atmel,at91sam9260-rstc";
> >           reg = <0xfffffd00 0x10>;
> > -        clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
> > +        clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
> >       };
> > diff --git a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> > index cdbbd17f80363..15f5bb51fd8a7 100644
> > --- a/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> > +++ b/Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
> > @@ -61,13 +61,14 @@ examples:
> >     - |
> >       #include <dt-bindings/interrupt-controller/irq.h>
> >       #include <dt-bindings/clock/at91.h>
> > +    #include <dt-bindings/clock/atmel,at91sam9rl-pmc.h>
> >       #include <dt-bindings/gpio/gpio.h>
> >       gadget@fff78000 {
> >           compatible = "atmel,at91sam9g45-udc";
> >           reg = <0x00600000 0x80000
> >                  0xfff78000 0x400>;
> >           interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
> > -        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
> > +        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE AT91SAM9RL_PMC_UTMI>;
> >           clock-names = "pclk", "hclk";
> >           atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
> >       };
> > diff --git a/include/dt-bindings/clock/atmel,at91rm9200-pmc.h b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> > new file mode 100644
> > index 0000000000000..35fce34e00b82
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91rm9200 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> > +
> > +#define AT91RM9200_PMC_SLOW	0
> 
> This is not used anywhere anywhere accross the current code base. Let's drop it.

Fine.  I added this after your feedback on v3 of the series [1],
probably misinterpreted what you meant.  v5 will be reduced by some
definitions again and keep the PLLs in the sama7 SoCs.

> > +#define AT91RM9200_PMC_MCK	1
> > +#define AT91RM9200_PMC_MAIN	3
> > +#define AT91RM9200_PMC_PLLACK	7
> > +#define AT91RM9200_PMC_PLLBCK	8
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9260-pmc.h b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> > new file mode 100644
> > index 0000000000000..6a5453cf70954
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9260 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> > +
> > +#define AT91SAM9260_PMC_SLOW	0
> > +#define AT91SAM9260_PMC_MCK	1
> > +#define AT91SAM9260_PMC_MAIN	3
> > +#define AT91SAM9260_PMC_PLLACK	7
> > +#define AT91SAM9260_PMC_PLLBCK	8
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> > new file mode 100644
> > index 0000000000000..44a804ff96fff
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9g45 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> > +
> > +#define AT91SAM9G45_PMC_SLOW	0
> 
> This is not used. Lets introduce it when needed
> 
> > +#define AT91SAM9G45_PMC_MCK	1
> > +#define AT91SAM9G45_PMC_UPLLCK	2
> > +#define AT91SAM9G45_PMC_MAIN	3
> > +#define AT91SAM9G45_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> > new file mode 100644
> > index 0000000000000..6eaef69242ee8
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9n12 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> > +
> > +#define AT91SAM9N12_PMC_SLOW	0
> 
> Not used.
> 
> > +#define AT91SAM9N12_PMC_MCK	1
> > +#define AT91SAM9N12_PMC_MAIN	3
> > +#define AT91SAM9N12_PMC_PLLACK	7
> > +#define AT91SAM9N12_PMC_PLLBCK	8
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> > new file mode 100644
> > index 0000000000000..0bb195712f785
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9rl clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> > +
> > +#define AT91SAM9RL_PMC_SLOW	0
> 
> Not used.
> 
> > +#define AT91SAM9RL_PMC_MCK	1
> > +#define AT91SAM9RL_PMC_UTMI	2
> 
> Manual also refers to this as UPLL (UTMI PLL). E.g.
> 
> "26.5 Main Oscillator
> The Main Oscillator is designed for a 12 MHz fundamental crystal. The 12 MHz
> is also used to
> generate the 480 MHz USB High Speed Clock (HSCK) thanks to the UTMI PLL (UPLL)."
> 
> [1] https://ww1.microchip.com/downloads/en/DeviceDoc/doc6289.pdf

Well, that old datasheet is full of variants for this, we have UPLL,
HSCK, UTMI PLL, USBHSCK, and UTMI Clock.  I rename it to
AT91SAM9RL_PMC_UPLLCK so it is in line with the other old SoCs.

> 
> > +#define AT91SAM9RL_PMC_MAIN	3
> > +#define AT91SAM9RL_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> > new file mode 100644
> > index 0000000000000..d095dcc9b29ff
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91sam9x5 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> > +
> > +#define AT91SAM9X5_PMC_SLOW	0
> 
> Not used.
> 
> > +#define AT91SAM9X5_PMC_MCK	1
> > +#define AT91SAM9X5_PMC_UPLLCK	2
> > +#define AT91SAM9X5_PMC_MAIN	3
> > +#define AT91SAM9X5_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,sama5d2-pmc.h b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> > new file mode 100644
> > index 0000000000000..51bb410c699e2
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> > @@ -0,0 +1,20 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sama5d2 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> > +
> > +#define SAMA5D2_PMC_MCK		1
> > +#define SAMA5D2_PMC_UPLLCK	2
> > +#define SAMA5D2_PMC_MAIN	3
> > +#define SAMA5D2_PMC_MCK2	4
> > +#define SAMA5D2_PMC_I2S0_MUX	5
> > +#define SAMA5D2_PMC_I2S1_MUX	6
> > +#define SAMA5D2_PMC_PLLACK	7
> > +#define SAMA5D2_PMC_AUDIOPLLCK	9
> > +#define SAMA5D2_PMC_AUDIOPINCK	10
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,sama5d3-pmc.h b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> > new file mode 100644
> > index 0000000000000..92210969104d6
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> > @@ -0,0 +1,16 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sama5d3 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> > +
> > +#define SAMA5D3_PMC_SLOW	0
> 
> Not used.
> 
> > +#define SAMA5D3_PMC_MCK		1
> > +#define SAMA5D3_PMC_UPLLCK	2
> > +#define SAMA5D3_PMC_MAIN	3
> 
> Not used.
> 
> > +#define SAMA5D3_PMC_PLLACK	7
> > +
> > +#endif
> > diff --git a/include/dt-bindings/clock/atmel,sama5d4-pmc.h b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> > new file mode 100644
> > index 0000000000000..53870448d6a1d
> > --- /dev/null
> > +++ b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * The constants defined in this header are being used in dts and in
> > + * at91 sama5d4 clock driver.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> > +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> > +
> > +#define SAMA5D4_PMC_SLOW	0
> 
> Not used.
> 
> > +#define SAMA5D4_PMC_MCK		1
> > +#define SAMA5D4_PMC_UPLLCK	2
> > +#define SAMA5D4_PMC_MAIN	3
> 
> Not used.
> 
> Thank you,
> Claudiu

Thanks for your review.

Greets
Alex

[1] https://lore.kernel.org/linux-devicetree/1f25e668-ff04-4fa7-a7fd-3ed3286edbe6@tuxon.dev/

